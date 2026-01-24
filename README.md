# LaTeX Dev Container

[![Docker Hub](https://img.shields.io/docker/v/gzurowski/latex-devcontainer/latest?label=Docker%20Hub)](https://hub.docker.com/r/gzurowski/latex-devcontainer)

Ready-to-use LaTeX environment for VS Code Dev Containers.

A complete LaTeX environment with zero configuration. No installation, no subscription, no limitations.

## Features

- Built with the **[TeX Live 2025](https://www.tug.org/texlive/)** distribution.
- Images with different [Tex Live schemes](https://www.tug.org/texlive/doc/texlive-en/texlive-en.html#x1-240003.2.2):
  - [`gzurowski/latex-devcontainer:basic`](https://hub.docker.com/repository/docker/gzurowski/latex-devcontainer/tags/basic/) for a basic setup.
  - [`gzurowski/latex-devcontainer:medium`](https://hub.docker.com/repository/docker/gzurowski/latex-devcontainer/tags/medium/) with more packages.
  - [`gzurowski/latex-devcontainer:full`](https://hub.docker.com/repository/docker/gzurowski/latex-devcontainer/tags/full/) with everything.
- Based on the **Ubuntu 24.04 LTS** using [devcontainers/base:noble](https://mcr.microsoft.com/en-us/artifact/mar/devcontainers/base/tag/noble).
- **Linting** with [ChkTeX](https://www.nongnu.org/chktex/) for caching errors as you type.
- **Formatting** with [latexindent](https://github.com/cmhughes/latexindent.pl) for consistent style of save.
- **Multi-architecture** images with support for AMD64 and ARM64 (Apple Silicon).
