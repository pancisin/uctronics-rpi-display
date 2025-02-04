ARG ARCH=$BUILDPLATFORM
# FROM --platform=$BUILDPLATFORM gcc:latest AS build
FROM --platform=$ARCH alpine:latest AS build
 
RUN apk add build-base git linux-headers

LABEL org.label-schema.name="pancisin/uctronics-rpi-display" \
    org.label-schema.description="."

# RUN apt-get update \
#   && apt-get install -y \
#   git 

RUN git clone https://github.com/UCTRONICS/U6143_ssd1306.git

WORKDIR /U6143_ssd1306/C

RUN make clean && make

# ------------------------------
FROM --platform=$ARCH alpine:latest

RUN mkdir /usr/share/app
# ADD docker-entrypoint.sh /usr/share/app/docker-entrypoint.sh
COPY --from=build /U6143_ssd1306/C /usr/share/app

WORKDIR /usr/share/app

# ENTRYPOINT ["/usr/share/app/docker-entrypoint.sh"]
CMD ["./display"]
