From node

USER root
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y libicu-dev && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN yarn add -g encoding irc node-telegram-bot-api request encoding jsonfile

RUN useradd -ms /bin/bash orzbot
USER orzbot

RUN mkdir -p /home/orzbot/.orzbot
VOLUME ["/home/orzbot/.orzbot"]

WORKDIR /home/orzbot/.orzbot

CMD ["sh", "-c", "main.js"]
