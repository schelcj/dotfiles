export BIOSTAT="${HOME}/src/biostat"
export PATH=${BIOSTAT}/bin:${BIOSTAT}/sbin:${PATH}
export PERL5LIB=${BIOSTAT}/lib/perl5:$PERL5LIB

# export VDPAU_NVIDIA_NO_OVERLAY=1

export PATH=/usr/cluster/bin:/usr/cluster/sbin:$PATH

function show_logs() {
  mapper show --step cloud-align --job-logs $1 \
    |grep -v mem_p                             \
    |grep -v 'M::'                             \
    |grep -v samblaster                        \
    |grep -v 'bwa mem'                         \
    |grep -v -F '[main]'                       \
    |grep -v ': Download complete'             \
    |grep -v ': Verifying Checksum'            \
    |grep -v ': Pull complete'                 \
    |grep -v ': Pulling fs layer'              \
    |grep -v ': Waiting'

}
