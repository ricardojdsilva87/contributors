FROM python:3.12-slim
LABEL org.opencontainers.image.source https://github.com/github/contributors

WORKDIR /action/workspace
COPY requirements.txt *.py /action/workspace/

RUN python3 -m pip install --no-cache-dir -r requirements.txt \
    && apt-get -y update \
    && apt-get -y install --no-install-recommends git-svn=1:2.25.1-1ubuntu3.11 \
    && rm -rf /var/lib/apt/lists/*

CMD ["/action/workspace/contributors.py"]
ENTRYPOINT ["python3", "-u"]
