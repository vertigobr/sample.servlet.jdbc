
FROM maven as builder
RUN mkdir -p /opt/app
COPY pom.xml /opt/app/
COPY src /opt/app/src
WORKDIR /opt/app/
RUN mvn install

FROM websphere-liberty:webProfile7
COPY --from=builder /opt/app/target/liberty/wlp/usr/servers/defaultServer /config/
# Install required features if not present
RUN installUtility install --acceptLicense defaultServer
