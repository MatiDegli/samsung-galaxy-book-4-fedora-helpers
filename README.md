# Samsung Galaxy Book4 Pro Fedora Helpers

Small helper scripts for a Samsung Galaxy Book4 Pro running Fedora Linux.

This repository stays intentionally small and is split into two independent areas:

- speaker toggle helpers
- battery charge cap helper
- fingerprint workaround helpers

## Scope

This repo is for Samsung Galaxy Book4 Pro hardware on Fedora.

It is a convenience layer around existing Linux fixes and workarounds. It does not try to replace the upstream speaker fix project or present the fingerprint workaround as an official Fedora solution.

## Speaker Toggle Helpers

The speaker helpers provide a simple manual way to enable, disable, and check the status of the speaker fix used by the `samsung-galaxy-book4-linux-fixes` project:

https://github.com/Andycodeman/samsung-galaxy-book4-linux-fixes

Scripts:

- `scripts/speaker/speaker-on`
- `scripts/speaker/speaker-off`
- `scripts/speaker/speaker-status`

Example use:

```bash
./scripts/speaker/speaker-on
./scripts/speaker/speaker-off
./scripts/speaker/speaker-status
```

Optional install example:

```bash
install -m 755 scripts/speaker/speaker-* ~/.local/bin/
speaker-on
speaker-off
speaker-status
```

The speaker toggle is optional manual convenience. It is useful if you want explicit control over enabling or fully disabling the installed speaker fix.

It is not needed for battery savings on the current upstream speaker fix. According to the upstream maintainer, the current driver powers the amps down automatically when no audio is playing, so idle power draw is basically negligible.

More notes: [docs/speaker.md](docs/speaker.md)

## Battery Charge Cap Helper

The battery helper provides a simple manual way to enable, disable, toggle, and inspect the 80% battery charge cap exposed by the kernel power-supply interface.

Script:

- `scripts/battery/battery-cap`

Example use:

```bash
./scripts/battery/battery-cap on
./scripts/battery/battery-cap off
./scripts/battery/battery-cap toggle
./scripts/battery/battery-cap status
```

Optional install example:

```bash
install -m 755 scripts/battery/battery-cap ~/.local/bin/battery-cap
battery-cap on
battery-cap off
battery-cap toggle
battery-cap status
```

System-wide install alternative:

```bash
sudo install -m 755 scripts/battery/battery-cap /usr/local/bin/battery-cap
```

The helper uses `/sys/class/power_supply/BAT*/charge_control_end_threshold` when that interface is available. It sets the threshold to `80` when enabled and back to `100` when disabled.

More notes: [docs/battery.md](docs/battery.md)

## Fingerprint Workaround Helpers

The fingerprint helpers install or roll back a Fedora fingerprint workaround for Galaxy Book4 hardware.

Scripts:

- `scripts/fingerprint/book4-fingerprint-setup.sh`
- `scripts/fingerprint/book4-fingerprint-rollback.sh`

Example use:

```bash
sudo ./scripts/fingerprint/book4-fingerprint-setup.sh
sudo ./scripts/fingerprint/book4-fingerprint-rollback.sh
```

Optional install example:

```bash
sudo install -m 755 scripts/fingerprint/book4-fingerprint-setup.sh /usr/local/bin/book4-fingerprint-setup
sudo install -m 755 scripts/fingerprint/book4-fingerprint-rollback.sh /usr/local/bin/book4-fingerprint-rollback
sudo book4-fingerprint-setup
sudo book4-fingerprint-rollback
```

The fingerprint setup uses the non-official `tenseventy7/libfprint-acer-egismoc` COPR. Review that source and treat it like any other third-party package repository.

More notes: [docs/fingerprint.md](docs/fingerprint.md)
