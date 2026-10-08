#!/usr/bin/env python3
"""Compatibility entry point: the public website now builds without Flutter."""
import subprocess
from pathlib import Path
subprocess.run(['npm', 'run', 'build'], cwd=Path(__file__).resolve().parents[1], check=True)
