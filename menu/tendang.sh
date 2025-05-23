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
BZh91AY&SY|N� _�qx����������`�ƒP  @ �| J* ID���� QR*��$�H���
@�CF��@      @d q��F�F��   �  �2 8�ѣA�@�    �   � hhѠѠh    d   h��H@4�#G���=��SF��5O��OM�)�C)D	�?S&�j1S�Si(�&�OSɨd�e=OSjh�4i��jz�P46�9o���#ۍ��ґ�0��v/��^�������&����|L����md�5��vMo�6��?��a����U��6��M�NNL-#&��.,L�����h�p�jb��k��ɹ�6�VK�7�'4�o��}�����&L<�m-,5�cZ�]ZM�j��:�.���0�Źv3Z?{���s�����f�w(�V�Y��:Y1|ә_�����y]�	������թ��5��+��e;�ZO�8��Z?Kv����-�K9��)��:�69��·�+�L<�{��ڛcXm�j|y<V��w���r��~g�o&Y|����,v��ev.��[U�Kc�|�O�­Łŕ^�rf��vQ��c����!��e������Yb21ib�1�i��&ˈo2�!�~�_�4��ݵ�cK��+5a^)�����Vѣ�`}�¯�cm�=K��V��%����ʽ4�U�~�}��k�+'���wS�7�=�s5�^W�����~u����%�mf�4F~f���^���fk�lmns2uX[W2|L�%Ɋ]yqn~ jU�X���,+������#9�f�����]����Uj}U}J�U��e>WƯ;���ȯK��V�u1K��Ұ�OЮh�W��*��/�7���6���U쟙�|�D�<��iW�������S�1E�����|L�Z0�10�t��U50Ų���g0�E/6R���KT6ɑ��Y;*�5�4�˱e���6��a�
�+���%�/����_�{O���Za�/��97�
�e10ɉL<����Q�����o����q�W3q/K�O�;������y��5OR�10ԕ����b%�6��VO���w�,�ʱ5��}淉�_[�Cd�ժ�q�hW�ǚ�|�M?5�u��B>��!�2�F_H�V����b�6��W���o��?��<U��y�3s*e12�涜��^�u�����zl]�H���kw��*�9����������zܯy_y<5[�U��a]A��Km�\��J�Z3}�.J�a���.�����i�]�s����]S�T�͇k��M&���<�Sߥ��ҵ?`|K�tS�l1o���{��ˋ-m��#��9=o$��4qk�MK�$�ɮ��վ��Cĺ��X�/�2d:A��=c[/z�k޼F���Z_4}����$��|�jê�eph����)�d�I�¶�04U���_uЯ�i+�eZG�FG����Gۍ��y�����S�{��|���ߩ�ph�}������g�M��x���v>�Z�֯�z���#���l�j���{��ޘ}��n�7ؙ�5b>2����LGEW]��酲6F��P�VClV�>
�ǝ^�y����ﲕ�l��[W�W�ά����LS�����~���k[cs5i2�S��aXaXh�Nv-��R�l����_yr���#%7�菦���h�h�\i�bv�Eￊ�J��ߟ}�;]���WyЖ5����煮k�Eh��VIa]���ZN�X����}���ĭJ��smlV�I����s�ƭ���-����v�Y0����6S����ʝ)bn���x].�5����Vlը�չ������-６�x���Wf�ԭ'�Z����f�)q��6+c�֭�vn�[I֗�Y�L��["�&#
���O��11VS
�e�FFC,����Z�~�k���?�T���&��~VV�|mұLF������)��)=7Ȯ��=�¿�3�+�r��'�3w�Չ�⑋�.�\����K[[�*��$͹sR��gc��
Xm���~'y5�߲�D�����Wִ^$�F����o#z��4���Ȭ�ZKsL8U�VO���L;)O�O3�-��Rd�1+)����³�r���9�#��YL٢�E��g};���v69���[��kF���إ���̞
�a�q-�f�';I���Sc��u2a�s��͛��+���;�]"x��%�,��E�w�k��0�a�Wr�^!wW�xeg^�a����:���*a�E�b�q���wGUO5��žKk����ok���klެ�x�{�����:�s�A�{s�]��S�a-�o��m׆��:jZ+ή�ٗZ�=Q�9[��'����y��W��a��
lbl�jx���Xn<�^�eW;�;`��:�*�ɒ�8þ�f���*ʦR83{���+Y���}Hp�iLML;����{��c�+Fʟ�X-c�U�y�i�]G}�=��w�e��3��ɓ�ɲvW�/m�pz&N��iM0�ޝmΆ�"��ouN��]l��oq�'�½ij��K����J�.q��W ֫�vK��wB�V�[��u�9]STs�W�zD�og9��5J�yuL;%�s+e5����6��Y�>ua�{'&o
���:�e��c��R�-�⎥]��Z���$���L��d��Ɇ�S&s{�,Z���^�&Uw���ll�m�Ŗ�h�-c�<�\��匓�=t��P����M�����i�/�i{&�=�qp�׫j^�\��~pW�ʯK��2�L���a�&Skʦ*iO�����W��s�܍c[H�ػ��{���I��K��+��c������R�FN��e��hX���c��L�-l5�ӕ��Sd�J����oW��.�-��o��Kp�M�t]�s��
�����*o�������cy`�vF������|s6��Z��]�F �4h4t�#Hs1m';N`��6#-�/y���b�Y3jh^��p�6��7���\֬���SpyS*�U���V���lM��,�S'B:ܚ�^�{U^k��t#!���=F��#���a��̘���S�̬J�WUU��y��K�\G�pYz����JN��]�B����NH�)�íVuuS�N.-L�fS)�h����bk��K��O���׆��v���&��N���5s��f��"���%��=��OR�G!\!yi��n�XCKDtK�.7J'�,e}��N��|,���SƬJ���K[A������kjV��/��y�$M�/�>�T�Dl1ab�L/���dy/E��ʃ�޾�#�bŋa�G���EܑN$��