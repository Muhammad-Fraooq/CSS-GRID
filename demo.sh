#!/bin/bash

# CSS Grid Demo Launcher
# Simple script to launch the CSS Grid layout demo in your browser

echo "🚀 Starting CSS Grid Layout Demo..."
echo "📁 Opening demo in your browser..."

# Check if Python3 is available
if command -v python3 &> /dev/null; then
    echo "🐍 Using Python3 to serve the demo..."
    cd css_grid
    python3 -m http.server 8080 &
    SERVER_PID=$!
    echo "🌐 Demo available at: http://localhost:8080"
    echo "📖 Press Ctrl+C to stop the server"
    
    # Open browser (works on most systems)
    if command -v xdg-open &> /dev/null; then
        xdg-open "http://localhost:8080" &
    elif command -v open &> /dev/null; then
        open "http://localhost:8080" &
    elif command -v start &> /dev/null; then
        start "http://localhost:8080" &
    else
        echo "🖱️  Manually open http://localhost:8080 in your browser"
    fi
    
    # Wait for Ctrl+C
    trap "kill $SERVER_PID; echo '🛑 Server stopped'; exit" INT
    wait $SERVER_PID
    
elif command -v python &> /dev/null; then
    echo "🐍 Using Python2 to serve the demo..."
    cd css_grid
    python -m SimpleHTTPServer 8080 &
    SERVER_PID=$!
    echo "🌐 Demo available at: http://localhost:8080"
    echo "📖 Press Ctrl+C to stop the server"
    
    trap "kill $SERVER_PID; echo '🛑 Server stopped'; exit" INT
    wait $SERVER_PID
    
else
    echo "❌ Python not found. Please install Python to run the demo server."
    echo "📄 Alternative: Open css_grid/index.html directly in your browser"
fi