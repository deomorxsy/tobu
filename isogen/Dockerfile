FROM alpine:3.18 as builder


ARG kernel=bzImage
ARG ramdisk=initramfs.cpio.gz

WORKDIR /app/
COPY ./scripts/isogen.sh .
RUN apk update && \
    apk add xorriso && \
    chmod +x ./isogen.sh && \
    . ./isogen.sh \
        scaff_isogen \
        grub_config \
        isolinux_config

#FROM scratch
#COPY --from=builder ./distro.iso .
