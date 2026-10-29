#!/bin/bash
set -euo pipefail

cat > plot.py <<'PYTHON'
import json
from pathlib import Path

import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt

records = [
    ("completed", "Notebook", 4, 10),
    ("completed", "Notebook", 6, 15),
    ("completed", "Pen", 10, 2),
    ("completed", "Pen", 20, 3),
    ("completed", "Folder", 5, 4),
    ("completed", "Folder", 10, 3),
    ("cancelled", "Notebook", 20, 10),
    ("cancelled", "Pen", 100, 2),
    ("cancelled", "Folder", 50, 4),
]
values = {}
for status, product, quantity, price in records:
    if status == "completed":
        values[product] = values.get(product, 0) + quantity * price
products = sorted(values)
revenues = [values[product] for product in products]

fig, ax = plt.subplots(figsize=(6, 4), dpi=150)
bars = ax.bar(products, revenues, color="blue")
ax.bar_label(bars, labels=[f"${amount:.0f}" for amount in revenues], padding=3)
ax.set_title("Revenue from completed orders")
ax.set_xlabel("Product")
ax.set_ylabel("Revenue ($)")
ax.set_ylim(0, max(revenues) * 1.2)
fig.tight_layout()
fig.savefig("figure.png")
plt.close(fig)
Path("plotted_values.json").write_text(json.dumps(values, indent=2) + "\n")
PYTHON

python plot.py
