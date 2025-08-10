#!/bin/bash
# Manjaro Zenbook 14 UX3405MA Setup Script
# Dual boot + drivers + optimizations

echo "=== Updating system ==="
sudo pacman -Syu --noconfirm

echo "=== Installing newer kernel (6.9) ==="
sudo mhwd-kernel -i linux69 --noconfirm

echo "=== Installing Intel GPU drivers ==="
sudo pacman -S --noconfirm mesa intel-media-driver vulkan-intel libva-intel-driver

echo "=== Installing audio firmware (Intel SST + Realtek) ==="
sudo pacman -S --noconfirm pipewire pipewire-pulse pipewire-alsa pipewire-jack wireplumber sof-firmware alsa-ucm-conf pavucontrol

echo "=== Installing ASUS laptop utilities ==="
sudo pacman -S --noconfirm asusctl supergfxctl
sudo systemctl enable --now asusd
sudo systemctl enable --now supergfxd

echo "=== Installing battery optimization tools ==="
sudo pacman -S --noconfirm tlp powertop
sudo systemctl enable --now tlp

echo "=== Installing useful fonts ==="
sudo pacman -S --noconfirm noto-fonts ttf-dejavu ttf-liberation

echo "=== Enabling firewall ==="
sudo pacman -S --noconfirm ufw
sudo systemctl enable --now ufw
sudo ufw enable

echo "=== Adding Flatpak & Snap support ==="
sudo pacman -S --noconfirm flatpak snapd
sudo systemctl enable --now snapd
sudo ln -s /var/lib/snapd/snap /snap

echo "=== Configuring GRUB for dual boot ==="
sudo sed -i 's/^GRUB_TIMEOUT=.*/GRUB_TIMEOUT=3/' /etc/default/grub
sudo sed -i 's/^#GRUB_DISABLE_OS_PROBER=false/GRUB_DISABLE_OS_PROBER=false/' /etc/default/grub
grep -q "^GRUB_DISABLE_OS_PROBER" /etc/default/grub || echo "GRUB_DISABLE_OS_PROBER=false" | sudo tee -a /etc/default/grub
sudo pacman -S --noconfirm os-prober
sudo grub-mkconfig -o /boot/grub/grub.cfg

echo "=== Cleaning up orphan packages ==="
sudo pacman -Rns $(pacman -Qdtq) --noconfirm || true

echo "=== All done! Please reboot your system. ==="
