# dotfiles-base

## Setting up macOS

- Install OS
  - Skip setting up Apple ID
  - Disable Siri
- Update to latest OS
- Manual settings
  - TouchID for more fingers
  - FileVault
  - Disable natural scrolling
  - Set hostname: System Settings > General > About; Name
  - Disable everything in System Settings > Keyboard; Text Input
  - Disable sounds in System Settings > Sounds
- Install XCode developer tools
  - `xcode-select --install`
- Setup dotfiles
  - `git clone https://github.com/hendrikvanantwerpen/dotfiles.git dotfiles`
  - `cd dotfiles`
  - `git clone https://github.com/hendrikvanantwerpen/dotfiles-base.git modules/base`
  - `script/setup`
- Install other dotfiles modules if necessary
- Import iTerm key bindings manually (?)
- Setup Apple ID
  - Disable all iCloud services
- Allow automation scripts for Firefox & ITerm
- Restore Wacom tablet settings (perhaps must be set manually, restore didn't seem to work)

## Issues & Ideas

- Find a way to include Amethyst settings.
