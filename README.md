# Bakery OS

**Description:** Bakery OS is an Arch Linux-based live system build and installer project designed to produce a customizable, distributable ISO image.

**Repository Layout:**

- **airootfs/**: Base filesystem tree used to build the live image.
- **scripts/**: Build helpers and orchestrators (see [scripts/]
- **syslinux/**, **grub/**, **efiboot/**: Bootloader configuration and images.

**Prerequisites:**

- **Host:** A working Arch Linux environment (or compatible) with development tools installed.
- **Packages:** Common tools used by the build pipeline include: `bsdtar`, `squashfs-tools`, `xorriso`, `pacman`, `mkinitcpio`, `arch-install-scripts`, and `sudo`.
- **Privileges:** Building the ISO will require sufficient privileges to run packaging and image creation tools.

**Building the ISO:**

1. Review and customize `profiledef.sh` and the contents of `airootfs/` as needed.
2. Run the primary build script from the repository root:

```bash
./build.sh
```

or, if you prefer the orchestrator under `scripts/`:

```bash
./scripts/build.sh
```

Build artifacts are produced under the `work/` directory; final ISO images and boot artifacts are placed inside `work/iso/` and `x86_64/` paths.

**Customizing the Image:**

- Edit the `airootfs/` tree to add or remove packages, services, and configuration files.
- Modify `profiledef.sh` to adjust package lists and build options.
- To include or update Calamares configuration, see the `calamares/` directory.

**Testing and Booting:**

- Test the generated ISO in a virtual machine (QEMU, VirtualBox, or VMware) before deploying to physical media.
- Example QEMU command:

```bash
qemu-system-x86_64 -m 2048 -cdrom work/iso/*.iso -boot d
```

**Contributing:**

- **Issues:** Open bug reports and feature requests via the repository issue tracker.
- **Patches:** Submit patches as pull requests. Keep changes focused and document rationale.
- **Style:** Follow existing script conventions and keep shell code POSIX-compatible where feasible.

**Security and Privacy:**

- Do not include secrets or private keys in `airootfs/` or the repository.
- Verify any third-party packages and sources before including them in the build.

**License:**

- See `LICENSE` in the repository root if present. If no license is provided, assume "All rights reserved" and add an appropriate open-source license for public distribution.

**Contact:**

- For questions or collaboration, open an issue or submit a pull request.

---
