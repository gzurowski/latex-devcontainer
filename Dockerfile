ARG VARIANT="noble"
FROM mcr.microsoft.com/devcontainers/base:${VARIANT}

ARG TEXLIVE_SCHEME="medium"
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install --no-install-recommends \
    perl wget \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /tmp/texlive \
    && cd /tmp/texlive \
    && wget -q https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz \
    && tar -xzf install-tl-unx.tar.gz --strip-components=1 \
    && export TEXLIVE_INSTALL_NO_CONTEXT_CACHE=1 \
    && export TEXLIVE_INSTALL_NO_WELCOME=1 \
    && ./install-tl \
        --no-interaction --scheme=${TEXLIVE_SCHEME} \
        --texdir /usr/local/texlive \
        --no-doc-install --no-src-install \
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

