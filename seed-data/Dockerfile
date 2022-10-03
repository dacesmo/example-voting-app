FROM python:3.9-slim

# add apache bench (ab) tool
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    apache2-utils time cron \
    && rm -rf /var/lib/apt/lists/*

RUN pip install statsd

WORKDIR /seed

COPY . .

# create POST data files with ab friendly formats
RUN python make-data.py

# Generate Crontab
RUN (crontab -l ; echo "*/2 * * * * /seed/generate-votes.sh >> /var/log/cron.log") | crontab
 
# Give execution rights on the cron job
RUN chmod 0644 /seed/generate-votes.sh
 
# Create the log file to be able to run tail
RUN touch /var/log/cron.log
 
# Run the command on container startup
CMD cron && tail -f /var/log/cron.log