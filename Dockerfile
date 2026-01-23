ARG VARIANT="noble"
FROM mcr.microsoft.com/devcontainers/base:${VARIANT}

# Base packages
RUN apt-get update && DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    ca-certificates \
    curl \
    make \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# TexLive packages
RUN apt-get update && DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    texlive-latex-base \
    texlive-latex-extra \
    texlive-science \
    texlive-fonts-recommended \
    texlive-bibtex-extra \
    lmodern \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# LaTeX utilities
RUN apt-get update && DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    biber \
    chktex \
    latexmk \
    python3-pygments \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/*
