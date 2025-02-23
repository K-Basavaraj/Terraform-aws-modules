variable "name" {
  type        = string
  description = "(Required) Name of the parameter. If the name contains a path (e.g., any forward slashes (/))"
}

variable "type" {
  type        = string
  description = "(Required) Type of the parameter. Valid types are String, StringList and SecureString."
}

variable "value" {
  type        = string
  description = "(Optional, exactly one of value, value_wo or insecure_value is required) Value of the parameter."
  default     = null
}

variable "description" {
  type        = string
  description = "(Optional) Description of the parameter."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to assign to the resource."
}