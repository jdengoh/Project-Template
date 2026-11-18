from collections.abc import Iterator

import pytest
from fastapi.testclient import TestClient

from app.main import app


@pytest.fixture
def client() -> Iterator[TestClient]:
    # The context manager runs the app lifespan (startup/shutdown).
    with TestClient(app) as c:
        yield c
