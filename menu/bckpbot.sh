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
BZh91AY&SY�y�v  ���g�� ����������@F�  P^swiڻ+��]��(����&S�d��F�4 4��  h@Te6��5<��ё��h d   �� 	!	�'�4�OSF�#CCi2d�@�SL� 8b4�A�   A���F�1 �I�LQ�h�����@ ��d �@[mB|��<�=>�	��˻9M�Q�e�jOQ	�A,�{�L4����HY�C}KV&±:=����j�FU���u��w�����p��2�
`+%)��W	��kli����,V�ؐ������ �.f��`$�g�x��'5��Ѫ�2���;�@��I�?i�4���xEL<�
�M�3B�d����x�� ��&��	!�BB��9i���i���ȗ�[I�F[ 8&�[��3g8�{��qr��I�Ձ)� v����_\��g�X��ˈ�T�j����(C�X�je�[�}����������Pr�}�2ZJ��p%�f�0���q!���\��&�!����sg��i4�N��u�P�=�=J;�hLz1�|YB��O�$\U�v��u=�U�@zx��PWC�m&:�UB*!6%�hU�������^��'1�����N�閙`��OV~��Iڥ���]�
�_��
k�H�(��:���UYkbE��C�җXW�!���B�#!$<4?�D�B�Z6B�ր�-ڴ�`��)3L,�w̌d�,�A����9��Ԁ�ku�(Z��#AD��氲�y)M�3�2�t���8�z��,%$��:�$�R%G>t]��
M�ɓ�oWٚ�6���M�"%db�W�.����g
"�5j�T��i�g'��5K���
�\<~O����U1��B�o�qd�;83Z��~�S*Q
���M9tЍmDfdF�U��܆�-�T2-���$�`��@C��JdS�Ò��4�AҨJf[�(���2��JR�%d��e�z���k1n��Ro/dĴS������P�+�hq��P�C4I�(�t��
�Jb}�H ��vh��eM[d#!���p��%܁T�-}(adO �I$i��#p�O%��B��na�?���� �$8�@���o�JD"A�d�� �1���"�(HX<ܻ 