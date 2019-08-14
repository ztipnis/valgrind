# Valgrind for macOS

This repository contains a version of Valgrind including a few patches to improve support for the macOS platform.

## Status

Valgrind now builds on macOS Catalina (tested on 10.15[b5]).

## Usage

In order to use this version, use the following command:

```
brew install --HEAD https://raw.githubusercontent.com/zatipnis/valgrind/catalina/valgrind.rb
```

In case you already have Valgrind installed, you will need to either `unlink` it first or `reinstall` it.

## CLion

Valgrind executable:
/usr/local/bin/valgrind

Analysis options:
--leak-check=full --leak-resolution=med --track-origins=yes --vgdb=no

For testing/developing/checking:
--trace-syscalls=yes

