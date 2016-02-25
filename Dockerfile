FROM ubuntu:xenial

MAINTAINER Kirth Gersen "kgersen@hotmail.com"

RUN apt-get update && apt-get -y upgrade

RUN apt-get install -y ca-certificates git git-core gnupg \
  flex bison gperf build-essential \
  zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 \
  lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev ccache \
  libgl1-mesa-dev libxml2-utils xsltproc unzip

RUN apt-get install -y joe bc python-networkx openjdk-7-jdk libproc-processtable-perl patchutils mercurial
