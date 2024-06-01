
{ pkgs, userSettings, ... }:

let
  myBackupScript = ''
  #!/usr/bin/env bash

  # A script to perform incremental backups using rsync

  set -o errexit
  set -o nounset
  set -o pipefail

  readonly SOURCE_DIR="$HOME"
  readonly BACKUP_DIR="mnt/home_backups"
  readonly DATETIME="$(date '+%Y-%m-%d_%H:%M:%S')"
  readonly BACKUP_PATH="/$BACKUP_DIR/$DATETIME"
  readonly LATEST_LINK="/$BACKUP_DIR/latest"

  lsblk

  read -p "What partition do you want to backup to? " partition
  read -p "Is $partition/$BACKUP_DIR the correct backup directory? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1

  if grep -qs '$partition ' /proc/mounts; then
      sudo umount $partition
  else
      echo "Not currently mounted"
  fi

  sudo mount $partition /mnt
  sudo mkdir -p "/$BACKUP_DIR"

  sudo rsync -av --delete \
    "$SOURCE_DIR/" \
    --link-dest "$LATEST_LINK" \
    --exclude=".cache" \
    "$BACKUP_PATH"

  sudo rm -rf "$LATEST_LINK"
  sudo ln -s "$BACKUP_PATH" "$LATEST_LINK"

  sudo umount $partition
  echo "Please remove the backup partition now"
    '';
in
{
  home.packages = [
    (pkgs.writeScriptBin "backup" myBackupScript)
  ];
}
