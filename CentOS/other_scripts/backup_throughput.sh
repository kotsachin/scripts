#!/bin/bash


for file in Result/benchmark/*/*/run1/bkp_result*
do
{
	fwp=$(basename $file)
        img=${fwp%.*}

        path=`dirname $file`
        fo=${path%/*}
        f=${fo%/*}
	#echo $fwp

	star=`cat $file | sed -n 1p |  awk '{ print $6}' | cut -c 12-19 | sed  's/-/:/g'`
	#echo `date -d "1970-01-01 $star UTC $star seconds" +"%H:%M:%S"`
	#star=$((star + 6))
	#echo $star
	end=`cat $file | sed -n 2p |  awk '{ print $6}' | cut -c 12-19 | sed  's/-/:/g'`
	
	st=`cat $f/Master/run1/jdbcRunnerLogs/jdbcrunner.log | grep "$star" | awk '{ if($3 != "[WARN"){print $6} }'`
	nd=`cat $f/Master/run1/jdbcRunnerLogs/jdbcrunner.log | grep "$end" | awk '{ if($3 != "[WARN"){print $6} }'`

	#echo $st
	#echo $nd
	#echo " "

	cat $f/Master/run1/gnuInput/*_t.dat | awk \
			-v ts=$st -v val=0 -v val1=0 -v end=$nd \
                        'BEGIN{ORS="";} {if( ($1>ts) && ($1<end) ){ i=1; while(i<=NF) {print $i," "; i=i+1; } print "\n";} }' \
                        > $fo/run1/gnuInput/bkp.dat

}
done


for file in ./Result/benchmark/*/*/run1/gnuInput/bkp.dat
        do
                path=`dirname $file`
                fo=${path%/*}
		f=${fo%/*}
 awk \
'{tx1+=$2; tx2+=$3; tx3+=$4; tx4+=$5; tx5+=$6; } \
END { print "========Throughput During Backup:-============\n tx1: "tx1/NR "\n","tx2: "tx2/NR "\n","tx3: "tx3/NR "\n","tx4: "tx4/NR "\n","tx5: "tx5/NR "\n" }'  $file > $fo/bkp_avg_result.txt



done



for file in Result/benchmark/*/*/run2/bkp_result*
do
{
	fwp=$(basename $file)
        img=${fwp%.*}

        path=`dirname $file`
        fo=${path%/*}
        f=${fo%/*}
	#echo $fwp

	star=`cat $file | sed -n 1p |  awk '{ print $6}' | cut -c 12-19 | sed  's/-/:/g'`
	#echo `date -d "1970-01-01 $star UTC $star seconds" +"%H:%M:%S"`
	#star=$((star + 6))
	#echo $star
	end=`cat $file | sed -n 2p |  awk '{ print $6}' | cut -c 12-19 | sed  's/-/:/g'`
	
	st=`cat $f/Master/run2/jdbcRunnerLogs/jdbcrunner.log | grep "$star" | awk '{ if($3 != "[WARN"){print $6} }'`
	nd=`cat $f/Master/run2/jdbcRunnerLogs/jdbcrunner.log | grep "$end" | awk '{ if($3 != "[WARN"){print $6} }'`

	#echo $st
	#echo $nd
	#echo " "

	cat $f/Master/run2/gnuInput/*_t.dat | awk \
			-v ts=$st -v val=0 -v val1=0 -v end=$nd \
                        'BEGIN{ORS="";} {if( ($1>ts) && ($1<end) ){ i=1; while(i<=NF) {print $i," "; i=i+1; } print "\n";} }' \
                        > $fo/run2/gnuInput/bkp.dat

}
done


for file in ./Result/benchmark/*/*/run2/gnuInput/bkp.dat
        do
                path=`dirname $file`
                fo=${path%/*}
		f=${fo%/*}
 awk \
'{tx1+=$2; tx2+=$3; tx3+=$4; tx4+=$5; tx5+=$6; } \
END { print "========Throughput During Backup:-============\n tx1: "tx1/NR "\n","tx2: "tx2/NR "\n","tx3: "tx3/NR "\n","tx4: "tx4/NR "\n","tx5: "tx5/NR "\n" }'  $file > $fo/bkp_avg_result.txt



done



for file in Result/benchmark/*/*/run3/bkp_result*
do
{
	fwp=$(basename $file)
        img=${fwp%.*}

        path=`dirname $file`
        fo=${path%/*}
        f=${fo%/*}
	#echo $fwp

	star=`cat $file | sed -n 1p |  awk '{ print $6}' | cut -c 12-19 | sed  's/-/:/g'`
	#echo `date -d "1970-01-01 $star UTC $star seconds" +"%H:%M:%S"`
	#star=$((star + 6))
	#echo $star
	end=`cat $file | sed -n 2p |  awk '{ print $6}' | cut -c 12-19 | sed  's/-/:/g'`
	
	st=`cat $f/Master/run3/jdbcRunnerLogs/jdbcrunner.log | grep "$star" | awk '{ if($3 != "[WARN"){print $6} }'`
	nd=`cat $f/Master/run3/jdbcRunnerLogs/jdbcrunner.log | grep "$end" | awk '{ if($3 != "[WARN"){print $6} }'`

	#echo $st
	#echo $nd
	#echo " "

	cat $f/Master/run3/gnuInput/*_t.dat | awk \
			-v ts=$st -v val=0 -v val1=0 -v end=$nd \
                        'BEGIN{ORS="";} {if( ($1>ts) && ($1<end) ){ i=1; while(i<=NF) {print $i," "; i=i+1; } print "\n";} }' \
                        > $fo/run3/gnuInput/bkp.dat

}
done


for file in ./Result/benchmark/*/*/run3/gnuInput/bkp.dat
        do
                path=`dirname $file`
                fo=${path%/*}
		f=${fo%/*}
 awk \
'{tx1+=$2; tx2+=$3; tx3+=$4; tx4+=$5; tx5+=$6; } \
END { print "========Throughput During Backup:-============\n tx1: "tx1/NR "\n","tx2: "tx2/NR "\n","tx3: "tx3/NR "\n","tx4: "tx4/NR "\n","tx5: "tx5/NR "\n" }'  $file > $fo/bkp_avg_result.txt



done


