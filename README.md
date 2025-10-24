# ThanatOS — A Minimalistic Linux-but-not-really-Based OS by Memento Software

**ThanatOS** is a lightweight, custom Linux-based operating system designed for fast booting, shell interactivity, and creative control. Built from scratch using a custom initramfs, it offers a clean boot experience, basic networking — all powered by the MementoSoft collective. (Well, it's a work in progress...)


and HOLY SHIT IT'S WIP DONT USE THIS AS A DAILY DRIVER BRUH


thank you


---

## 🧠 Philosophy

> *uhhh papyrus, i ate the kernel*

ThanatOS is more than an OS — it's a statement. Built by two passionate developers, it blends minimalism, technical precision, and artistic branding. Whether you're debugging kernel panics or designing splash screens, ThanatOS gives you full control from the first instruction.

---

## 🚀 Features

- **Custom initramfs** with BusyBox Bash.  
- **Interactive shell** with full job control (`setsid`, tty1) and other stuff only a nerd like you care about (/j)
- **Cool package manager** LOOK! ITS PACMAN! WAGAWAGA-
- **GRUB arguments (boot modes)**:  
  - `Normal Boot`: silent kernel (`quiet loglevel=0`)  
  - `DEBUG Boot`: verbose kernel (`loglevel=7`)  
- **Splash screen support** via GRUB (`background_image`)  
- **Network-ready** (ping, wget, ip commands available)  
- **Basic shell utilities** and aliases... 
- **Stylized branding** with ThanatOS logo and our very own awesome design 

---

## 🛠️ Requirements

- Linux host (for building)  
- `cpio`, `gzip`, `grub`, `qemu` or real hardware  
- PNG-compatible GRUB (to get splash and other fun stuff)

---

## 📦 Build Instructions
Everyone knows that by the well known laws of aviation...

```bash
# Build initramfs
chmod +x init
find . -print0 | cpio --null -ov --format=newc > init.cpio
gzip init.cpio

# Copy init to boot
cp init.cpio.gz /boot/
cp bzImage /boot/

# Update GRUB
sudo update-grub
```

---

## 🎨 GRUB Configuration Example
cuz it's bad if it's ugly

```cfg
set gfxmode=1280x1024
set gfxpayload=keep
terminal_output gfxterm

insmod png
background_image /boot/logo.png

menuentry "ThanatOS v0.1.61 [Normal Boot]" {
    linux /boot/bzImage video=VGA-1:1280x1024@60 quiet loglevel=0
    initrd /boot/init.cpio.gz
}

menuentry "ThanatOS v0.1.61 [DEBUG Boot]" {
    linux /boot/bzImage video=VGA-1:1280x1024@60 loglevel=7
    initrd /boot/init.cpio.gz
}
```

---

## 📁 Structure

```
initramfs/
├── init              # Custom init script (shell-based)
├── bin/              # BusyBox and custom tools
├── dev/, proc/, sys/ # Mount points
├── boot/             # Kernel and splash assets
└── logo.png          # ThanatOS splash image
```

---

## 🤝 Credits

Created by **Lester** and **Alas** under the name **MementoSoft**...
ThanatOS is a personal OS project aimed at learning, experimentation, and creative expression, among other stupid autistic things.

---

## 📜 License

This project is licensed under the **GNU General Public License v3.0 (GPL-3.0)**.  
You are free to use, modify, and distribute this software, provided that any derivative work is also licensed under the GPL.  
For full details, see the [GNU GPL v3.0](https://www.gnu.org/licenses/gpl-3.0.en.html).

Just don’t hide the origin of this project. Honestly, don’t.

Not really a license but...
- Thx Bruce Perens for Busybox, with other cool people in 1996
- Atlus Game Design (Because the beta test versions are named after Persona 3, who would have guessed lol)
