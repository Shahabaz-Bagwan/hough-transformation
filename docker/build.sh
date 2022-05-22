#!/bin/bash

echo "building docker image.... "
docker build -t hough-transformation:1.0 .

echo "running the container.."

docker run -d -it --name houghTransformation --mount type=bind,source=`pwd`,target=/projects hough-transformation:1.0 && check=1
