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
BZh91AY&SY^�e� S���@ ����������d�fڲ  00 @ `���P>�9�OT+@�ՆP��	�	WNB�ԀP�r�*Jѥ+mA #c
@�V��  i&�S�D�MFƨh� 4��      �  A�&&&`&   0 � &   hI6�Hbdd   4dhM 4��    I��j���&SzSbF������&�4�z��6�   �(�z4J{F�2Sڣ�oQ�4i��H�ɡ�h� 4�  d6PD�� �	�dd���&G�)���)�a&���)�m��PbP2 �#ޞ_���l/z�ܫ,��V*�_���������jۧ���_
��Fک�C�&+����3�8U7H�ġ,%��5�x�0maQ��7y,�c��~.8`�G�8���3U�[��׫�s뤂e}��Z-��D�iEL�%"�	#�Z(z")=&5R��T�E�Ho�4��u��%C&Y%J�&� ��wˆ#^c��#jK�5j3ĹwK��$&���B�5���hgJ&K�$�!���Ʋ�'(Қa����i�3y��D�9�Է'V���~ jCi Rn��[L��/� �I� jWh�2���55taD�Y�x��Ʒ����R�J����)Z�X��)遬��܎�:_-	LI$��n�P�L�d*cu��}�A,0P��$����� E"�Sy)���4㸡�۸&��֜����9��C�
���m�/C�sa�btd#�"�"EO{�	2r�7m�z��/\Y[����"�D��!��J�(k����� ~;`T�OA�C,�t�B�u�%6�Sj�M- (�q�S[����xQޜ�=���V2N��S�/T��Ļ}��r��Ÿ̝E�Wu�I�)�{���2�ƺ�{�P'<���eK%��+��m��vӛ,I/��Z�ў���2���/��(�S("723��H���]�26�HÞRA:O��������`�
T�Z})�D������66}����,����������B	��~����}t��bfY����lzO�t�8}+Љ����]]9J��5	��� ���Ui:T7O2�����T[,9C�x���&���6L$��vƧ�W�7�:��h�%J�b�?��s.]T��
�c�!�Z<��R��?�����:�x[q�z~��첇j��@X{�zZ��i�Q�����4aH<��;��E����c��i��L�>6 	���(�� �0�s��w�ˣ��6s|�?.�����O�����xu�Q.��� �8a|7�ȝ�Ͼ��N�&H˟ׅ�v��/���;�!�T�w���l�Ӎ-^��X�KԿ9��B�F=�&}'6T�y�%x_u�4����uzk?�9h�8�鸠S_�z��)�,��9�0/�5��绮���诋S�0DS��iTAM
]�7c��d �AV���#�9�a�oj���5�7��o���#���is�&�db��0�QPdPI��f2�M�5�S����6'�S�W�ٰMB/G�(����I��Mfa��J�+}��1ɻw�D���$�kDMF'pK	��,R*��S��z�U��!�0��g�L��C���8C,BB	Z	������6f�����ASa�7�4Z��D!�x�9y�u���|_����	�J�6M�@2 �<�,"�
m��^��sF��mJ[�>��}��E��P
����ðN11�@�~�?�'�~������_._'��=�v�7�B���f	�/�E*z/\�r��k�!��<��!����筙�M�v@w�N�����?�����é�xr��#��;97W�g�<�w��{M����5 x�N~B��##E� |�`w{�a�_��C�.�fD���:��ύT�]:Π0!Qk�BH�B��6�P�a!� ~a<�NYդ:���9��c������(��AD�h��?��%Oʥ�����C1�8������)�O��s��q�m�Ek�E7}hD�c��%� ����P�~����Qx��#�+ ��4)�e>��*@5FJQ�gI*� @M�����#H�@Hi���QB@dy�	68x�,:m��Ӛ��!'�$�@�f���"5"Œ �AhJ)�\7��gAU�yLD>����-(x�(�j��jIr�45|�Q
��9�U Ͳ	x5D3�	8K�AO�~�?ʾK�H}D�ǳ{lh��
>��z"
z����C����{'Ut3E��}�8�>9���(��F�/��us�,���oC�/��Z1��p�4�Xe*A`SH�D�2�Ɩ�����ܩ	�������U"$ !PK�j 	nJ�
�P9����
D�8 Y}��g*4U���>ѕ�<�j�w�����~�J��Nil����].��6��`���T�%���v������8 *�x�!������2)�����V,A� ő�d0Q�������Sq�Mhu��X &fft4�f��T7ƕZ�2�x���5.���j�r��sA�g��-�'^����/֝�zb��
�UUa����WB�S|��1 ʀp��J��8��1]�Za�\6� �Ґ����	�1!!(
���>�=���-��ׁܢdy06TL��M�42S���[�rh_X�ʡ����-q�t�f�����֦���q�9+O��[#8�)kT$O����u��V�Һ�К� d�%�x	���MC�M�\�=$Z���mz�6�"�T�b�\b��pM�H���#���4aARqy�~|$�77f�"��a�iP^~�1��x��dB:Eʔ���(7P��P��=�p@�,(ދ�'@S@/t�C�B�����P�t�@�}#�Ǘ�5@�<�P�(P\�m��&���6ޱ�5|�ǹ{bcn��|��+�q<s<G;Qҭc�b�FYK��(��k[+L��lV�P$[ �!b�6��'����<�vyE3�x�33�OPb?���Dd~'!�)ua��K �X����=�0�6�J~5�@ơп�
���R!Zi�4��j�+��QS�w7��b����l��]�*�� p�ɫH3�$�Q�
�Z����&]-xM:�)Tŋ[���9z�E#�e3oDC{z�]NtT�)�_�}�}kX-􁯌.F5\ގ��۔����]�V��ru�Q��-��i�AvVfVc�זF���_��l�'j��*�O1�j�m �pG���S����>J�p��4@2��vwa�*����f�tT��9�<BM���h5 ";�z���y�_;}�27Ĥ��b �Q@stp�(�dXmU, ���h�ã#�!H�������:����zQP{� h�g9`�� 
���-K�h�+�J�.�N�84lvw�x��JQ5�&	W��jϠ�) ���V�(��#AF�qj�p���]7St�!)����PM��3H�
���V�GJ��ؓ4��w)�g��2W���p�vb���b�`�`�z�^"� �<���k���;�X,� /I	$�H�!�[:�Z
��"�R֫��\����p�3��D<"bI��JE� �-{�ـ��#	�x�Se�����kH8M�)�f:P8�UX� �H>kN2��ԯx^�r_	�}|���}S��hu�>�>_�Q��(_�Q�T��>�
�O:��
b�>�BhJ%�8���'�\��rY��뼫X��\c5����F�v�E�� �V|�G�Ò?x��J�:�� �l $R'��s_��y���c{ w{��C�p,��B�T�Z���@�����;q��N�l�ԞH�����d���b����^QN�I$$$�&;�m@��j���'�Z�b����(�8��͎Ira�KS�����ˏ���SE5*��1���~�[Qॅe���"��̋�"׃�wa����.�7��������P���q;�RR��P�.�B�oe����k���<`�9G�)JI�r+{[J�\i|9g�S���eC6��e��%R,fB1)�
���u��"��F�b�H�(ro&�/%�T/B�B������o�~��ei����-�P`\�c�b����l���2��Y�V���zүt�u*w�l�YSy���$J�sO
E5�FjQ�);dώ�`<}�3��`����S��ך��K��.
r"u�xP�@��4�s4N�)`(jE�"�R���$x;��,8�my"sOWz��;k��e�v�|�ؾ9�E�$'M��jt#ԧ�@DQ"$+(i p�"A����k~\慫d^�4	��g���i��p ��P2Y��Bjxɪ�V�i�U�T改o��+H/�P��SRdRaF=�7l;�Q��a_y0:P�:[����cb��h덏p)��T}t�(,!�ց�D\�R��  P�B�2��Ү�I�<d��h�y���	d�Bd�"�J�,U�?�Z��[N�}�&�feݖR�ԋ
���ϙy��X�<]1.n��X�����p��Jֵ4 �tUda�r��YySb���wVM��~�_.�:R��\,+nP�U��ut����tO����{�N3�_�i,�W,��-�me-ب��N5��%�W�O-e�7��& �Jl:jN�����)[��ml����av��{�4p^� ��'��J�Ҁ���[�v=��e4\� rr��H�!���Xs�Q�w(?�6�R��<�	�A��^�������P��+G.�LNP��C\P��ȝ�i�@01�?�گ�N@^;@��}UuE�^.�G���x�p�f��O[+4��z
oD�K�}�-�Oh��I�:.F���ĴJ��H��� �,ID�"�E"�r�J�M���R�-�15� �5##G���K*}%�Ê;�V�X ��J>;��^&�n8��/f��8��Xk�(_���ܫ!�P����R��}<W~�h�s��w����{��K��Egȴ�E��B/G4�����ˮ�s)��U����5q�(��N"Y8t
����K�ʳ%����l�,V���%���ˡKE��2�B�@�9y�_w�\T��L� @X
<�h���3 5��Q2�E���"!�M�P2<������q!DbHo�:�
 ֈJQP��(�`Bkp7 ��S�P�{��:݈hd�9����2�	�5;�W]]R�դ��ȗp9ڶ�r
�ʦ�N��A�u3YA� 3!Bf\���9P�s[��"{aL�\l�9�$���p���E�������Kh��;ܝT�UeTcB?4����hS���2`�	���t�"�-�`l&��NFLk�i�%����}:Bj���㙨�����H&��.<&�F8	��5.U�.�) Ȧ��b����ldA�`QE7%�u#�Գq��i��6�9��,�%��i̫�V�b,X�/^y��T�*�Tv�[�h�K��=��>u�k��D1�ҵ<"�|Up)��YӬT#�J�Z!��ʄ��'xCb�A�΂�B�zͱ{�m��D?!\�W�~���E������@�ux���|#�w�Q�� �QJ;P�	���������'����8��m�+���锭�r�-�^���9뉉��T,uTl��h���T�EC������IT��h��YTl���X�:�I��������7R���,���&@��<1�`E � -B"?�+�S�8��H?DD"� 1���X����ƣ�Ƨ�~B�J��0����(������O3��r���6Zr�]Oo'w+NJ�\[kS�(~~KvAi?��0�z��A��E�QA�,��i)b�R���5}�8��2���>g����]���|����|�c��U�U0�VX2���A/�E],K,���̡���#J��F1�ZY�,d"���ŁifY��,X���e,��L���a*��	�,��R�O���O�rE8P�^�e�