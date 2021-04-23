FROM alpine:latest
RUN apk update && apk --no-cache add \
        curl \
        git \
        vim \
        python3 \
        ffmpeg
RUN python3 -m ensurepip
RUN pip3 install --upgrade youtube_dl
RUN mkdir /download && chmod 777 /download
COPY download-mp3.sh /bin/download-mp3
RUN chmod +x /bin/download-mp3
RUN chmod 777 /bin/download-mp3
RUN PATH=/bin/download-mp3:$PATH && export PATH
CMD [ "/bin/sh" ]