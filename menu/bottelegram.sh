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
BZh91AY&SY��cv  ���1s�����������@ f�  P�\���)�9����l0�4���M�4��S�zO#(z�P���=F� ��<�� $�4�ST�G�Jz�z���z�a3SFF�F  i�h�$HS�OD�z�$�Mh���dh     �h4��� �Ѧ@@� �)��jy Ҍ��@d  $ �c���pX2p�jW�4E�
���K��� 4"�i��o�X���$��������|`#�1É����\�Nd��&�`6s3@���.>":�bЀjN�V5�~G���u2���B�M��d����ʻ�t���FA�o2�n��rEjjD_���ձ��EW�aIT��ȩ?S���X؞i:�[1�,8��� ��tb��sy��E�F,Hq1�c���[Q�/�h7��\$�����N7����h���Ӈ	��@�be��g���?�컕0�ܖ�сbҢ,���ό��u�a-{��-0�u����Pw6A��(ք+HM������|;:oT�vseW��i��H�*�FU<"�b٤*��u!4�2�"刾M�m�)"�w�&�HU�]o�T-r��t��R�!���>\��V�����+����鿰F���r�I��g˖}��E�+k��Xk���l�k��5����#�Ȉ;����>H��Z[F���y��s|�j �MVd%%��@]{����E����8��t,�Fe\$�%h
�ϻ{mQ+A]β��mk�8!�B��,��a�uC
5��X2"��lF7�X0pzL R��H*�w�H��/����G�0�dGI�`�^7�����	6���Kt�XdH#eW�.�:~�ֆ4�Zi	�2����(x�ZQ���j�X�7&�>u2�f+[v��&9��a���ZV�ơ;2��Ǝ Z.A�ܭʔ���&S�L��дաo䆞1A��4�0�Ԅ�
Ɍ���m6��m#h�bAjB�Q��d��� �t	'k��k�(����V#�Z#�i��$�OX�Ӫ��)1S�|���d�h��D�-b�/�:�G9���ZK.���	���'t��9�.�1Q���Q�e�˥��ʘ�"��I83����G~�T6I�6Y��HW�,*3A&@���o�.��l@��aj�j�0�-�Dd�!�.�<�J%Bqj��~�a6���I�P��s�HXRX�Q����y 46x0�T�M�0q��
�0�a�l� �D�����՚�B1���1���R�Ҝ��:�
:��d��Ҙ�:f�+%¤knJQ$QF<Ȋb�����:HT�u�J��L�����	�+f�
T>Ɯ�4.�I$�� L2�[Y��Ϥ�8 B�˅$EĂ 4�X�M���M0J������|1��%HW�:�C$�R"�Y��`�޸c�����N�JC�өf�BtB펓����x&G<����-�����?!� ��B�S��9@ Ta�?��H�
n�