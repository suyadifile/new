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
BZh91AY&SY���� ���qs���?�������@ f�  ` @D    C�F�A�2b#C  4�  � 4h� ��   �ѣ@�h����� 4�  `���@d�F�@ i�@  H�&��e2`M 5Ojz�4zLeOM�b=5MO4��0�Jjz�Dbm�d����4��`��J��b�{0tt�o��~MOK�*D��!!��3a�����43 ��=���g���7�;����u��҄?����_��<��B��S�a!�[������]��2<�7��'0�{6@ɥ��{�$� ��֐9�
�o��44-NQF��qf:����>t�+[��liy�jp�ﺜ�M�Ml� ����f�dw[�G�N�q�\��4:��c���XmNv]m��hmjks74&�'����4�G;@��6���$CC`���<,!������s�'xx������kf����������d�����&��K�>�f@�P8S I��~�J��o���w��Z�1�ICn7}���=�?���{��9P�aƝ�<a4q����JQ�}H����O�����v[��RD*�!
����q�S��Ȇg}�~�H��-!�����a{`��$54�8�L�: lkdcc����Fƴ$u#�O�t^��I��E�&qGa0Q�(+Y�$4������6�� $?3`���jWe�	����%s����/�$�a�6YKh"{�j���$�!�����Z������pa�ʆG�6�A�B)����5�3*t24��P���7�A���`����,�H1:�\�S���ԅ/���h@��2V��q�p~)$�����	�CK3�����$���]�a��ě=
�0��w�!6�����~n�cSZ<��y[]�!�] �'t�l��n�̄CT�� ����x ��4@��i��
�@�$�G�ds!7+c@����C��*cD�>�cKC�Hj�&nz���hm�����c73���HJS�jd�55��:��4/���&>W0+�q `�5�ZP56jeW[AC�!b�?���a��a��6��������\�A�l6�m�����3d<#�G �9P�C:�9������?6��jk}o������FL���c�C��mL<L2w[���\7��x���s=���8<C�jluS��w�+����8��&#������v��/�C�&�]��=���;#�'i��)�:O��}i�\�/ѓ�� �����KS��$�!ě7��xR�t��;cx�C�1�&��Adm3C����x�^�6��a$	6>g���!�'������2o��;C���X���`ihd���P2B=gJ�����J�7;lۛ�hQ��F���8��@�����/M.Q���	�cy��#P�5�$���8�H����xnr�f����s�C`Հ�5�qt�d3��pn`h_@6�L6�.mCh�%*v�u5�C'@��6O�`,h�P�8��ɼ8��jZ���nk&ͬf��|�d`Ass%�Ƨ��4#��utH7���9�+q>v�)���
Sq��B�<\��w��G�<��6�=�Kd|� C�7/�6F� !H������"�(HP@�r�