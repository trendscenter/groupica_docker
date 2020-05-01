echo "Building gica image"
wget https://trendscenter.org/trends/software/gift/software/stand_alone/gica_linux_may_1_2020.zip;
sleep 10;
unzip gica_linux_may_1_2020.zip; 
chmod +x ./groupica;
rm gica_linux_may_1_2020.zip;
sudo docker image build -t gica_app:v91 .;
echo "Done"
