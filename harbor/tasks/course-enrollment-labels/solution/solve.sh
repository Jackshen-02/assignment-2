#!/bin/bash
set -euo pipefail

cat > plot.py <<'PYTHON'
import json
from pathlib import Path

import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt

import textwrap

values = {'Introduction to Statistical Learning': 48,
 'Applied Data Visualization': 35,
 'Foundations of Database Systems': 42,
 'Practical Natural Language Processing': 27,
 'Probability for Computing': 31,
 'Responsible Artificial Intelligence': 22}
courses = list(values)
counts = list(values.values())
plt.rcParams.update({"font.size": 9})
fig, ax = plt.subplots(figsize=(7, 5), dpi=150)
bars = ax.bar(range(len(courses)), counts, color="blue")
ax.set_xticks(range(len(courses)), [textwrap.fill(name, 16) for name in courses])
ax.bar_label(bars, labels=[str(count) for count in counts], padding=3)
ax.set_title("Course enrollment")
ax.set_xlabel("Course")
ax.set_ylabel("Students")
ax.set_ylim(0, 60)
fig.tight_layout()
fig.savefig("figure.png")
plt.close(fig)
Path("plotted_values.json").write_text(json.dumps(values, indent=2) + "\n")
PYTHON

python plot.py
