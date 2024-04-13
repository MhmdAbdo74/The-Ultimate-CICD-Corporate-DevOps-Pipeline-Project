variable "ami" {
  description = "The ID of the AMI to use for the EC2 instances"
}
variable "type" {
  description = "The type of EC2 instance to launch"
}
variable "instance_count" {
  description = "The number of EC2 instances to launch"
}
variable "KEY_NAME" {
  
}
variable "vpc_id" {
  
}
variable "subnet_id" {
  
}
variable "sg-id" {
    type    = set(string)

}