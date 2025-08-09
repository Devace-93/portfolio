#!/usr/bin/env python3
"""
Database Learning Project Quick Setup
Run this script to get started quickly with your database learning project.
"""

import subprocess
import sys
import os
from pathlib import Path

def main():
    print("🚀 Database Learning Project - Quick Setup")
    print("=" * 50)
    
    # Check if we're in the right directory
    current_dir = Path.cwd()
    if not (current_dir / "docker-compose.yml").exists():
        print("❌ docker-compose.yml not found!")
        print("Make sure you're running this from the databases/ directory")
        return
    
    print("1. Starting Docker containers...")
    try:
        result = subprocess.run(["docker-compose", "up", "-d"], 
                              capture_output=True, text=True)
        if result.returncode == 0:
            print("✅ Docker containers started successfully!")
        else:
            print(f"❌ Failed to start containers: {result.stderr}")
            return
    except FileNotFoundError:
        print("❌ Docker not found! Please install Docker first.")
        return
    
    print("\n2. Installing Python packages...")
    packages = ["mysql-connector-python", "psycopg2-binary", "pandas", "jupyter", "jupyterlab"]
    
    for package in packages:
        print(f"   Installing {package}...")
        subprocess.run([sys.executable, "-m", "pip", "install", package], 
                      capture_output=True)
    
    print("✅ Python packages installed!")
    
    print("\n🎉 Setup Complete!")
    print("\n📋 What's available:")
    print("   • MySQL database: localhost:3306 (root/rootpassword)")
    print("   • PostgreSQL database: localhost:5432 (postgres/postgres)")  
    print("   • Adminer web interface: http://localhost:8080")
    print("   • Sample data and tables are already loaded")
    
    print("\n🚀 Get started:")
    print("   1. Open the notebook: jupyter lab notebooks/database-connection-tutorial.ipynb")
    print("   2. Or connect directly to databases using the credentials above")
    print("   3. Check out the documentation in docs/ folder")
    print("   4. Try the example SQL queries in sql/ folder")
    
    print(f"\n📁 Project location: {current_dir}")

if __name__ == "__main__":
    main()
