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
RUN git clone --verbose https://github.com/mfinotti/hakafka.git /config/custom_components/hakafka
RUN git clone --verbose https://github.com/mfinotti/ha-custom-events.git /config/custom_components/ha-custom-events
RUN git clone --verbose https://github.com/custom-components/hacs.git /config/custom_components/hacs
