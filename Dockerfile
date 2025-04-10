FROM debian:bullseye-slim

# Set noninteractive frontend for apt to avoid prompts
ENV DEBIAN_FRONTEND=noninteractive

# Update apt cache and install dependencies:
# - bash: The Bash shell
# - texlive-latex-base: Provides pdflatex and basic LaTeX packages
# - texlive-fonts-recommended: Commonly needed fonts for TeX Live
# - poppler-utils: Provides pdfunite, pdfseparate, etc.
# Use --no-install-recommends to keep the image smaller
# Clean up apt cache afterwards
RUN apt-get update && apt-get install -y --no-install-recommends \
    bash \
    texlive-full \
    poppler-utils \
    && rm -rf /var/lib/apt/lists/*

# Add same user as host to share with same file permissions
ARG UID
ARG GID

ENV HOST_UID=${UID}
ENV HOST_GID=${GID}

RUN groupadd -g ${GID} host_group \
    && useradd -u ${UID} -g ${GID} --create-home --shell /bin/bash host_user \
    && usermod -aG sudo host_user \
    && mkdir -p /etc/sudoers.d \
    && echo "host_user ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/host_user

#WORKDIR /workdir

# Set the default command to run a Bash shell
CMD ["bash"]