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
BZh91AY&SY\s ��{�������������`�f� 0  ` �{>Tֈ��n�ն�Y�k��6gw6:��#�U]�	:�(�ED�UEQ!D��J�B�� a%�F�����S��?Tm#�I�oTf��Gꇨ�=G��2=4Ѩi� 8               8               "���~����z�jOh���☇�=L��<)��i��6�� ��ADL��l��(ģ��L�j��R��~�=��)�OQ���i���D���bM50��4�S0��SOSԌdz��?T��=@i��c�;�A��a���j���	�0L@��611#���+K�aaɺ���qRsw�*vt���Sqf�UQIW�K��6
����Z+%��l-JWJJ��20�=\��Z���[p�p�88�����������F��Ъ�����������^�ԋ�uX��t�1l,AN��� [+ʩ$���[��i��h�璔9)�-uL �~�ܙc��Q��R��.ȷʱb_T�o���1�{O!�Gz�=e0�綗�]xu/Z���vۛ��K�W��z��S
��Qf�p�\4i�뚉c8�K�Լy!�ۃ�εJ� ��;i�~�uj���X���Ɩ��:�p����2���%�1�Y4R8�x���{���� ���A�,'�'�pn�:��f�/J��}MGM[K�����*�k)�B�/���fX��Ѯ�eSN�I�p��Ò����\\��#&k ��wOQ��w�����[�/DSμ%Fo>���6��vq�@���(s hF10H&����*��u�&�9�š>� L�<	�.a}j$���"�5-l9s��N�"Qu�����$1m�Kԫ��p�BB����,��U߇k��I:��:J1:�����l�rk���D��l�Լk,�,	���� H)�i�U?.�դ4���g
-�Wy�c�~�r�>�<����)ڞ$�Υށ<`U�!�O�6�����? /�?Ź��Ox$#�����އ��"�)��ۙq�R�@��OX����t
{]��2D��,�,���Ѳ.��@P���������TB)�C�,*_Ͳ��D��e�B&l���ʹ����`F&^/B0����Ŀh�����:1ēis-�-�uX-��(��Qc*�����o=����k�6�?�j�h8٢������^2qM�ޘ�!r��^?'�c�ί*�͌B}���OnX%�|h6HΫ>Rl�:9�Y7��]�����OՂ�Sp��9l�a����s];4:��~ո-����d�Vc(�\s��~�}�ꯢM�n�	�\�m���$$��8���&�;�e�q�����C�vPs^���N�[m�k)��B����ra���3TŽC�']�
p0��!�
SF
!��[�T�p��%=r@�M�~_l-&�}�����4:�oKxjx�����b|����V�Ɯ�X�blz~����}�l	�~�:uY�Ϙ�49Y�����Ϩ�^���̅xKm!��D߷���p_��'g�_/�s33:ʍ�N�R������=��r�-����$�J�=+��ʹ7.�<Y+��m߷�eg\Ĵ��7k_��p�AW�ظ��;��;X�3�!�{�'~�9��"���]��Ƿϗ����Q�.���똋�썴�2<ˉ߄c� ��l��xϻ�Y��$Ǭ�U��'������K|��~	k}�Cy����T7¦T���ONk�;'���R�0i�1��0�|W�t~�����T���U?׮HA�0J�_��UX��W�_��c����`4,��d�������N����y�w��k��nĒ,�¹@hՄ�i���L�" ���n��3Y�DQ�6*T�+���5�����({�:��%B���B�J�T��S�Ϩ��%����g �ǖBd(k_3m�W;��%����`'�C���|z�טj��U��|�*RU	�&F��b��?�=I�L����(� AP >�]~���`1�ⵎBʍɂ)B���U��ם�B��!k�m{8�˅��h��oHD�a�@���k	S� �Cꯐ�Y�w�ID!��D+ɮ��ֆ�[��w���Wȏ.o�@��R������C�&"뤵�R�Y����?e�� �K�v�NAĬ�&+���8�8�AE��֑؀h��
$!�N`9�]��)�`X-&0�R{A�
�ΕV�p��+ �� p�y%��������H���G�	�����6�B��x)@����?'��A�����	��y��Z�T�H/>0~��#[��8���\@d*!+(�������{trn���.�l��D��F�{�rPD�'������Xb�ٙ���۹��owi(��°�JS�as#K/�8U)�����i�'`�\�7�����6��U|{�h�8�[���?������U��]�����1!��8�%)Α������*�j�s������%\ #z+*O����wq��R�[?e�� <]��zK�����d��3��v��$*%�jg�ha���_��	�kK��"��� ���_`D�@Ng�rj��#�a� �@�$���m�Wns-ǣ`��~U�(^����g*����.z\�C{�`}�[��$40�K�{��(I��������ɝD",�Οp=�86�-�nQ�"%UI%5Rb���������Q�����׎ @��S����[m��uKUoq�5wO!���Ẁ��@X(����5����|�۾X����	N���g���k�����m������&�{IR	$.�x^��{��L�Z묠Y��������R# n��Y���Q$�m���p/Ͼ��.��lM c�)��㲇��=&Ð��d3aO���S����8ưDR���.�k�/N����UB^���.�D�V�T���%b*�	�1���H��C: �\�0!�92!B�-�!�X�  �d��>E��l���#�Az@"�X�b|d$���]0~�*��K���&n ��4�Op����=���6����Fg��Km.ӢbÆ?�A�ƙ���z�:Ç-sMUU�6���ʐ}��vt�ݩM]�:�g�miҩ� �p�I I$�@,��P(�K�<�YH��
	*1�H��N�*��#�۫���r��/���,<,�����f�`�`��	�p1�Z얡��*o�;��7�*��CA�gB���iI�_�>H|������U*�� �L3=6�v�{�:Fm6�ĩ]�@+�����yE�vX+a�;�h_���E�4%� �x�`
��00;��õ�Л���T���(����`�80���1Q�aQ|R����2j�9漥�@�B!Z�nc����R��5�X�t�5f�a;UL��'_@��ntwD����؇*��\8�S�G�⺦��X��B������0҇>�h"�(!�)v�wcX��HP��]�`��hȆ\�C��4PX������j���S+Z�kf�@,X����B��7~�߹�� X�(�EP�C���(!��r= \�Բ	1&48� 3G ���6�c*��Q���a�k}��;U9
n5����ZI��$s� �5�ȃ#,��T�P�D
�+Gm_x���=�nf�u��u��������H��0݂R! H&�3a(g�������ъ������Cyž��nE�]l��
��\:`��;�����Y���a�M��0�D �e�q)�y!��@,��7�  �1�w!p����Kn��%dU�15�{|�/�T�	� ���&���4q7כ�?�����BH�$#R*?��\ج$��G��0/��~�. p����R?Z�O�T��UI�?nv|C�KTV��P$?���E��ҭ�h�>����P�xb{�s=�>/�3گ��<����{��8j�C��E�3ʻ��D{T�|4[��������!_�]��p� ��AJw��X����j�!�=�;�B9�V ���0S�0����YG�S -�HI7��=F�E���(
w3A��津�bs� HmS�5��R�V�O*�ML-��s��ˣ�5���貅��t��i�����}v}�a�n ���W 7x���ڊ	׭3P�58�(�']Пz_`���[j�^�V�e'f��� .S=�B��A~�E�ALQ�"�œ�D��L���K�\�10��^���څ�N8t]&�Q F�l&�\��.3X���������/t1��&��-�pA�:QI�Q�Yu��)���)�+k8�"+@]^��2�h�!qz���u_�RX��P�^e0��`{�4
���Xڦ�2S^�R � v)X<��бP\K�_�b&���3�(��u ��26��LAr�S�D�&:��'����76]��� vX�,~6�W��sP�85B�;�@';�D$BLT#BH�̃"�) `>��\+a�\9���E���2k�3
l*7�m�? zD+�O��f�H�<��N�wu��� J�RKs�S��*v� �fN�.B���mX�2]�`h1pQ�Z���)UW�d�a�D�٪�W4|��O\��̏6P��`A(�dB��P���C��p:�µt�;~�Ζ�m\@�P����K�A85���S�s~��l���ډ�O"�����sx��Ç��G��	�H)`��S��(F�!�o=�D��r�K�����ؑFyD"����;К��]��f/Y�C 9�|ޭN�k��#�;���F��0�+_0w w�,�����w-h�˛�=�d� �z���Ϭ�*A��0��	�BPS�Q����+��P��q
"|���́�+*�#e�d`h��-��<�]Y����j!:��^ ���CR˜R���r�)���q���@s��LP�t��5QI�E� ���a���R9"g���8�3�5-.�	.{�~�p��ȼ<�:>�Hf�-eL�,qE���׸N
b!��'l��A��-E����&A�/��KU#��^d8� ���	�@
 �JVm���J]�M�ԅ����p�Li&	!F�B�l{wV�c�G#)�D�!J��d$%��Chf�.0L��+���0[
��Hԉ�R�9/����!�u�L�̟VylHB�+�b��L�¡���n!L/a�T֡�VAI@�̉�/�"�yT,������H�*���T��taO��+��]��%Q8��� �o�+_le�ݡ�Tp�)��F��������Q���!��	��"�ؾ1�U���{G*,W���PRs$�o�U�T1H��8��Xb�R���h����I�I�3�֣�fBT���>�1}�gM;;v�F�KҀ�P�Q(wՂ���Ct�
!Aq.F%��A.)�c�d4R�ź�S3�1����	�����}AS@��EpX��8İ�R�Lj��L�c@��zF����#5#��%h�� }𗘭�w�p!N���mAnaoKJ���.`<n�E�g�08��4
�.�X�;����=�-Ș��x|��G�0zP$b�����(D����^7��� �[�b�2��"������S1{�>��`9UJF�a���3�'�l�Yh���v�����Y�&Ff��H�*��(,RC�t��"Ulh#����MEB�C���`����,6� }�6��&�$�X���܅���3zM�	��Ҙ�P� 6m<́�Aw	���i�S�����/w! �}���ޛ�ԣ�P�_`��V����`���ma�b@�1K!
%��	���m�R��C0��<;�uN��}�Pj���~_�pxyA�pf� @�C�8Jd�y�(��7*�����"�EǏ�m8y�ʀ��Zxhd�F�t�f���*b�@��qSHb7�q�`�� �wr�(��?n�e�ek�h�}�@g�!$4�E5�7��J[Ѭ��/Z�bCzC�@��GXzOw5>�` }JH����.���3n���=xu�M�� P�	�&��L_�N�@�"�C�~g����u0 �;�ZY���I! BHC��
L���<>��w�{YmS�p��cR��&�s�b��Y��� �y�O���Z�����
4�']�^@�`Plx�7oWB��"$�H��k���9����^lu����l�5��⮁�x�����`B��`��h�����b@�@>�T�@b� b�+�8/�'���T� UW����T�QI2�$Dp��TŊ QJ!" h�
&(���u����eM
�b�D���*����H�
A��`