# ft_services

Here is my work for ft_services, a sysadmin project of the 4th circle of the 42 Common Core, meant to familiarise with Kubernetes.
It consists in using k8s tools to develop a frugal, resilient and efficient infrastructure.

Since it's an experimental project meant to be run on limited resources, it uses minikube.

Running the script will deploy a MySQL/Wordpress/PHPMyAdmin stack behind a redirecting instance of NGINX, along with an FTPS server, all fully telegraf-monitored with a Grafana/InfluxDB stack.

All the relevant services are exposed on the same IP *192.168.49.3* at different ports using the LoadBalancer service directive and the MetalLB addon for minikube, ie

- NGINX on ports 80 (HTTP) and 443 (HTTPS)
- Wordpress (HTTPS) on port 4040
- PHPMyAdmin (HTTP) on port 4000
- Grafana on port 3000
- FTPS on ports 20, 21 and 8975 (passive FTPS)

(Note : The NGINX server exposes a single static page at its root, 307-redirects to the Wordpress service on the /wordpress URI, and reverse-proxies the PHPMyAdmin service on the /phpmyadmin URI.)
