import logging.config
from pathlib import Path

import yaml


def setup_logging() -> None:
    """Load logging configuration from YAML file."""
    config_path = Path(__file__).resolve().parents[1] / "config" / "logging.yaml"
    with open(config_path, encoding="utf-8") as f:
        config = yaml.safe_load(f)

    logging.config.dictConfig(config)
