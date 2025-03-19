#!/bin/bash

CASE_COUNTS=(964 1256)
ORS=(1.1 1.2 1.3 1.4 1.5 1.6 1.7 1.8 1.9 2.0)
SFS_FILE="sfs_files/Kryukov2009European1800.sfs"
for cases in "${CASE_COUNTS[@]}"; do
  for or in "${ORS[@]}"; do
    total=$((cases + 5000))
    
    p1=$(awk "BEGIN {printf \"%.4f\", $cases/$total}")
    
    output="outputs/power_${cases}cases_OR${or}"
    
    echo "Running analysis for $cases cases with OR = $or"
    echo "Total sample size: $total, Proportion of cases: $p1"
    
    spower LOGIT "$SFS_FILE" \
    --def_rare 0.001 \
    --moi A \
    --def_neutral -0.0001 0.0001 \
    --proportion_detrimental 1 \
    --proportion_protective 0 \
    --OR_rare_detrimental "$or" \
    --OR_common_detrimental 1 \
    --baseline_effect 0.1 \
    --sample_size "$total" \
    --p1 "$p1" \
    --limit 10 \
    --alpha 0.05 \
    --method "KBAC --name K1 --mafupper 0.001 --maflower 0 --alternative 1 --moi additive --permutations 1000 --adaptive 0.1" \
    --replicates 1000 \
    --jobs 32 \
    -o "$output"
    
    echo "Completed analysis for $cases cases with OR = $or"
    echo "-------------------------------------------------"
  done
done