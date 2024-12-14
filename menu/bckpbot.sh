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
BZh91AY&SYp��  ���g�� ����������@F�  P;�6�n��P(H$hh�h4h���� � �mF�4��       h �@�� h @2�4 4 �� h4 ��L�hh�  h I!	�Bb���~�mO)�����i��z����I������V���t�jB��A���,2�)B�VO��L�I$�b"P��)�}#ʺ��߽w�zw�C�L����;��WE��>Q�t�O!�eE�	G��Az�|����Ig�ҙ�F�XG_��x�>c_�o�MƲJ�������m�-ߛ�0%�I`�����Y�&>���:�{�I��=��O�<T��G�x����܃ t���5���j���!L�XUQT�kuK�ŨߺR~H�#��ӕ-�)�xSR�4*�O�
�+3���q��p
<�0d*	^0�`�(���q�r���)�����`�P�t�Q "1*���'�����r�8�5���H����i����z��8���9iM1���Y�C�/�ԟXb.V0�(E��(�ƫHp�0���:�[�|�'쿌-'E�}ev�u��ߏ"Am���2b,��]�@���5�-z�@P�H����d�(��Q@�Y�qU�MTT�H#Q�隈�
:V�3"������G���58x�%��͏C��C��~�k�Sv�jHb�����0P1�q��3�ir�c$X{�`	���(�lMl����]��>�&OX�j DT�b$d�u��D��a��V(,(w�6�*�K5�y�=�ءA8�V���*+�W��C����g�J�h�w�޶��V�8���m��TZzy��.ҍ�z���j.bZN"������2�L6]�T�N*�XF%ХBB��H����䠆%�1�%'�X
HF�w�IA�3�����}�E��X7���rܜ���fpɶ���!�eR
�	BRe!:���W�g�+Qn/�:'?��JI���as]�Q˂y��(�f|��:rE��
�
\�%�*س%6�0ȕq-i��!!A�!�(p���«���.�$gd�#��?#�����=@���@' $8p�H=E]]��0�=g` ,#1���"�(H8ztM 