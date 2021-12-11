FROM homeassistant/home-assistant:2021.11

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY requirements.txt /usr/src/app/

RUN pip3 install --no-cache-dir -r requirements.txt

COPY . /usr/src/app

#EXPOSE 8123

RUN mkdir -p /config
RUN mkdir -p /config/python_script
RUN mkdir -p /config/custom_components
RUN mkdir -p /config/kairoshub

WORKDIR /config/custom_components
RUN wget https://github.com/mfinotti/hakafka/releases/latest/download/hakafka.zip
RUN unzip hakafka.zip
RUN mv hakafka-main hakafka

RUN wget https://github.com/mfinotti/hakafka/releases/latest/download/ha-custom-events.zip
RUN unzip ha-custom-events.zip
RUN mv ha-custom-events-main ha-custom-events


RUN mkdir -p /config/custom_components/hacs 
WORKDIR /config/custom_components/hacs
RUN wget https://github.com/hacs/integration/releases/latest/download/hacs.zip
RUN unzip hacs.zip 
RUN rm hacs.zip
