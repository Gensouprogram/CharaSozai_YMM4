title �������E�����Gymm4�Ή��R���o�[�^�[ Version 1.3.1
@echo off
setlocal
:setting
cls
rem �^�C�g���\��
echo =============================================
echo   ���낢�������藧���Gymm4�Ή��R���o�[�^�[
echo              Version 1.3.1919810
echo ---------------------------------------------
echo �Ή��������ꗗ
echo �E���ˎ��������i�S��ꊇ�ϊ��Ή��j
echo �E�V���ˎ��������i�ꊇ�ϊ����Ή��j
echo �E�炭�������L�����f�ށi�ꊇ�ϊ��Ή��j
echo �E�_�Ў��������i�ꊇ�ϊ��Ή��j
echo �E�Ղɂ������i�ꊇ�ϊ��Ή��j
echo �E���˃L�����f�ށi�ꊇ�ϊ��Ή��j
echo �E�������L�����f�ށi�ꊇ�ϊ��Ή��j
echo �E�񃖂̂񎮂������i�ꊇ�ϊ����Ή��j
echo �E�Ƃ�݂����������i�ꊇ�ϊ��Ή��j
echo �E�݂��񎮗����G�i�ꊇ�ϊ��Ή��j
echo �E�ӂɂ����������G�i�ꊇ�ϊ����Ή��j
echo =============================================
echo.

echo ���[�h��I�����Ă��������B
echo 1.�ʏ����
echo h.help��\��

:settone

set /p x="�����I���F"
if "%x%" == "1" (
    echo �ʏ�������I������܂����B
    set word=1.�P�̃t�@�C���̂ݕϊ��A2.���ˎ��Ή��̂��ׂĂ̓����n�������ϊ��̂ǂ����I�т܂����H 
    set word2=�R���o�[�g������������藧���G���܂Ƃ܂��ē����Ă���t�H���_�̃p�X����͂��Ă�������
    set word3=�R���o�[�g������������藧���G�P�̃L�����̃t�H���_�̃p�X����͂��Ă�������
    set word4=�J�n���܂��B�����ɂ�1��30�b���x������܂��B
    set word5=�������I�����܂����B�ϊ�����Ă��Ȃ��t�@�C������������P�̃t�@�C���݂̂ŕϊ����Ă��������B
    set word6=�������I�����܂����B�ϊ�����Ă��Ȃ��t�@�C�����������������x��蒼�����A���Ƃŕϊ����Ă��������B
    set word7=Enter�L�[�ŏI�����܂��B
    set NotFound=�t�@�C�����w�肵�Ă��������B
    set cancel=�ēx�w�肵�܂��B
    set NoAnswer=�ēx�ݒ肵�Ă��������B
) else (
    echo.
    echo ���ˎ�������藧���Gymm4�Ή��R���o�[�^�[
    echo Version 1.3.1
    echo �X�V���e
    echo �E�ꊇ�ϊ��̍�����
    echo �E�ꊇ�ϊ��Ή��̂�����肪����
    echo �E�t�@�C���p�X��������w�肵�Ȃ��Ă悢�悤��
	echo �E�����ĕϊ��ł���悤��
    echo ���Ή������G�̓^�C�g����ʂɋL�q���Ă��܂��B
    echo.
  goto :settone
)

:selectwhich

echo.
rem �ꊇ�������͒P�̂̂ǂ��炩��I��
echo %word%
set /p which="�ϊ��ݒ�(1/2)>>>"
if "%which%" == "2" (
    rem ������
) else if "%which%" == "1" (
    goto :only
) else (
    echo "%"NoAnswer%"
    goto :selectwhich
)

echo %word2%

rem ���O�w��
echo 1.���O���w�肷��
echo 2.���O���w�肹��folder.txt���烍�[�h����
set /p ans=">>>"
if "%ans%" == "1" (
    goto :allname
)

for /f %%i in (folder.txt) do (
  set folder=%%i
)
goto :endallname

:allname
rem �p�X�w��
set /p folder="�p�X����́i�����Ō�ɓ����j>>>"
:endallname
rem Ӱ��
echo 1.�������L�����f�ނ��ꊇ�ϊ� 2.����ȊO���ꊇ�ϊ�
set /p ans=">>>"
if "%ans%" == "1" (
    goto :yukkurichara
)
rem �m�F
echo �t�@�C���p�X:%folder%
echo ���[�h:�ꊇ�ϊ�
set /p gosign="%word4%(y/n)>>>"
if "%gosign%" == "n" (
    echo "%cancel%"
    goto :setting
)
cls

rem �S�L����YMM3 to YMM4 �ϊ�
rem ��ʃ��Z�b�g
rem ������Ԃɂ���
set frame=1
set add=1
set name=00
set chara=1
set charaname=\�����イ
rem �L������(�ڌ��Z�b�g,�V����2)
set /a maxchara=156*284
:run
rem cls
rem frame�𐔒l�ɂ��āA���ƌ��ݒ�B�󔒂͕s�Ȃ̂ŉ��肷��B
if %frame% == 2 (
    set framename=a
    set endname=.1
) else if %frame% == 3 (
    set framename=b
    set endname=.2
) else if %frame% == 4 (
    set framename=c
    set endname=.3
) else if %frame% == 5 (
    set framename=d
    set endname=.4
) else if %frame% == 6 (
    set framename=e
    set endname=x
)
rem �i�W�pecho
set /a progress=progress+1
rem �m�F�pecho
echo %folder%%charaname%\��\%name%%framename%.png �[�[�� %name%%endname%.png %progress%/%maxchara%
rem ����
rem frame��2~5�ŕϊ��ł��A����ȊO�̓G���[�f��
ren %folder%%charaname%\��\%name%%framename%.png %framename%%endname%.png
rem frame��1�ŕϊ��ł��A����ȊO�̓G���[�f��
ren %folder%%charaname%\��\%name%.png %framename%.0.png
rem frame��6�ŕϊ��ł��A����ȊO�̓G���[�f��
ren %folder%%charaname%\��\%name%x.png %framename%.png
rem frame�ǉ�
set /a frame=frame+1
rem frame��7�𒴂����ꍇ�Aframe��1�Ƀ��Z�b�g����name��1��������
    if %frame% == 7 (
        rem ������
    ) else (
        goto :run
    )
    set frame=1
    rem name��1~9�Ȃ�A�ŏ���0��t����i�t�@�C���̓s����j
    if %name% == 00 (
        set name=01
        goto :next
    )
    if %name% == 01 (
        set name=02
        goto :next
    )
    if %name% == 02 (
        set name=03
        goto :next
    )
    if %name% == 03 (
        set name=04
        goto :next
    )
    if %name% == 04 (
        set name=05
        goto :next
    )
    if %name% == 05 (
        set name=06
        goto :next
    )
    if %name% == 06 (
        set name=07
        goto :next
    )
    if %name% == 07 (
        set name=08
        goto :next
    )
    if %name% == 08 (
        set name=09
        goto :next
    )
    if %name% == 09 (
        set name=10
        goto :next
    ) else (
        set /a name=name+1
    )
    :next
    rem name��19�𒴂����ꍇ�Aname��00�Ƀ��Z�b�g����chara��1�ǉ�����
    if %name% == 19 (
        rem ������
    ) else (
        goto :run
    )
    set name=0
    :eye
    rem cls
rem frame�𐔒l�ɂ��āA���ƌ��ݒ�B�󔒂͕s�Ȃ̂ŉ��肷��B
if %frame% == 2 (
    set framename=a
    set endname=.1
) else if %frame% == 3 (
    set framename=b
    set endname=.2
) else if %frame% == 4 (
    set framename=c
    set endname=.3
) else if %frame% == 5 (
    set framename=d
    set endname=.4
) else if %frame% == 6 (
    set framename=e
    set endname=x
)
rem �i�W�pecho
set /a progress=progress+1
rem �m�F�pecho
echo %folder%%charaname%\��\0%name%%framename%.png �[�[�� %name%%endname%.png %progress%/%maxchara%
rem ����
rem frame��2~5�ŕϊ��ł��A����ȊO�̓G���[�f��
ren %folder%%charaname%\��\0%name%%framename%.png %framename%%endname%.png
rem frame��1�ŕϊ��ł��A����ȊO�̓G���[�f��
ren %folder%%charaname%\��\0%name%.png %framename%.0.png
rem frame��6�ŕϊ��ł��A����ȊO�̓G���[�f��
ren %folder%%charaname%\��\0%name%x.png %framename%.png
rem frame�ǉ�
set /a frame=frame+1
rem frame��7�𒴂����ꍇ�Aframe��1�Ƀ��Z�b�g����name��1��������
    if %frame% == 7 (
        rem ������
    ) else (
        goto :eye
    )
    set frame=1
    set /a name=name+1
    rem name��7�𒴂����ꍇ�Aname��00�Ƀ��Z�b�g����chara��1�ǉ�����
    if %name% == 7 (
        rem ������
    ) else (
        goto :eye
    )
    set name=00
    set /a chara=chara+1
    rem �L�����ɉ����Ė��O�ύX�B�ʏ�͖ڂƌ��̓�L�q�A�V���˂͖ڂƌ�,a��b�̍��v4���L�q�B
    rem ���ˎ��������
    rem �����n�������
if %chara% == 2 (
        set charaname=\�����イ
        goto :run
    )
    if %chara% == 3 (
        set charaname=\���肷
        goto :run
    )
    if %chara% == 4 (
        set charaname=\����
        goto :run
    )
    if %chara% == 5 (
        set charaname=\�������
        goto :run
    )
    if %chara% == 6 (
        set charaname=\���ǂ�
        goto :run
    )
    if %chara% == 7 (
        set charaname=\������
        goto :run
    )
    if %chara% == 8 (
        set charaname=\���[���
        goto :run
    )
    if %chara% == 9 (
        set charaname=\������
        goto :run
    )
    if %chara% == 10 (
        set charaname=\�����
        goto :run
    )
    if %chara% == 11 (
        set charaname=\������
        goto :run
    )
    if %chara% == 12 (
        set charaname=\�����낤
        goto :run
    )
    if %chara% == 13 (
        set charaname=\������
        goto :run
    )
    if %chara% == 14 (
        set charaname=\���Ȃ�
        goto :run
    )
    if %chara% == 15 (
        set charaname=\������
        goto :run
    )
    if %chara% == 16 (
        set charaname=\���߂��܂�
        goto :run
    )
    if %chara% == 17 (
        set charaname=\�������[��
        goto :run
    )
    if %chara% == 18 (
        set charaname=\���傤��
        goto :run
    )
    if %chara% == 19 (
        set charaname=\���[��
        goto :run
    )
    if %chara% == 20 (
        set charaname=\��������
        goto :run
    )
    if %chara% == 21 (
        set charaname=\������
        goto :run
    )
    if %chara% == 22 (
        set charaname=\������
        goto :run
    )
    if %chara% == 23 (
        set charaname=\������
        goto :run
    )
    if %chara% == 24 (
        set charaname=\������
        goto :run
    )
    if %chara% == 25 (
        set charaname=\���܂�
        goto :run
    )
    if %chara% == 26 (
        set charaname=\���[���
        goto :run
    )
    if %chara% == 27 (
        set charaname=\������
        goto :run
    )
    if %chara% == 28 (
        set charaname=\���Ƃ�
        goto :run
    )
    if %chara% == 29 (
        set charaname=\���Ȃ�
        goto :run
    )
    if %chara% == 30 (
        set charaname=\���Ɂ[�݂邭
        goto :run
    )
    if %chara% == 31 (
        set charaname=\������
        goto :run
    )
    if %chara% == 32 (
        set charaname=\����߂��܂�
        goto :run
    )
    if %chara% == 33 (
        set charaname=\���オ�[���Ă�
        goto :run
    )
    if %chara% == 34 (
        set charaname=\����݂傤�܂�
        goto :run
    )
    if %chara% == 35 (
        set charaname=\������
        goto :run
    )
    if %chara% == 36 (
        set charaname=\�����[���ӂ�����
        goto :run
    )
    if %chara% == 37 (
        set charaname=\���킱
        goto :run
    )
    if %chara% == 38 (
        set charaname=\������
        goto :run
    )
    if %chara% == 39 (
        set charaname=\��������
        goto :run
    )
    if %chara% == 40 (
        set charaname=\�����΂�
        goto :run
    )
    if %chara% == 41 (
        set charaname=\�����悤����
        goto :run
    )
    if %chara% == 42 (
        set charaname=\������
        goto :run
    )
    if %chara% == 43 (
        set charaname=\�����
        goto :run
    )
    if %chara% == 44 (
        set charaname=\�Ă�
        goto :run
    )
    if %chara% == 45 (
        set charaname=\�Ă�
        goto :run
    )
    if %chara% == 46 (
        set charaname=\�Ƃ���
        goto :run
    )
    if %chara% == 47 (
        set charaname=\�Ƃ���
        goto :run
    )
    if %chara% == 48 (
        set charaname=\�Ƃ�Ђ�
        goto :run
    )
    if %chara% == 49 (
        set charaname=\�Ƃ�܂�
        goto :run
    )
    if %chara% == 50 (
        set charaname=\�Ȃ��[���
        goto :run
    )
    if %chara% == 51 (
        set charaname=\�ɂƂ�
        goto :run
    )
    if %chara% == 52 (
        set charaname=\�ʂ�
        goto :run
    )
    if %chara% == 53 (
        set charaname=\�̂������
        goto :run
    )
    if %chara% == 54 (
        set charaname=\�͂���
        goto :run
    )
    if %chara% == 55 (
        set charaname=\�ς����[
        goto :run
    )
    if %chara% == 56 (
        set charaname=\�ς邷��
        goto :run
    )
    if %chara% == 57 (
        set charaname=\�Ђ���
        goto :run
    )
    if %chara% == 58 (
        set charaname=\�Ђ�
        goto :run
    )
    if %chara% == 59 (
        set charaname=\�ӂ�
        goto :run
    )
    if %chara% == 60 (
        set charaname=\�ӂ��
        goto :run
    )
    if %chara% == 61 (
        set charaname=\�ׂ�ׂ�
        goto :run
    )
    if %chara% == 62 (
        set charaname=\�܂݂���
        goto :run
    )
    if %chara% == 63 (
        set charaname=\�܂肳
        goto :run
    )
    if %chara% == 64 (
        set charaname=\�݂�
        goto :run
    )
    if %chara% == 65 (
        set charaname=\�݂����[
        goto :run
    )
    if %chara% == 66 (
        set charaname=\�݂����[�Q
        goto :run
    )
    if %chara% == 67 (
        set charaname=\�݂̂肱
        goto :run
    )
    if %chara% == 68 (
        set charaname=\�ނ炳
        goto :run
    )
    if %chara% == 69 (
        set charaname=\�߁[���
        goto :run
    )
    if %chara% == 70 (
        set charaname=\�߂��ɂƂ�
        goto :run
    )
    if %chara% == 71 (
        set charaname=\�߂ł�����
        goto :run
    )
    if %chara% == 72 (
        set charaname=\�߂�[
        goto :run
    )
    if %chara% == 73 (
        set charaname=\�߂���
        goto :run
    )
    if %chara% == 74 (
        set charaname=\������
        goto :run
    )
    if %chara% == 75 (
        set charaname=\���݂�
        goto :run
    )
    if %chara% == 76 (
        set charaname=\��܂�
        goto :run
    )
    if %chara% == 77 (
        set charaname=\��͂�
        goto :run
    )
    if %chara% == 78 (
        set charaname=\�䂤��
        goto :run
    )
    if %chara% == 79 (
        set charaname=\�䂤��
        goto :run
    )
    if %chara% == 80 (
        set charaname=\�䂩��
        goto :run
    )
    if %chara% == 81 (
        set charaname=\��䂱
        goto :run
    )
    if %chara% == 82 (
        set charaname=\�悤��
        goto :run
    )
    if %chara% == 83 (
        set charaname=\�悵��
        goto :run
    )
    if %chara% == 84 (
        set charaname=\���Ђ�
        goto :run
    )
    if %chara% == 85 (
        set charaname=\�炢��
        goto :run
    )
    if %chara% == 86 (
        set charaname=\���
        goto :run
    )
    if %chara% == 87 (
        set charaname=\�肮��
        goto :run
    )
    if %chara% == 88 (
        set charaname=\���[�Ԃ����
        goto :run
    )
    if %chara% == 89 (
        set charaname=\���[�ق킢��
        goto :run
    )
    if %chara% == 90 (
        set charaname=\��肩
        goto :run
    )
    if %chara% == 91 (
        set charaname=\��[�݂�
        goto :run
    )
    if %chara% == 92 (
        set charaname=\��Ȃ�
        goto :run
    )
    if %chara% == 93 (
        set charaname=\��Ȃ��Ⴂ���
        goto :run
    )
    if %chara% == 94 (
        set charaname=\�ꂢ����
        goto :run
    )
    if %chara% == 95 (
        set charaname=\�ꂢ��
        goto :run
    )
    if %chara% == 96 (
        set charaname=\��Ă�
        goto :run
    )
    if %chara% == 97 (
        set charaname=\��݂肠
        goto :run
    )
    if %chara% == 98 (
        set charaname=\���
        goto :run
    )
    if %chara% == 99 (
        set charaname=\�킩�����Ђ�
        goto :run
    )
    rem VOCALOID�n�������
    if %chara% == 100 (
        set charaname=\����
        goto :run
    )
    if %chara% == 101 (
        set charaname=\����Ă�
        goto :run
    )
    if %chara% == 102 (
        set charaname=\����
        goto :run
    )
    if %chara% == 103 (
        set charaname=\����
        goto :run
    )
    if %chara% == 104 (
        set charaname=\������
        goto :run
    )
    if %chara% == 105 (
        set charaname=\����
        goto :run
    )
    if %chara% == 106 (
        set charaname=\�˂�
        goto :run
    )
    if %chara% == 107 (
        set charaname=\�͂�
        goto :run
    )
    if %chara% == 108 (
        set charaname=\�܂�
        goto :run
    )
    if %chara% == 109 (
        set charaname=\�݂�
        goto :run
    )
    if %chara% == 110 (
        set charaname=\�䂫�݂�
        goto :run
    )
    if %chara% == 111 (
        set charaname=\���[
        goto :run
    )
    if %chara% == 112 (
        set charaname=\���
        goto :run
    )
    if %chara% == 113 (
        set charaname=\�邩
        goto :run
    )
    if %chara% == 114 (
        set charaname=\���
        goto :run
    )
    if %chara% == 115 (
        set charaname=\���
        goto :run
    )
rem UTAU�n�������
    if %chara% == 116 (
        set charaname=\�Ă�
        goto :run
    )
    if %chara% == 117 (
        set charaname=\�łӂ���
        goto :run
    )
    if %chara% == 118 (
        set charaname=\����
        goto :run
    )
rem �{�C�X���C�h�n�������
    if %chara% == 119 (
        set charaname=\������
        goto :run
    )
    if %chara% == 120 (
        set charaname=\������
        goto :run
    )
    if %chara% == 121 (
        set charaname=\����
        goto :run
    )
    if %chara% == 122 (
        set charaname=\�܂�
        goto :run
    )
    if %chara% == 123 (
        set charaname=\��Â��䂩��
        goto :run
    )
rem CeVIO�n�������
    if %chara% == 124 (
        set charaname=\����
        goto :run
    )
    if %chara% == 125 (
        set charaname=\������
        goto :run
    )
    if %chara% == 126 (
        set charaname=\�����͂�
        goto :run
    )
    if %chara% == 127 (
        set charaname=\�Â�
        goto :run
    )
rem �͂���n�������
    if %chara% == 128 (
        set charaname=\������
        goto :run
    )
    if %chara% == 129 (
        set charaname=\���݂���
        goto :run
    )
    if %chara% == 130 (
        set charaname=\���
        goto :run
    )
rem ���̑�
    if %chara% == 131 (
        set charaname=\�ߑ�
        goto :run
    )
rem �炭������
    if %chara% == 132 (
        set charaname=\�炭�������얲
        goto :run
    )
    if %chara% == 133 (
        set charaname=\�炭������������
        goto :run
    )
    if %chara% == 134 (
        set charaname=\�炭�������z�K�q
        goto :run
    )
    if %chara% == 135 (
        set charaname=\�炭�������t����
        goto :run
    )
    if %chara% == 136 (
        set charaname=\�炭���������~���A
        goto :run
    )
    if %chara% == 137 (
        set charaname=\�炭�������p�`�����[
        goto :run
    )
    if %chara% == 138 (
        set charaname=\�炭���������g
        goto :run
    )
    if %chara% == 139 (
        set charaname=\�炭�������d��
        goto :run
    )
    if %chara% == 140 (
        set charaname=\�炭�������@�q
        goto :run
    )
    if %chara% == 141 (
        set charaname=\�炭���������
        goto :run
    )
    if %chara% == 142 (
        set charaname=\�炭��������
        goto :run
    )
    if %chara% == 143 (
        set charaname=\�炭������������
        goto :run
    )
    if %chara% == 144 (
        set charaname=\�炭������������
        goto :run
    )
    if %chara% == 145 (
        set charaname=\�炭�������ؐ�
        goto :run
    )
    if %chara% == 146 (
        set charaname=\�炭�������V�q
        goto :run
    )
    if %chara% == 147 (
        set charaname=\�炭�������_�q
        goto :run
    )
    if %chara% == 148 (
        set charaname=\�炭���������
        goto :run
    )
    if %chara% == 149 (
        set charaname=\�炭����������
        goto :run
    )
    if %chara% == 150 (
        set charaname=\�炭���������[�~�A
        goto :run
    )
    if %chara% == 151 (
        set charaname=\�炭�������`���m
        goto :run
    )
    if %chara% == 152 (
        set charaname=\�炭�������A���X
        goto :run
    )
    if %chara% == 153 (
        set charaname=\�炭���������Ƃ�
        goto :run
    )
    if %chara% == 154 (
        set charaname=\�炭�������z�s
        goto :run
    )
    if %chara% == 155 (
        set charaname=\�炭��������d��
        goto :run
    )
    if %chara% == 156 (
        set charaname=\�炭�����������䂩��
        goto :run
    )
    if %chara% == 157 (
        set charaname=\�炭�������i�Y�[����
        goto :run
    )
    if %chara% == 158 (
        set charaname=\�炭��������
        goto :run
    )
    if %chara% == 159 (
        set charaname=\�炭�����������[
        goto :run
    )
rem �_�Ў�
    if %chara% == 160 (
        set charaname=\�_�Ў��얲
        goto :run
    )
    if %chara% == 161 (
        set charaname=\�_�Ў�������
        goto :run
    )
    if %chara% == 162 (
        set charaname=\�_�Ў��d��
        goto :run
    )
    if %chara% == 163 (
        set charaname=\�_�Ў��`���m
        goto :run
    )
    if %chara% == 164 (
        set charaname=\�_�Ў����c
        goto :run
    )
    if %chara% == 165 (
        set charaname=\�_�Ў����
        goto :run
    )
    if %chara% == 166 (
        set charaname=\�_�Ў���
        goto :run
    )
    if %chara% == 167 (
        set charaname=\�_�Ў��D�܉�
        goto :run
    )
    if %chara% == 168 (
        set charaname=\�_�Ў�����
        goto :run
    )
    if %chara% == 169 (
        set charaname=\�_�Ў���
        goto :run
    )
    if %chara% == 170 (
        set charaname=\�_�Ў�����얲
        goto :run
    )
    if %chara% == 171 (
        set charaname=\�_�Ў����얂����
        goto :run
    )
    if %chara% == 172 (
        set charaname=\�_�Ў����얂����
        goto :run
    )
    if %chara% == 173 (
        set charaname=\�_�Ў�����H��
        goto :run
    )
    if %chara% == 174 (
        set charaname=\�_�Ў��_�ʁi���j
        goto :run
    )
    if %chara% == 175 (
        set charaname=\�_�Ў��_�ʁi�j�j
        goto :run
    )
    if %chara% == 176 (
        set charaname=\�_�Ў��R���K��
        goto :run
    )
    if %chara% == 177 (
        set charaname=\�_�Ў��T���G��
        goto :run
    )
    if %chara% == 178 (
        set charaname=\�_�Ў��H������
        goto :run
    )
    if %chara% == 179 (
        set charaname=\�_�Ў��L�N��
        goto :run
    )
    if %chara% == 180 (
        set charaname=\�_�Ў��G���X
        goto :run
    )
    if %chara% == 181 (
        set charaname=\�_�Ў�������
        goto :run
    )
    if %chara% == 182 (
        set charaname=\�_�Ў����V�g
        goto :run
    )
    if %chara% == 183 (
        set charaname=\�_�Ў��􂢎q
        goto :run
    )
    if %chara% == 184 (
        set charaname=\�_�Ў�����
        goto :run
    )
    if %chara% == 185 (
        set charaname=\�_�Ў�����
        goto :run
    )
rem �Ղɂ������
    if %chara% == 186 (
        set charaname=\�Ղɂ����
        goto :run
    )
    if %chara% == 187 (
        set charaname=\�Ղɂӂ�
        goto :run
    )
    if %chara% == 188 (
        set charaname=\�Ղɂӂ��
        goto :run
    )
    if %chara% == 189 (
        set charaname=\�Ղɂ܂肳
        goto :run
    )
    if %chara% == 190 (
        set charaname=\�Ղɂꂢ��
        goto :run
    )
    if %chara% == 191 (
        set charaname=\�Ղɂ�݂肠
        goto :run
    )
    if %chara% == 192 (
        set charaname=\�Ղɂ���
        goto :run
    )
    if %chara% == 193 (
        set charaname=\�Ղɂłӂ���
        goto :run
    )
    if %chara% == 194 (
        set charaname=\�Ղɂ܂�
        goto :run
    )
    if %chara% == 195 (
        set charaname=\�Ղɂ䂩��
        goto :run
    )
    if %chara% == 196 (
        set charaname=\�Ղɂ�����
        goto :run
    )
    if %chara% == 197 (
        set charaname=\�Ղɂ�܂�
        goto :run
    )
rem ���˃L�����f��
    if %chara% == 198 (
        set charaname=\���񂱂���
        goto :run
    )
    if %chara% == 199 (
        set charaname=\�܂肳����
        goto :run
    )
    if %chara% == 200 (
        set charaname=\���݂���
        goto :run
    )
    if %chara% == 201 (
        set charaname=\�ꂢ�ނ���
        goto :run
    )
    if %chara% == 202 (
        set charaname=\�݂�����
        goto :run
    )
    if %chara% == 203 (
        set charaname=\�䂩�肳��
        goto :run
    )
    if %chara% == 204 (
        set charaname=\�����炳��
        goto :run
    )
rem QH���������
    if %chara% == 205 (
        set charaname=\QH��������
        goto :run
    )
    if %chara% == 206 (
        set charaname=\QH���A���X
        goto :run
    )
    if %chara% == 207 (
        set charaname=\QH���`���m
        goto :run
    )
    if %chara% == 208 (
        set charaname=\QH���p�`�����[
        goto :run
    )
    if %chara% == 209 (
        set charaname=\QH���t�����h�[��
        goto :run
    )
    if %chara% == 210 (
        set charaname=\QH�����O��
        goto :run
    )
    if %chara% == 211 (
        set charaname=\QH�����~���A
        goto :run
    )
    if %chara% == 212 (
        set charaname=\QH�����
        goto :run
    )
    if %chara% == 213 (
        set charaname=\QH���d��
        goto :run
    )
    if %chara% == 214 (
        set charaname=\QH����
        goto :run
    )
    if %chara% == 215 (
        set charaname=\QH���d��
        goto :run
    )
    if %chara% == 216 (
        set charaname=\QH�����c
        goto :run
    )
    if %chara% == 217 (
        set charaname=\QH���얲
        goto :run
    )
    if %chara% == 218 (
        set charaname=\QH��������
        goto :run
    )
rem �݂���
    if %chara% == 219 (
        set charaname=\�݂��񎮂������A���X
        goto :run
    )
    if %chara% == 220 (
        set charaname=\�݂��񎮂�����舢��
        goto :run
    )
    if %chara% == 221 (
        set charaname=\�݂��񎮂�����肱�[���
        goto :run
    )
    if %chara% == 222 (
        set charaname=\�݂��񎮂�����肫�߂��܂�
        goto :run
    )
    if %chara% == 223 (
        set charaname=\�݂��񎮂�����菬����
        goto :run
    )
    if %chara% == 224 (
        set charaname=\�݂��񎮂�����肱����
        goto :run
    )
    if %chara% == 225 (
        set charaname=\�݂��񎮂�����肱����
        goto :run
    )
    if %chara% == 226 (
        set charaname=\�݂��񎮂�����肱�܂�
        goto :run
    )
    if %chara% == 227 (
        set charaname=\�݂��񎮂��������
        goto :run
    )
    if %chara% == 228 (
        set charaname=\�݂��񎮂�����肳�Ƃ�
        goto :run
    )
    if %chara% == 229 (
        set charaname=\�݂��񎮂�����葁�c
        goto :run
    )
    if %chara% == 230 (
        set charaname=\�݂��񎮂������T�j�[�~���N
        goto :run
    )
    if %chara% == 231 (
        set charaname=\�݂��񎮂������˖���
        goto :run
    )
    if %chara% == 232 (
        set charaname=\�݂��񎮂������l�G�f�P
        goto :run
    )
    if %chara% == 233 (
        set charaname=\�݂��񎮂�����肷����
        goto :run
    )
    if %chara% == 234 (
        set charaname=\�݂��񎮂�����肷�킱
        goto :run
    )
    if %chara% == 235 (
        set charaname=\�݂��񎮂�����萣���t
        goto :run
    )
    if %chara% == 236 (
        set charaname=\�݂��񎮂������Ԕ؊�
        goto :run
    )
    if %chara% == 237 (
        set charaname=\�݂��񎮂�������d��
        goto :run
    )
    if %chara% == 238 (
        set charaname=\�݂��񎮂������`���m
        goto :run
    )
    if %chara% == 239 (
        set charaname=\�݂��񎮂������Ȃ��[���
        goto :run
    )
    if %chara% == 240 (
        set charaname=\�݂��񎮂������p�`�����[
        goto :run
    )
    if %chara% == 241 (
        set charaname=\�݂��񎮂������p���X�B
        goto :run
    )
    if %chara% == 242 (
        set charaname=\�݂��񎮂������t����
        goto :run
    )
    if %chara% == 243 (
        set charaname=\�݂��񎮂�����薂����
        goto :run
    )
    if %chara% == 244 (
        set charaname=\�݂��񎮂������_�q
        goto :run
    )
    if %chara% == 245 (
        set charaname=\�݂��񎮂�����胁���[
        goto :run
    )
    if %chara% == 246 (
        set charaname=\�݂��񎮂���������
        goto :run
    )
    if %chara% == 247 (
        set charaname=\�݂��񎮂�����薅�g
        goto :run
    )
    if %chara% == 248 (
        set charaname=\�݂��񎮂�����芑
        goto :run
    )
    if %chara% == 249 (
        set charaname=\�݂��񎮂������H�X�q
        goto :run
    )
    if %chara% == 250 (
        set charaname=\�݂��񎮂������d��
        goto :run
    )
    if %chara% == 251 (
        set charaname=\�݂��񎮂�����胊���[�z���C�g
        goto :run
    )
    if %chara% == 252 (
        set charaname=\�݂��񎮂�����胋�[�~�A
        goto :run
    )
    if %chara% == 253 (
        set charaname=\�݂��񎮂������얲
        goto :run
    )
    if %chara% == 254 (
        set charaname=\�݂��񎮂�����背�~���A
        goto :run
    )
    if %chara% == 255 (
        set charaname=\�݂��񎮂�����背�e�B
        goto :run
    )
    if %chara% == 256 (
        set charaname=\�݂��񎮂������@�q
        goto :run
    )
    if %chara% == 257 (
        set charaname=\�݂��񎮂�����茷���}�L
        goto :run
    )
    if %chara% == 258 (
        set charaname=\�݂��񎮂�����茋���䂩��
        goto :run
    )
    if %chara% == 259 (
        set charaname=\�݂��񎮂������՗t��
        goto :run
    )
    if %chara% == 260 (
        set charaname=\�݂��񎮂������՗t��
        goto :run
    )
    if %chara% == 261 (
        set charaname=\�݂��񎮂�����蓌�k����q
        goto :run
    )
    if %chara% == 262 (
        set charaname=\�݂��񎮂�����蓌�k���肽��
        goto :run
    )
    if %chara% == 263 (
        set charaname=\�݂��񎮂������IA
        goto :run
    )
    if %chara% == 264 (
        set charaname=\�݂��񎮂��Վ傿���i�ԁj
        goto :run
    )
    if %chara% == 265 (
        set charaname=\�݂��񎮂��Վ傿���i���j
        goto :run
    )
    if %chara% == 266 (
        set charaname=\�݂��񎮂��Վ傿���i�ԃT�C�h�e�[���j
        goto :run
    )
    if %chara% == 267 (
        set charaname=\�݂��񎮂��Վ傿���i�T�C�h�e�[�������j
        goto :run
    )
    if %chara% == 268 (
        set charaname=\�݂��񎮂��Վ傿���i���T�C�h�e�[���j        goto :run
    )
    if %chara% == 269 (
        set charaname=\�݂��񎮂��Վ傿���i�|�j�[�e�[���ԁj
        goto :run
    )
    if %chara% == 270 (
        set charaname=\�݂��񎮂��Վ傿���i�|�j�[�e�[�����j
        goto :run
    )
    if %chara% == 271 (
        set charaname=\�݂��񎮂��Վ傿���i�|�j�[�e�[�����j
        goto :run
    )
rem �Ƃ�݂���
    if %chara% == 272 (
        set charaname=\�얲�L����
        goto :run
    )
    if %chara% == 273 (
        set charaname=\�������L����
        goto :run
    )
    if %chara% == 274 (
        set charaname=\�t�����L����
        goto :run
    )
    if %chara% == 275 (
        set charaname=\�d���L����
        goto :run
    )
    if %chara% == 276 (
        set charaname=\�������L����
        goto :run
    )
    if %chara% == 277 (
        set charaname=\�z�K�q�L����
        goto :run
    )
    if %chara% == 278 (
        set charaname=\���~���A�L����
        goto :run
    )
    if %chara% == 279 (
        set charaname=\���c�L����
        goto :run
    )
    if %chara% == 280 (
        set charaname=\�@�q�L����
        goto :run
    )
    if %chara% == 281 (
        set charaname=\���݂��L����
        goto :run
    )
    if %chara% == 282 (
        set charaname=\�ꂢ����L����
        goto :run
    )
    if %chara% == 283 (
        set charaname=\��䂱�L����
        goto :run
    )
    if %chara% == 284 (
        set charaname=\�얲�L����
        goto :run
    )
cls
rem �^�C�g���\��
echo =============================================
echo   ���ˎ�������藧���Gymm4�Ή��R���o�[�^�[
echo              Version 1.3.1
echo ---------------------------------------------
echo ���p�N�E�u�����������ϊ�
echo �����n�������̑S�L�����͈ꊇ�Ŏ����ϊ��\
echo ����ȊO���P�̂ŉ\
echo �t�@�C���p�X�w�莮
echo =============================================
echo.
title ���ˎ��������ymm4�Ή��R���o�[�^�[ Version 1.3.1 �y�ϊ��I���z
echo %word5%
echo %word7%
pause
exit

rem �������L�����f�ވꊇ�ϊ�

:yukkurichara

rem �m�F
echo �t�@�C���p�X�F%folder%
echo Ӱ�ށF�������L�����f�ވꊇ�ϊ�
set /p gosign="%word4%(y/n)>>>"
if "%gosign%" == "n" (
    echo "%cancel%"
    goto :setting
)
    ren %folder%\�������얲\��\00.png 00.0.png
    ren %folder%\�������얲\��\01.png 00.1.png
    ren %folder%\�������얲\��\02.png 00.2.png
    ren %folder%\�������얲\��\03.png 00.3.png
    ren %folder%\�������얲\��\04.png 00.4.png
    ren %folder%\�������얲\��\05.png 00.png
    ren %folder%\������薂����\��\00.png 00.0.png
    ren %folder%\������薂����\��\01.png 00.1.png
    ren %folder%\������薂����\��\02.png 00.2.png
    ren %folder%\������薂����\��\03.png 00.3.png
    ren %folder%\������薂����\��\04.png 00.4.png
    ren %folder%\������薂����\��\05.png 00.png
    ren %folder%\�������d��\��\00.png 00.0.png
    ren %folder%\�������d��\��\01.png 00.1.png
    ren %folder%\�������d��\��\02.png 00.2.png
    ren %folder%\�������d��\��\03.png 00.3.png
    ren %folder%\�������d��\��\04.png 00.4.png
    ren %folder%\�������d��\��\05.png 00.png
    ren %folder%\�������얲\��\00.png 00.0.png
    ren %folder%\�������얲\��\01.png 00.1.png
    ren %folder%\�������얲\��\02.png 00.2.png
    ren %folder%\�������얲\��\03.png 00.3.png
    ren %folder%\�������얲\��\04.png 00.4.png
    ren %folder%\�������얲\��\05.png 00.png
    ren %folder%\������薂����\��\00.png 00.0.png
    ren %folder%\������薂����\��\01.png 00.1.png
    ren %folder%\������薂����\��\02.png 00.2.png
    ren %folder%\������薂����\��\03.png 00.3.png
    ren %folder%\������薂����\��\04.png 00.4.png
    ren %folder%\������薂����\��\05.png 00.png
    ren %folder%\�������d��\��\00.png 00.0.png
    ren %folder%\�������d��\��\01.png 00.1.png
    ren %folder%\�������d��\��\02.png 00.2.png
    ren %folder%\�������d��\��\03.png 00.3.png
    ren %folder%\�������d��\��\04.png 00.4.png
    ren %folder%\�������d��\��\05.png 00.png
    ren %folder%\�������얲��\��\00.png 00.0.png
    ren %folder%\�������얲��\��\01.png 00.1.png
    ren %folder%\�������얲��\��\02.png 00.2.png
    ren %folder%\�������얲��\��\03.png 00.3.png
    ren %folder%\�������얲��\��\04.png 00.4.png
    ren %folder%\�������얲��\��\05.png 00.png
    ren %folder%\������薂������\��\00.png 00.0.png
    ren %folder%\������薂������\��\01.png 00.1.png
    ren %folder%\������薂������\��\02.png 00.2.png
    ren %folder%\������薂������\��\03.png 00.3.png
    ren %folder%\������薂������\��\04.png 00.4.png
    ren %folder%\������薂������\��\05.png 00.png
    ren %folder%\�������d����\��\00.png 00.0.png
    ren %folder%\�������d����\��\01.png 00.1.png
    ren %folder%\�������d����\��\02.png 00.2.png
    ren %folder%\�������d����\��\03.png 00.3.png
    ren %folder%\�������d����\��\04.png 00.4.png
    ren %folder%\�������d����\��\05.png 00.png
    ren %folder%\�������얲��\��\00.png 00.0.png
    ren %folder%\�������얲��\��\01.png 00.1.png
    ren %folder%\�������얲��\��\02.png 00.2.png
    ren %folder%\�������얲��\��\03.png 00.3.png
    ren %folder%\�������얲��\��\04.png 00.4.png
    ren %folder%\�������얲��\��\05.png 00.png
    ren %folder%\������薂������\��\00.png 00.0.png
    ren %folder%\������薂������\��\01.png 00.1.png
    ren %folder%\������薂������\��\02.png 00.2.png
    ren %folder%\������薂������\��\03.png 00.3.png
    ren %folder%\������薂������\��\04.png 00.4.png
    ren %folder%\������薂������\��\05.png 00.png
    ren %folder%\�������d����\��\00.png 00.0.png
    ren %folder%\�������d����\��\01.png 00.1.png
    ren %folder%\�������d����\��\02.png 00.2.png
    ren %folder%\�������d����\��\03.png 00.3.png
    ren %folder%\�������d����\��\04.png 00.4.png
    ren %folder%\�������d����\��\05.png 00.png
    goto :onlyend
rem �P�̕ϊ�

:only

echo �ǂ̗����G�̃^�C�v��ϊ����܂����H
echo ���ˁE�炭�����E�_�ЁE���E�ՂɁE���˃L�����E�������L�����E�񃖂̂�E�Ƃ�݂��E�݂���E�ӂɂ����Edairi���͂邩���̗����G�ik or �����́j
echo �V���˂������in�j
echo �������L�����f�ށiy�j
set /p which="�ϊ��ݒ�(1/2)>>>"
if "%which%" == "k" (
    rem ������
) else if "%which%" == "n" (
    goto :newkitune
) else if "%which%" == "y" (
    goto :onlychara
) else (
    rem ������
)

echo %word3%

rem ���O�w��
echo 1.���O���w�肷��
echo 2.���O���w�肹��folder.txt���烍�[�h����
set /p ans=">>>"
if "%ans%" == "1" (
    goto :name1
)

for /f %%i in (folder.txt) do (
  set folder=%%i
)
echo �L�������w�肵�Ă�������
set /p charactor=">>>"
set folder=%folder%/%charactor%
goto :endname1
:name1

rem �p�X�w��
set /p folder="�p�X�����>>>"

:endname1

rem �m�F
echo �t�@�C���p�X:%folder%
echo ���[�h:�P�̂��ˁE�炭�����E�_�Ў��������
set /p gosign="%word4%(y/n)>>>"
if "%gosign%" == "n" (
    echo "%cancel%"
    goto :setting
)
cls

rem ��̓�����̕ϊ�
    ren %folder%\��\00.png 00.0.png
    ren %folder%\��\00a.png 00.1.png
    ren %folder%\��\00b.png 00.2.png
    ren %folder%\��\00c.png 00.3.png
    ren %folder%\��\00d.png 00.4.png
    ren %folder%\��\00e.png 00.png
    ren %folder%\��\01.png 01.0.png
    ren %folder%\��\01a.png 01.1.png
    ren %folder%\��\01b.png 01.2.png
    ren %folder%\��\01c.png 01.3.png
    ren %folder%\��\01d.png 01.4.png
    ren %folder%\��\01e.png 01.png
    ren %folder%\��\02.png 02.0.png
    ren %folder%\��\02a.png 02.1.png
    ren %folder%\��\02b.png 02.2.png
    ren %folder%\��\02c.png 02.3.png
    ren %folder%\��\02d.png 02.4.png
    ren %folder%\��\02e.png 02.png
    ren %folder%\��\03.png 03.0.png
    ren %folder%\��\03a.png 03.1.png
    ren %folder%\��\03b.png 03.2.png
    ren %folder%\��\03c.png 03.3.png
    ren %folder%\��\03d.png 03.4.png
    ren %folder%\��\03e.png 03.png
    ren %folder%\��\04.png 04.0.png
    ren %folder%\��\04a.png 04.1.png
    ren %folder%\��\04b.png 04.2.png
    ren %folder%\��\04c.png 04.3.png
    ren %folder%\��\04d.png 04.4.png
    ren %folder%\��\04e.png 04.png
    ren %folder%\��\05.png 05.0.png
    ren %folder%\��\05a.png 05.1.png
    ren %folder%\��\05b.png 05.2.png
    ren %folder%\��\05c.png 05.3.png
    ren %folder%\��\05d.png 05.4.png
    ren %folder%\��\05e.png 05.png
    ren %folder%\��\06.png 06.0.png
    ren %folder%\��\06a.png 06.1.png
    ren %folder%\��\06b.png 06.2.png
    ren %folder%\��\06c.png 06.3.png
    ren %folder%\��\06d.png 06.4.png
    ren %folder%\��\06e.png 06.png
    ren %folder%\��\07.png 07.0.png
    ren %folder%\��\07a.png 07.1.png
    ren %folder%\��\07b.png 07.2.png
    ren %folder%\��\07c.png 07.3.png
    ren %folder%\��\07d.png 07.4.png
    ren %folder%\��\07e.png 07.png
    ren %folder%\��\08.png 08.0.png
    ren %folder%\��\08a.png 08.1.png
    ren %folder%\��\08b.png 08.2.png
    ren %folder%\��\08c.png 08.3.png
    ren %folder%\��\08d.png 08.4.png
    ren %folder%\��\08e.png 08.png
    ren %folder%\��\09.png 09.0.png
    ren %folder%\��\09a.png 09.1.png
    ren %folder%\��\09b.png 09.2.png
    ren %folder%\��\09c.png 09.3.png
    ren %folder%\��\09d.png 09.4.png
    ren %folder%\��\09e.png 09.png
    ren %folder%\��\10.png 10.0.png
    ren %folder%\��\10a.png 10.1.png
    ren %folder%\��\10b.png 10.2.png
    ren %folder%\��\10c.png 10.3.png
    ren %folder%\��\10d.png 10.4.png
    ren %folder%\��\10e.png 10.png
    ren %folder%\��\11.png 11.0.png
    ren %folder%\��\11a.png 11.1.png
    ren %folder%\��\11b.png 11.2.png
    ren %folder%\��\11c.png 11.3.png
    ren %folder%\��\11d.png 11.4.png
    ren %folder%\��\11e.png 11.png
    ren %folder%\��\12.png 12.0.png
    ren %folder%\��\12a.png 12.1.png
    ren %folder%\��\12b.png 12.2.png
    ren %folder%\��\12c.png 12.3.png
    ren %folder%\��\12d.png 12.4.png
    ren %folder%\��\12e.png 12.png
    ren %folder%\��\13.png 13.0.png
    ren %folder%\��\13a.png 13.1.png
    ren %folder%\��\13b.png 13.2.png
    ren %folder%\��\13c.png 13.3.png
    ren %folder%\��\13d.png 13.4.png
    ren %folder%\��\13e.png 13.png
    ren %folder%\��\14.png 14.0.png
    ren %folder%\��\14a.png 14.1.png
    ren %folder%\��\14b.png 14.2.png
    ren %folder%\��\14c.png 14.3.png
    ren %folder%\��\14d.png 14.4.png
    ren %folder%\��\14e.png 14.png
    ren %folder%\��\15.png 15.0.png
    ren %folder%\��\15a.png 15.1.png
    ren %folder%\��\15b.png 15.2.png
    ren %folder%\��\15c.png 15.3.png
    ren %folder%\��\15d.png 15.4.png
    ren %folder%\��\15e.png 15.png
    ren %folder%\��\16.png 16.0.png
    ren %folder%\��\16a.png 16.1.png
    ren %folder%\��\16b.png 16.2.png
    ren %folder%\��\16c.png 16.3.png
    ren %folder%\��\16d.png 16.4.png
    ren %folder%\��\16e.png 16.png
    ren %folder%\��\17.png 17.0.png
    ren %folder%\��\17a.png 17.1.png
    ren %folder%\��\17b.png 17.2.png
    ren %folder%\��\17c.png 17.3.png
    ren %folder%\��\17d.png 17.4.png
    ren %folder%\��\17e.png 17.png
    ren %folder%\��\18.png 18.0.png
    ren %folder%\��\18a.png 18.1.png
    ren %folder%\��\18b.png 18.2.png
    ren %folder%\��\18c.png 18.3.png
    ren %folder%\��\18d.png 18.4.png
    ren %folder%\��\18e.png 18.png
    ren %folder%\��\00a.png 00.4.png
    ren %folder%\��\00b.png 00.3.png
    ren %folder%\��\00c.png 00.2.png
    ren %folder%\��\00d.png 00.1.png
    ren %folder%\��\00e.png 00.0.png
    ren %folder%\��\01a.png 01.4.png
    ren %folder%\��\01b.png 01.3.png
    ren %folder%\��\01c.png 01.2.png
    ren %folder%\��\01d.png 01.1.png
    ren %folder%\��\01e.png 01.0.png
    ren %folder%\��\02a.png 02.4.png
    ren %folder%\��\02b.png 02.3.png
    ren %folder%\��\02c.png 02.2.png
    ren %folder%\��\02d.png 02.1.png
    ren %folder%\��\02e.png 02.0.png
    ren %folder%\��\03a.png 03.4.png
    ren %folder%\��\03b.png 03.3.png
    ren %folder%\��\03c.png 03.2.png
    ren %folder%\��\03d.png 03.1.png
    ren %folder%\��\03e.png 03.0.png
    ren %folder%\��\04a.png 04.4.png
    ren %folder%\��\04b.png 04.3.png
    ren %folder%\��\04c.png 04.2.png
    ren %folder%\��\04d.png 04.1.png
    ren %folder%\��\04e.png 04.0.png
    ren %folder%\��\05a.png 05.4.png
    ren %folder%\��\05b.png 05.3.png
    ren %folder%\��\05c.png 05.2.png
    ren %folder%\��\05d.png 05.1.png
    ren %folder%\��\05e.png 05.0.png
    ren %folder%\��\06a.png 06.4.png
    ren %folder%\��\06b.png 06.3.png
    ren %folder%\��\06c.png 06.2.png
    ren %folder%\��\06d.png 06.1.png
    ren %folder%\��\06e.png 06.0.png
cls
rem �^�C�g���\��
:onlyend
cls
echo =============================================
echo   ���ˎ�������藧���Gymm4�Ή��R���o�[�^�[
echo              Version 1.3.1
echo ---------------------------------------------
echo ���p�N�E�u�����������ϊ�
echo �����n�������̑S�L�����͈ꊇ�Ŏ����ϊ��\
echo ����ȊO���P�̂ŉ\
echo �t�@�C���p�X�w�莮
echo =============================================
echo.
title ���ˎ��������ymm4�Ή��R���o�[�^�[ Version 1.3.1�y�ϊ��I���z
echo %word6%
echo.
echo �����ĕϊ����܂����H
echo 1.�����ĕϊ�����
echo 2.�ϊ����Ȃ��ŏI������
set /p ans=">>>"
if "%ans%" == "1" (
    goto :only
)
pause
exit

rem �V���ˎ��������
:newkitune

rem ���O�w��
echo 1.���O���w�肷��
echo 2.���O���w�肹��folder.txt���烍�[�h����
set /p ans=">>>"
if "%ans%" == "1" (
    goto :name2
)

for /f %%i in (folder.txt) do (
  set folder=%%i
)
echo �L�������w�肵�Ă�������
set /p charactor=">>>"
set folder=%folder%/%charactor%
goto :endname2
:name2

rem �p�X�w��
set /p folder="�p�X�����>>>"

:endname2

rem �m�F
echo �t�@�C���p�X:%folder%
echo ���[�h:�P��,�V���ˎ��������
set /p gosign="%word4%(y/n)>>>"
if "%gosign%" == "n" (
    echo "%cancel%"
    goto :setting
)
cls

rem �V���ˎ��������ϊ�
    ren %folder%\��\00\00.png 00.0.png
    ren %folder%\��\00\00a.png 00.1.png
    ren %folder%\��\00\00b.png 00.2.png
    ren %folder%\��\00\00c.png 00.3.png
    ren %folder%\��\00\00d.png 00.4.png
    ren %folder%\��\00\00e.png 00.png
    ren %folder%\��\00\01.png 01.0.png
    ren %folder%\��\00\01a.png 01.1.png
    ren %folder%\��\00\01b.png 01.2.png
    ren %folder%\��\00\01c.png 01.3.png
    ren %folder%\��\00\01d.png 01.4.png
    ren %folder%\��\00\01e.png 01.png
    ren %folder%\��\00\02.png 02.0.png
    ren %folder%\��\00\02a.png 02.1.png
    ren %folder%\��\00\02b.png 02.2.png
    ren %folder%\��\00\02c.png 02.3.png
    ren %folder%\��\00\02d.png 02.4.png
    ren %folder%\��\00\02e.png 02.png
    ren %folder%\��\00\03.png 03.0.png
    ren %folder%\��\00\03a.png 03.1.png
    ren %folder%\��\00\03b.png 03.2.png
    ren %folder%\��\00\03c.png 03.3.png
    ren %folder%\��\00\03d.png 03.4.png
    ren %folder%\��\00\03e.png 03.png
    ren %folder%\��\00\04.png 04.0.png
    ren %folder%\��\00\04a.png 04.1.png
    ren %folder%\��\00\04b.png 04.2.png
    ren %folder%\��\00\04c.png 04.3.png
    ren %folder%\��\00\04d.png 04.4.png
    ren %folder%\��\00\04e.png 04.png
    ren %folder%\��\00\05.png 05.0.png
    ren %folder%\��\00\05a.png 05.1.png
    ren %folder%\��\00\05b.png 05.2.png
    ren %folder%\��\00\05c.png 05.3.png
    ren %folder%\��\00\05d.png 05.4.png
    ren %folder%\��\00\05e.png 05.png
    ren %folder%\��\00\06.png 06.0.png
    ren %folder%\��\00\06a.png 06.1.png
    ren %folder%\��\00\06b.png 06.2.png
    ren %folder%\��\00\06c.png 06.3.png
    ren %folder%\��\00\06d.png 06.4.png
    ren %folder%\��\00\06e.png 06.png
    ren %folder%\��\00\07.png 07.0.png
    ren %folder%\��\00\07a.png 07.1.png
    ren %folder%\��\00\07b.png 07.2.png
    ren %folder%\��\00\07c.png 07.3.png
    ren %folder%\��\00\07d.png 07.4.png
    ren %folder%\��\00\07e.png 07.png
    ren %folder%\��\00\08.png 08.0.png
    ren %folder%\��\00\08a.png 08.1.png
    ren %folder%\��\00\08b.png 08.2.png
    ren %folder%\��\00\08c.png 08.3.png
    ren %folder%\��\00\08d.png 08.4.png
    ren %folder%\��\00\08e.png 08.png
    ren %folder%\��\00\09.png 09.0.png
    ren %folder%\��\00\09a.png 09.1.png
    ren %folder%\��\00\09b.png 09.2.png
    ren %folder%\��\00\09c.png 09.3.png
    ren %folder%\��\00\09d.png 09.4.png
    ren %folder%\��\00\09e.png 09.png
    ren %folder%\��\00\10.png 10.0.png
    ren %folder%\��\00\10a.png 10.1.png
    ren %folder%\��\00\10b.png 10.2.png
    ren %folder%\��\00\10c.png 10.3.png
    ren %folder%\��\00\10d.png 10.4.png
    ren %folder%\��\00\10e.png 10.png
    ren %folder%\��\00\11.png 11.0.png
    ren %folder%\��\00\11a.png 11.1.png
    ren %folder%\��\00\11b.png 11.2.png
    ren %folder%\��\00\11c.png 11.3.png
    ren %folder%\��\00\11d.png 11.4.png
    ren %folder%\��\00\11e.png 11.png
    ren %folder%\��\00\12.png 12.0.png
    ren %folder%\��\00\12a.png 12.1.png
    ren %folder%\��\00\12b.png 12.2.png
    ren %folder%\��\00\12c.png 12.3.png
    ren %folder%\��\00\12d.png 12.4.png
    ren %folder%\��\00\12e.png 12.png
    ren %folder%\��\00\13.png 13.0.png
    ren %folder%\��\00\13a.png 13.1.png
    ren %folder%\��\00\13b.png 13.2.png
    ren %folder%\��\00\13c.png 13.3.png
    ren %folder%\��\00\13d.png 13.4.png
    ren %folder%\��\00\13e.png 13.png
    ren %folder%\��\00\14.png 14.0.png
    ren %folder%\��\00\14a.png 14.1.png
    ren %folder%\��\00\14b.png 14.2.png
    ren %folder%\��\00\14c.png 14.3.png
    ren %folder%\��\00\14d.png 14.4.png
    ren %folder%\��\00\14e.png 14.png
    ren %folder%\��\00\15.png 15.0.png
    ren %folder%\��\00\15a.png 15.1.png
    ren %folder%\��\00\15b.png 15.2.png
    ren %folder%\��\00\15c.png 15.3.png
    ren %folder%\��\00\15d.png 15.4.png
    ren %folder%\��\00\15e.png 15.png
    ren %folder%\��\00\16.png 16.0.png
    ren %folder%\��\00\16a.png 16.1.png
    ren %folder%\��\00\16b.png 16.2.png
    ren %folder%\��\00\16c.png 16.3.png
    ren %folder%\��\00\16d.png 16.4.png
    ren %folder%\��\00\16e.png 16.png
    ren %folder%\��\00\17.png 17.0.png
    ren %folder%\��\00\17a.png 17.1.png
    ren %folder%\��\00\17b.png 17.2.png
    ren %folder%\��\00\17c.png 17.3.png
    ren %folder%\��\00\17d.png 17.4.png
    ren %folder%\��\00\17e.png 17.png
    ren %folder%\��\00\18.png 18.0.png
    ren %folder%\��\00\18a.png 18.1.png
    ren %folder%\��\00\18b.png 18.2.png
    ren %folder%\��\00\18c.png 18.3.png
    ren %folder%\��\00\18d.png 18.4.png
    ren %folder%\��\00\18e.png 18.png
    ren %folder%\��\00\00a.png 00.4.png
    ren %folder%\��\00\00b.png 00.3.png
    ren %folder%\��\00\00c.png 00.2.png
    ren %folder%\��\00\00d.png 00.1.png
    ren %folder%\��\00\00e.png 00.0.png
    ren %folder%\��\00\01a.png 01.4.png
    ren %folder%\��\00\01b.png 01.3.png
    ren %folder%\��\00\01c.png 01.2.png
    ren %folder%\��\00\01d.png 01.1.png
    ren %folder%\��\00\01e.png 01.0.png
    ren %folder%\��\00\02a.png 02.4.png
    ren %folder%\��\00\02b.png 02.3.png
    ren %folder%\��\00\02c.png 02.2.png
    ren %folder%\��\00\02d.png 02.1.png
    ren %folder%\��\00\02e.png 02.0.png
    ren %folder%\��\00\03a.png 03.4.png
    ren %folder%\��\00\03b.png 03.3.png
    ren %folder%\��\00\03c.png 03.2.png
    ren %folder%\��\00\03d.png 03.1.png
    ren %folder%\��\00\03e.png 03.0.png
    ren %folder%\��\00\04a.png 04.4.png
    ren %folder%\��\00\04b.png 04.3.png
    ren %folder%\��\00\04c.png 04.2.png
    ren %folder%\��\00\04d.png 04.1.png
    ren %folder%\��\00\04e.png 04.0.png
    ren %folder%\��\00\05a.png 05.4.png
    ren %folder%\��\00\05b.png 05.3.png
    ren %folder%\��\00\05c.png 05.2.png
    ren %folder%\��\00\05d.png 05.1.png
    ren %folder%\��\00\05e.png 05.0.png
    ren %folder%\��\00\06a.png 06.4.png
    ren %folder%\��\00\06b.png 06.3.png
    ren %folder%\��\00\06c.png 06.2.png
    ren %folder%\��\00\06d.png 06.1.png
    ren %folder%\��\00\06e.png 06.0.png
    ren %folder%\��\01\00.png 00.0.png
    ren %folder%\��\01\00a.png 00.1.png
    ren %folder%\��\01\00b.png 00.2.png
    ren %folder%\��\01\00c.png 00.3.png
    ren %folder%\��\01\00d.png 00.4.png
    ren %folder%\��\01\00e.png 00.png
    ren %folder%\��\01\01.png 01.0.png
    ren %folder%\��\01\01a.png 01.1.png
    ren %folder%\��\01\01b.png 01.2.png
    ren %folder%\��\01\01c.png 01.3.png
    ren %folder%\��\01\01d.png 01.4.png
    ren %folder%\��\01\01e.png 01.png
    ren %folder%\��\01\02.png 02.0.png
    ren %folder%\��\01\02a.png 02.1.png
    ren %folder%\��\01\02b.png 02.2.png
    ren %folder%\��\01\02c.png 02.3.png
    ren %folder%\��\01\02d.png 02.4.png
    ren %folder%\��\01\02e.png 02.png
    ren %folder%\��\01\03.png 03.0.png
    ren %folder%\��\01\03a.png 03.1.png
    ren %folder%\��\01\03b.png 03.2.png
    ren %folder%\��\01\03c.png 03.3.png
    ren %folder%\��\01\03d.png 03.4.png
    ren %folder%\��\01\03e.png 03.png
    ren %folder%\��\01\04.png 04.0.png
    ren %folder%\��\01\04a.png 04.1.png
    ren %folder%\��\01\04b.png 04.2.png
    ren %folder%\��\01\04c.png 04.3.png
    ren %folder%\��\01\04d.png 04.4.png
    ren %folder%\��\01\04e.png 04.png
    ren %folder%\��\01\05.png 05.0.png
    ren %folder%\��\01\05a.png 05.1.png
    ren %folder%\��\01\05b.png 05.2.png
    ren %folder%\��\01\05c.png 05.3.png
    ren %folder%\��\01\05d.png 05.4.png
    ren %folder%\��\01\05e.png 05.png
    ren %folder%\��\01\06.png 06.0.png
    ren %folder%\��\01\06a.png 06.1.png
    ren %folder%\��\01\06b.png 06.2.png
    ren %folder%\��\01\06c.png 06.3.png
    ren %folder%\��\01\06d.png 06.4.png
    ren %folder%\��\01\06e.png 06.png
    ren %folder%\��\01\07.png 07.0.png
    ren %folder%\��\01\07a.png 07.1.png
    ren %folder%\��\01\07b.png 07.2.png
    ren %folder%\��\01\07c.png 07.3.png
    ren %folder%\��\01\07d.png 07.4.png
    ren %folder%\��\01\07e.png 07.png
    ren %folder%\��\01\08.png 08.0.png
    ren %folder%\��\01\08a.png 08.1.png
    ren %folder%\��\01\08b.png 08.2.png
    ren %folder%\��\01\08c.png 08.3.png
    ren %folder%\��\01\08d.png 08.4.png
    ren %folder%\��\01\08e.png 08.png
    ren %folder%\��\01\09.png 09.0.png
    ren %folder%\��\01\09a.png 09.1.png
    ren %folder%\��\01\09b.png 09.2.png
    ren %folder%\��\01\09c.png 09.3.png
    ren %folder%\��\01\09d.png 09.4.png
    ren %folder%\��\01\09e.png 09.png
    ren %folder%\��\01\10.png 10.0.png
    ren %folder%\��\01\10a.png 10.1.png
    ren %folder%\��\01\10b.png 10.2.png
    ren %folder%\��\01\10c.png 10.3.png
    ren %folder%\��\01\10d.png 10.4.png
    ren %folder%\��\01\10e.png 10.png
    ren %folder%\��\01\11.png 11.0.png
    ren %folder%\��\01\11a.png 11.1.png
    ren %folder%\��\01\11b.png 11.2.png
    ren %folder%\��\01\11c.png 11.3.png
    ren %folder%\��\01\11d.png 11.4.png
    ren %folder%\��\01\11e.png 11.png
    ren %folder%\��\01\12.png 12.0.png
    ren %folder%\��\01\12a.png 12.1.png
    ren %folder%\��\01\12b.png 12.2.png
    ren %folder%\��\01\12c.png 12.3.png
    ren %folder%\��\01\12d.png 12.4.png
    ren %folder%\��\01\12e.png 12.png
    ren %folder%\��\01\13.png 13.0.png
    ren %folder%\��\01\13a.png 13.1.png
    ren %folder%\��\01\13b.png 13.2.png
    ren %folder%\��\01\13c.png 13.3.png
    ren %folder%\��\01\13d.png 13.4.png
    ren %folder%\��\01\13e.png 13.png
    ren %folder%\��\01\14.png 14.0.png
    ren %folder%\��\01\14a.png 14.1.png
    ren %folder%\��\01\14b.png 14.2.png
    ren %folder%\��\01\14c.png 14.3.png
    ren %folder%\��\01\14d.png 14.4.png
    ren %folder%\��\01\14e.png 14.png
    ren %folder%\��\01\15.png 15.0.png
    ren %folder%\��\01\15a.png 15.1.png
    ren %folder%\��\01\15b.png 15.2.png
    ren %folder%\��\01\15c.png 15.3.png
    ren %folder%\��\01\15d.png 15.4.png
    ren %folder%\��\01\15e.png 15.png
    ren %folder%\��\01\16.png 16.0.png
    ren %folder%\��\01\16a.png 16.1.png
    ren %folder%\��\01\16b.png 16.2.png
    ren %folder%\��\01\16c.png 16.3.png
    ren %folder%\��\01\16d.png 16.4.png
    ren %folder%\��\01\16e.png 16.png
    ren %folder%\��\01\17.png 17.0.png
    ren %folder%\��\01\17a.png 17.1.png
    ren %folder%\��\01\17b.png 17.2.png
    ren %folder%\��\01\17c.png 17.3.png
    ren %folder%\��\01\17d.png 17.4.png
    ren %folder%\��\01\17e.png 17.png
    ren %folder%\��\01\18.png 18.0.png
    ren %folder%\��\01\18a.png 18.1.png
    ren %folder%\��\01\18b.png 18.2.png
    ren %folder%\��\01\18c.png 18.3.png
    ren %folder%\��\01\18d.png 18.4.png
    ren %folder%\��\01\18e.png 18.png
    ren %folder%\��\01\00a.png 00.4.png
    ren %folder%\��\01\00b.png 00.3.png
    ren %folder%\��\01\00c.png 00.2.png
    ren %folder%\��\01\00d.png 00.1.png
    ren %folder%\��\01\00e.png 00.0.png
    ren %folder%\��\01\01a.png 01.4.png
    ren %folder%\��\01\01b.png 01.3.png
    ren %folder%\��\01\01c.png 01.2.png
    ren %folder%\��\01\01d.png 01.1.png
    ren %folder%\��\01\01e.png 01.0.png
    ren %folder%\��\01\02a.png 02.4.png
    ren %folder%\��\01\02b.png 02.3.png
    ren %folder%\��\01\02c.png 02.2.png
    ren %folder%\��\01\02d.png 02.1.png
    ren %folder%\��\01\02e.png 02.0.png
    ren %folder%\��\01\03a.png 03.4.png
    ren %folder%\��\01\03b.png 03.3.png
    ren %folder%\��\01\03c.png 03.2.png
    ren %folder%\��\01\03d.png 03.1.png
    ren %folder%\��\01\03e.png 03.0.png
    ren %folder%\��\01\04a.png 04.4.png
    ren %folder%\��\01\04b.png 04.3.png
    ren %folder%\��\01\04c.png 04.2.png
    ren %folder%\��\01\04d.png 04.1.png
    ren %folder%\��\01\04e.png 04.0.png
    ren %folder%\��\01\05a.png 05.4.png
    ren %folder%\��\01\05b.png 05.3.png
    ren %folder%\��\01\05c.png 05.2.png
    ren %folder%\��\01\05d.png 05.1.png
    ren %folder%\��\01\05e.png 05.0.png
    ren %folder%\��\01\06a.png 06.4.png
    ren %folder%\��\01\06b.png 06.3.png
    ren %folder%\��\01\06c.png 06.2.png
    ren %folder%\��\01\06d.png 06.1.png
    ren %folder%\��\01\06e.png 06.0.png
goto :onlyend

rem �������L�����f�ޒP��

:onlychara

rem ���O�w��
echo 1.���O���w�肷��
echo 2.���O���w�肹��folder.txt���烍�[�h����
set /p ans=">>>"
if "%ans%" == "1" (
    goto :name3
)

for /f %%i in (folder.txt) do (
  set folder=%%i
)
echo �L�������w�肵�Ă�������
set /p charactor=">>>"
set folder=%folder%/%charactor%
goto :endname3
:name3

rem �p�X�w��
set /p folder="�p�X�����>>>"

:endname3

rem �m�F
echo �t�@�C���p�X:%folder%
echo ���[�h:�P�̂������L�����f��
set /p gosign="%word4%(y/n)>>>"
if "%gosign%" == "n" (
    echo "%cancel%"
    goto :setting
)
cls

    ren %folder%\��\00.png 00.0.png
    ren %folder%\��\01.png 00.1.png
    ren %folder%\��\02.png 00.2.png
    ren %folder%\��\03.png 00.3.png
    ren %folder%\��\04.png 00.4.png
    ren %folder%\��\05.png 00.png
    ren %folder%\��\00.png 00.0.png
    ren %folder%\��\01.png 00.1.png
    ren %folder%\��\02.png 00.2.png
    ren %folder%\��\03.png 00.3.png
    ren %folder%\��\04.png 00.4.png
    ren %folder%\��\05.png 00.png

goto :onlyend