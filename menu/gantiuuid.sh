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
BZh91AY&SY��Y  ���!����?�������@ f�    PY�$Lm��<�ȣ1��O)�OI=��h�)�0CM���=@��OQ� H�i�2 � ��  �  �"D�A=yC�z@�h �F����  � h44 4�42�  2 2  �R�4���4d hh� bd2� oRȷ�{Z&'�e!�\�+���5 M�q�1fF5p�j��v��}m�~�IP�����4�F��M����F�y�(SܮV)�l|�b��H%�Ns�ūu�����Ƚ@3M��g�'yrjz�X�X�7?��l�;\*�C�6M�5�Þ:m�,F����Nw��������~v,-�"(S�, �;رH�&��hB�(z���D�F4(�s���XT+�����_��f�����)��`]תH�|�D�b�6�;�D����a�A�el��G�Z�囅�:va�)���@�	�͓EwU�e��� ��NOvD|��\��R�ql�L�#6�cy؊��X�;-&ɤ���F�B�z�2� �j3Ղ����(�̪�-(��GJM���{.>*����/%]��Icdo���nK�~�������!T�z�Z9s0���":�8���ʬy�᰹�<j���l�Z��{�D�Bh����-4D(���XB�Ē0�fk#bH�af��v݋�����]�R���c��lP�2���8�b�3�&��ȴ�����R�����ʹ�cJ*[���7�h���B�ƾ��i��ǡ�h!��)�}�[E���9x��(X�@�XW�{�������vG�:;��U��>w���EWА9��6L��n ��Ĥ�@���QVi<ؚ`�Fz*�ꎰԵ:��	���a�F���t(]2���*T���pW��n�-�e"~W��,:D�]5EV�5Kb֕�k%��bhόr��˪Z�^��6���C�U(�V�Y$�ܤ`���f�)8T��Q4�h�PRR�H�C3��M�cتI�����_����Fِ�r<+����%y�u9Q�F��l�#�[҉,"L��Ԕ��Zny�1d�Z��i�:��Dh���UB��@�̇�8&>uU��UىƸ���i��z�Á��dʒMzت���ʭ��9дI��ߨf��(�)R��K�@!0���N?)Ȯ8p�� t�����E�00rE8P���Y