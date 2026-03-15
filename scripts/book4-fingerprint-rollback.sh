#!/usr/bin/env bash
# Roll back the Galaxy Book4 fingerprint workaround to Fedora defaults.

set -euo pipefail

readonly COPR_REPO="tenseventy7/libfprint-acer-egismoc"
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

if authselect current | grep -q 'with-fingerprint'; then
  authselect disable-feature with-fingerprint >/dev/null
fi
authselect apply-changes >/dev/null

dnf -y copr disable "${COPR_REPO}" >/dev/null 2>&1 || true
dnf distro-sync -y --refresh "${FINGERPRINT_PACKAGES[@]}"
systemctl restart fprintd

printf 'Fingerprint workaround rolled back.\n'
printf 'To remove enrolled fingerprints manually, run: fprintd-delete <username>\n'
