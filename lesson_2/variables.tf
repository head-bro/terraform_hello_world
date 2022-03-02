variable "server_port" {
  description = "port number for web page"
  type = number
  default = 8080
}

variable "abl_port" {
  description = "load balancer in port"
  type = number
  default = 80
}