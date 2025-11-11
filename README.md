# ocd - OpenCode Docker

Builds a docker image for running opencode cli.

## Build

```
docker build -t ocd .
```

## Running

Run `opencode auth login` to create the necessary files. The files will be
mounted into the container at runtime.

```
docker run \
  -e GITHUB_TOKEN=$GITHUB_TOKEN \
  -v ~/.local/share/opencode:/root/.local/share/opencode \
  -v ~/.local/share/opentui:/root/.local/share/opentui \
  -v ~/.config/opencode:/root/.config/opencode \
  -v ~/.local/state/opencode:/root/.local/state/opencode \
  -v "${PWD}":/opt \
  -it \
  --rm \
  ocd
```
