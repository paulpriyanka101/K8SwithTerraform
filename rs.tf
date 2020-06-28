provider "kubernetes" {
	config_context_cluster = "minikube"
}

resource "kubernetes_deployment" "rsweb1" {
  metadata {
    name = "rsweb1"
  }

  spec {
    replicas = 2


    selector {
     	match_expressions {
		key = "dc"
		operator = "In"
		values = [ "IN" ]
	}		
    }

  template {
	metadata {
		labels = {
		env = "dev",
		dc = "IN",
		app = "webserver"
		}
		
	annotations = {
			"key1" = "value1"
		}
	}

	spec {
		container {
			image = "vimal13/apache-webserver-php"
			name = "mycon1"
		}
	}
}
}
}
