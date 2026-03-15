# Speaker Notes

These scripts are a small convenience layer around the speaker fix from `samsung-galaxy-book4-linux-fixes`.

They do not install the original project for you. They only help you manually toggle parts of an already installed fix, including:

- the MAX98390-related kernel modules
- `max98390-hda-i2c-setup.service`
- `max98390-hda-check-upstream.service`
- `/etc/modules-load.d/max98390-hda.conf`
- the local modprobe blacklist used when the fix is disabled

Scripts:

- `scripts/speaker/speaker-on`
- `scripts/speaker/speaker-off`
- `scripts/speaker/speaker-status`

The toggle is optional and intended for manual control, not as a claim that the fix must always be disabled when not in use.

It is not a battery-saving requirement on the current upstream driver state. Older battery-consumption assumptions came from an earlier state before playback-hook-based amp power management was added. With the current behavior, the amps are powered down automatically when no audio is playing, so these scripts are now mainly a manual convenience layer for explicit control.
