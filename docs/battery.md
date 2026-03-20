# Battery Charge Cap Notes

This helper manages the kernel battery charge threshold exposed through:

- `/sys/class/power_supply/BAT*/charge_control_end_threshold`

Script:

- `scripts/battery/battery-cap`

Supported commands:

- `on` sets the battery charge end threshold to `80`
- `off` sets the battery charge end threshold to `100`
- `toggle` switches between `80` and `100`
- `status` shows the current threshold

This is only a small convenience wrapper around the kernel interface already provided by the system. If your kernel, firmware, or battery driver does not expose `charge_control_end_threshold`, the script exits with an error instead of guessing another mechanism.
