FROM pytorch/pytorch:1.13.1-cuda11.6-cudnn8-runtime

COPY . /ritnet
COPY ./requirements.txt /install/requirements.txt
RUN apt-get update && apt-get install -y python3-opencv git

RUN pip install -r /install/requirements.txt

WORKDIR /ritnet
RUN pip install -e .

CMD ["python", "ritnet_demo.py"]