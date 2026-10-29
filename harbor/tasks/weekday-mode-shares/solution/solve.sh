#!/bin/bash
set -euo pipefail

cat > plot.py <<'PYTHON'
import json
from pathlib import Path

import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt

records = [
    ("Central", "weekday", "Bus", 20),
    ("Central", "weekday", "Bus", 40),
    ("Central", "weekday", "Bicycle", 10),
    ("Central", "weekday", "Bicycle", 20),
    ("Central", "weekday", "Walking", 4),
    ("Central", "weekday", "Walking", 6),
    ("Central", "weekend", "Bus", 90),
    ("Central", "weekend", "Bicycle", 5),
    ("Central", "weekend", "Walking", 5),
    ("West", "weekday", "Bus", 10),
    ("West", "weekday", "Bicycle", 80),
    ("West", "weekday", "Walking", 10),
]
counts = {}
for district, day_type, mode, count in records:
    if district == "Central" and day_type == "weekday":
        counts[mode] = counts.get(mode, 0) + count
values = {mode: 100 * count / sum(counts.values()) for mode, count in counts.items()}
modes = ["Bus", "Bicycle", "Walking"]

fig, ax = plt.subplots(figsize=(6, 5), dpi=150)
wedges, labels, percentages = ax.pie(
    [values[mode] for mode in modes], labels=modes,
    colors=["blue", "orange", "green"], autopct="%.1f%%",
    textprops={"fontsize": 11},
)
for text, color in zip(percentages, ["white", "black", "white"]):
    text.set_color(color)
ax.set_title("Weekday travel in Central")
ax.set_aspect("equal")
fig.tight_layout()
fig.savefig("figure.png")
plt.close(fig)
Path("plotted_values.json").write_text(json.dumps(values, indent=2) + "\n")
PYTHON

python plot.py
