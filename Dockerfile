# Base image
FROM eclipse-temurin:21-jre-jammy

# Set working directory
WORKDIR /minecraft

# Copy server jar and any necessary files
# COPY /minecraft /minecraft

# Install necessary tools (e.g., socat for input/output bridging)
RUN apt-get update && apt-get install -y socat && rm -rf /var/lib/apt/lists/*

# Entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Start Minecraft via the entrypoint script
ENTRYPOINT ["/entrypoint.sh"]
