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
BZh91AY&SY]�y|  ���!����?�������@ f�    PY�'�8�:�gS�4	�2��H�S�456�	�=4 ��mF�mA�h3Q� "bd�ML�z�h=@   �� � D�I������h��� ��h=!�z�� ����h � ��h  � ��I h'��`�1=F�тd�`�C �+���ɲe{�A���s�:MƠ	�n�^+ȳ����yn	��g�D���Ƒ�̮A�C���eP�,i����ڃi,?@n�R���n��T5{@e�I_����]�\u��V­��=�����)T"Ű4�Δ~�f��rZFMa#��t�>u�tz�B2���1alqB�1Y��e�#ƚFCR�C���L�Y��Bp1K
��j6��a�#��^Vl��A�?�u����Xm��$O>cA"28��.�Q�_b��&X���8 @	��"�޻.��5�_���j�WȒ"� >���LT�;�ٺ�^�P{p<w𗁞@Yђ���f&�i�)UN) M]��4��ܔ�T62�Ʒ�d�ɉ���{caD�Ua�}ye*۟?�>�q[�8��S�,�c\�s��;�:��tF�ܤ����
�p9q�&R�\�(���fԟ�j�t0�M	c;�X�d�Gmj$�eC��
���i>����F�4�$I�%�,l�|��#De��=M&i���/[u��E.��{�wX]Z��R���'6�m�(�t�	�Z
òv�ӂÐ�l͟s��];��@x����)��cV	�ً���h��X��U�_5h�FH���y��Du��5T�N����>�^H
L�I��E^����H�E��H�w#��e
�f���l���k3���0��vY&��7�ޣ��,u��
����+<#�Wf���M3��-�#��4�=A^�/��QLM�p�)qj�,�Gvm����T�eU�C$����jw�-z�/Z �&�$�
U*D�a�3L�D��6�N�ᄥ~�
5lg�<՟u-����U���mB��2!8Ȥ}�dVKp`q����r58L��NQ����4,-|D.qUOQ�Rڑ����'�'̩����z	��%-���l��m��*5%ǝ��L�j)TLF���>�!���Z� ��	x�&B�J���WG�A@�8` 4yuQ��"�ܑN$y_ 