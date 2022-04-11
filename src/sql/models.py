from typing import List
import sqlalchemy as db
from sqlalchemy.future import select
from sqlalchemy.orm import declarative_base
from sqlalchemy.ext.asyncio import AsyncSession


Base = declarative_base()


class Account(Base):
    """A database table containing account information."""
    __tablename__ = "account"

    id = db.Column('acct_id', db.Integer, primary_key=True)
    name = db.Column(db.Text(length=200))


async def list_accounts(db_session: AsyncSession) -> List[Account]:
    return await db_session.scalars(select(Account))

