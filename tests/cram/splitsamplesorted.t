  $ MERGED=$TESTDIR/data/merged.dataset.xml
  $ REF=$TESTDIR/data/ecoliK12_pbi_March2013.fasta

  $ $__PBTEST_PBMM2_EXE align $MERGED $REF $CRAMTMP/split_dataset_sorted.alignmentset.xml --split-by-sample --sort

  $ [[ -f $CRAMTMP/split_dataset_sorted.3260208_188nM-GTAC_2xGCratio_LP7_100fps_15min_5kEColi_SP2p1_3uMSSB_BA243494.alignmentset.xml ]] || echo "File does not exist!"
  $ [[ -f $CRAMTMP/split_dataset_sorted.test_test.alignmentset.xml ]] || echo "File does not exist!"
  $ [[ -f $CRAMTMP/split_dataset_sorted.UCLA_1023.alignmentset.xml ]] || echo "File does not exist!"
  $ [[ -f $CRAMTMP/split_dataset_sorted.3260208_188nM-GTAC_2xGCratio_LP7_100fps_15min_5kEColi_SP2p1_3uMSSB_BA243494.bam ]] || echo "File does not exist!"
  $ [[ -f $CRAMTMP/split_dataset_sorted.test_test.bam ]] || echo "File does not exist!"
  $ [[ -f $CRAMTMP/split_dataset_sorted.UCLA_1023.bam ]] || echo "File does not exist!"
  $ [[ -f $CRAMTMP/split_dataset_sorted.3260208_188nM-GTAC_2xGCratio_LP7_100fps_15min_5kEColi_SP2p1_3uMSSB_BA243494.bam.pbi ]] || echo "File does not exist!"
  $ [[ -f $CRAMTMP/split_dataset_sorted.test_test.bam.pbi ]] || echo "File does not exist!"
  $ [[ -f $CRAMTMP/split_dataset_sorted.UCLA_1023.bam.pbi ]] || echo "File does not exist!"

  $ grep "PacBio.AlignmentFile.AlignmentBamFile" $CRAMTMP/split_dataset_sorted.3260208_188nM-GTAC_2xGCratio_LP7_100fps_15min_5kEColi_SP2p1_3uMSSB_BA243494.alignmentset.xml | tr -d '\t' | cut -f 3 -d ' ' | cut -f 2 -d '=' | tr -d '"'
  split_dataset_sorted.3260208_188nM-GTAC_2xGCratio_LP7_100fps_15min_5kEColi_SP2p1_3uMSSB_BA243494.bam
  $ grep "PacBio.AlignmentFile.AlignmentBamFile" $CRAMTMP/split_dataset_sorted.test_test.alignmentset.xml | tr -d '\t' | cut -f 3 -d ' ' | cut -f 2 -d '=' | tr -d '"'
  split_dataset_sorted.test_test.bam
  $ grep "PacBio.AlignmentFile.AlignmentBamFile" $CRAMTMP/split_dataset_sorted.UCLA_1023.alignmentset.xml | tr -d '\t' | cut -f 3 -d ' ' | cut -f 2 -d '=' | tr -d '"'
  split_dataset_sorted.UCLA_1023.bam

  $ grep -c split_dataset_sorted.3260208_188nM-GTAC_2xGCratio_LP7_100fps_15min_5kEColi_SP2p1_3uMSSB_BA243494.alignmentset.xml $CRAMTMP/split_dataset_sorted.json
  1
  $ grep -c split_dataset_sorted.test_test.alignmentset.xml $CRAMTMP/split_dataset_sorted.json
  1
  $ grep -c split_dataset_sorted.UCLA_1023.alignmentset.xml $CRAMTMP/split_dataset_sorted.json
  1

  $ ID=$(samtools view -H $CRAMTMP/split_dataset_sorted.3260208_188nM-GTAC_2xGCratio_LP7_100fps_15min_5kEColi_SP2p1_3uMSSB_BA243494.bam | grep 3260208_188nM-GTAC_2xGCratio_LP7_100fps_15min_5kEColi_SP2p1_3uMSSB_BA243494 | cut -f 2 | cut -f 2 -d ':')
  $ samtools view $CRAMTMP/split_dataset_sorted.3260208_188nM-GTAC_2xGCratio_LP7_100fps_15min_5kEColi_SP2p1_3uMSSB_BA243494.bam | grep -vc ${ID} | tr -d ' '
  0
  $ samtools view $CRAMTMP/split_dataset_sorted.3260208_188nM-GTAC_2xGCratio_LP7_100fps_15min_5kEColi_SP2p1_3uMSSB_BA243494.bam | wc -l | tr -d ' '
  9

  $ ID=$(samtools view -H $CRAMTMP/split_dataset_sorted.test_test.bam | grep test_test | cut -f 2 | cut -f 2 -d ':')
  $ samtools view $CRAMTMP/split_dataset_sorted.test_test.bam | grep -vc ${ID} | tr -d ' '
  0
  $ samtools view $CRAMTMP/split_dataset_sorted.test_test.bam | wc -l | tr -d ' '
  11

  $ ID=$(samtools view -H $CRAMTMP/split_dataset_sorted.UCLA_1023.bam | grep UCLA_1023 | cut -f 2 | cut -f 2 -d ':')
  $ samtools view $CRAMTMP/split_dataset_sorted.UCLA_1023.bam | grep -vc ${ID} | tr -d ' '
  0
  $ samtools view $CRAMTMP/split_dataset_sorted.UCLA_1023.bam | wc -l | tr -d ' '
  10
