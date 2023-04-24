DOCKER := $(shell { command -v podman || command -v docker; })
TIMESTAMP := $(shell date -u +"%Y%m%d%H%M%S")
detected_OS := $(shell uname)  # Classify UNIX OS
ifeq ($(strip $(detected_OS)),Darwin) #We only care if it's OS X
SELINUX1 :=
SELINUX2 :=
else
SELINUX1 := :z
SELINUX2 := ,z
endif

.PHONY: all clean

get_macros:
	eval $(op signin --account pixel-combo.1password.com) && op item get fnsq7vwjy6hwmdf6puikiuo5na --field "notesPlain" --format json | jq -r .value > config/macros.dtsi

all:
	make get_macros
	$(DOCKER) build --tag zmk --file Dockerfile .
	$(DOCKER) run --rm -it --name zmk \
		-v $(PWD)/firmware:/app/firmware$(SELINUX1) \
		-v $(PWD)/config:/app/config:ro$(SELINUX2) \
		-e TIMESTAMP=$(TIMESTAMP) \
		zmk
	git checkout config/macros.dtsi

clean:
	rm -f firmware/*.uf2
	$(DOCKER) image rm zmk docker.io/zmkfirmware/zmk-build-arm:stable
