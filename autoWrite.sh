#!/bin/bash

set -e
set -u
set -o pipefail

executableName="./read_xlsx_to_ios"

eval "chmod +x ${executableName}"

cat << EOF
自动将xlsx中的i18n国际化内容写入xcstrings/strings中
有如下2种类型
EOF


fg_pale_red='\033[33m'       
fg_default='\033[0m'  

echo -e "$fg_pale_red 1. Xcode14 strings中"
echo -e "$fg_pale_red 2. Xcode15 xcstrings"

echo -e "$fg_default"


read -p "输入对应的数字并按回车键: " ostype

case $ostype in
1)
	read -p "请输入Xcode项目根目录或者一个目录: " lprojPath
	read -p "请输入xlsx文件路径: " xlsxpath
	
	eval "${executableName} -x ${xlsxpath} -p ${lprojPath}"
	
;;
2)
	read -p "输入xcstrings文件路径或者一个目录: " xcstringsPath
	read -p "请输入xlsx文件路径: " xlsxpath

	eval "${executableName} -x ${xlsxpath} -xc ${xcstringsPath}"
;;
*)
	echo "输入错误，请输入1或者2"
;;
esac