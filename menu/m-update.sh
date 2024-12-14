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
BZh91AY&SY��� �E�@ ���?�������@�D@0  `��=�!֎�A@�JCMDM��FMM4@z��h���Ɋz��M �   @ 4 � 4�A����� hh4d  �bA���OD�C#@      �M4�hhhdh@M  0���*Ih4�5<?J=1M���fSd&Ѡ�M�4<��"��\o+����w�V���P1u�0V�^���dk�I]zI�rT��Q�V��g�i}��.�}R.�/�kU�65�\��������7/����	���БL=�{�Y�������S�	�]T !(�H��֠
=Q*�"#I�R��R��FnW�W�F������.��f��j���7iA�=����%�O#ky����ꪪ��     I$���S��1�6��eWS�7�{�Z��hl�03��U*�2{��������0�`��R�HB� Bn���d�s�!L�HBFfN4�b������;�5tL�,1��ʯ�<	'�����pw�����Y��Y�4Xu\��̦**Oeo�s�����/�ϩ�t��}�;�؟����<��5�;�y[޴��6��E�B��)'�Ғ�-i��x��R�0�� ��D���,�Fw�5C����ܙ�3�|�$d���KT��>�I%˩~]�)�Fd�1�ʴ!B�!Е-Q&dY���喭�)m2�R�T�V���R������A_�G��Y��͘{����ެqb�q���N��\I�[��} w���Q
#�EB��#c�u�K�G�}0�+��<�Y�]OF2x}c�gl}F��t7��qLr���Z0mܛ>4�Q;q�W��5C-9��=W�;���h�{m/�r�Y�52)���^?63|�`���'��AL�w\~Sz{Bx��C��Κ��|Z���H�S���	#V
V.��1t�Nʩ&ְbDaXi�A�8��2_�@�KnOĖ�L-oqwY�5GãVS��I��3H~��])�UM۷̈k�z�#I4�\u۲�R�j���K����j�kV��.An�<�_'4St��U~LD�%����*���U�<�2c �jJ�iV�leI0ʂ�9a���;R�ȃ�U�I���R�J������$/L;�0Auݕ�8��&II�G��A���/��*$��#�3+�������΃�99P���3�M��c� �O��̗�'�9&�q�,&�̶yR���]���}��_S��;����)JR��)JR�JR��.mA�E�5K�������@���J]KR�UKI	��5:&	���)T���:��d�m��D�$��k'o�fN��-�RB�֐nN��FI��ZjK�[���R�Ye-�,��#֗��NT� ;9.+E)T�Uj��"
�N�d����>~y��@�&�1f@�.����E��Mm���E%)*�F�%��غd����e��ߋ�H�)�o��w��I�v�tR�J�Mr匷RW�3L�pK�t�3��MIt��3&ܤ5�&yR�R���+=r�]��Ε�U$͒g�$�r�.B�ع;	�J��������ˎn�Jª�ʪpA��icw* "�*�e�$�*I{�RM)X4F��n�@�_5%���ԮD�Ӊ1{����S�S���O�R����45���$���.�p�!�n�