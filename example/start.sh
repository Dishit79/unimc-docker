#!/bin/bash
# Simple Minecraft Server Startup Script using ZGC with SIMD Optimizations
# Author: Kristjan Krusic aka krusic22
# Optimized for Java 21+

# Memory settings (in MB)
STARTRAM=128    # Initial RAM allocation
MAXRAM=2024     # Maximum RAM allocation

# Minecraft server JAR file
JARNAME="server.jar"

# Additional server arguments
AFTERJAR="--nogui"

# JVM Parameters for ZGC and SIMD Optimizations
JAVA_OPTS="
  -server
  -XX:+UseZGC
  -XX:+UnlockExperimentalVMOptions
  -XX:-OmitStackTraceInFastThrow
  -XX:+ShowCodeDetailsInExceptionMessages
  -XX:+DisableExplicitGC
  -XX:+PerfDisableSharedMem
  --add-modules=jdk.incubator.vector
"

# Start the server
echo "Starting Minecraft server with ZGC..."
java -Xms${STARTRAM}M -Xmx${MAXRAM}M ${JAVA_OPTS} -jar ${JARNAME} ${AFTERJAR}
