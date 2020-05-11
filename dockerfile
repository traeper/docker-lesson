# 실제 개발&프로덕션 환경에서는 latest 버전 사용은 지양해야 한다.
FROM node:latest

# 도커 이미지 사이트에서 working_dir 값과 동일하게 작성한다.
WORKDIR /home/node/app

# directory 지정 - 현재 폴더의 모든 파일들을 {WORKDIR} 경로로 모두 옮김
COPY . .

CMD yarn serve
