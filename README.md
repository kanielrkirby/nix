# `nxdv`

This repo's primary use-case is to allow me an easy way of getting a useable environment for various languages (currently, Rust is the only one set up).

## Getting Started

### Prerequisites

To use the development environments in this repository, you must have Nix installed on your system. If Nix is not already installed, you can install it by running:

```bash
sh <(curl -L https://nixos.org/nix/install)
```

Ensure that you have [enabled Nix Flakes](https://nixos.wiki/wiki/Flakes). To enable it for just the following commands, just pass in `--experimental-features 'nix-command flakes'` with the rest of the command.

### How to Use

The way I typically make use of this repo is simply calling it remotely. For example:

```bash
$ nix develop github:kanielrkirby/nix?dir=rust
```

You can also clone it though:

```bash
$ git clone https://github.com/kanielrkirby/nix
$ cd nix/rust
$ nix develop
```

### Rust Development Environment

The Rust development environment in this repository is specifically designed to cater to Rust developers' needs, featuring tools and utilities for effective Rust development.

#### Features

- **Toolchain Management**: This devShell makes use of a `rust-toolchain.toml`, which makes customizing more idiomatic for Rust users. Currently requires you to update the hash (looking for a workaround to simplify this).
- **Extra Tools**: Includes various tools like `bacon`, `evcxr`, `cargo-binstall`, `cargo-flamegraph`, etc.
- **WebAssembly and Web Tooling**: Includes WebAssembly tools `cargo-leptos`, `cargo-tauri`, and `cargo-wasi`.

## Contributing

While this is, first and foremost, a personal repository, contributions are definitely welcome! If you have suggestions for improving the development environments or adding new ones, please feel free to create issues or pull requests, and I'll review them when I get a chance!
