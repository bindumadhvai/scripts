cd SpringMVCSecurityXML/

#Building the application
mvn clean install >> f1.txt

#Renaming the war file
mv /var/lib/jenkins/workspace/BuildDeploy3/SpringMVCSecurityXML/target/SpringMVCSecurityXML.war /var/lib/jenkins/workspace/BuildDeploy3/SpringMVCSecurityXML/target/bindu.war

#Running the test.sh script to check and intsall tomcat in remote server
ssh ggk@54.244.209.186 'bash -s' -- < /var/lib/jenkins/workspace/BuildDeploy3/test.sh
echo "Tomcat8 is ready to provide services in remote"

#copying the war file into remote
scp /var/lib/jenkins/workspace/BuildDeploy3/SpringMVCSecurityXML/target/bindu.war ggk@54.244.209.186:/var/lib/tomcat8/webapps
echo "Deployed successfully"

#checking the application by opening the browser
#firefox 54.244.209.186:8080/bindu
exit 0
