variable "web_linuxvm_instance_count" {
  description = "Web linux vm count"
  type = map(string)
  #type = list(string)
  #default = ["vm1","vm2"]
  #i want to define my string format into key value format
  default = {
    "vm1" = "1022",
    "vm2" = "2022"
  }
}