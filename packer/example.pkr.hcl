source "docker" "ubuntu" {
  commit = true
  image  = "ubuntu:16.04"
}
build {
  sources = ["source.docker.ubuntu"]

  provisioner "ansible" {
    user              = "ubuntu"
    playbook_file     = "./playbook.yml"
  }
  
  post-processor "docker-tag" {
    repository = "camillamartins/dockerpacker"
    tags = ["1.0"]
  }
}
