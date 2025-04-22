FROM broadinstitute/gatk:4.2.6.0

## Update the cloud key??? 
##https://stackoverflow.com/questions/77385641/cli-gcloud-the-following-signatures-could-not-be-verified-because-their-public
RUN curl -O https://packages.cloud.google.com/apt/doc/apt-key.gpg \
    && apt-key add apt-key.gpg 

## install git to clone t1k zlib needs to be updated for t1k 
RUN apt-get update && apt-get install -y git zlib1g-dev

## clone t1k and compile binaries AND download the hla reference 
RUN git clone https://github.com/mourisl/T1K.git && cd T1K && make && perl t1k-build.pl -o hlaidx --download IPD-IMGT/HLA

## Now add t1k to the path 

