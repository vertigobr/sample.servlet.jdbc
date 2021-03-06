
FROM vertigo/maven-ibmjava as builder
RUN mkdir -p /opt/app
COPY pom.xml /opt/app/
COPY src /opt/app/src
WORKDIR /opt/app/
RUN mvn install

FROM websphere-liberty:webProfile7
COPY --from=builder /opt/app/target/liberty/wlp/usr/servers/defaultServer /config/
COPY --from=builder /opt/app/target/liberty/wlp/usr/shared /opt/ibm/wlp/usr/shared
# Install required features if not present
RUN installUtility install --acceptLicense defaultServer
