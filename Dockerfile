FROM selenium/standalone-chrome-debug:3.141.59

LABEL maintainer="kazuhito_m"

USER root

# install library

## psmisc for "killall" command.
RUN apt-get update -y \
    && apt-get install -y recordmydesktop psmisc language-pack-ja \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# timezone/locale settings(japanese)

RUN update-locale LANG=ja_JP.UTF-8
RUN echo "LC_ALL=ja_JP.UTF-8" >> /etc/default/locale
RUN mv /etc/localtime /etc/localtime.org
RUN ln -s /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
ENV TZ Asia/Tokyo

# create scripts

RUN echo "#!/bin/bash\nrecordmydesktop --display=\$DIPLAY --no-sound --on-the-fly-encoding --delay=10s -o /output/test-evidence.ogv &" > /usr/local/bin/start-recording
RUN chmod 755 /usr/local/bin/start-recording

RUN echo "#!/bin/bash\nkillall recordmydesktop" > /usr/local/bin/end-recording
RUN chmod 755 /usr/local/bin/end-recording

# movie output directory setup

RUN mkdir /output
RUN chmod 777 /output
WORKDIR /output

USER seluser