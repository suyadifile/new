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
BZh91AY&SY
Ej� ��������������pf�  `
�>�jWL]�n:5Z�  �[ RRRy��M�zj4z�4�24    �   � d  �Ѡ       �    d4h       � �2��
<Ԍ��=L����G�i��='��6�C#G�Pi�� "R"ѦSF����h���   �i��"��MhЍ4�L�(�53$d�1F�h����%��;m1����5[�M��kC�x����V��K�-�:>�S�j.�,C�	� �׆�+(TRAT0*�Q��� ��X�Vy��Dl�Wnw[[��W�d���'q;���%5a�^��n;�G���b�n��i␲c��3�h����ϵ����C&��)3�cKf�C/<!b����E�cbL`41%AP�	뤃�q
�S
�>���������sU�t�v�r1yx������k���8F�����s�:�&�Bm0�{�dv���SkR�f�d��������t��!0�8�N#�;&M���Ϸ:^}g7|�R��t�!w�[�����#w��`q�0$	W��>>��	7b��G�).�����x$qd��[�j��0���.b�Tt>Jm�\�c�]��Cε�|&�r��K92�;Z5����;:3��γҷ�m8�T:�Wl�o�K���ޝX�%ƚA���e�9��H�[ X�Fl0
 �OH���侺kK�4���j�/Cc�22@ȁ4hCi�mHY�n�H�u�Bh!�&�����-�J�:B2!�8���$�̯'U.J���|^:)�0R0��-�%ȀV��S�̎���LF6��P11�;�Y1�8bz@����w��CJzq�s���^�x�������8a�2h�Y*�P�򵻷p�b!x(\I�Mw�$	��h5���&\�����/�T��!�+�rMT2]s�Ξ�4���c"�� ��2A�w1	Y��	XPUv�FD�ƽ5�����r��N���%�_"��]+�:�;��ں:��iD$(�
�x�� ][!/[W��,�\��avXsq{}=>g5��R���?1eɋ��m���>�$�0�y�K�n�:�f�vh��7�s�eJ�)CE�A���Jy�5p0��=����JBl<vꋌ'{{H�jSt��������p��6YLy|��v�������HBd���ί�ʞ�Ig��ZO����i�v����)� p�$HTM���-bT��e�Hh�bA� ��X2�a����j���ωdT$��"�t�h$��i�W-�^%㝩�l�y��v���/]�N�- �v�}1���Ҷj9j��t�]u�2�G�'/)�0����l�iNdJ`�m��Sh�������%1��P�����I;NTƟ@eB�����㫂z..��frh�M����a���$[�d�:"D���Bըa|����ʛ����&2g�֫ED�k*Zs/��V4���ã�߯c>�4{H�Ywwv�CzC�J�p����Z!��30�(��0X�b���,;�_�I�r��87FI�4�=壙�\#���s6��PMU)ʳ�	{X}��z*0p�a����{H�@D�	^� ���	������K9��&�Դ���o�1� �f��3õ�p��HH+@MC�k�`��?7� �,a:5�:�
��\��'1�\Z�1��T��H�O5���i �B7�f)`k@���$� �J
äAr�zbt��%�a#"h>�H���2.��8�u�R􁊡��#��N�@�E�fj�� �2�����Gc���:�ޫ/� ��8�����kq��û��ǻ�om;Gq�"z����_7��� �g^��y�莆7R�7@��P�qwD�L";{#a��vfI�o؆&�p��(E)4��ؤ�v��x����G� ��X���$��m��!��bD HE�	qSxE�&�p���Y?bB첻fu�D�1�U'u2�4������M�b�Z�$�X� Ca1�TX���-�V���L�l6����2�xI:�6����u@��!@�=-"�{hY�$�f�a�f0�&I��T��eG��D,���TT�I�����rd6�QrF�/l�%hH&do�
��ښ��z��^�=	ӤJ@鴡,DHC\P�a쉍,�Hj�*r� �a�aaω��d��͊�s�8���wL���d6p^Nqg%�C��y��"�T6�4�Q�D�6�:WO�k����x6�6�zި�:�2q�ţn�C� ��(q	�2ߌ�)�P"eh�@<� ��t$BFn�-��Bg�����fF�"�/�шR�W�bX!�18�XMM��wu�}���Bb��������� ^r� T�0%�:�\�Ǌ&���	���I� ��W��=�G��m�0��i�⡰�� L�,�'�M5CRAU� 	A�PT �A�i�p��Zj��
+�(8H�0t�k��$hDpb �$H��w$S�	 �V�p