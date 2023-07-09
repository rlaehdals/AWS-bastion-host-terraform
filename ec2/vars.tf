variable "region"{
    type = string
}

variable "subnet_id" {
    type = string
}

variable "aws_security_group_ids"{
    type = list
}

variable "key_name"{
    type = string
}

variable "instance_type"{
    type = string
}