# Kinesis Advantage 360 Pro

## Prerequisites

- Ensure you have [Docker](https://www.docker.com/products/docker-desktop) installed and running on your machine.
- Additional tools may be necessary; see [requirements](https://kinesis-ergo.com/support/kb360pro/#requirements).

## Building the Firmware

Execute the following commands in your terminal:

- **Build Firmware for Both Halves:**
  ```sh
  make
  ```
- **Build Only for Left Side:**
  ```sh
  make left
  ```

After building, check the `firmware` directory for the latest build files. Filenames start with a timestamp indicating the build time.

### Cleanup

To delete the built Docker container and compiled firmware files, use:
```sh
make clean
```
Use `make clean_firmware` to clean only the firmware files without removing the Docker container. Alternatively, `make clean_image` removes the Docker container while keeping firmware files intact.

## Flashing Firmware

Follow the programming instructions detailed in the [Quick Start Guide](https://kinesis-ergo.com/wp-content/uploads/Advantage360-Professional-QSG-v8-25-22.pdf).

### Steps to Flash

1. **Extract Firmware**: 
   - From the GitHub build job archive (cloud builder) or the `firmware` folder (local build).

2. **Prepare Left Side**:
   - Connect to USB.
   - Enter bootloader mode with `Mod+macro1` (keyboard should show as a USB drive).
   - Copy `left.uf2` to the drive (will disconnect automatically).

3. **Prepare Right Side**:
   - Power on the left side, then connect the right side to USB.
   - Enter bootloader mode with `Mod+macro3`.
   - Copy `right.uf2` to the drive.

4. **Finalize**: Unplug all devices, power cycle them, and enjoy your keyboard!

> **Note**: Use the reset buttons to toggle bootloader mode as described in the [User Manual](https://kinesis-ergo.com/wp-content/uploads/Advantage360-ZMK-KB360-PRO-Users-Manual-v3-10-23.pdf).

> **Note**: Some OS may not indicate successful ejection post flashing. This does not imply failure.

## Troubleshooting

- **Drive Not Ejected**: If the OS doesn't eject the drive after flashing, manually check the connection and try again.

## Other Support

- [GitHub Repository](https://github.com/KinesisCorporation/Adv360-Pro-ZMK)
- [Firmware Updates](https://kinesis-ergo.com/support/kb360pro/#firmware-updates)
- [User Manuals](https://kinesis-ergo.com/support/kb360pro/#manuals)

For hardware issues, open a [support ticket](https://kinesis-ergo.com/support/kb360pro/#ticket) with Kinesis.
