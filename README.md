# AWS-bastion-host-terraform

### 아래의 순서에 따라서 리소스를 생성한다.

모든 리소스를 생성할 때는 아래의 명령어를 사용한다.

```
가장 처음 디렉터리에 들어왔을 때
terraform init (terraform이 API를 사용할 수 있도록 모듈 다운로드함)

terraform apply -var-file=dev.tfvars -auto-approve (실제로 리소스를 만듬)
```
---

1. VPC
2. subnet (VPC id를 채워준다.)
3. internet-gw (vpc id, publuc subnet id 채워준다.)
4. security_group (vpc id를 채워준다.)
5. key
   - ssh-keygen -f {pwd}/mykey를 사용하여 만든다. (이때 mykey는 본인이 원하는대로 변경 가능하다. path_to_public_key만 똑같이 채워주면 된다.)
   - key가 위치한 곳인데, 나는 terraform을 사용하는 곳에 만들었다. 지정하지 않으면 ~/.ssh에 생성된다.
6. ec2 (위에서 만든 key_name, subnet_id, security_group_id를 채워준다.)

이렇게하면 모든 리소스는 생성이 완료된다. 

### ssh config 생성

이때 ssh 연결할 때 key위치, 이름, host name을 항상 적는 것은 매우 귀찮다. 따라서 ssh config를 생성해주자.

```
vim ~/.ssh/config 입력하고 아래의 내용을 채워준다.

Host EC2_ROOT
  HostName 255.255.255.255 (본인 ec2의 public IP)
  User ec2-user (aws linux의 경우 root가 ec2-user이다.)
  IdentityFile {pwd}mykey (아까 위에서 ssh-keygen을 만들 때 사용한 경로를 입력한다.)
```

이렇게하면 ssh EC2_ROOT를 입력하면 손쉽게 접근 가능하다.
