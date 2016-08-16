# stack-fpm
A script to package Haskell projects with `fpm` into `.deb`, `.rpm`, `.pkg` and
other supported formats.

Currently requires `stack` and a `package.yaml` from Hpack usage. There's work
on converting the shell script onto a Haskell script for doing a more principled
implementation.

## Usage
```
$ stack fpm my-project
>>> Building for Linux...
...
>>> Building for Darwin...
...
$ ls dist
my-project-0.1.0.0-1.x86_64.rpm
my-project-0.1.0.0_amd64.deb
my-project-0.1.0.0.pkg
```

## License
AGPLv3
