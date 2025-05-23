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
BZh91AY&SY���� �_�!x�����������`���P  @ ��}���2�tMi����lDU���Z�J��P��Ͷ�
��Q=	��i�h�� z��F���          ��  �  h  ���    F@ �
!����ji���M2dz�` 1��E2&'��Shj1F�'�?&���S@�������H�4�C �D&h���L=�z4�&��&�dG�dh=	�M ���>@�)���>���l<�����Cܓ�u�W�c�>�~�%��C,l��Ia����p��`4��:pٍ��	�nUUk[��|�V�N�:�F�F�^�7d����>�Ffq���� ����m������[�il ��ō״n����r6ZQ���[�e�&]�,������<�vDe����֖W]kY0(}�lu�pP����C��pM|L+)<�/n�>�a�>�$�m�n	�(��L��6�1Ԅo]O���ԅ�����h[5�!0S��C�1�C �ѐ`^��2�����úcm�ٗ���Z��`^����-!	l�X�XU��*�*�i�G�����tCڻ��h�Gf�j��7%_��
�8�b��&~�?�֣��i����S�����6:�y�v�cj4fb�z.��B�I��<Z�Z҅fj֔�$љb�I�s5�i�h�x��0L����M�33=O��I���P�!��!D=�PŪB�t9^�B�B�u���5T�ЎO�0��Q}�fyz��T9�����؅�| ߋ����~��ܽ"���z�U�}鳤�bb1����a�qKlp*����_�����ܠk}�QWg��[�n�z�o��Wc�y���x��u���������`�L(���yoϺJP��G�����/| ������VHxHOX	�GR�zHM7C�rР�+�{�{�� @�C�=a��dHH~���B��&A1�0�I;��YcV�`�-Z�Hb����d�c!�2���ޟi���*��h�豄��$u���ٶ��Po[X �@4��	�X���������_���GS� i�Ԧ�L��4b�����}���ϴ�{�[�CC����fÌ��"R�wl�ơ��gb���Բ��Y���������>����C��Cnb���t��s+Ѯ�KG�#��h�,01�G�Z� ��x=�}�]�����{V| ��<}�q|�v���pk]���j�d���������%�>vǣ�|�[E�{����> ��߻��}7J����8H�H�'�BP{�۷�"�LB~d9�%鳳���*��7o����#����`�J00xg��,��HHc� �ۀy_��h:>4�7��˩�݅�2��?b�WpA�1P�H!b �Ǟ��܅h�(P��ѽ��ؼ����5���# ]�C��u�) �`q7�鳀�C���%:C5�%���ȣ}�^�Q��B�~���!�[�1��W���S�i]M�|,�rC��v�������=�+SKC�S�I�u��O��r��8�C!�- �Ĺ3��b�q��zOf����S&]^dR\]�i�2�]!k/�����p:Ay��:���zy�Xz�؇g���8�v5Qw�����T~T#��`!�BC�CO|�:�	���vw���3�6u5�!'G*R��o-~+m�9��I��c6��?�R�q�qϬ�j�Z@��I�d����.CҺ�y,��yv!��H@�!(���a?�D���!���4��wUʩXB���v�Q�X��=�=hz�w��P��w�� |����,��s�4C�ބ�P�� n��{��&\���[��hoB�D$��nf�\��!���⡸�#��8�(U�}���d�V�@@�	��B�D:��y�(nԡ�:m�ЎV��x���_�	D�Z!K��	{����m/�^ĹZ��������1�y��@d��m���V��\]�4���Cw
܆Q��(Z3�>�P�P��
;Ё7!J�x!W5����_p��w�4P�CF�+���$� @��쎯5�3j!����'���C2�@M#"P���(  HB(�g�e��T���{���P�A�u��_Z;��'b��7ZP!i���Z�Pۈ=�[�6�h���L�$��<��(BrP�f�ބ��+y�����@O�@N��ݟM�jc:�P����pp���1�YM�y�d�}3Tdd�G�B�\���B���Y"�����F6�D��ѥݒݔmu�0<�!�v��*�?�`V��̐�Җ<��|��ٜM���]�I&��",�M�W�C�n�$"Տ��pwd��B!�'lB(�&���U�n��F��:����ʷ��(���f��^�cօW�h/U<����2�/@��^N;1���Q����8����
=��d%ÞUU��UV� @5UU^NeUQ��z�=�s�Jh��i� �
##C4%�v��*�� T��/�B����-�P�5��jԭh�(4�b`�!����m4�� �݂�9��Nt97��VP~���)̂�H1��mh{�Z�����RC�lC�+B(�|Ta�Y�� B��{��@i�0!9P�8�C�8�=�ӭ�u�ê9>�PT��lEt'im� ��"��A�~��A���
�a��uT��a�1���]�\���Љ�_
��j�T"]QT<$�D���d�v��h�t�-C��תch۹?]� 6��_�$�����S.��tj��X#y@0�=���Y�d޵}m?L��ڃ�!&���^����t:�N֕Tu^�"R�2�+N&��u:v�����LJƱ7B�k}�$6�8\7 �C'�B·���yƎy�X0(Q�%��2�(��{��4y�=�"�:�GeTlb�@�D��&�<`9Q�Te�#PF�S�c�\3�.*9=�^�Ї���! ���["K,�I�Dz��!D�C�����K���a��P�
���C'$��� �X� �3�ƭ^�NF�8A�e��<���Ő"B&� �Z�d6����O��\���J��9)��<M�Q?���^x<�N �E��QQUL�UUL���G���n�:v=Mj����!��H��2aD���]�sl0o�bƾ1��mW�ƻ�ar�� LͨU��w����h������4� @�/��S�q��dN�<q�Jއh�*�g"�Nq�%�R�!A����!��oP!WS������.8E�\��k����}�q`+�p��]�ݘ���!W��!��d#{�J2Q�1�W5�A����X�2P����1Nv�Fe�"�H)@��ڹ�9�T5l�8d9fg��T��2�x(��'Xv��:Su�M��LT}D8�J�2�����/�@������! "@�t\���Ck��n؅�'v��P�
['ne`RCQ[(��jTe�BDp�-��³u�`RB�Q��*2JL�[H����6�iB�9^1��j�B�+���C1F�D-.��ŲB�z`=0P&D�u)a����`U~��*�AL���I@��*Cٜ:����ތ�n7��Z��3�`�đ���su�K��6/������Mv�&����6�m׶ۥF��{M�e줫� 椎o@}T?j�SE��h��{�AG��>��H�F��R!�!���{�u�&� ��]�"1�H~�]��BB�#Cd