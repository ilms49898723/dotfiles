# My Configuration Files

## Tools

### General
- apt: C/C++ compiler
- apt: GNU Make
- apt: Neovim
- apt: cmake
- apt: cscope
- apt: curl
- apt: git
- apt: tmux
- apt: wget
- git: [Universal Ctags](https://github.com/universal-ctags/ctags)
- git: [fzf](https://github.com/junegunn/fzf)
- git: [ripgrep](https://github.com/BurntSushi/ripgrep)

### Neovim
- apt: libtool-bin
- apt: ninja-build
- pip: pynvim
- pip: jedi

## Setup Scripts

- `install_config.sh`: Copy configuration files to $HOME or proper locations
- `setup_zsh_plugins.sh`: Setup plugins for zsh
- `git_config.sh`: Setup configuration for git
- `patch_wsl_config.sh`: Update the setting for Windows Subsystem for Linux (WSL)

## Install Scripts

- `tools/tools_install.sh`: Tools via apt package manager
- `tools/neovim_install.sh`: Neovim: stable release
- `tools/ctags_install.sh`: Universal Ctags: head
