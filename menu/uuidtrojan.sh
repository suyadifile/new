#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SY_��N  �_�qp����������@ F  P���t���k�Q4CF��ަ��S���A4d��&F�MA��&�LS�2@ښA�hhi����F�I�6���� d � �� ��$��=Fɤ�A��h h      �p4�M���F�d��4ѐ 	�D��)�s�v��mL�,О�X���*����m	L
�x�j=���Z�4g9ǚaH`�~^�]�y������<�*Xg2�^���	��$�n��	]t�l�7w�Ґ�!W���uY�zk�� �9��[M0��Xt�\�\"b�Ғ�HT����r(���i�&<�t���^�1��0�f[B�V/'�4�FG��+�[c"3|�������j���"�I>�'|����04s#�5�o ��cj&�!����
#v�DU]c��0"�(=T���)�����ku��hCm��nqpc����z����M�hl�:z8Ɔ��/R�L��tD��GۗO���T���Tn�U&\���d�E��d-���)9�k	_��P��o	��ڐ "�N�h��V��b�Ru�+ l��^L��� R(�����԰�k����#���Z��0�R̈�ѣ��/c��Ve�v�"Az���(RO�����J<JP�)���r7}����eߨGd'��"Q�֔@c�-9�Y9���(�i��9�*������$Q���3�H�I�I��"x00��*��q�_>�?D��8d Y>ॽHq�2�[����Lzս���O�% �I�WF�q�*݆>�����s#(�b�ï���{A�(��3ʼi�a8�A���"H3��`��&��IxW5k��l)�S��2Z1�%a ӕ���,7ĥ)%,n�(����@b�W��:{6���򠰊2Th�JY[�'�h�>Q0�H����ؒ�E�� ���L���DaV��O��r�p�����5�4&�-��C���J.M����1kPx�����+❬�R�Q!���J�t���?A WHB?�HAʀIW�F���w$S�	���