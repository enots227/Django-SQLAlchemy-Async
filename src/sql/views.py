from django.shortcuts import render
from django.http import HttpResponse
from django.conf import settings
from sqlalchemy.ext.asyncio import AsyncSession
from .models import *


async def view1(request):
    html = '<html><body><ul>'

    async with settings.DB_SESSION_MAKER() as db_session:
        items = await list_accounts(db_session)

        for item in items:
            html += '<li>' + item.name + '</li>'

    html += '</ul></body></html>'

    return HttpResponse(html)


async def view2(request):
    html = '<html><body><ul>'

    db_session: AsyncSession = settings.DB_SESSION_MAKER()

    items = await list_accounts(db_session)

    await db_session.close()

    for item in items:
        html += '<li>' + item.name + '</li>'

    html += '</ul></body></html>'

    return HttpResponse(html)


async def view3(request):
    html = '<html><body><ul>'

    db_session: AsyncSession = settings.DB_SESSION_MAKER()

    items = await list_accounts(db_session)

    db_session.close() # throws async warning since missing await, but works

    for item in items:
        html += '<li>' + item.name + '</li>'

    html += '</ul></body></html>'

    return HttpResponse(html)
