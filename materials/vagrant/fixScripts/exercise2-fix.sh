#!/bin/bash
cat /etc/hosts

sudo sed -i '/^127\.0\.0\.1[[:space:]]\+www\.ascii-art\.de/d' /etc/hosts
