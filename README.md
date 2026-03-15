# Samsung Galaxy Book4 Pro Fedora Linux Helpers

Small helper scripts for Samsung Galaxy Book4 Pro on Fedora Linux.

This repo currently covers:

- manually enabling, disabling, and checking the speaker fix from:

https://github.com/Andycodeman/samsung-galaxy-book4-linux-fixes

- setting up and rolling back the fingerprint workaround for Fedora on Galaxy Book4 hardware

## What this is

This is just a convenience layer on top of existing Linux fixes and workarounds for Galaxy Book4 hardware.

For speakers, it gives you 3 simple commands:

- `speaker-on`
- `speaker-off`
- `speaker-status`

The scripts manage the same pieces the original fix already installs, including:

- MAX98390 modules
- `max98390-hda-i2c-setup.service`
- `max98390-hda-check-upstream.service`
- `/etc/modules-load.d/max98390-hda.conf`
- a local modprobe blacklist file when the fix is fully disabled

For fingerprint support, it includes 2 helper scripts:

- `book4-fingerprint-setup.sh`
- `book4-fingerprint-rollback.sh`

These scripts help you:

- enable the `tenseventy7/libfprint-acer-egismoc` COPR
- upgrade `libfprint`, `fprintd`, and `fprintd-pam`
- enable or disable `authselect` fingerprint authentication
- roll back to Fedora stable packages with `dnf distro-sync`

## Important note

These scripts are **not required for battery savings** on the current version of the driver.

As explained by the maintainer of the original fix, the amps are now powered down automatically when no audio is playing, so idle power draw is basically negligible.

That means this repo is mainly useful if you want:

- explicit manual control over the fix
- a quick way to fully enable/disable it
- a simple status command
- a simple way to set up or roll back the fingerprint workaround
- peace of mind when using Bluetooth headphones, external speakers, or just preferring a fully unloaded state

## Tested on

- Samsung Galaxy Book4 Pro
- Fedora

## Commands

```bash
speaker-on
speaker-off
speaker-status
./scripts/book4-fingerprint-setup.sh
./scripts/book4-fingerprint-rollback.sh
