variable "name" {
  type        = string
  description = "The name of the DB subnet group."
}

variable "subnet_ids" {
  type        = list(string)
  description = "A list of VPC subnet IDs."
}

variable "name_prefix" {
  type        = string
  description = "Creates a unique name beginning with the specified prefix. Conflicts with name."
  default     = null
}

variable "description" {
  type        = string
  description = "The description of the DB subnet group."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to assign to the resource."
}
