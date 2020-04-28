# change directory to the docker location
echo "Running gica using docker"

# run docker:map local directory containing data to /input
# copy contents from /output directory to local directory output
sudo docker run --rm -d --name mygicapp -v /home/user/Desktop/data/example_subjects/visuomotor/:/input/ -v /home/user/Desktop/scripts/:/scripts/ -v /home/user/Desktop/groupica_app/groupica_docker/GroupICATv4.0b/:/app -v /output gica_app:v91;

sudo docker exec mygicapp /app/groupica /scripts/batch_cmd.m;

sudo docker cp $(sudo docker ps -q --filter="NAME=mygicapp"):/output /home/user/Desktop/output/;

sudo docker rm -f $(sudo docker ps -q --filter="NAME=mygicapp");

echo "Done"
