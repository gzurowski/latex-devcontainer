# LaTeX Dev Container

[![Docker Hub](https://img.shields.io/docker/v/gzurowski/latex-devcontainer/latest?label=Docker%20Hub)](https://hub.docker.com/r/gzurowski/latex-devcontainer)
[![Build](https://img.shields.io/github/actions/workflow/status/gzurowski/latex-devcontainer/build.yml?branch=main)](https://github.com/gzurowski/latex-devcontainer/actions)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

Ready-to-use LaTeX environment for Visual Studio Code Dev Containers.

A complete LaTeX environment with zero configuration. No installation, no subscription, no limitations.

## Features

- Built with the **[TeX Live 2025](https://www.tug.org/texlive/)** distribution.
- Images with different [Tex Live schemes](https://www.tug.org/texlive/doc/texlive-en/texlive-en.html#x1-240003.2.2):
  - [`gzurowski/latex-devcontainer:basic`](https://hub.docker.com/layers/gzurowski/latex-devcontainer/basic/) for a basic setup.
  - [`gzurowski/latex-devcontainer:medium`](https://hub.docker.com/layers/gzurowski/latex-devcontainer/medium/) with more packages.
  - [`gzurowski/latex-devcontainer:full`](https://hub.docker.com/layers/gzurowski/latex-devcontainer/full/) with everything.
- Based on the **Ubuntu 24.04 LTS** using [devcontainers/base:noble](https://mcr.microsoft.com/en-us/artifact/mar/devcontainers/base/tag/noble).
- **Linting** with [ChkTeX](https://www.nongnu.org/chktex/) for caching errors as you type.
- **Formatting** with [latexindent](https://github.com/cmhughes/latexindent.pl) for consistent style of save.
- **Multi-architecture** images with support for AMD64 and ARM64 (Apple Silicon).

## Issues

If you encounter any problems or have suggestions, please [open an issue](https://github.com/gzurowski/latex-devcontainer/issues).

## Quick Start

### Option 1: Visual Studio Dev Container

You must have Docker and Visual Studio Code with the [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) installed.
See the Visual Studio Code's [Dev Containers documentation](https://code.visualstudio.com/docs/devcontainers/containers#_installation) for setup details.

Add the following `.devcontainer/devcontainer.json` file to your project:

```json
{
  "name": "LaTeX",
  "image": "gzurowski/latex-devcontainer:full",
  "customizations": {
    "vscode": {
      "extensions": ["James-Yu.latex-workshop"],
      "settings": {
        "editor.formatOnSave": true,
        "latex-workshop.latex.autoBuild.run": "onSave",
        "latex-workshop.linting.chktex.enabled": true
      }
    }
  }
}
```

Target the desired scheme using the `image` tag (`basic`, `medium` or `full`).

Open the folder in VSCode and select **Dev Containers: Reopen in Container**.

### Option 2: GitHub Codespaces

Click the button below to launch a fully configured LaTeX environment in your browser:

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/gzurowski/latex-devcontainer)

### Option 3: Docker

You can also use the container directly (without Visual Studio Code) to build your LaTeX projects:

```bash
docker run --rm -v $(pwd):/workspace -w /workspace gzurowski/latex-devcontainer:full latexmk -pdf document.tex
```

This mounts your current directory into the container, builds the document, and writes the output PDF back to the host.

## Additional Packages

Use the [TeX Live package manager](https://www.tug.org/texlive/tlmgr.html) to install packages not included in your chosen scheme:

```bash
tlmgr install <PACKAGE_NAME>
```

For a persistent installation, extend the Dockerfile or add to `postCreateCommand` in your `devcontainer.json` file:

```json
{
  "postCreateCommand": "tlmgr install <PACKAGE_NAME>"
}
```

