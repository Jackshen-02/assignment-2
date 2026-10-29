#!/bin/bash
set -euo pipefail

cat > plot.py <<'PYTHON'
import json
from pathlib import Path

import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt

values = {'Before update': {'Account authentication': [180, 240, 210, 260],
                   'Payment authorization': [220, 200, 250, 230],
                   'Product search': [100, 150, 130, 170]},
 'After update': {'Account authentication': [120, 160, 140, 170],
                  'Payment authorization': [150, 130, 170, 150],
                  'Product search': [80, 100, 90, 110]}}
times = ["09:00", "10:00", "11:00", "12:00"]
styles = {
    "Account authentication": ("blue", "-", "o"),
    "Payment authorization": ("orange", "--", "s"),
    "Product search": ("green", ":", "^"),
}
plt.rcParams.update({"font.size": 9})
fig, axes = plt.subplots(1, 2, figsize=(8, 4.5), dpi=150, sharey=True)
for ax, (panel, series) in zip(axes, values.items()):
    for service, numbers in series.items():
        color, line, marker = styles[service]
        ax.plot(times, numbers, color=color, linestyle=line, marker=marker, label=service)
    ax.set_title(panel)
    ax.set_xlabel("Time")
    ax.set_ylim(0, 300)
    ax.legend(loc="upper center", bbox_to_anchor=(0.5, -0.22), fontsize=9)
axes[0].set_ylabel("Response time (ms)")
fig.subplots_adjust(left=0.10, right=0.98, top=0.90, bottom=0.37, wspace=0.17)
fig.savefig("figure.png")
plt.close(fig)
Path("plotted_values.json").write_text(json.dumps(values, indent=2) + "\n")
PYTHON

python plot.py
