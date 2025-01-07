#!/bin/bash
./purge.sh && ./create_network.sh && ./run_mysql.sh && ./build_image.sh && ./run_app.sh
