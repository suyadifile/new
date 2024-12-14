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
BZh91AY&SY�E�  �_� ��%�*����P�7�^t4(!�b�Pz���z�M2 ���D��=��    ��g��@h�i�4ڃ �� 7�I��M6�S�L���  HSTѦ�@�    FX���X9$���'t0�R8��2kl����G=z��T4�M6�%� B",�"��������%�\��@      ��c��v�5�%�����;���'*���YI��"�Pw�+$+E>���m:� ��Y 2&������]ʿ�%��#�D�K��f�MT�骫+�M=���'BYn3h�&B�!B����0In����&+��S!FYm�L��7?,�M
l�������&�Z��ٰ��N�%-�ϵ�ʪ�s�����'�ͺL'e���h�V�����p�R�r����d�p���q�y$����EH#q�'�	i�N���0·�ś10���v��j�C@�5���4��m��f�pq͑����z��s�e�V��a��l�T�������N�`�KbN����C���n�ŀo��­fKF����bF�.��8�L��D� ��x~6Z��	�0�)l���{����Np�0�	���䓌�K(pr�I��:4��Ye�2��[�I&׏T�6p/Xv���\�!bvb��:jU��gBN�����w6����jڽݕq�i��[�œV�����I$�Fy��7=�I5t�mC�'���߾[{��bN-�N!����m���hA��&��6���c�:B�<N#�]��BB�q�