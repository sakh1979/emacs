# Emacs Configuration

Sagun Khatri
sakh1979@gmail.com

**Tested on versions:**
* GNU Emacs 24.5.1 (x86_64-apple-darwin13.1.0, NS apple-appkit-1265.19) of 2015-06-17
* GNU Emacs 24.5.1 (x86_64-pc-linux-gnu, GTK+ Version 3.4.2) of 2015-06-17

## Installing

Clone this repository, and then run the `bootstrap.sh` script. This
will copy all of the necessary files to `~/.emacs` and
`~/.emacs.d`. Note that if these files exist for you already, **this
will overwrite those files**.

Once you have run the bootstrap script, start Emacs (make sure you are
connected to the internet when you do this for the first time). It
will install [`el-get`](https://github.com/dimitri/el-get) and all of
the other plugins listed in the next section. This initial
installation may take a while, so be patient.

## Dependencies

For some of the plugins to work, you will need to have some external
dependencies installed, such as Python, IPython, git, etc. If the
installation gives you an error, it might mean you are missing a
required dependency that el-get doesn't install.

## Emacs plugins

This configuration installs several plugins using
[`el-get`](https://github.com/dimitri/el-get). These plugins are
specified in `.emacs.d/settings/el-get-settings.el`, and are also
listed below:

* `auto-complete` -- auto completion
* `popup` -- visual popup (e.g., for auto completion)
* `color-theme-solarized` -- the [solarized](http://ethanschoonover.com/solarized) color theme
* `magit` -- git plugin
* `markdown-mode` -- support for [Markdown](http://daringfireball.net/projects/markdown/) files
* `helm` -- [completion and selection](https://github.com/emacs-helm/helm) narrowing framework
* `helm-descbinds` -- describe keybindings using helm
* `nyan-mode` -- silly mode that renders a nyan cat to display how far
  you are through a file

## Gotchas

Here are some issues I or others have run into when installing this
configuration.

### Version control systems

To install all the plugins above, you need to have several different
version control systems installed, including `hg`, `git`, `bzr`, and
`cvs`.

### Trouble building AUCTeX

If you get the following error:

`error: el-get: ./autogen.sh el-get could not build auctex [./autogen.sh]`

There are a few possible causes. Try these steps:

1. Make sure you have `automake` and `texlive-full` installed (if you
   are on Ubuntu) or MacTeX (if you are on Mac).
2. Try running emacs from the command line (it could be an issue with
   not finding the right path).
3. If that doesn't work, run emacs from the command line with the
   `--debug-init` flag. This will give you more information about the
   error, and possibly point you towards the solution.

### Tramp is timing out

If you get the error `tramp ssh: connect to host c port 22: Operation
timed out` and you are running OS X Mavericks with Emacs installed
using Homebrew, then this is probably due to the Mavericks
upgrade. Try reinstalling Emacs through Homebrew and remove the folder
`~/.emacs.d/el-get` (note: this will remove all your el-get plugins,
and they will need to be reinstalled).
