#!/bin/sh

# Invoke this script by passing the top level benchmark results directory as
# input. The script assumes that the tests are grouped by date, followed by the
# result directory. For example, if you have run three tests on Mar 5th, 2013,
# your results directory has the following structure
#
# <timestamp-or-name-for-march5th-group>
# 	<timestamp-or-id-for-test1>
# 	<timestamp-or-id-for-test2>
# 	<timestamp-or-id-for-test3>
#
# Under each result subdirectory, it assumes it will find a RUNCONF.txt file
# and Run1/Server1/TransactionType-1_t.png file. Any changes to that will break
# the script
#

conf_filename="run_conf.txt"
result_filename="result.txt"
transactionplot1="TransactionType-1_t.png"
transactionplot2="TransactionType-2_t.png"
transactionplot3="TransactionType-3_t.png"
transactionplot4="TransactionType-4_t.png"
transactionplot5="TransactionType-5_t.png"

transactionplot_1="TransactionType-1_r.png"
transactionplot_2="TransactionType-2_r.png"
transactionplot_3="TransactionType-3_r.png"
transactionplot_4="TransactionType-4_r.png"
transactionplot_5="TransactionType-5_r.png"
count=1;

subdirs=`ls "$1"`;
cd "$1"
echo "<html>"
echo "	<body>"
echo "		<table border=\"1\">"
for dir in $subdirs; do
	results=`ls $dir`;
	for result in $results; do
		if [ "$result" = "index.html" ]; then
			continue;
		fi
		runconf=`cat "$dir/$result/$conf_filename" | sed 's///g'`
		t_result=`cat "$dir/$result/Master/run1/$result_filename" | sed 's///g'`
		
		echo "<tr>"
		echo "<td rowspan="2">Scenario:-$count </td>"
		count=$((count+1))
		echo "<td rowspan="2"><a href=\"$dir/$result\">$result</a></td>"


		echo "<td rowspan="2">"
		echo "<table>"
		OIFS=$IFS
		IFS=$'\n';
		for confline in $runconf; do
			echo "<tr><td>$confline</td></tr>"
		done
		IFS=$OIFS
		echo "</table>"
		echo "</td>"


		echo "<td rowspan="2">"
		echo "<table>"
		OIFS=$IFS
		IFS=$'\n';
		for resultline in $t_result; do
			echo "<tr><td>$resultline</td></tr>"
		done
		IFS=$OIFS
		echo "</table>"
		echo "</td>"


		echo "<td><img src=\"$dir/$result/Master/run1/gnuPlot/$transactionplot1\" width=550px height=300px </img></td>"
#		echo "<td><img src=\"$dir/$result/Server1/Run1/gnuPlot/$transactionplot2\" width=400px height=300px </img></td>"
#		echo "<td><img src=\"$dir/$result/Server1/Run1/gnuPlot/$transactionplot3\" width=400px height=300px </img></td>"
#		echo "<td><img src=\"$dir/$result/Server1/Run1/gnuPlot/$transactionplot4\" width=400px height=300px </img></td>"
#		echo "<td><img src=\"$dir/$result/Server1/Run1/gnuPlot/$transactionplot5\" width=400px height=300px </img></td>"
		echo "</tr>"
		echo "<tr>"
#		echo "<td><img src=\"$dir/$result/Server1/Run2/gnuPlot/$transactionplot2\" width=550px height=300px </img></td>"
#		echo "<td><img src=\"$dir/$result/Server1/Run1/gnuPlot/$transactionplot_1\" width=400px height=300px </img></td>"
#		echo "<td><img src=\"$dir/$result/Server1/Run1/gnuPlot/$transactionplot_2\" width=400px height=300px </img></td>"
#		echo "<td><img src=\"$dir/$result/Server1/Run1/gnuPlot/$transactionplot_3\" width=400px height=300px </img></td>"
#		echo "<td><img src=\"$dir/$result/Server1/Run1/gnuPlot/$transactionplot_4\" width=400px height=300px </img></td>"
#		echo "<td><img src=\"$dir/$result/Server1/Run1/gnuPlot/$transactionplot_5\" width=400px height=300px </img></td>"
		echo "</tr>"
	done
done

echo "		</table>"
echo "	</body>"
echo "</html>"
