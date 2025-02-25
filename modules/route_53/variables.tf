variable "zone_id" {
  type        = string
  description = "(Required) The ID of the hosted zone to contain this record."
}

variable "name" {
  type = string
  description = "(Required) The name of the record."
}

variable "type" {
  type = string
  description = "(Required) The record type. Valid values are A, AAAA, CAA, CNAME, DS, MX, NAPTR, NS, PTR, SOA, SPF, SRV and TXT."
}

variable "ttl" {
  type = string
  description = "(Required for non-alias records) The TTL of the record."
}

variable "records" {
  type        = list(string)
  description = "(Required for non-alias records) A string list of records."
}
