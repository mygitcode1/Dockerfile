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

ARG --> Works at only Image build process
ENV --> Used while launching a container, 
Note that, ARG defined values diappear after image creation and ENV defined values can be visible in Container at echo $ENV or ust env
EXPOSE --> Not to open the ports, Just to find on which port application works while an new user checks #docker image inspect <IMG_ID>
CMD     --> Commands in CMD will run after container creation; Only 1 CMD is valid in a Image. If multiple CMD's is given, only last one gets execute.
CMD ["executable","param1","param2"] 
We can overide the CMD 
docker build -t bhanu143chandar/devops:v5 . ping -c 5 google.com
ENTRYPOINT  --> This doesn't allow override like CMD
WORKDIR     --> All the data or files be kept in this dir, If defined.
USER        --> Used to execute all the steps defined in Image as this particular user.
