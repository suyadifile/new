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
BZh91AY&SY��p ���8�����������`�f� 0  `%�R{������UNR��6�w�v��m����d� m��k�٨УUEv�B�R�Qk)F�)F��2kl��V�F��+Z�$�hd�z�F����f�I�I�
<���=5416�� A�   � L  `��    0  	��  & M     jH��z���hѓҁ�6H�� �  �4��JA�I�"4d��$ޒ{T���x556����@�1hz�i�F�2��&�����LA��4����b�Q��6L��� ���(����k���	��{����v~)"
�;A��#��A�c�<��rTS��|��QP�����k'��!Q���$�T~���i�CA��ӷ�+-L�t{�{�l`����@���\@3���_|��K5W����P\e�~X�7�1a��.�If��LmZJF�~s��,�a�bV���^"M�����9���V�'g��`�)�+���0�a�Lf��]~��*8S�f$�*)���0�Z�� ��r׫�Ix7��˒ա���_=o�.�X�1�ؕ��˭��g���jw�-pp�R���["�5~�5�̷�$��&���j�"Wl��꤃aD��`�g�[=�ᲱuU�Q�n�e�N��v�#J�Z3�p[M�۟��ok֪���{)�+Go/�������[z�4y�3>$���$	�?O�-�������9OA�G�6-0��G����O�rXr)���p����ns#�Y�u�������f�O�s���ǆn;����r~~l��[���NN��`�3)Lo��vT�J(Q�xz�|�=�u*55�al̉o+Y���{�5��|~>`t(����ȔH�9-?d|Բ��� �D�<��zm���-C�j|���a�o�=1g��x`�U(�*U0��p��2��L`b6�"�ۤ��1YJ~�7���9��rk�gy��Hd�;���dVx�l1u���|1zխ���N?��,-��!����A�P��w�爉Q�+Ar�Q�������[�{��/�=�v����Ӈ���y<.n^ܸ�6l�:;�����Y���*�sb"d2E�Z��X�*FRVAU������f0&Tԕ �7>��M��)C���*��d���]��ŷĝ���W��u~�k���t]��!h뗛N�F��'����O�h(Ã��n���i"1��1'ֆ$,���B�h�ha��,<{,�MIؘ�ȑ͝�YFD�
��3�t�"O�E��q�q����4w�Q�CHg)������ڶ�R�)���ϝ�4���Lc�6�Y�+�XH�����>�n���7�շ�n��á�>�K�mI���QN��ӗ#>-������՗=<I�0],���\�����o�F&��	��Qp�}�2\�uLV�s6]OP�E�5��_�>�7n�\�kb�0h�4�#���ab�E;&�WO���<��ȣ��-]�����ͺtv�;�wh�Jsi�|9��x}�"�c���W�2ڣ
���㚞Dק�:���|&o�=6�&U�y�]��Vxͧ[�_]�FS�\��)��ie���p�t����M��}"�Pm� ��X�3��'Ԕ��q8N]*�����i�+��ׁ�6�X����\)՜�j�a=����'�6ج�ٯ�����%:�T
,�A�~�l�fu8��
vI���<��G�Ľ� ��Nwۇ-.�O�5����JO"|�2|f��#��r5��t;�P��D��D4��F��>ӆUZ�D�q`��Gr�#��r��f����b;��\��z+f��*��H�xv��@��$W
�夼�F�4��C`��6����_�c����x?,ev��*�7�_���ҙOb�I	�ex�L�ֿ��>d���MU�HE�!Y�߆�r�_L��V��e.b:��t����WWoms�z���]�F+Б���pJvd� �B<�e�ӯv����M�4�� �AAa>�� ;�-n�ĔQ|x=�����;�ެ^aZ���@�M�7ۑk�Mv;�_���H��E1���ۑv	��k-x���b��;$�]5i��B�]�:�Ԗl�_��E���&~%h���m��`�R���zZ�F�:�Gm��ޅ$*��i}~,gj�&�|��llWn�MҸ�+�i�,B!u���ھ�@�Ǒɢ��E�Mg��^M|f#Q��e*<�,$3Yw��_�M:T��3u2a�Gz�#�
�B/u�@��-��$$I���c߼��8",�݁(�K���q����T��
V�P��M#��"BH�Ā�u$<-���9''�ԟq����-W�DZ�?\��.��!�\�H1	2�����1��̤�R�T�T��IP~u>b��fXx�ٌP�W��"�F+��!u�3�v0�e)�e�2I(�b����)3��6N.�X�k,��Z��-�*aBQ/	j���G����������w3�ʶg��]	����y&��U��M0�3�9�Hľ._z'2=|\�:7�+����2O�C�V9V���eEhl;,2D!y!�,���L/h�1I����ߪ7�C$UH��<q�|ƆI$�*��ǷW���tw�=OMԍsO�ˀ�.F���(	�,1	�M�����y��KI��3�B�1��]GØ�b�"~��j��چD�<��f��8I}��P�8# ����;��|��o�������U��T�� ��_�������v	`/@4�%|kڦ��<�H�=:K��"z5����p�����!�OS=�5lI��]�����Ԉ�c��%�}䡲nps�������S)4���P�$t��G�Ѥ���wFd����O1�=�O���y���X")��G�I=��d'��!nq0<0����T��HÃ퓗�ٱ��f�ܖdp��I�6Һ���L5��s��J�����ܦ�4B�4	.��N�;�Jv	ʁ�˼}��6�F��y�/��}+�.-S�=��tN]�urF0�an(5D��V @)AT�g;\�����,V��ˉĲ܄��\�G-'������~(�mM'O�h�p/��2I�4�s��I~Yg4�qh��N�!�3�r-$��j|��ɹObn��]^ig�a&iJ>[?��xO�1䯞�vK&$��U��U*��x�]D�1�"�+��B�H|(w�(V��twɣ���v����M5�|OxzF���.k%��*��Α��K�?7O_��+���dM\7�<I����l�+���u���}��Ř�x���6�5���V���9�j�N=�k���c���ق�y��I.�I���g�,��i�\K]{���oJR��'c���٦�
�GnFCbgJ�ntp�oT�RgO	��e�,���R��Y.��C"�d�bl�Rd�m>I��s]?)���O�2(~R��0`hfO�>�_��0���Zͭ��7�/�����D�G��n��t�a�!��u��NA���SВ}�&�v��Y��M�H�N&�����yM�3jAy�l��P��IA{\����]5_�l��B%GQ�(�Q���s��%�#��G9�%�:X��X9.�5~�B����Q,�G2/��}X�L�dJ{���2X�EH�2�=�s#N1�t��
R�Cg��D58���9e�+v��7�/�1|:ɼj���؁�����U $���� �%j����J��+�B�;��萄�$�����O�:��8Lb����r��@��CYn�ͷ6���$�%����I؊@� ��	eZ�ݰ[�{e��*iԉ'f��֕�R��d����=�J�C�f�QG�҂��!/#�8l�ܧ�r��N���D���Ҷl�]r��H)���֖tT%�W>�qI
���GU�,M;a��\7d�5ǟ�pc���(�+rb&xH���+DF�2�[��p�gk��@���3�ge�~y]Gi�.�z���7\���+���M���&R(�,��%�|� d���Q���I<ؖ�;��N&h�Qg>dO�-���w��K^��JWM�*�&�?C�q�&���6F֩t��f�����x�u�d�y�*�U�[�w�f�5NĞ>ĵ#ER��+l��V���B�)��I���D�:tM�K�����V0T�1�y�5T�Rt�J�=�H�̤yR����U:��7
IgU�,�)8�U�`�F[PH��H� ōV�8��IǊ��d�x�1�B�/�d�,�"1D���EF�%�k��*x�#��"njE��D�֛0I	�فܙ�%))Q*��P�rl�fЪ(AKBֲ�`*����M�F`Y-�|V٢Γa䄙1mn�1Bk)/d�VK0�/Լ���d���c���I	M���c-��69��l݈�AM�@5m�$�0��R�6�Œ�NF���4#�6�ÍmI3s�\
�٤����P�ʹ@�UH���)*�Iн�����L̖��x(T��BCixնo.�W@��9�ӺNIx$v�s&MY���*8û��Ұ���QT�0�r�d8�H�	�8+�v-�ꝍ��L�c`�*KH8��9T�f�hgM��VP�劓�(f���ʡEų�IL�;� �
J��J��f����$�<�J�RGx�Y5!ЕUI=~t\�L&�y�,��R�Y ����r�2���x�d�UA�h�����bHi���l��ո��\/y�g��L:�^�$��D��HbD��!��F,��"
ɀt� �X�{�'Ɛ�){�� 2�A: ��0Hyg��+H��P�e�![,s��:&�{�yF�~���0ό�R=���Y��S�Y��	�Ô�SQG<��g�1���B��b��8�Ȇ����4@��������*�H�I�vF�9?y\財ͮ}�oSm��:��8;9�;�2<O:��_|�0;�n�VhM�%�ra�ȱ$�%��
W�#l@�%l�M������A�95)�ΆZ�P�t�R�Hp(�1��WBO:��[z�R���
QLG�'��m����)ɳ�"Lc16P5��ᭌT�0�����&QF�.m�Ӊ*��G(� Ej#X���Dm� ����B{a�uC��tX:�Sk96z Tӥgz*�X�;�ǰ���!���HbK���(��9�6e��&cVZ������-���ޗ�ò8��ֱ�8&����w]�ja�k��s"čEV�Dr@6�P�ur��M{�a9�v���!��i8ƑT���au�X�N��x���퓹[d��P����#��]�l@� �Q-J��GVN���=s0�����]��2��4h��n��3�ՒV�X��ow�"C?v�]�5��߲d��)I
"��͈֫H��"Ѐ����] ]�����e��U�MY�GW.�j�{�z�Dg�%���5f"$N�憤��
��X1�G%����V����Ϛ��mL���bF�;�\R�mK%P�T(��b�Þ���F
�1�u�"�������.���5��Cq~���)�CbT�P"���4@�B��C�P��q�QRFL��@F��Zꬦ���FRu0�#ZT��U�+eX�/b�j�s���yi'�y�0�T:r�k �R�p�"�2e�#�qWE���v�ĭN��؆5Z�BN|;>��9$H��k�5�ܛ�p�0���`�-@]}`GXс����f}��vM��^��w<|��L����O���l��2�I�C�I.������IҙOJ����F�|6��O'��5���J c�r<� Y�P*5R�
ER���S��$�l�DԒ5G
����Û��$�>D�[�]�t�ҽ/�yW�HIE�E��@�#A�'R9�e=d���rvK�W֩R�9Wo:��y�Ҳ�#n2�A�#p�Jp�d��#|����R���0��1 ��Z��d8�WA�.@	�-��l�vs���r�:��rF֟pde�M����[ּY�O�$�R���9c�Kܨ��(��Q����;"n�s�Mt�_��͒�l�͝�$�2d�[Xn%F�J�aIE�%�/E�]')�M�e��#m��O,�Q,$�a!f�J��'� K�)�Y|�¦�VKЬ/K>�c6it�Ҳ�YJ��-�E�^,)JL��H����oH�`�d�H���l���M%U�eF�n��&C+�z���==D��+��gJo�(��JF
�����*�

�� �^]!z����4��	�s�$�g�
�
�9V�ᨕB�=h��K$�b�# ���\nJ�%a'Db)�td=�H�3�(���b'H����J����g�O����I?'����v'�-(���7#�$��ʓl�@���Mpރ;7l(��	P��@���I���T�F���ISIG����z<��W�a��<{�.1����z��ccؼ���D��$��kܔ�=��M�.��8V��¥�"HV��ԩ4�|K���=T�*Z�֡�%P��)!L6��((I*C� �l�2jUB�
F�iP�sT��z��ԑy�m��q��YI6���	���l�cl���G��{Q�������	r+B�^MA!9���U���HmWcM*�n��X��uݺ�Q�)yI���e��4��Cd�7�&�X�>вg9#�7V;��`�q"a�6���'8$`7��=I,�T"A`2���kX��B���~���k#7��&��Mg��Bh�㢐P��Օ3�b�t���"[/�D�	7�n���,-CM/$٧(���m�:K��&�������#Y�aY�M���	%�X���W�D����D���$p&J,RjQD�E��*Iz�lH���)l�"IR��¶���L��YKMYJH��ɇ���J#X��HwC^���:������9%J�W�!u���V�T�Im��D�p��5r�EpYJ�wb�bC�������9�;��b89?�p����n��a��;PO j�'d�6��~?d$�g]��e�%;�.����l���dN��ߪ����x�xN��K�#np�#�Rf`TƲbҥM*ʇT�Rm������ԙH�x����W��������I	:��!V3��2x��n�b�3L��2�aSd�'�	_8 T�i �S���c�x�	"$:0Xi�t�&�S�ڦ��Q�e ��%/	A ,p����I�J�H%��Q���S���&�K"���Vj��*�>� ����� ����(����
��AT���;d��y�(����܆QV��H��(������
��(*$�!�@da
B��H�"�+"*��3�ߧd��W����$��Z?��?��Q3 1T���P�-���]��B@#��