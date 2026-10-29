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
    expected = {'Before update': {'Account authentication': [180, 240, 210, 260],
                       'Payment authorization': [220, 200, 250, 230],
                       'Product search': [100, 150, 130, 170]},
     'After update': {'Account authentication': [120, 160, 140, 170],
                      'Payment authorization': [150, 130, 170, 150],
                      'Product search': [80, 100, 90, 110]}}
    assert isinstance(actual, dict), "expected a JSON object"
    assert actual.keys() == expected.keys(), "unexpected keys"
    for panel, services in expected.items():
        assert isinstance(actual[panel], dict), f"{panel} must be an object"
        assert actual[panel].keys() == services.keys(), f"wrong services in {panel}"
        for service, numbers in services.items():
            observed = actual[panel][service]
            assert isinstance(observed, list) and len(observed) == 4, (
                f"{panel}, {service} needs four values"
            )
            for value, target in zip(observed, numbers):
                assert isinstance(value, (int, float)) and not isinstance(value, bool)
                assert math.isclose(value, target, rel_tol=0, abs_tol=1e-6), (
                    f"{panel}, {service} has value {value}, expected {target}"
                )
