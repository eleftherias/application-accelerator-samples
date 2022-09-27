alias acc='java -jar acc-engine/cli/target/cli-1.4.0-SNAPSHOT-exec.jar'

git clone git@github.com:pivotal/acc-engine.git

cd acc-engine/cli
./build.sh

cd - 

acc register-fragment java-version --from-location file://$PWD/fragments/java-version
acc register-fragment live-update --from-location file://$PWD/fragments/live-update
acc register-fragment spring-boot-postgresql --from-location file://$PWD/fragments/spring-boot-postgresql
acc register-fragment tap-workload --from-location file://$PWD/fragments/tap-workload