"""Check the output files and declared click-through rates."""

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


def test_click_through_rates():
    sidecar = APP / "plotted_values.json"
    assert sidecar.is_file(), "plotted_values.json is missing"
    actual = json.loads(sidecar.read_text())
    # Email = 120/1000, Search = 90/1000, Social = 30/1000, as percentages.
    expected = {"Email": 12.0, "Search": 9.0, "Social": 3.0}
    assert isinstance(actual, dict), "expected a JSON object"
    assert actual.keys() == expected.keys(), "unexpected channel names"
    for channel, rate in expected.items():
        value = actual[channel]
        assert isinstance(value, (int, float)) and not isinstance(value, bool), (
            f"{channel} must have a numeric rate"
        )
        assert math.isclose(value, rate, rel_tol=0, abs_tol=1e-6), (
            f"{channel} has rate {value}, expected {rate}"
        )
