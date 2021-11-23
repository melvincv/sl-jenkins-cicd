#!/bin/bash
cd ..
docker build -t melvincv/bookzy:1.0 .
docker push melvincv/bookzy:1.0