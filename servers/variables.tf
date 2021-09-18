variable "image_id" {
  default     = "ami-042e8287309f5df03"
  type        = string
  description = "id do AMI da AWS"

  validation {
    condition     = length(var.image_id) > 4 && substr(var.image_id, 0, 4) == "ami-"
    error_message = "The image_id value must be a valid AMI id, starting with \"ami-\"."
  }
}

variable "servers" {
  type    = number
  default = 4
}

variable "environment" {
  type    = string
  default = "Development"
}

variable "message" {
  type    = string
  default = "Olá, tudo bem?"
}