#!/bin/bash

set -x
set -e

container_build=$1
date=$(date '+%Y-%m-%d')

# Build
$container_build build . --file Containerfile --target base -t ghcr.io/jackm97/my-nvim-ide:base_"$date"
$container_build build . --file Containerfile --target my-nvim-ide:rocky9 -t ghcr.io/jackm97/my-nvim-ide:rocky9_"$date"
$container_build build . --file Containerfile --target my-nvim-ide:ubu22.04 -t ghcr.io/jackm97/my-nvim-ide:ubu22.04_"$date"

# Tag
$container_build tag ghcr.io/jackm97/my-nvim-ide:base_"$date" ghcr.io/jackm97/my-nvim-ide:base

$container_build tag ghcr.io/jackm97/my-nvim-ide:rocky9_"$date" ghcr.io/jackm97/my-nvim-ide:rocky9
$container_build tag ghcr.io/jackm97/my-nvim-ide:rocky9 ghcr.io/jackm97/my-nvim-ide:rocky-latest
$container_build tag ghcr.io/jackm97/my-nvim-ide:rocky9 ghcr.io/jackm97/my-nvim-ide:latest

$container_build tag ghcr.io/jackm97/my-nvim-ide:ubu22.04_"$date" ghcr.io/jackm97/my-nvim-ide:ubu22.04
$container_build tag ghcr.io/jackm97/my-nvim-ide:ubu22.04 ghcr.io/jackm97/my-nvim-ide:ubu-latest

# Push
$container_build push ghcr.io/jackm97/my-nvim-ide:base_"$date"
$container_build push ghcr.io/jackm97/my-nvim-ide:base

$container_build push ghcr.io/jackm97/my-nvim-ide:rocky9_"$date"
$container_build push ghcr.io/jackm97/my-nvim-ide:rocky9
$container_build push ghcr.io/jackm97/my-nvim-ide:rocky-latest
$container_build push ghcr.io/jackm97/my-nvim-ide:latest

$container_build push ghcr.io/jackm97/my-nvim-ide:ubu22.04_"$date"
$container_build push ghcr.io/jackm97/my-nvim-ide:ubu22.04
$container_build push ghcr.io/jackm97/my-nvim-ide:ubu-latest
