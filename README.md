# Manjaro Zenbook UX3405MA Dual Boot Setup

This script configures **Manjaro Linux** on the **ASUS Zenbook 14 UX3405MA** (Meteor Lake, Intel Arc GPU) for **dual boot with Windows 10** and optimizes the system for:
- Latest Intel GPU drivers
- Working audio (Intel SST + Realtek)
- ASUS Fn keys & performance modes
- Battery optimization
- Firewall & extra app support

## 🚀 Features
- Installs Linux kernel 6.9+ for Meteor Lake
- Configures GRUB for dual boot with Windows
- Enables latest Intel graphics stack
- Adds ASUS utilities (`asusctl`, `supergfxctl`)
- Improves battery life (`tlp`, `powertop`)
- Enables Flatpak & Snap
- Sets up PipeWire for audio

## 📥 Installation
1. **Download** the repo:
   ```bash
   git clone https://github.com/YOUR_GITHUB_USERNAME/manjaro-zenbook-dualboot-setup.git
   cd manjaro-zenbook-dualboot-setup
