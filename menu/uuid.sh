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
BZh91AY&SY�fQ:  �_�qp����������@ F  P��˭�gb�P��i0I�&h�Ʃ���=&@�4�1�ڞ����P�4�S����z�@@ڀ�=5�H�G�$z���h��d�Ʉ��#�=F�FFp�ѓF�hdd0�2 dh �2 ��LS�=!��چ��4bz� � M RAU�����~,�X�C�8�r�Y&�9�f�x�9}�g�	c��qn����f��5Fw�*e�|��Mݗ�3����q�@�֢���n-�d������OS��+͚���2ks��&o�s�~l���7uN:We��0��-N��e�CDſ<a�}H����#�%`mh9p�1�H*pq	�S	�p�L$����'=� 8M�`3fp� �/��J�i�",|J������t��A�X}.�0qu'.�%^�1�J�YH�m4���(X�*\!�Ri%J�V��85�!�����ك����6�񑠴`6E���~�+379��1]����o%i5���]*P�o7�q<��#D�J����ޓ�վ��l���l���i���!�[�.	��uU���Cٷ�Fsa���8�`'�@�2�'G�HC$ C���;VKo7ӫ�f+?{��uD��Z�/񓟑gQ?�y´<,�������R?�[�l�1���%�!�Qw�#V�I��� �Z�l����Hn,4�>��Oe�R�dt@�9P��t�I�T��Q���00�(��_���}̜j��]��b�!D���=y".�J�1o�>�cS�v/p��r�����<2�:��^��#�i����,��1��E���
KW���k̳Xd�H��O�ֵ+���t�Ͱ��@��K�2���]wq�(��&w�b*�Q2�
C��[lK�t���du����0� +���/�Q�'^b�e��&�#�ZT��X�A�(�t���U��8G��`�q��C ��n� P�ߵ,,J�m�`�M�$NP���qr�]-���ax�k�-c�l�x��=��`	�]��*F�L�fCg3� t�H:�$ U�$ ��ܑN$'ٔN�