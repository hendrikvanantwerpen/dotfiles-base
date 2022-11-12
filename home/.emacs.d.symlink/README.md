# Emacs Configuration

Packages are generally installed using `el-get`. Own recipes go into
`el-get-user/recipes`.

Initialisation code for `el-get` installed packages foes into
`el-get-user/inits`. Initialisation code for Emacs or locally
installed packages goes into `inits`. Code for locally installed
packages should be guarded by a require, since they may not be
installed.

