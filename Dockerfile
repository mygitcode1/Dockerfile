FROM
LABEL
RUN
COPY
ADD
CMD
FROM nginx:latest
LABEL "owner"="Bhanu" "email"="bhanu143chandar@gmail.com"
RUN apt update && apt install -y nginx curl jq wget unzip
COPY index.html /usr/share/nginx/html/
COPY scorekeeper.js /usr/share/nginx/html/
COPY style.css /usr/share/nginx/html/
ADD https://releases.hashicorp.com/terraform/1.1.9/terraform_1.1.9_linux_386.zip .
RUN unzip terraform_1.1.9_linux_386.zip && chmod 777 terraform && ./terraform version && mv terraform /usr/local/bin
#HEALTHCHECK CMD curl --fail http://localhost || exit 1
CMD ["nginx", "-g", "daemon off;"]

Building Docker image
# docker build -t bhanu143chandar/<imag_name>:version .
              or
# docker build -t bhanu143chandar/<imag_name>:version <Dockerfile path>
