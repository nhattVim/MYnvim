<div align="center">
    <h1>MYnvim 💫</h1>
</div>

![](https://github.com/nhattVim/assets/blob/master/MYnvim/rice1.png?raw=true)

## Preview

<div align="center">
    <table>
        <tr>
            <td><img src="https://github.com/nhattVim/assets/blob/master/MYnvim/pre1.png?raw=true"/></td>
            <td><img src="https://github.com/nhattVim/assets/blob/master/MYnvim/pre2.png?raw=true"/></td>
        </tr>
    </table>
    <table>
        <tr>
            <td><img src="https://github.com/nhattVim/assets/blob/master/MYnvim/pre3.png?raw=true"/></td>
            <td><img src="https://github.com/nhattVim/assets/blob/master/MYnvim/pre4.png?raw=true"/></td>
            <td><img src="https://github.com/nhattVim/assets/blob/master/MYnvim/pre5.png?raw=true"/></td>
        </tr>
    </table>
</div>

## Advice

> [!Important]
> You should only use this configuration on Linux or WSL (Windows Subsystem for Linux), not on Windows. If used on Windows, it may result in various errors, and I don't have the time to troubleshoot them.
> You can use this script to set up your WSL (Ubuntu)
>
> ```
> bash <(curl -sSL https://is.gd/nhattVim_wsl)
> ```

## Dependencies

- Prerequisites:
    - Make sure you have installed the latest version of [Neovim v0.10.0+](https://github.com/neovim/neovim/releases/tag/v0.10.3).
    - Have [git](https://cli.github.com/), [make](https://www.gnu.org/software/make/), [python](https://www.python.org/), [nodejs](https://nodejs.org/), and [cargo](https://www.rust-lang.org/tools/install) installed on your system
    - Install [lazygit](https://github.com/jesseduffield/lazygit#installation) to launch lazygit in neovim with `<leader>gg` _(optional)_
    - Install [translate-shell](https://github.com/soimort/translate-shell) to translate text with `<leader>ut` _(optional)_
    - For [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) _(optional)_
        - live grep: [ripgrep](https://github.com/BurntSushi/ripgrep)
        - find files: [fzf](https://github.com/junegunn/fzf)
    - A terminal that support true color and undercurl:
        - [kitty](https://github.com/kovidgoyal/kitty) *(Linux & Macos)*
        - [wezterm](https://github.com/wez/wezterm) *(Linux, Macos & Windows)*
        - [alacritty](https://github.com/alacritty/alacritty) *(Linux, Macos & Windows)*
        - [iterm2](https://iterm2.com/) *(Macos)*
        - [PowerShell 7+](https://learn.microsoft.com/en-us/powershell/scripting/whats-new/migrating-from-windows-powershell-51-to-powershell-7?view=powershell-7.2) _(Windows)_

    ```bash
    # Then run this command:
    pip install pynvim
    npm install neovim -g
    ```

- Necessary font:
    - [MesloLGS NF Regular.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf)
    - [MesloLGS NF Bold.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf)
    - [MesloLGS NF Italic.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf)
    - [MesloLGS NF Bold Italic.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf)

## Install

- Make sure you have removed old nvim and nvim-data folders

```bash
# Windows PowerShell
rm -Force -Recurse "$env:LOCALAPPDATA\nvim"
rm -Force -Recurse "$env:LOCALAPPDATA\nvim-data"

# Linux / Macos (unix)
rm -rf ~/.config/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim
```

- Then run this command:

```bash
# Window
git clone https://github.com/nhattVim/MYnvim "$env:LOCALAPPDATA\nvim" --depth 1

# Linux / Macos (unix)
git clone https://github.com/nhattVim/MYnvim ~/.config/nvim --depth 1
```

- You can remove .git file with this command:

```bash
# Window
rm -Force -Recurse "$env:LOCALAPPDATA\nvim\.git"

# Linux / Macos (unix)
rm -rf ~/.config/nvim/.git
```

Now just open neovim and enjoy.

![](https://github.com/nhattVim/assets/blob/master/MYnvim/rice2.png?raw=true)

## Docker

A special way to test MYnvim with docker.

<!-- ```bash -->
<!-- # create nvim-data volume -->
<!-- docker volume create nvim-data -->
<!---->
<!-- # replace '$1' with the file address you want to open -->
<!-- docker run -it -p 8080:8080 -v '$1':/workspace -v nvim-data:/root mynvim/nvim -->
<!---->
<!-- # example Window -->
<!-- docker run -it -p 8080:8080 -v ${pwd}:/workspace -v nvim-data:/root mynvim/nvim -->
<!---->
<!-- # exmaple Linux -->
<!-- docker run -it -p 8080:8080 -v $HOME:/workspace -v nvim-data:/root mynvim/nvim -->
<!-- ``` -->

```bash
# Create MYnvim-data volume
sudo docker volume create MYnvim-data

# Then run this command for the first time
sudo docker run -it --name MYnvim -v MYnvim-data:/root -v $HOME:/mnt archlinux:latest /bin/bash -c "
    pacman -Syu --noconfirm
    pacman -S --noconfirm base-devel curl wget unzip neovim python nodejs npm lazygit fzf ripgrep
    if [ ! -d \"\$HOME/.config/nvim\" ]; then
        git clone https://github.com/nhattVim/MYnvim \$HOME/.config/nvim --depth 1
    else
        cd \$HOME/.config/nvim && git pull
    fi
    cd /mnt
    nvim
"

# Then run this command every time you want to run MYnvim
sudo docker start -ai MYnvim
```
