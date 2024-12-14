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
BZh91AY&SY8��  ���=s �����������@ f�  P�{��s�ݹ(�&M0��d�<�5<���D��=#@h�jl��	S�aMG��A��hd4�  4�hD"0)���e4�h�d44�=@ 4 p�i��@   �M@� b"E=52 *~I���j6���jO(�z�4   jR>��l=�|���6��ÞI�KH�15,�lz��d����/1�mg�U; �Jll/�Y�>-$C�u=�d�9���tp6���Xj�)Y���;o�!���C"�j%4��h%)܀�X�j
b=��|�3�	l�ڇ���D�A/��_�+�s��4��\�Jr/GI��.�q#��y�!�����a�%����i|,��*}����S�:2�ھn�-�H�V�$��fK�8>[���sنa����X*�����N�bۻ�X�R	u_���c�O��f1��gv�xy=s�S28�PF���Wͻ�/Dn���jJf�}v3mlB:�����[�^�`�#� �+;�5PG5�%AL��v1f��m#a���y�ī��&<�2
�c[N��/,7����n��J�R�4ɋ���Gvm�)�z(p��*���<#��̷DN.㨇@�HΜ&��'��T��$�(,YDʈ�]��	��Q͊ >p��F#*��"M��Y*�}N�z��.GK*:M����,���{�m�	@��`
7��Q�����t�����{���b�x.��E���Xn`�m����
�ℛ�R�*��7�rcr��X`I����B6�Ad�)RW�J��Hj)L�=��5��4�H*(�s��D��7lڑ����}�����:���./`\��������T����H#�����+'&�A�0��e7���D��_%�ps�+)"	�22Hf��"�Le8��᎑\��[>�����E��J#��`��� ?<�F_&~�9JF���Z�{KiR�O����D�jr�ZӇ���^3�3�9������$�9�;�c���]
��(�5	�����bp/��)��8��*Q0�k���%�ȉ�\&�8E��ꗈ�#����O 	�&�? ��^rXL}�h`�E��ӱ�����e�;�=D�\�ҝe��s[DX�V�*V����j��V���h��]0O��(}��ex�v&803�S"(¬�Yį᪭AӁ�X�':�@Ġ��[�Na��a���N.&�7�,,Hf ��Ԛ쿧2A�6\��(aλ%,��,	ۦ���V�jΒ�d�S���~���<`LHBb�L���;@b�3�rE8P�8��