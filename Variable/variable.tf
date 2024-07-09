variable "ami" {
  description = "our ami value"
  type        = string
  default     = "ami-08a0d1e16fc3f61ea"

}

variable "instance_type" {
  description = "provide your instnce type"
  type        = list(string)
  default     = ["t2.micro", "t2.small", "t2.large"]
}

variable "number" {
  description = "provide number of instances"
  type        = number
  default     = 1
}

variable "associate_public_ip_address" {
  description = "please enable public IP"
  type        = bool
  default     = true
}

variable "tags" {
  description = "provide your instance tag"
  type        = map(string)
  default = {
    Name = "PCE-Ter"
    Env  = "Prod"
  }
}


variable "cidr_block" {
  description = "provide your cidr block"
  type        = string
  default     = "10.0.0.0/16"
  sensitive   = false
}

variable "enable_dns_hostnames" {
  description = ""
  type        = bool
  default     = true
  sensitive   = false
}