# ubuntu docker 환경 셋팅

* docker 설치 : https://docs.docker.com/engine/install/ubuntu/

## jenkins
* 설치
sudo docker pull jenkins/jenkins
* 실행
sudo docker run -d -p 80:8080 orchardup/jenkins


## 시스템 시작 시 실행 설정 [link](https://eunseok.tistory.com/entry/Startup-script-Booting%EC%8B%9C-Start%ED%95%98%EB%8A%94-script%EC%B6%94%EA%B0%80-%EB%B0%A9%EB%B2%95)
1. /etc/init.d 아래에 startScript.sh 추가
2. chmod 755 startScript.sh
3. sudo update-rc.d startScript.sh defaults
4. 재부팅 시켜서 알아보기
