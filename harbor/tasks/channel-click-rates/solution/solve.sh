#!/bin/bash
set -euo pipefail

cat > plot.py <<'PYTHON'
import json
from pathlib import Path

import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt

records = [
    (2025, "final", "Search", 100, 30),
    (2025, "final", "Search", 900, 60),
    (2025, "final", "Social", 200, 20),
    (2025, "final", "Social", 800, 10),
    (2025, "final", "Email", 100, 30),
    (2025, "final", "Email", 900, 90),
    (2024, "final", "Search", 1000, 400),
    (2024, "final", "Social", 1000, 600),
    (2024, "final", "Email", 1000, 200),
    (2025, "draft", "Search", 1000, 500),
    (2025, "draft", "Social", 1000, 700),
    (2025, "draft", "Email", 1000, 100),
]

totals = {}
for year, status, channel, impressions, clicks in records:
    if year == 2025 and status == "final":
        totals.setdefault(channel, [0, 0])
        totals[channel][0] += impressions
        totals[channel][1] += clicks

rates = {channel: 100 * clicks / impressions
         for channel, (impressions, clicks) in totals.items()}
channels = sorted(rates, key=rates.get, reverse=True)
values = [rates[channel] for channel in channels]

fig, ax = plt.subplots(figsize=(6, 4), dpi=150)
bars = ax.bar(channels, values, color="blue")
ax.bar_label(bars, labels=[f"{value:.1f}%" for value in values], padding=3)
ax.set_title("Final campaign click-through rates (2025)")
ax.set_xlabel("Channel")
ax.set_ylabel("Click-through rate (%)")
ax.set_ylim(0, 15)
fig.tight_layout()
fig.savefig("figure.png")
plt.close(fig)
Path("plotted_values.json").write_text(json.dumps(rates, indent=2) + "\n")
PYTHON

python plot.py
