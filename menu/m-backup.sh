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
BZh91AY&SY�yK? ��������������pf�  `
��.�z:x��� ��  �*� IOe2e��4h�hP�z�I���� �  � � �  24       hF�G��    2  @    b�O�?Tdچ� ����    @ J�L�='���=A����4i�LQ�L�jz�444i��MAH A4F&��$�I���CM4�hh�24dhi�d����EE���FK|`�f9���w�jL�kH�bx��Na�a���5P�A N2�rz��X���p&�fB��P�}�l!�d� �(�Y��g?3-"$
���X̫@,#)MW�בY�1���+\?��]���f|aӉ�,���\?M���k�;�
Nry��h9�hk��@�a����Y	�$���T��H?� �"��H���BV�����z��?G�������������C@�4b��v|�ӥ[S"Bl/�|8�v��ǅF֢���Y?�su������N2C���g��8p �fmn�V  ��i��c*(���C�炏A>�3T��sV
����|gwVI?j����o�4��G
�ƼA�D[ᕧ:����BW��ӎ�ut<V<O�m�k���PS�-r��8�#��}S���z�x,�U��� Z���mI�#OH�Ґi�D�0\A��xK�=�l׬+,*�qsr����,@�]R�b�I��e`(�b(�)�jw�a$5DY#,!1 �V�&��&�<EZ��dC�8BA�$�ʫ�tT��ICsjy�E6
A�� �>�D�,�)�ʜhI�g�u�pgA:]N�wV�o�P�"�IH3q�	!I	c�NrE���;fb$w��J�������f �9E-m6�<5�0B re���0f�4@\r R�K��#fx]�)����~!�q~��U��i��#��qX�ݣp�PD�Cʚi���6����W�dM.7�ӧ��� ~N�+n8w��Q-��5�t_�AԷ���`�� � H����.~ j��o[M��R�$.+����ɻ��纵��Zֵ�N�,�ZI$�)Js��l��q*P����V�<(D{�ٰ�DG��װƕdR�V��βP3ϭ���ˠ��+RV�)	��Y�-/���Q�Su0����
���7�i��/N<�Lt2�2��˘��$!��iv'/���2��֭9����1�P��n�h�@bD��	�ｯ�ţU�wf���A��<��ma"�CkHS�%p;H4��T7j_>#?+��g������P�[���z�l��-�֟��uӲ�<}���:tZ��쬝1-��"��#���q�*���,�l)ΉK�Z�ݲ[��O�~gZ�S
kU�6mv:3��L)��5�$m�Ն�)괶�B����+��и�������K&��$N|�,Z���(,���*��Zxq�}y5�T����9��6,
VPS~}%P������[�J�!��)	b�}ý�D0'��� ����[���Ñ��v8��-C�B�$V���`�虈�n�=���n(&��s,���ޟ)�(��;N>��{B%�3�BW� $��*�1XX¤��n"n�������u 7���@ �(!���d� ���$�&�յ��#�M�k�D/��$j+t�T��jG���
�o4�#~���� 2�/�Y1����#y�b��UU'���=�-��� �l�ܘזԬk$dL�V� �=�LK@�; �Å��l�� b�<�щ�5� T�`���C�� � W��n�Y���r����=�݈A��])�khxn�μD����l:Po&D�J���y���3��.���"�����K���C���'X������D�6]�[B5x�v��l7�a"��P�ؤ���'v#�{iD{ �k ��^$�vM�>�b<�U��	h��.
p	�X��x~	Of�Gz�Ѫ�Գ�@/k4n�BM-;�l
Ј����"I�(A$@���`�l3��͊�i >�RJ`�	�u�l�B�u��@B�2.yTXE���\n�q3I ��j �>���GvŻ��e�s.0a��5�]�R�o|���]\o'�� �BA3G�A>rh:��믐��<ri�&���J2JfaB�����ؐ��=T�F�^0�B�_YӁ���f�M�������11���q9�|��*��<�~�m*4��ĉ�m�t]>��d���e��m3��D��Y����m�vd�@,C;����	n�Z�E���Z$PF��/B����H��ʍ2L�Z����bi]��w�L�
X��
�5&�VSaf�}�&�B�5X�@�>_7 �q �itd�t�̜��!zj9�� �i�7/rU�t�����Q Ә�^r��52�w`��
%�	�SĠ�x��Z" �%@�'�L��Ei���Q^��"P`����h%!#B �"rĉ�rE8P��yK?