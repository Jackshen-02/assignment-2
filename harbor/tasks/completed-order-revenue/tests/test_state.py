"""Check the output files and declared plotted values."""

import json
import math
from pathlib import Path

import numpy as np
from PIL import Image

APP = Path("/app")


def test_plot_script_exists():
    assert (APP / "plot.py").is_file(), "plot.py is missing"
    assert (APP / "plot.py").stat().st_size > 0, "plot.py is empty"


def test_figure_is_valid():
    figure = APP / "figure.png"
    assert figure.is_file(), "figure.png is missing"
    assert figure.stat().st_size > 1000, "figure.png is too small"
    with Image.open(figure) as image:
        image.verify()
    with Image.open(figure) as image:
        assert image.format == "PNG", "figure.png must be a PNG"
        assert min(image.size) > 100, "figure.png is too small"
        pixels = np.asarray(image.convert("RGB")).reshape(-1, 3)
    # This only rejects simple blank canvases, not every empty or wrong chart.
    assert len(np.unique(pixels, axis=0)) > 4, "figure.png looks blank"


def test_plotted_values():
    sidecar = APP / "plotted_values.json"
    assert sidecar.is_file(), "plotted_values.json is missing"
    actual = json.loads(sidecar.read_text())
    expected = {'Folder': 50, 'Notebook': 130, 'Pen': 80}
    assert isinstance(actual, dict), "expected a JSON object"
    assert actual.keys() == expected.keys(), "unexpected keys"
    for key, target in expected.items():
        value = actual[key]
        assert isinstance(value, (int, float)) and not isinstance(value, bool), (
            f"{key} must have a numeric value"
        )
        assert math.isclose(value, target, rel_tol=0, abs_tol=1e-6), (
            f"{key} has value {value}, expected {target}"
        )
