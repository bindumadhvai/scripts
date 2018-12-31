cd bindu/SpringMVCSecurityXML/ 
touch 111
#Building the application
mvn clean install >> f1.txt

#Renaming the war file
mv /var/lib/jenkins/workspace/BuildDeploy3/bindu/SpringMVCSecurityXML/target/SpringMVCSecurityXML.war /var/lib/jenkins/workspace/BuildDeploy3/bindu/SpringMVCSecurityXML/target/bindu.war

#Running the test.sh script to check and intsall tomcat in remote server
ssh ggk@ 'bash -s' -- < /var/lib/jenkins/workspace/BuildDeploy3/test.sh
echo "Tomcat8 is ready to provide services in remote"

#copying the war file into remote
scp /var/lib/jenkins/workspace/BuildDeploy3/bindu/SpringMVCSecurityXML/target/bindu.war ggk@:/var/lib/tomcat8/webapps
echo "Deployed successfully"

#checking the application by opening the browser
#firefox :8080/bindu
exit 0
