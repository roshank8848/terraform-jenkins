# terraform-jenkins

### Download terrafrom binary
```bash
wget -c https://releases.hashicorp.com/terraform/1.15.4/terraform_1.15.4_linux_amd64.zip
```

### Unzip the binary and move it to `/usr/local/bin`
```bash
unzip terraform_1.15.4_linux_amd64.zip
sudo mv terraform /usr/local/bin
```

### create a `.env` file with following details
```
export AWS_ACCESS_KEY_ID=""
export AWS_SECRET_ACCESS_KEY=""
export AWS_SESSION_TOKEN=""
export AWS_REGION=""
```

### export .env file with following command
```bash
source .env
```