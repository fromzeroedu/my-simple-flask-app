FROM python:3.4.5-slim

# Ensure that Python outputs everything that's printed inside
# the application rather than buffering it.
ENV PYTHONUNBUFFERED 1

# Upgrade pip
RUN pip install --upgrade pip

## make a local directory
RUN mkdir /app

# set "app" as the working directory from which CMD, RUN, ADD references
WORKDIR /app

# now copy all the files in this directory to /code
ADD . .

# pip install the local requirements.txt
RUN pip install -r requirements.txt

# Listen to port 80 at runtime
EXPOSE 5000

# Define our command to be run when launching the container
CMD ["gunicorn", "app:app", "-b", "0.0.0.0:5000", "--workers", "4", "--reload"]
