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
BZh91AY&SY�(�� ���qs���?�������@ f�  ` } (� � ��hCM2��L����� h4 ��L�hh�  h � �� 44� 4�� 8h �A�0@4���2 b�R ��&	��x@4��56
g�1�2G�j�iM�a�OL���@�A�G�4aL�����  1Ԫ ��{���zN����<�H�`W��6+aXG����g#���f~ox�s3�X��!:����E>n� a��dͥ���'��P��*~L$3CKk����+�ІG�f�d��&nf�4�a���'� *v0!XM�:�����(�P���P���Akr��PÉ����m�u9����%�7q������q74��w��6��i���1��e��`pjs����knO�CcS[���7;�dt?�K7��ha����a	��hC���V��C�ps�7t|�=�h}5�nl}�y�``}L�Fm�t?�C���K���� }C
���L$C�d����>���iV��0�!a���f�<O]�?����F�9�pNПXM�sg�35Ҕy_���O|����t���&��Ur �(~Gu�u�<���Ԇgy����u�zV��~ξA�\�������5�2���������ք��yA��	>�����5��Sej�߼����6��co�BC��3���{���=��+����'�ö"y�m�D�$�!�{	�C�����X��������K��7�l|���SA{C�kjfT�di4�K�_�7�A���`����,��H1���
����u5!K�t�Z*~L�������e|��x��!���|D�f$��ˤ4�xd4}46�`^���!6����?7y���ď&�Fְ!�a �({-l�
�m�s�y���=�plDu� \M@N��`+A �o�#36���7��XT���2�H��������#��^�g�Y��>�C1���u� HJS����4�� �3�B��vA\c��u�
ҁ����]����P�(B@LxS@`.�]�[\mA ��F��Amk���j gd��l���#��R�V��u�É�����������/|���6���9�v�t�y�M,<,2kw�O�v��f��N�&Olu��+��a�c�=O3���.����j��F��N�M�p\5�k�&�e����nq���y��Ns���O�7�/;�d�6�x3t<��iju0���$!��`f�\��JR���Hr�n���a�f<�ٚ�,��hv�_C8��(�\MO��4�3d���6 1'�4;��8 �K�08J[-���jHC'��V�0y�YkV�]�M��4(�aFi#P�K�bɠja��MB���(֎!�-C`<msk��H�	�����?p��0�tmr�f����s�C�j�u��8�:}m���c�X� ������a��;@:��A���ij�'�@-�J�2n��)i���Y����dٵ��\����-md�1��p���A��t��li�����Mc;�Ե
Sm��B�8�����w��#�F7��N۔x  C�7�ǀr�P C�@����ܑN$7�0��