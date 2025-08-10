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
- Adds ASUS utilities (``asusctl``, ``supergfxctl``)
- Improves battery life (``tlp``, ``powertop``)
- Enables Flatpak & Snap
- Sets up PipeWire for audio

## 1️⃣ Before We Start
Make sure:

- **Windows 10 is already installed** (UEFI mode, not Legacy)
- You have at least **50–80 GB free space** for Manjaro.
- Secure Boot is **disabled** in BIOS.
- Fast Boot is **disabled** in BIOS and Windows.

## 2️⃣ Prepare Windows 10
**1. Shrink the C: Drive:**
- Press ```Win + X``` →  **Disk Management.**
- Right-click ``C: → Shrink Volume.``
- Enter how much space to free (e.g., 80000 MB for 80 GB).
- You should now see **Unallocated Space** (black bar).

**2. Disable Fast Startup** (important for Linux access to NTFS):
- Control Panel → Power Options → Choose what the power buttons do.
- Click Change settings that are currently unavailable.
- Uncheck Turn on fast startup.

**(Optional)** Disable BitLocker if your drive is encrypted.

## 3️⃣ Create Manjaro Live USB
- Download Manjaro KDE ISO → https://manjaro.org/download/
- Use **Rufus**:
 - Device: Your USB drive
 - Boot selection: Manjaro ISO
 - Partition scheme: **GPT**
 - Target system: **UEFI (non-CSM)**
 - Write mode: **DD mode** when prompted

## 4️⃣ Boot Into Manjaro Installer
- Restart and press ``F12`` (or ESC) to open the boot menu.
- Select your USB drive (UEFI).
- In the Manjaro menu, choose **Boot with proprietary drivers**.
- Wait for the KDE desktop to load.

## 5️⃣ Start Installation
1. Click "Install Manjaro".
2. Language → English (or your choice).
3. Region → Asia/Dhaka (for you).
4. Keyboard → English (US).
5. Partitions → Choose Manual Partitioning (DO NOT choose erase disk).

## 6️⃣ Partition Setup
You’ll see:
 - **EFI System Partition** → ~100–300 MB, FAT32, mounted at ******/boot/efi******
 - **Windows NTFS partitions** (don’t touch)
 - **Unallocated space** (this is where we install Manjaro)
Create:
 - ```/``` (root) → 50–80 GB, ext4
 - ```/home``` → remaining free space, ext4
 - **Swap** → 8 GB (if you want hibernation; otherwise skip)

**Important:**

 For **EFI System Partition**, choose:
- Mount point: ```/boot/efi```
- Format: **DO NOT format**
- This lets GRUB share the EFI partition with Windows.

## 7️⃣ Bootloader
- Bootloader location: ``/boot/efi``
- Bootloader ID: ``manjaro``

## 8️⃣ Finish Installation
- Confirm summary → Click Install.
- Wait for it to finish.
- Reboot and remove USB.

## 9️⃣ After Installation
- You should see **GRUB menu** with:
 - Manjaro Linux
 - Advanced options
 - Windows Boot Manager

## 📥 Post Installation
1. **Download** the repo:
```bash
git clone https://github.com/BlackViking07/Manjaro-Zenbook-14-DualBoot-Setup.git
cd Manjaro-Zenbook-14-DualBoot-Setup
```
2. Make script executable:
```bash
chmod +x manjaro-zenbook-setup.sh
```

3. Run the script:
```bash
./manjaro-zenbook-setup.sh
```

## ⚠️ Notes
- Must be run after Manjaro installation.
- If dual booting, install Windows first, then Manjaro.
- Make sure Secure Boot is disabled in BIOS.
