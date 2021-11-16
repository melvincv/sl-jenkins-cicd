#!/bin/bash
cd ..
docker build -t bookzy:1.0 .
docker run --name bookzyappv1 -d -p 8200:8080 bookzy:1.0