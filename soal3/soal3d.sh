#!/bin/bash

now=$(date +'%m%d%Y')
zip -rem Koleksi.zip Kucing_* Kelinci_* -P "$now"