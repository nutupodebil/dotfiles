These are my strange and perhaps silly dotfiles.

All file and directory names that start with the prefix `dot-` correspond to files in your system’s home directory if you replace this prefix with `.` :
for example, the `dot-scripts` directory corresponds to the `~/.scripts` directory.

First, make sure you have git and stow installed. Otherwise, install them with:
```shell
sudo pacman -S git stow
```

Then clone this repository into the ~/.dotfiles directory (or any other directory that is strictly one level below the home directory (/home/your-user)):
```shell
mkdir ~/.dotfiles
git clone https://github.com/nutupodebil/dotfiles.git ~/.dotfiles
```

Next, go to the ~/.dotfiles directory and invoke stow with the following flags:
```shell
stow --dotfiles .
```

**! IMPORTANT !** `stow` will return an error if there are files (not symlinks) with the same names as the files in this repository in your home or ~/.config or ~/.scripts directories.
You can read more about GNU Stow by following the link: https://www.gnu.org/software/stow/manual/

