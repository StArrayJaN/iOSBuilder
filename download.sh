#!/bin/bash
set -e  # 遇到错误立即退出

echo "开始下载 Unity 导出工程..."

# ===== 配置区域 =====
DOWNLOAD_URL="https://github.com/StArrayJaN/iOSBuilder/releases/download/1.0/XcodeProject.zip"  # 替换为实际下载地址
DEST_DIR="."                         # 解压目标目录（当前工作目录）
# ===================

# 创建临时文件
TEMP_ZIP=$(mktemp -u).zip

# 下载
echo "从 $DOWNLOAD_URL 下载中..."
curl -L -o "$TEMP_ZIP" "$DOWNLOAD_URL"

# 检查下载是否成功
if [ ! -f "$TEMP_ZIP" ]; then
    echo "错误：下载失败"
    exit 1
fi

# 解压到目标目录
echo "解压到 $DEST_DIR ..."
unzip -q "$TEMP_ZIP" -d "$DEST_DIR"

# 清理临时文件
rm "$TEMP_ZIP"

# 可选：验证关键文件是否存在
if [ ! -d "Unity-iPhone.xcodeproj" ]; then
    echo "错误：解压后未找到 Unity-iPhone.xcodeproj，请检查压缩包内容"
    exit 1
fi

echo "下载并解压完成"