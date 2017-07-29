#!/bin/bash

# ���̃t�@�C�������݂���ꏊ�ɂ���.�Ŏn�܂閼�O�̃t�@�C���̃V���{���b�N�����N��
# �z�[���f�B���N�g���z���ɏ㏑���쐬����D

path=$(cd $(dirname $0) && pwd)

for file in $(find "$path" -maxdepth 1 -type f -name '.*' ! -name '.' )
do
  file=$(basename $file)
  echo "ln -sf $path/$file $HOME/$file"
  ln -sf "$path/$file" "$HOME/$file"
done

