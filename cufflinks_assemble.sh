#!/bin/bash

MEM_LIMIT="125G" # it seems each job do not consume 10G to my observation; so set 125G shall be safe, even after increase the cores. 
 
FILE_COUNT=` find ./2mapping  -name "accepted_hits.bam"  | wc -l`
echo "FILE_COUNT=${FILE_COUNT}"

qsub -P $PROJECT -N $JOBNAME -pe omp $NCORE_REQ -l mem_total=${MEM_LIMIT} -l h_rt=${RT_LIMIT} -t 1-${FILE_COUNT}  cufflinks_assemble.qsub



