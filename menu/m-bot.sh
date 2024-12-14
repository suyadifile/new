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
BZh91AY&SY�-�� ���m}����������PF@�  `��@��Z@       e&��MO�L�A�h �4  �h  �  � ���    �� 2  � ��    dd �$�M'� 4� 4   �   48    242    �� @�" #@@F$��ObSm)�=�Tٕ=OI�z4L�x�I$Ԍo�C�j�~�馨a2hB��6����J
t�[�����d�����
�$�����w��P@Zi�E��U7ZR,��ݣ(>���>�*�aZ�N�u��W�+E�3�L������D,)Ƣ��@0[�S)���`�..g�љ8_		 �L~��L�?�@�H���h|��PI#҈�|�L�R a�9�U#A�?R,��ԧl�"�o7qڤ�i3�>����~=��!����1΄�Il����@I*�ho��B��a��֒��a��v��u�1Ѵ��P� ���Q$I	3�MZ�nѪ^�I�>^�i�CG�^B���C�D(�����\����4`:��.�c�Uwo{O����-,I���.;m��Vwj�B��b��D�YP��C��A�go������n��k/���p���Ea:]����s�C)�[<
ISN�!���L���Ҹj�^H�h���a���iyk�Jĝ(>��h/4Rg����V�zB�'�����s��vFak�́@���7�,BF#�^�����z}�ʒ��{��M������7�vHH?X��k ��r���g���z
�,��D$���&"�lH�$M�m�Hdȇ|%<�&�K����!0��F� W��tO����Pf�'.MC�s�s�A0�xH+���f�ς�(ߐIv#��b(_(`���5b���ga�Q`
�cLC-;��/��NB�XO�S4e���gݳ��CLi�{�K��i<d�/��Ò�L�P �l��K��d�L>a�y�U��O���R��T�r�Dx��?O�N�޲'59�%����jXX`x�x�a >{�cʊ�m�}zÌ�S��-_ǳ��If�-6�O���6�m���/;�}��`�Pv1��P����95 ���C�r�����+[�{�pBE@E&���	o��(��.�ڦ�}�(�`^�iX�[������2P�U0�U��~`�����)E�J�g�E�Y�vU�e1��S�V���yJ�c�O@wFBWg���% "�!�Ȁ�9P�
�4��=�qM��
�����g��('������EE�i&pm��;
v��D=��*}Q�t:�(H�T<	�^�cW��#�	饅��r?x^Bg���,��z%����wS�n�)��Aq��>�th�i�Ѹ���T�%B����
l�A!wؾ��?��gk�$m��A�'OE�9�
��C)�] �@�C�I�bgq �(�	�%R4h�.j�8�� H�͚a��P9�7��cǇ�Q�)~��a���_{8sO#�藬�yh���"΍tn��ib����OɓVT��h�/��EJ����4�� �6�xi y"��@[�|�&���H�>���o��1���%�)�
�R�
��T���!�?R�=�P�8������IrF@��HAo1��+��yC}��r��h���q4%꠰1�"A`Z5#��~F��g�.$VrF�Z�u=*QTAKc�p� �
�*�vD�@�:�P ����JA��p�al%֌Q���V�P��tZ��
�e��G�%�ңA��9b��	��Jai�y�XiX�NAť�?Q9ڬ�'� !<�h	o��P+L�b�r�t
(Q�jZ�
�V�Y*O��X{Ҹ�I��)��ZVP;*�	�]�BA�!�iLhC� �T�{�z���0Y�H�y�#�yz���k
g"�-���
��Z,;�bh

�S@�����
CMC���-E���m��*�����k�n-� �A��ɰ�r�+ � ��j8GIM9SM��*��-�s1�v�&��"Vr���A���0��֑ =p��x��A�$�n&��H�Y��3� �W�*,c>"�1�O��:�m������4!C!&���ѧ�6i6x�^��ǛB��?�ŗ��r�d��`�g�ߗp��w�l�[yR��t�"�6D�h�Zi
��`�!�Ķ�c@�4��@X��^�
LLR��
FA����4�y =#F�%Ҕ�*�r���I�֢�I�aQ, �4hK����D�h�J�g�qBH&�!�Iv0ǫ��Y�C�
x���$k:<��Z�h�h<%ȑ@���4��LB���HLm��1��DJ`H�6hL�%A��$�T�Q�Q�YxyɁX����
��*� @2�J	���QUh@�F�L���cf�B<g�R�:;P���a��ҼV�K����3Eʵ;�xM䗖�wk�͗<��� ��5��14�����_ޚf����������\0\NW��z9{9�'am�ؿ?Qpv�x�J�k8��K��T���R�!0 ���� ���s�V�sEkB@m3�X�a�]��&H��H�����J�d�]�e��UƅsA��*C�X�Ai�`Mg[
����̌���iI-@���[Fd������$$�kI���o2DaQLD0�)�L��i]�	�41�H��_`HjGD`�m� �i@P���2rTLFD��N$�n�((��
��h
�wSj/�*)��11�4�ST�e�z
�)��I!���X�
�{��!M"F���VgW6���XBH�Բ@F��`p8�o,�"�X�ځ�U6�C/�ϵ	Rnb]��:	��Ƀ2A�ڋ�50p=]�J޾H8
��܍w�G�tk��r���2(G.ïPPf[��2���􈍆�����W��ZT�3"� K�E�҅H|}܉[G$�����Y���!�0�����uT��J"�F�@I�	!8Hp�B��!�AN��>>I��A=�!D@�A�.�p�!�[��