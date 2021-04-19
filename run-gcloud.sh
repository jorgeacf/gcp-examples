#!/bin/bash

#   docker run --rm -it \
#   				-v "${HOME}/dev:/root/dev" \
#                   -v "${HOME}/.gcloud:/root/.config/gcloud" \
#                   -v "${HOME}/.ssh:/root/.ssh:ro" \
#                   -v "$(command -v docker):/usr/bin/docker" \
#                   -v /var/run/docker.sock:/var/run/docker.sock \
#                   --name gcloud \
#                   google/cloud-sdk:latest "$@"

export GOOGLE_APPLICATION_CREDENTIALS='/root/.config/gcloud/sa/dataflow-sa.json'

PROJECT_ID='gcp-terraform-teamplates'
STORAGE_BUCKET='test-bucket-random-000000'
REGION='us-central1'

# mvn -Pdataflow-runner compile exec:java \
#       -Dexec.mainClass=org.apache.beam.examples.WordCount \
#       -Dexec.args="--project=${PROJECT_ID} \
#       --gcpTempLocation=gs://${STORAGE_BUCKET}/temp/ \
#       --output=gs://${STORAGE_BUCKET}/output \
#       --runner=DataflowRunner \
#       --region=${REGION}"


java -cp target/word-count-beam-bundled-0.1.jar \
		org.apache.beam.examples.WordCount \
		--project=${PROJECT_ID} \
       	--gcpTempLocation=gs://${STORAGE_BUCKET}/temp/ \
       	--output=gs://${STORAGE_BUCKET}/output \
       	--runner=DataflowRunner \
       	--region=${REGION}