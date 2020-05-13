# Docker Study

## prerequisites

1. 반드시 윈도우 랩탑 대신 맥북 지참
2. <https://www.docker.com/products/docker-desktop> : docker desktop 받아서 설치
3. vue-cli설치/업그레이드: yarn global add @vue/cli
4. visual studio code + docker plugin install

## sample-app start

* vue create sample-app

## docker 기초

* 예제1) hello-world 도커 이미지 돌려보기
  1. docker pull hello-world:latest  
latest는 생략해도 됨.  
<https://hub.docker.com/> 도커 허브 사이트에서 download 수가 높은(검증된) 이미지를 다운로드하는 것이 중요하다.
  2. docker run hello-world  
docker 컨테이너는 running 중인 프로세스가 0개가 되면 꺼지며 "Hello from Docker!, 기타 문장"이 노출되고 종료되는 것을 확인할 수 있다.
* 예제2) ubuntu 도커 이미지 돌려보기
  1. docker pull ubuntu:18.04 & docker run ubuntu:18.04  
ubuntu에 기본적으로 떠있는 프로세스가 없기 때문에 바로 종료됨.
  2. docker run -it ubuntu:18.04 /bin/bash  
ubuntu:18.04에 /bin/bash 쉘 환경으로 연결(i: interaction, t:tty)
  3. docker container ls  
실행되고 있는 container가 노출됨. 만약 실행중인 docker cmd 환경에서 exit를 입력 후 나온다면 위 "docker container ls" 명령어로 조회가 안됨.
* docker container ls -a  
종료된 container들이 노출되므로 접속해서 로그를 확인하는 등 디버깅에 이용할 수 있음.
docker run은 컨테이너 생성 -> 컨테이너 실행을 의미함
만약 컨테이너를 생성하고 싶지 않으면 run 명령에 --rm 옵션을 추가
* docker container prune
종료된 모든 컨테이너를 제거
* docker image prune
사용되지 않는 모든 이미지를 제거

## docker - node 실행

1. node 이미지 다운로드 및 실행  
<https://hub.docker.com/_/node>  
Container, Linux가 있으므로 이 이미지를 실행하게 되면 도커 이미지 자체의 Linux OS가 실행되며 노드가 그 환경에서 실행됨을 알 수 있음.

## dockerfile 설명

* docker hub에 가서 이용할 이미지에서 확인
* dockerfile 참고
* docker 이미지 빌드 : docker build -t sample-app:latest .  
결과로 docker 이미지가 생성된다. docker image ls 하면 보임.
* docker stop {CONTAINER ID} stop을 하면 CMD로 걸어놓은 프로세스에 중단 요청(SIGTERM)을 날리고 해당 프로세스가 중단되면 빠져나오게됩니당
* docker run sample-app:latest  
docker run $태그명:$버전명

## dockerfile2 설명

* docker build -f multi-stage.dockerfile -t sample-app:latest .  
dockerfile이 여러개인 경우 -f로 빌드할 dockerfile 이름을 가리킬 수 있다.

* docker run -d -p 8080:8080 sample-app:latest  
-d : detach를 이용해서 컨테이너를 백그라운드에서 실행
-p : 외부에 포트 공개

## compose

* docker-compose.yaml 작성  


## 트러블 슈팅

* docker history {IMAGE ID}  
docker image build가 잘 되었는지 확인하기 위한 용도. 결과 로그가 출력

* docker container exec -it {CONTAINER ID} /bin/sh  
exec -it: 실행중인 컨테이너에 연결, 내부에 빌드본이 어떻게 카피되었는지 확인할 수 있음.
top을 찍어보면 node가 떠있음을 확인할 수 있음.  
pkill node : node 프로세스 모두 종료 -> PID 1번으로 잡힌 프로세스가 꺼지면 컨테이너도 자동 종료


### 도움말

* 이미지 = 씨디
* 컨테이너 = 씨디로 설치한 것
* run/exec -it : (i: interaction, t:tty)
