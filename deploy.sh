#!/bin/bash

# 배포 스크립트
# 사용법: ./deploy.sh

set -e

SERVER_IP="3.106.238.151"
SERVER_USER="ubuntu"
KEY_PATH="$HOME/Downloads/sca-key.pem"
PROJECT_DIR="/home/ubuntu/sea_V2"

echo "🚀 배포 시작..."

# 1. 서버에 프로젝트 파일 전송
echo "📦 프로젝트 파일 전송 중..."
rsync -avz --exclude 'node_modules' \
           --exclude '.git' \
           --exclude 'build' \
           --exclude 'data' \
           --exclude '*.log' \
           -e "ssh -i $KEY_PATH -o StrictHostKeyChecking=no" \
           ./ $SERVER_USER@$SERVER_IP:$PROJECT_DIR/

# 2. 서버에서 빌드 및 배포 실행
echo "🔨 서버에서 빌드 및 배포 실행 중..."
ssh -i $KEY_PATH -o StrictHostKeyChecking=no $SERVER_USER@$SERVER_IP << 'ENDSSH'
cd /home/ubuntu/sea_V2

# 백엔드 빌드
echo "📦 백엔드 빌드 중..."
cd SCA-BE
./gradlew clean build -x test
cd ..

# 도커 이미지 빌드 및 배포
echo "🐳 도커 이미지 빌드 중..."
docker-compose build

echo "🔄 기존 컨테이너 중지 및 제거..."
docker-compose down

echo "🚀 새 컨테이너 시작..."
docker-compose up -d

echo "✅ 배포 완료!"
docker-compose ps
ENDSSH

echo "🎉 배포가 완료되었습니다!"




