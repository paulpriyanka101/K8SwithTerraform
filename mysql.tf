provider "kubernetes" {
	config_context_cluster = "minikube"
}

resource "kubernetes_deployment" "rsmysql1" {
  metadata {
    name = "rsmysql1"
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
		app = "mysql_db"
		}
		
	annotations = {
			"key1" = "value1"
		}
	}

	spec {
		container {
			image = "mysql:5.6"
			name = "mysqlcon1"
			env {
				name = "MYSQL_ROOT_PASSWORD"
				value = "redhat"
			}
			env {
				name = "MYSQL_DATABASE"
				value = "mydb"
			}
			env {	
				name = "MYSQL_USER"
				value = "admin"
			}
			env {
				name = "MYSQL_PASSWORD" 
				value = "admin"
			}
		}

	}
}
}
}

