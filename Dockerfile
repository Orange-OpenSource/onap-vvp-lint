FROM alpine:3.8

ARG ONAP_TAG=beijing

COPY run_vvp.sh /run_vvp.sh
RUN chmod +x /run_vvp.sh
RUN apk --no-cache add --update python py-pip bash git && \
    git clone --depth 1 https://git.onap.org/vvp/validation-scripts -b $ONAP_TAG /src/valid_script
RUN cd /src/valid_script && pip install -rrequirements.txt --upgrade pip
RUN pip install pytest-html
RUN mkdir -p /heat_files

CMD ["/run_vvp.sh", "/heat_files"]
