vpc_id = "" # VPC를 생성한 후 id 넣어주기
security_name = "allow_ssh"
ingress = {
    from_port = 22
    to_port = 22
}
protocol= "tcp"
cidr_blocks = [""] # 현재 본인의 IP
region = "ap-northeast-2"
tags = {
    Terraform = "true"
    Enviroment = "dev"
}