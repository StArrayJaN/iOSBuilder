#!/bin/bash
set -e  # 遇到错误立即退出

echo "开始下载 Unity 导出工程..."

curl -LO https://github.com/StArrayJaN/iOSBuilder/releases/download/1.0/ADOFAI292.zip
curl -LO https://github.com/StArrayJaN/iOSBuilder/releases/download/1.0/Il2CppOutputProject.zip

unzip -q ADOFAI292.zip -d .
unzip -q Il2CppOutputProject.zip -d .
rm Info.plist
curl -LO https://github.com/StArrayJaN/iOSBuilder/releases/download/1.0/Info.plist

# 可选：验证关键文件是否存在
if [ ! -d "Unity-iPhone.xcodeproj" ]; then
    echo "错误：解压后未找到 Unity-iPhone.xcodeproj，请检查压缩包内容"
    exit 1
fi

find . -maxdepth 1 -type f -name "*.sh" -exec chmod +x {} \;
chmod +x usymtool
chmod +x usymtoolarm64

echo "下载并解压完成"