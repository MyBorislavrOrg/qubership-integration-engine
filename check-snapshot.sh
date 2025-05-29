#! /bin/bash
xmlstarlet sel -N x="http://maven.apache.org/POM/4.0.0" -t -v "/x:project/x:properties/x:revision[contains(., '-SNAPSHOT')]" ./pom.xml || echo ""

echo $?
IS_SNAPSHOT=$(xmlstarlet sel -N x="http://maven.apache.org/POM/4.0.0" -t -v "/x:project/x:properties/x:revision[contains(., '-SNAPSHOT')]" ./pom.xml || echo "")
echo "IS_SNAPSHOT: ${IS_SNAPSHOT}"
if [[ "${IS_SNAPSHOT}" == "" ]]
then
echo "❗ The project/properties/revision in the pom.xml has no '-SNAPSHOT' postfix."
echo "Workflow fail. Please add '-SNAPSHOT' to the revision."
exit 1
else
echo "✅ The project/properties/revision in the pom.xml has '-SNAPSHOT' postfix: ${IS_SNAPSHOT}"
fi
