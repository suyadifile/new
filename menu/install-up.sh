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
BZh91AY&SY�'  V�A�@ ���������   @T��ͬ�Q)�i��Q�'���44�CC&@z&����єѦ���M�h�4ѐ `@p�L�FL0	��bd4���RiFQ���d�"P���i� �/�Fغ�$�ef��:���#dlbf���$)9���|�Vƞ��lzi���d��!�X�}�"��MH1j�/�r��5�l�ń��%���n�D�C2�Mjt�"mp,s[{>,1�9~�V<�,��1D.��&�����~�Ԫ�y;Gm%2��)TtƎ#3��
%�ʶ�9љB\ŘW��9R�
�Yk���4�g�$�(��R�E�u崝/��n�B�:F�]�(���T.�du-�S�L�������fA5`N{*�.�0���
М ۤ0�ƒG��"��F-�>��T�Q>v���5c�f�E�+jH�@�ފ\�p15G�����V��Q��W\��S}#����/�)49��+2	y�R4Z�q$���w�B�"ؗi8�V̎�[#
�M��v��b��^E�"���L+��mU,���m���U��J��MD�B���8inQvv9T*DNA_y�lY"�����)�,�׷"ZX.ʖ:��9���`�S}�hG;�O��?��H�
 ¸��