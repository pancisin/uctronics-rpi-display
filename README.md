
# UCTRONICS rpi display

```bash
docker tag uctronics-rpi-display pancisin/uctronics-rpi-display:arm64
```

```bash
docker push pancisin/uctronics-rpi-display
```

``` bash
docker buildx build --platform linux/arm/v7,linux/arm64/v8 . -t uctronics-rpi-display
```