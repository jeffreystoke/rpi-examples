#!/usr/bin/env python3

from prometheus_client import CollectorRegistry, Gauge, write_to_textfile
import RPi.GPIO as GPIO
import time

MONITOR_PIN = 4

GPIO.setmode(GPIO.BCM)

file_output = '/var/lib/textfile-collections/light.prom'
registry = CollectorRegistry()
g = Gauge('light', 'LIGHT', ['kind'], registry=registry)

try:
    while True:
        GPIO.setup(MONITOR_PIN, GPIO.OUT)
        GPIO.output(MONITOR_PIN, GPIO.LOW)

        time.sleep(15)

        count = 0
        start_time = time.time()
        GPIO.setup(MONITOR_PIN, GPIO.IN)
        while (GPIO.input(MONITOR_PIN) == GPIO.LOW):
            time.sleep(0.1)
        end_time = time.time()

        # capacitor charging time, bigger means darker
        dur = end_time - start_time
        # fake lightness
        light = 100 / dur

        g.labels('lightness').set(light)
        write_to_textfile(file_output, registry)

        print('lightness={:.03f}'.format(light))
except KeyboardInterrupt:
    print('exit')
finally:
    GPIO.cleanup()
