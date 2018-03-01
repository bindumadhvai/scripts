#ssh -T ggk@54.244.209.186
#checking fot tomcat8 installation
service tomcat8 status | grep "loaded" > f1.txt
if [ -s f1.txt ]
then
     rm -f f1.txt
     service tomcat8 status | grep "dead" > f1.txt
     if [ -s f1.txt ]
     then   
           echo "restarting the tomcat8 service"
            sudo service tomcat8 restart > f1.txt
     fi
else
     echo "installing"
     apt-get -y install tomcat8
fi
rm -f f1.txt 
echo "tomcat is ready to provide service"
