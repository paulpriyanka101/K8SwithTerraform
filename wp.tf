provider "kubernetes" {
	config_context_cluster = "minikube"
}

resource "kubernetes_deployment" "rswp1" {
  metadata {
    name = "rswp1"
  }

  spec {
    replicas = 1


    selector {
     	match_expressions {
		key = "env"
		operator = "In"
		values = [ "dev" ]
	}		
    }

  template {
	metadata {
		labels = {
		env = "dev",
		app = "wp"
		}
		
	annotations = {
			"key1" = "value1"
		}
	}

	spec {
		container {
			image = "wordpress:4.8-apache"
			name = "wpcon1"
		}

	}
}
}
}
