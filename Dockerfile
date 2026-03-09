FROM python:3.11


WORKDIR /app

COPY . /app/

RUN apt-get update && \
	apt-get install -y jq curl iputils-ping

RUN pip install --upgrade pip setuptools && \
	pip install poetry

RUN poetry self add poetry-plugin-dotenv

RUN poetry install

EXPOSE 5000

# Entrypoint
CMD ["poetry", "run", "flask", "run", "--host=0.0.0.0"]