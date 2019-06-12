#!/usr/bin/env bash

iw dev | grep ssid | sed s/ssid//
