from pathlib import Path

from hyperswitch_python import hello, version


def test_python_package_exposes_rust_backed_api():
    assert hello("Hyperswitch") == "Hello, Hyperswitch!"
    assert version().startswith("0.")
    assert Path(__file__).resolve().parents[1].exists()
