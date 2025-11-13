# ocd - OpenCode Docker

Builds a docker image for running opencode cli.

## Build

```
docker build -t ocd .
```

### Customise build targets

The default build target architecture is `arm64` and opencode version `1.0.57`.
These can be overridden by passing the `TARGETARCH` and `OPENCODE_VERSION`
during the build process.

```
docker build -t ocd --build-arg TARGETARCH=arm64 --build-arg OPENCODE_VERSION=1.0.57 .
```

## Setup

Install opencode locally and run `opencode auth login` to create the necessary
files. These files will be mounted into the container at runtime.

## Running

Add `ocd` shortcut to your `.bashrc`

```
alias ocd="mkdir -p ~/.local/share/opencode-docker-cache || true && \
  cp ~/.local/share/opencode/auth.json ~/.local/share/opencode-docker-cache && \
  docker run \
  -e GITHUB_TOKEN=$GITHUB_TOKEN \
  -v ~/.local/share/opencode-docker-cache:/root/.local/share/opencode \
  -v ~/.local/share/opentui:/root/.local/share/opentui \
  -v ~/.config/opencode:/root/.config/opencode \
  -v ~/.local/state/opencode:/root/.local/state/opencode \
  -v "${PWD}":/opt \
  -it \
  --rm \
  ocd"
```
