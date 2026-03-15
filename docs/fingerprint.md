# Fingerprint Notes

These scripts help set up or roll back a Fedora fingerprint workaround for Galaxy Book4 hardware.

Setup script:

- enables the `tenseventy7/libfprint-acer-egismoc` COPR
- upgrades `libfprint`, `fprintd`, and `fprintd-pam`
- restarts `fprintd`
- enables `authselect` fingerprint support

Rollback script:

- disables fingerprint support in `authselect`
- disables the COPR
- runs `dnf distro-sync` to return fingerprint packages to Fedora stable
- restarts `fprintd`

Scripts:

- `scripts/fingerprint/book4-fingerprint-setup.sh`
- `scripts/fingerprint/book4-fingerprint-rollback.sh`

This COPR is not an official Fedora source. Review it carefully before using it on your system.
