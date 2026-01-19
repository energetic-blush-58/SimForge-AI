#!/bin/bash
# SimForge AI - Deployment Script for AIDP.store
echo "🚀 Starting SimForge AI Lab..."

# Install Docker if not present
if ! command -v docker &> /dev/null
then
    echo "📦 Installing Docker..."
    sudo apt-get update && sudo apt-get install -y docker.io
fi

# Pull the heavy AI models (This is our GPU 'workload')
echo "🧠 Pulling Llama-3 and Physics Models..."
docker pull ollama/ollama

# Start the background engine
docker run -d --gpus all -v ollama:/root/.ollama -p 11434:11434 --name simforge-engine ollama/ollama

echo "✅ SimForge is live! GPU utilization started."
