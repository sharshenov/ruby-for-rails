#!/bin/sh

mkdir -p $1

for template_dir in templates/* ; do
  dir=$1/$(echo $template_dir | sed 's|^templates/||g')
  mkdir -p $dir

  cat $template_dir/Dockerfile-template | sed "s|##FROM_IMAGE##|$1|g" > $dir/Dockerfile
done