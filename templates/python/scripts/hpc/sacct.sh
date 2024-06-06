#!/bin/bash
sacct --format=User,JobID,Jobname%50,partition,state,time,start,end,elapsed,MaxRss,MaxVMSize,nnodes,ncpus,nodelist

