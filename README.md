# Hyperswitch Python WSL Development

This project is configured to run entirely inside Ubuntu WSL.

## Prerequisites
- WSL2 with Ubuntu installed
- Docker installed inside Ubuntu WSL
- VS Code with Remote - WSL and Dev Containers extensions

## Project location
The project is copied into the Linux home directory:

```bash
cd ~/projects/hyperswitch-python
```

## Build

```bash
docker compose build
```

## Run tests

```bash
docker compose run --rm app python -m pytest -q
```

## Development shell

```bash
make shell
```

## VS Code Dev Container

Open the project folder in VS Code and choose:

- Remote-Containers: Reopen in Container

The dev container uses the Dockerfile in the project root and installs Python, Rust toolchain, maturin, and pytest.

## Notes
- This environment is Linux-native and does not require Windows-specific tooling.
- The project source is mounted from the WSL filesystem for best performance.
