# groupica is compiled using MATLAB version R2016b. Appropriate run time libraries will be installed using the Dockerfile. Steps to run docker are as 
follows:

1. Copy or clone files from groupica_docker to host directory keeping version specific directories as it is. It is assumed that you have docker desktop or some other way to run docker.

2. Change directory to the directory where the build.sh and docker run.sh files are.

3. Run ./build.sh file at the command prompt.

4. ./run.sh file needs to be changed to map local input and output directories. In the command "sudo docker run --rm -d --name mygicapp -v /home/user/Desktop/data/example_subjects/visuomotor/:/input/ -v /home/user/Desktop/scripts/:/scripts/ -v /home/user/Desktop/groupica_app/groupica_docker/GroupICATv4.0b/:/app -v /output gica_app:v91;"
	a. Map container /input directory to the input data directory (/home/user/Desktop/data/example_subjects/visuomotor/) in the host.
	b. Map batch_cmd.m and batch_input.m location from host directory "/home/user/Desktop/scripts/" to /scripts/ directory in the container.
	c. Use /output to create output directory in the container. Map host output directory like /home/user/Desktop/output/ in the command "sudo docker cp $(sudo docker ps -q --filter="NAME=mygicapp"):/output /home/rnsk123/Desktop/output"
	d. Also make sure to map the /app directory in the container to directory where the groupica and other files are stored ("home/user/Desktop/groupica_app/groupica_docker/GroupICATv4.0b/:/app").
	e. Make sure to use /input for data directory and /output for results directory in scripts/batch_input.m file in scripts directory. Also use container path /scripts/batch_input.m for the batch_input.m in scripts/batch_cmd.m file ("sudo docker exec mygicapp /app/groupica /scripts/batch_cmd.m;");

