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
6vt ���m}����������PF@�  `����T6l�keV�hR@P!��CA���ъ�jji����#F�1�mOS'���i�h p  4  dhd    #  �� � #C       d         ��  Eh$�*{J~��MLM)�HѣL��� 4A�<��D�L�FS4��{JP6�����2�����;��o~.��r�O��hR\�ȞQ�W=:�=������K����D(lz?�Ƀo	"Zs'	R�E7(�" �3�iLs#�� T+
Ԁ�vۭ�
�L�xвd�n�2���5EV \�n�L��V�� ���>��[�*A�[ݬ|cy��@Q/H9F9�θ(�'��"Hr��
�	 &`l�@�ɠ�:ɇs�T$��z"�f,�OkY&,��Y�-�FM���iT��g?�vn%W�=��E�r&޹�j{l7rzRV0l2aⲝftm++�(�*z�TIBL릭{7i�^�I�>��ƍOH���"mA���_����8�4ˁ��m����ɵ�vz�@��gȋIH9��jzm�'��D	���2�RRb���-�掄��j����<�3�>�����2c1��5w�
���ؽF��$�z�n�m�n��C(���8�\S�}��-d���U��A�%���K�#D�-gT��x�a��s%��Fqk��M�"o���Ø^���ĕ�v{k�%�n�:J�m��o6쐐}���@t{%�:���dw�(�`�z!$���a1� bF�"n@�l�!���ۢoG.=��>0�^Ů�{�n�PU?o��@|�x9rd89�3q��A]��>#����7$�+t.�摽҉�<6p��S����n..k������4�2������T�<p��Piǽ��gͳ4Si!�4�=�%�1ZO7������xrQ���J2�Itg�6H$��4.�i�!��.��U"��܏�i����8�Kdt ���3��1��f���񍄀�X6�7m	��r���B9�!�;=m���z����HuZ�ȶ���Ͷ�ͨK��%�f���T)���T)�i/.-@���!�r�����[�h�;Ƅ��*�%�4z�QQr(5ݳަ�}�dl0/h��t�ŉ^�KZr(y�P���y�G�Lr�;s[[x�ɐ@�u�'�>fދ�����(�W�5��0��:3�l1����.J5�'	�$�EV��G7�1؛+h��r����%ad��d�)&hfe��3}����Ww�����H���2K�6��P����q���y�M�
�&>Sx�������U)�m&�b��f#�FRw�ȎyvL8�mw�z�S���PYt�.�|b�礁�5��D�	s<"C(8���G79UvB�e9�s��nH�H����d�@s�낖j�]v��P��j�H���	A�Y�M��d7������]��Ժ�[����&ά���F�O��F��KN�(a������,H���BQh�C��$����'�^U>?Oe
)��/:E�Z�>B��#�M���q{���B\Kv� ����mEK�)��b#�Xh���h ��10��H��Io������㯈��ŲHȀ���w!ک�g�J�!�'�i2���Hޮ�j ���W �T��xĈ=b���~�D�@�:�P �̋w���!��<��xÀkJؘ��A����.%���%��A�\��˳��%��F�Kf��3 p&�M)���梽a�`Je8�M�Z;��j�8T�� �Xz�ɶ���Je�ж-"�#AVYggi��H䦒��K"`o�X�I��)��ZVP;*�	�\��JA�C�4�Ї���� 4\k��]#��G��gA�`)����g�7Z����@�|�6�hIL��4�����Az�D^�m��xR��.ɌT���b%�C�cF��f%��tA���hq��M8�u��lL�-�v��:\�I�Q+9t���Ph8gv��Qn�� �逤=4����$�-��w�1�e�p1_ �_�*-c>�����P���!� �S��(d$��3s��&�,�K��hZ��[�vk��?}����7h���`і�D��;�pTgĜ��+@m!TQa��i�-��!�-�P2��/Y�&�)f�I# ΎE��T�x�;
F
�hK�)XU��)�&������P	��0���p�/��h����:f?v�A5�
K�@7��Y�C�
x%��H�s�!´%rӜ�y�"��C`2i�Y"��c ���o�c��(���� l&����M��!D)hMt�ח���U������XQ}�P����PL�z�P6�T|TjɕT�ٰ�)���[G|@0�U�^+����3��jv*��/�j<�gǚG��v�5���A�H��v�`�B;�6!�lu�r%W�^���Ћ�6����-�_���Vh�$��ȩ'K<���rJ`h�ag���ĽЏD6�L�#��x*!�a��S��ee�!������d��jWU�,L!�bl�Cf��ckB�TO�wC:11ƕ�$��]]��ȶ��h�oh��$��kQ�%4�t�*¢��a2S,�mԺ�$.���P2EfE���q4�&��"�H��B�n ��Q1�7�8�lvY�`����++-�+I�M�����c�Ƙ�AMS	�T/mSע��3�C�$��~��)�H˞��U�ρ-�dXBH�b�<ME$��q)V�X�E��M�	�H�lZ6�>�F�%I��t����~LX3�y����։[��	]�;������ W`��>c��A-��E��udi1[�pj��˃
DF�&���r+�l-	*Qa�'�����F���wyDy�QN�viͲz��)B�"��@�W�c��NP9�RHA`����gNb�A�,A�!�C� (؄B���)�Q���