
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
        CertificateArn=arn:aws:acm:ca-central-1:879709723808:certificate/f02502df-9bb2-47de-841c-40dcf08c7de0 \
        CertificateDomainName=teamcity.dev.fernandoespinosa.org \
    --capabilities=CAPABILITY_IAM \
    --profile=aws-development \
    --region=ca-central-1