terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"   
      version = "~> 3.0.2"
    }
  }
}

provider "docker" {}

resource "docker_image" "apache" {
  name         = "httpd:latest"
  keep_locally = false
}

resource "docker_container" "apache_container" {
  name  = "apache-server"
  image = docker_image.apache.name
  ports {
    internal = 80
    external = 9090
  }
//in this line,i have change the apache html value ,like your own websites ,in file path paste your folder path
volumes{
    host_path      = "file path"
    container_path = "/usr/local/apache2/htdocs/"
  }
}




