
cd $(dirname $0)

aws cloudformation deploy \
    --stack-name=TeamCity \
    --template-file=TeamCity.template.yaml \
    --parameter-overrides \
        TeamCityVersion=latest \
        InternetFacingStack=true \
        DBPassword=${TEAMCITY_DB_PASSWORD} \
        ServerContainerCpu=2048 \
        AgentInstanceType=t3.large \
        AgentContainerCpu=2048 \
        AgentContainerMemory=7500 \
        AgentNumber=0 \
        CertificateArn=arn:aws:acm:us-east-1:879709723808:certificate/3bfd5aa8-b81b-4209-bab1-ba6ae13cf8ae \
        CertificateDomainName=teamcity.dev.fernandoespinosa.org \
    --capabilities=CAPABILITY_IAM \
    --profile=aws-development \
    --region=us-east-1