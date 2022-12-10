FROM mcr.microsoft.com/devcontainers/base:bullseye

ARG SBCL_VERSION=2.2.11
ARG SBCL_ARCH=x86-64

COPY setup.lisp /tmp/setup.lisp

RUN set -x && \
    curl -Ls "http://prdownloads.sourceforge.net/sbcl/sbcl-${SBCL_VERSION}-${SBCL_ARCH}-linux-binary.tar.bz2" | \
    tar -xj --directory /tmp/ && \
    cd "/tmp/sbcl-${SBCL_VERSION}-${SBCL_ARCH}-linux/" && \
    sh install.sh && \
    curl -LO https://beta.quicklisp.org/quicklisp.lisp  && \
    su vscode -c "sbcl --non-interactive --load quicklisp.lisp --eval '(quicklisp-quickstart:install)' --eval '(ql-util:without-prompting (ql:add-to-init-file))'" && \
    su vscode -c "sbcl --non-interactive --load /tmp/setup.lisp" && \
    rm -rf "/tmp/sbcl-${SBCL_VERSION}-${SBCL_ARCH}-linux/"