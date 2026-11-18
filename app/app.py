import logging
from contextlib import asynccontextmanager

from fastapi import FastAPI

from app.api.routes import health
from app.settings import get_settings

logger = logging.getLogger(__name__)


@asynccontextmanager
async def lifespan(app: FastAPI):
    logger.info("Starting application...")
    # Create shared clients here and keep them on app.state
    yield
    logger.info("Application stopped")


def create_app() -> FastAPI:
    settings = get_settings()
    app = FastAPI(title=settings.app_name, lifespan=lifespan)
    app.include_router(health.router)
    return app
