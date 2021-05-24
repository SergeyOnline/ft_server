#!/bin/bash

docker build -t ft_server /Users/sergej/student/ft_server && docker run --rm -p 80:80 -p 443:443 -it ft_server
