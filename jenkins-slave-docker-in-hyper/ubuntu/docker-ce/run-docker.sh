#!/bin/bash

/usr/bin/dockerd -H tcp://0.0.0.0:2375 -H unix:///var/run/docker.sock
