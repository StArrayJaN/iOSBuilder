#!/bin/bash

echo "开始下载 Unity 导出工程..."

curl -LO https://github.com/StArrayJaN/iOSBuilder/releases/download/1.0/XcodeProject.zip

unzip -q XcodeProject.zip -d .

# 可选：验证关键文件是否存在
if [ ! -d "Unity-iPhone.xcodeproj" ]; then
    echo "错误：解压后未找到 Unity-iPhone.xcodeproj，请检查压缩包内容"
    exit 1
fi

find . -maxdepth 1 -type f -name "*.sh" -exec chmod +x {} \;

if [ -f "usymtool" ] && [ -f "usymtoolarm64" ]; then
chmod +x usymtool
chmod +x usymtoolarm64
fi

echo "下载并解压完成"
