FROM alpine:3.8

ARG ONAP_TAG=master

COPY run_vvp.sh /run_vvp.sh
RUN chmod +x /run_vvp.sh
RUN apk --no-cache add --update python3 bash git && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    git clone --depth 1 https://git.onap.org/vvp/validation-scripts -b $ONAP_TAG /src/valid_script && \
    cd /src/valid_script && pip3 install -rrequirements.txt --upgrade pip && \
    pip3 install pytest-html && \
    mkdir -p /heat_files

CMD ["/run_vvp.sh", "/heat_files"]
