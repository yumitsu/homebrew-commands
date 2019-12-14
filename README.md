# Collection of useful external Brew commands

## `brew-orphans`
This command shows you leftover directories of improperly uninstalled or removed formulas inside your `Cellar`:
```sh
$ brew orphans
apple-gcc42                      mongodb                           phantomjs
```


## `brew-sha256`
Generate `sha256` hash of local file, remote file or formula's distfile (defined by `url` directive):
```sh
# Formula's distfile hash
$ brew sha256 bash
b4a80f2ac66170b2913efbfb9f2594f1f76c7b1afd11f799e22035d63077fb4

# Remote file hash
$ brew sha256 https://github.com/sindresorhus/pure/archive/v1.11.0.zip
540b5120e83e4b128900be7df38c25a819f54b8213957959820d7e186774c0ec

# Local file hash
brew sha256 ~/.zshrc
571105edda9e8c3a5165e22442e61e02e299603ba7ab210bb2bd41acabe28a7b
```
