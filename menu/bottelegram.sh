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
BZh91AY&SY����  ���1s�����������@ f�  P�ݓ�8�s��n��HM�h��z)���<�C�hhd��hed��S �#)��m0��4� `F���� 42@%4��&�yM�h�i��4ɦ��#M   8h �A�0@4���2 b��M�%='�=OQ�PڃFG�P=@�4�Ԁ�����VnT��ַ���}�K�$�62G͔Xj@G;��l�'�R�?����xt0� �l�x�q/2P�A���D�+@��Ui��Ͷ�N�C��ӎƣ�N�n��Ǌw$ŉ�c<I
�Q46�w~%TKdJ��9Sk7:� �n�̼xg�'3F��=e��Zy��z<)"�}5�)���D¦B����W��0b�ߖ䂎���+|��qb@��J�*IЅ؋�|#A��f�Ъ�%C7m
P{{��ԣ+��p�8za6�b�ޔ����ZŒe��(��.+��T�9nC68�@F��� N��ބfXM����^� Q�)
4���k f�\6/��D⽜�&�`d� �Mw�e}c4#G%�}�I	��-cΨ�E�>$�T��"����!���D�%�)3\�a�	})��ϩ���1�:���XUX|��_��C����j�6L�]z�.�T��᪦�KDPf3�X���w�Ƿ�wA;���GH[�i�q������X�U�꤀5�Zr�)GtzIz\�Ś�eu$i):���H'�@p逌w��xd@d�ŉ��B"dn����N���"�2�O��x����\�CN����+���࿺"!B8�F #��H+wCGP��`�w��=�o� �`Ga�`�Z/4j�M�M�o�M�F�"��!��	��b��mΓ9%6�!>��:R�JDA��[�ez��e��_Hz*SR[��[n�@P�"�B�n�ܝ3�4�%V�q��,N��ݞT�dd���Hp6� �E�օ�U�{g�9����;�A����ø�n6��mg)�JA�!p^tj8h�O̉
��7x6���E��ۺ�v�4���8��c�Y�^.�"�)}�WQ�}Vs��V������("�M���P��c�&��wpw�aS����T/<���wM�n�{Y�]0 �� P�3�ě��F�:<�L�t�=4��y���1�G���g}c� �{1�j�cPze49j��Vֱ����'�;����H1�t̶>%(�!�D!�!oIrm���W�# 5�yы6�5h�W�C����W��d3KuD(i	�L,W�VH. ���Z�!1%��R���H)sv�1@h�]7gL��c �6�����d&�5f-X,# ��Ҁb�H.���C���PA��9�<�s[��Jc%���p��``��`�X���6R�MT3�(M�q	�8!�8�,K͒��(ip���T���2c�$���w��I���f��+�ՙ!^eΪ�q�wv1��Dqit��jV����$�q�?@���oG+<��<�L$!0���)�v������)���@