ARG VARIANT="noble"
FROM mcr.microsoft.com/devcontainers/base:${VARIANT}

ARG USERNAME=vscode
ARG TEXLIVE_SCHEME="basic"
ARG TEXLIVE_YEAR="2026"
ARG TEXLIVE_MIRROR="https://ftp.math.utah.edu/pub/tex/historic/systems/texlive"
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install --no-install-recommends \
    perl wget \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /tmp/texlive \
    && cd /tmp/texlive \
    && wget -q ${TEXLIVE_MIRROR}/${TEXLIVE_YEAR}/install-tl-unx.tar.gz \
    && tar -xzf install-tl-unx.tar.gz --strip-components=1 \
    && export TEXLIVE_INSTALL_NO_CONTEXT_CACHE=1 \
    && export TEXLIVE_INSTALL_NO_WELCOME=1 \
    && ./install-tl \
    --no-interaction --scheme=${TEXLIVE_SCHEME} \
    --texdir /usr/local/texlive \
    --no-doc-install --no-src-install \
    && chown -R ${USERNAME}:${USERNAME} /usr/local/texlive \
    && rm -rf /tmp/texlive

# Include both architectures in the path:
ENV PATH="/usr/local/texlive/bin/x86_64-linux:/usr/local/texlive/bin/aarch64-linux:${PATH}"

# Additional TeX Live packages
RUN tlmgr install \
    biber \
    chktex \
    latexindent \
    latexmk

# Latexindent dependencies
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install --no-install-recommends \
    cpanminus \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/* \
    && cpanm File::HomeDir YAML::Tiny

