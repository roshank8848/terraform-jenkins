output "jenkins_master_url" {
  value       = "http://${module.compute.master_public_ip}:8080"
  description = "Access the Jenkins Dashboard here"
}

output "jenkins_slave_ip" {
  value       = module.compute.slave_public_ip
  description = "Public IP of the Slave Node for SSH or Agent setup"
}