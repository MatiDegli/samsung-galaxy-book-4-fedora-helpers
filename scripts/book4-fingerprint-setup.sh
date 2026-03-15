#!/usr/bin/env bash
# Install and enable the Galaxy Book4 fingerprint workaround on Fedora.

set -euo pipefail

readonly COPR_REPO="tenseventy7/libfprint-acer-egismoc"
readonly REQUIRED_PACKAGES=(
  "authselect"
  "dnf-plugins-core"
  "fprintd"
  "fprintd-pam"
  "libfprint"
)
readonly FINGERPRINT_PACKAGES=(
  "libfprint"
  "fprintd"
  "fprintd-pam"
)

require_root() {
  if [[ "${EUID}" -ne 0 ]]; then
    printf 'Please run as root.\n' >&2
    exit 1
  fi
}

require_root

dnf install -y "${REQUIRED_PACKAGES[@]}"
dnf -y copr enable "${COPR_REPO}"
dnf upgrade -y "${FINGERPRINT_PACKAGES[@]}"
systemctl restart fprintd

if ! authselect current | grep -q 'with-fingerprint'; then
  authselect enable-feature with-fingerprint >/dev/null
fi
authselect apply-changes >/dev/null

printf 'Fingerprint workaround installed.\n'
printf 'Next steps:\n'
printf '  fprintd-enroll\n'
printf '  fprintd-verify\n'
printf '  sudo -k && sudo ls /root\n'
