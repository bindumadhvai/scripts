#cloning the application
rm -rf Java_sample_app
git clone https://github.com/bindumadhvai/Java_sample_app
cd Java_sample_app/SpringMVCSecurityXML/

#Building the application
mvn clean install >> f1.txt

#Renaming the war file
mv /var/lib/jenkins/workspace/ddd/Java_sample_app/SpringMVCSecurityXML/target/SpringMVCSecurityXML.war /var/lib/jenkins/workspace/ddd/Java_sample_app/SpringMVCSecurityXML/target/bindu.war

#Running the test.sh script to check and intsall tomcat in remote server
ssh ggk@54.244.209.186 'bash -s' -- <  /home/ubuntu/rmdp/test.sh
echo "Tomcat8 is ready to provide services in remote"

#copying the war file into remote
scp /var/lib/jenkins/workspace/ddd/Java_sample_app/SpringMVCSecurityXML/target/bindu.war ggk@54.244.209.186:/var/lib/tomcat8/webapps
echo "Deployed successfully"

#checking the application by opening the browser
#firefox 54.244.209.186:8080/bindu
exit 0
