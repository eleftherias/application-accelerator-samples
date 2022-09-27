set -ex

alias acc='java -jar ../../acc-engine/cli/target/cli-1.4.0-SNAPSHOT-exec.jar'

# Register accelerator
acc register-accelerator java-rest-service --from-location file://$(dirname $PWD)

# Generate project from accelerator
acc run --values test-values.json --output generated-project java-rest-service
cd generated-project

# Check for correct package in all Java files
find . -type f -name '*.java' -print0 |
while IFS= read -r -d '' file; do
    grep -qE 'package[[:space:]+]io.experimental.test' "$file"
done

# Check that pom.xml exists
test -f pom.xml

# Check that build.gradle does not exist
test ! -f build.gradle

# Check that the code builds
./mvnw clean verify
