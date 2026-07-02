FROM python:3.13-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PATH="/home/devuser/.cargo/bin:/home/devuser/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       build-essential \
       adduser \
       curl \
       git \
       ca-certificates \
       pkg-config \
       libssl-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Python tooling as root so packages are available system-wide
RUN python -m pip install --upgrade pip maturin pytest

# Create a non-root user for development (use full path if PATH issues occur)
RUN /usr/sbin/adduser --disabled-password --gecos '' devuser
USER devuser
WORKDIR /work
RUN mkdir -p /home/devuser/.cargo /home/devuser/.rustup
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain stable

COPY --chown=devuser:devuser pyproject.toml Cargo.toml /work/
COPY --chown=devuser:devuser src /work/src
COPY --chown=devuser:devuser tests /work/tests

RUN pip install -e .

CMD ["bash"]
