FROM kalilinux/kali-rolling

# Install essential build tools and dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    git \
    util-linux \
    libbluetooth-dev \
    tk-dev \
    uuid-dev \
    gh \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Install Node.js 20.x (required for E2B)
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs && \
    rm -rf /var/lib/apt/lists/*

# Install Yarn globally
RUN npm install -g yarn@1.22.19

# Install essential hacking tools
RUN apt-get update && apt-get install -y \
    metasploit-framework \
    nmap \
    burpsuite \
    wireshark \
    john \
    hydra \
    aircrack-ng \
    sqlmap \
    nikto \
    && rm -rf /var/lib/apt/lists/*

# Set up default user (kali)
RUN useradd -m kali && \
    mkdir -p /home/kali/.ssh && \
    chown kali:kali /home/kali/.ssh

USER kali
WORKDIR /home/kali