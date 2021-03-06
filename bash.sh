#!/bin/sh
skip=49

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
�l��_bash.sh �[	T�ן1���QT� PѠWP�h�0
	B�+-
(SDi]�Պm�jk��U@Qp/�V��%m). (�ޝ��	%O����;�'����}�ݷ������x|��������XD�c*�����ߞX�as���&ڴ^ri=3:���>l��t����Ő�y���l�Hb�А|ENSW��F��ee��M�����^VюU���9���N�K/i�@�>\��Ts�ɞn7{��\N�-o�o2�g���%���<S킱1#��Aq�9C���'W��/��>t�G��Û�I@�O�0�7���AzTӎ�S'���taE͡��F�[i�~�D7e���#m�$���y��'o�6d9�����϶~�	^k�� ��&�@|�	>�?�/5�o4�g��9���;߄~|�	~�	��	~�	��	�΄��L�o1�B��h���7�h>���ЯS;�'4�چ�м��4�%%$��L"�')�����$i�"S��eX�L� ��%��0it\�R
(N���e�I2�'KLT(%(%Z%W��4>KP�d�d%,�⩬��I��(&[,�&'`1��*e\XGi�Dd��$��U��h��R$��p��*,x|��1o�a�;���[o�!�$$|�&��'�d����)���9q2d$6^���P��*B�`���A�����с�aF�}��*�w��s��6|��l\���Qn6n�����~�����0xK_��;2�&o����Ègp�2���AH�L�R�͌Sޜ�{2x�:����눈�s<��|(��f��|f;0x?���|��3�;�0ۓ�wb��r|g�����v߅��b�]�~�f<���,�"���2[W���䖓�!��ֹ��_~/�<�\�ju�r������s C�k�H	�����S ��n'�X�����]�M%�p��6��ހ�뵳I��\Jbg���Z�Ck=Il�V+$�5`�"Z�ـy�K�f{��k���� ����!�Nd�I|�-Y��}���f��<�n}hxHeY*�=����g������{���1�^�T����^�Q�ds�@�6��QW�Q]e����J�rZ"}�?��	�V�x�N���5�pV~�Ue�d����~������T�W(/����4KQ�*8u�a�,�)'�_;�u��b�wT0�/���d&�
���y��@	)��E����̜�(������29[)ōH������,�8��!�w�,�'�M�R�,HI��s�E�`(S܈L� Yq#�*�3�2D)nnL�KT��*d�	gU�(���}(]'����,�'�ĥ�?w4�h`o;�ոF&s.:B5�02��&�+��HK����C	&�X@�1Kor%er�c{u�q|]�HJ1�Q_��t=�ۭG�6�`�Fh2��Э��:l� O7���ﲨJ1*���q�X5�x�F��xV���8Q���팲%��0۴k�1�S�H�/!5R+o!3.��D���D	�%�8�r�%^Cd�l��"#KoG���4���n��-�T�%9ti�_�t�������	'��u�*OKi�T��Q�EΣ>�{_q��f�C��$�\6�s�y�J"1�c�Q�x���o���oF ϊh�/��}'p/ȉ r)����AT�~j�-T-��@8d&��j!��#�F=�������g�`gm$G��p�D�d��lelٺ��s��&Ү$���T�ξJ��Ք�������/I74i)�:�(���Ծȗ�j�&�̉���⌃U�)�Х`�r��Q��F�:TO�����Q�[�H�4!��D"�K`ޕ��J��	��S����V�`<�hh;��U��ȕ/���d%v �-O�.���O��VkN����9X�Jo� � � � �
�e ,ե�!��#�ڬ��h�i���# K R*��t:4��iuh e������4���6�zB�(wZ�UM6��+�nZ�5�[¥���&r�F��4����x7"�U��� ����BC�n!�ʅO�k��열G���l}� pB �F\i5� �.� lh6��z��U�z`	@J�H#] -FF˯ƙ���Cc����P�=��!]��Fr�jp�G��p�~@iuQŝ���W
EhN6�c=��Q�J����X�RG����%��e�0��N����{z䲡�UQ�T�Mf��+� *|o�}]�o� -Cld,���`$#WYs��Wф�TB|��/K|��u�(W�m�~S�,T6��'>���k�H"*�Q7�9
Hp�v��*��C@)((�kq0�=�CD->�:��
2���iie\:�[�8k:����m�4�����*Ug��EY����d�E��{���SZ���}��8���,	P,�C%��eQ[�e��a�`1��`F@�����*`Zq#`j�< "�x>>��*W�E��� �ƻރ=�f*?��L���&��O4�'���~���Y��-�C��Ϙ03`V��<�x?����DN���{��O�=-��`xJ�g@����K�b��%N-t��Q�E��P���Fb�p!���]���2Vw3����U���m�QY�𜇚gLz$5�|�����iEr �W`."�%���$��L$Q�؅dZ7�#�V�z$3��s�\$Ci���P��S0�b���%7�E=��A��ey�f) ��N�f�K��U5�t"h)� ��0��a7����a_g��q�]Dy�l�	V��t�`OC%R��Fu�k�^cH����ү�W�ϣ_j�J����G���Lb�iH�A��Q�8#�,�
2"~jc�9#]�ff�1'm�N(��-G�e�1K3g���
���"�*XO��-�9�5���bހ5������Y�D
�O �3�7`4O8��0�'���v���}�?O��x����������z��WA�b*-Ym޷��d��t��v>�>�f��Pf�?+֟ms�t�6��ZuJ�|�~/�_S8"ù9�~�Nן){�^���w�X�3v�yvO���wM�Y���Y���v��Ȉw����ZZ�)m}��T[P�:�۳���,D�D���c����������N���|NK�{�.��Gˡ���TZ��2���h����Ѳ������bG�e�Z�|�s�S���!�~�9����_�ozqpϡ�)��g�^k�w=��C��;�f�����"M����'��l�/�g�#ϖ��)��'�pzr3��w^թ	�O&����ˍ9|�s�+�H�	{C�_�Ԝ�����]���3����@�ٙO+\��zϾ�����_.m���e���u?�<��<�ts���~����������XX<���;���ޯ���89jѶ��Z�1���{gM����pͦ�!n��ٹ���>k���N΃��Me�u��b؁٩�-y�l���wqb���<H�1�O�٥�5�M���{�=xR~��˻oV�L.P�X0/����A�f��K�J.|��ײU//�����L�J�~�9~��Kyy��N��{.�1x�^����x��y����CWޙXs���ڪEQ�y����W-����wح��i*�ŝVE]�_�|</S�nQ|�M8��[�D�q��U�`��q�T�`MXD±{�QO?�>�����v�Ӿ�٧�҇�J���J�����n��k>zoH~��㻖O�����H��:�S�����Wv���A�ܨo������G��-�#��:-~4N�Ǣ�G|<���_�U�͜:�٪�{��kg$���z��rF����W��~�fe�ǉ-���Ç�|�E��P�)Z�l�}a���g��K�UK��T�a�۾�;3���]�e�3{O�����u��nΟ�7n�nN�4[�»�X������R�ڻ��|t`�ׂA�~	Z᤼|#�0��ұ�ǻ��d<Ʈmq��ps������������9a��EԹ��?2��U%��()pq�W�|��9�S�;�p?t�ن%��'�ɏ�;?��S⋱�E�l�96�!�kˈ�iJ��O�բyV���O|������K��;c7�9v�pi���O*?��ԗ��<c{[~ev��:�����k��c:�v\^�5dZㆆß��O~ИiA����4d\9�U׭�9�{�N�R�w&��{�{�s�N=p5r>�?����5�ㅳx�òVOqb���Y3��-s�X�b��-�ē����c�A���[%Y2����5�[�y���_>X�)�b����[��9y��j�B����d7�eəs~~�zޫ�vr~�������1��M�s�KE����\Y��/����W�u��v�Y���v�n���z��6!i;��#]>[6����}�}Wz7-��MS��w�y�JYT�mxq����o���f�����V���Ky׾���ܾ���٦NW�Cg����z�����>��j1��!�4}���}]TO�_}%�S��˨�^��s���{T������GY�>�w���֕���a�G]���~Y��.h�s\a���X�ylj���s$տ:���,��h�bVtn�1>��7���v?6��a�O@�H���w��ի;��:CY|e����Q]ou����(~K]<f�p����B�=��ޞ^�^^�^�Sds�x���݇��k��^���>�������L/��'}K���ԓ���;���^��!M�]���@��V��zS��8�j�B���J�m:����
�r�\�F�s��0����[�i�����œ[6��A�*Z�@"��N��xOO�Kc$	�J�LJ~�e|�A�M���Ø��)��,ӧK���Hk�İ�ci��v��zs۱����$1���2I�R�P���8P�,l��l^�@٣�(����*��W�o�tx�W�J_���zCXo�C{s�Ӧ����?���2��n�coZG@�Q���qB@�Ȱ7ƞ����c�۱�~w��m���6���N��z���o���>.��8��:�5 �k�~�o�vg+�E���g�l��k0��0U����Ϙ����y��i�lC�(� <��>�6m�6���_�c6m	i���imR�R�.��M��bw�^DA�B���RD%���?�?��"�""UTP,��R�KQ�b�ę�wvoޝ���帽}�}ggޙ�ٛ�7�yZ9��Ls{E�[�q<�/	��d�4�Se���V�le�<,+�� ��=��!�R[���~�����|�rܯ�t��e�*?��j2���zx���ԫ�dnìĚ�u˿/`��� n[��Dcn��R�����_������9`�x�� <��!M<U?��4�������	5ߦ�O'��=�P�-�RՓA�=G_ ������]�j�Y��kxY�_��9��Y�����7���}-j�loQ�y�O#���q��oQ��?��h�e�Y�4|eR�{����H���TRm��$��j�k��>��Q�/"~2���nr�[1��V����%��<���@>ޏ��I�?)&��\��?/�w =����-�ANgK��s��q�=���pw�Tɯ^p;c��	���� ��3��_p}8�'�o�)-�.y��z?ۥ�YW��|����S�}p�����?@z�
hv<����v�W�&����^����Y��W��M:輦�V����H��;!�����J����pC��4��𪆟H�|a;���_�?M���z�W`��m�>������
2��vKs߻L��T�[�Q˯��M��9�5�5�@�&������d�s��~� ��^��!=�A=7��.ƺ�~'����9�g{�����Q��V#��'���u}X֪��>,�[�M�f�jo�s�f�ީl��������q;g�|�w��^È>|[x��7eb�H��/�}#��M�dcf�ʾJNōj���v
3J]�l;�V�J�0é��ɒ���|�t�B9[�_������|���+���`1���,"��,
��v��Z�#�+y��fq1fO�0��Ky�@a��EL.���6��ua
�"�Fq{"��ȔHٙ���zU.�틂%��N���A0�eE$�G ��:�<��]������]W��oe���9��(�,�������$5F�G��f�m~���es�P��
��]ϴ�5�-+�wlc��G��B��M�u��0ߝ!|8֮�3T��*(dIt��r���l�wH�d���5;Ls׾��asx|'۷/G`s�����r��i�?h�@#;�s���C�{̽�v�>`�3lT��s����\ �d�j�� ��f�j^�Xn��- }Ƕ|�L;3�xA�^p��焘J�X�w� 3��G�R�6����+I�hṾy?Gxa�����J6���""�M�z�6��Uϱ�8������XF�xn!�&��E˝
ꤹ��Ox�"�O��Y����
{j;��!j��wƁ���272#�7S��	z�]~Ή_�L	mmJe�1�F{|k
��JUc��/�=y�H��� 2����}��<�����0i5���W��[��wj�;x���w��A#����k�G�k��4b�����k�����1h�U��2cX���'h=���u����X���"Һc��7��"�Ј�5��tlL��A�b����"�l�텅���#g�O�������	�^� �pNA�3h��D��$�[*Iy���~��Zg�/�eށ�ĭ(�ȭ�����Z��\}�o�_ρMh�vwZ^���'����ﹴ�^<	s�X���1V�^��J�u��?�����i�@oG�ב~4�ȯ�[��ǛH?�c$Һ]�g��'�.v�������~������/��j0Q|�����	�ٌ�3�hM���K��oF�2�Q�
�}E~�<���"���:�_�y�k�����M��[���E�C�b�k�'����O�K�񒑇��HSc�;p����G4��877����|��g�6��uOz�6�yy�ي����~��|B��xk���C�d���,�~�aϭR  