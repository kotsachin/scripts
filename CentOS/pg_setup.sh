#!/bin/bash

#if [ "$1" == "--help" ]; then
	echo ""
	echo " $ op [version]"
	echo ""
	echo " op can take these values:"
	echo ""
	echo "  get	- Get a stable release source tarball of version 9.x.x          ($ get 9.x.x )"
#	echo "  ?	- An op value for checking *currently active branch* in git     ($ ? )"
	echo "  e	- An op value for *exporting PATH* of a version                 ($ e  [9.x.x | pwd])"
	echo "  i	- An op value to *install* with specified version               ($ i  [9.x.x | pwd])"
	echo "  d	- An op value to *initdb*                                       ($ d  [9.x.x | pwd])"
	echo "  s	- An op value to *pg_ctl start*                                 ($ s  [9.x.x | pwd])"
	echo "  ss	- An op value to *pg_ctl start    for a sby*                    ($ ss [9.x.x | pwd])"
	echo "  x	- An op value to *pg_ctl stop*                                  ($ x  [9.x.x | pwd])"
	echo "  sx	- An op value to *pg_ctl stop     for a sby*                    ($ sx [9.x.x | pwd])"
	echo "  r	- An op value to *pg_ctl restart*                               ($ r  [9.x.x | pwd])"
	echo "  sr	- An op value to *pg_ctl restart  for a sby*                    ($ sr [9.x.x | pwd])"
	echo "  bs	- An op value to *build a standby* from the master              ($ bs [9.x.x | pwd])"
	echo "  ds	- An op value to *destroy the standby*                          ($ ds [9.x.x | pwd])"
#	echo "  rc	- An op value to *check relation caching status*                ($ rc )"
#	echo "        (for a running server, off course)"
	echo "  q for quit"
#	exit;
#fi

#op=$1;
read op version port

PGSRCPATH="$HOME/pg_git_source/postgres";
origdir=`pwd`;

## If we're merely here to download the tarball from ftp.postgresql.org
if [ "$op" != "get" ];	then

	### This part is about determining PostgreSQL version we'd be working with

	# what is user trying to do?
	#
	# if $version is "x.x.x", the operation is invoked from a source directory
	# other than the git repository like expanded source tarball of a stable release
	
	vernum=`echo "$version" | awk '{ n = split($1, dummy, "."); print n;}'`
	if [ "$vernum" == "3" ]; then
			version="$version"
			cd $HOME/pg_tar_files/postgresql-$version
			if [ "$?" != 0 ]; then
		 		echo "================================================================================"
				echo " Please run 'pg_version get $version' before doing whatever you're trying to do";
		 		echo "================================================================================"
				echo ""
				exit;
			fi
	
	# Else <git-stuff>
	# User means to install from the git repository which in this 
	# case is at $PGSRCPATH
	else	
		cd $PGSRCPATH;
	
		# There is no $version: That is, no explicit version specified, always assume the current
		# branch of the git repository
		if [[ -z "$version" ]]; then
			version=`git status | grep "On branch" | awk '{print substr($4,4)}'`;
			if [ "$version" == "ter" ]; then
	    		version="master";
			fi

			# op is '?': Just want to know what branch are we on in git
			if [ "$op" == "?" ]; then
				echo "Currently on '$version' in git/";
				cd $origdir;
				exit;
			fi

		# $version must be the version to choose a specific branch
		else
			# Better remember which branch we were on
			origver=`git status | grep "On branch" | awk '{print $4}'`;

			# Switch to the specified branch iff op is "i"
			if [ "$version" == "m" ]; then
				if [ "$op" == "i" ]; then git checkout master; fi;
					version="master";
				else
					if [ "$op" == "i" ]; then git checkout "pg-$version"; fi;
					version="$version";
				fi
			fi
	# </git-stuff>

	### this ends the getting of version number, etc.
	fi

else
	# before proceeding for "get" op, check if we already have requested version
	alreadyhave=`ls -l $HOME/pg_tar_files/ | grep "$version" | wc -l`
echo $version
	if [ "$alreadyhave" != 0 ]; then
		echo "Already have $version...";
		exit;
	fi

## this ends the check for "get" operations
fi

# Configure directories to work with per the version we came up with
PGINSTALLPATH="$HOME/pg_install/install/$version";
PGDATAPATH="/newdisk/pg_data/$version";
PGARCHPATH="/newdisk/pg_archive/$version";
PGSBYDATAPATH=`echo $PGDATAPATH"-sby"`;


# Already in PATH
alreadyinpath=`which postgres | grep $version | wc -l`
if [ "$alreadyinpath" == "0" ]; then
	PATH=$PGINSTALLPATH/bin:$PATH;
else
	echo "================================="
	echo " No alteration of PATH necessary"
	echo "================================="
	echo ""
fi

# Do what's been told to

case $op in

	"i") # install
		 
		 mkdir -p $PGINSTALLPATH;

		 # Clean up and build
		 {
		 if [ -f "config.status" ]; then
		 	gmake clean;
		 fi
		 CFLAGS="-g -O0" ./configure --with-libxml --enable-cassert --enable-debug --enable-profiling --prefix=$PGINSTALLPATH --with-python && \
		 gmake && gmake install;

		 cd contrib/pgbench/ && gmake && gmake install && cd -;
		 cd contrib/pageinspect/ && gmake && gmake install && cd -;
		 cd contrib/pg_stat_statements/ && gmake && gmake install && cd -;
		 cd contrib/pg_buffercache/ && gmake && gmake install && cd -;
		 cd contrib/pg_archivecleanup/ && gmake && gmake install && cd -;
		 cd contrib/pg_trgm/ && gmake && gmake install && cd -;
		 
		 # if no $version, no further action required here
		 if [[ -z $version ]]; then 
				echo 1; 
		 else 
				# when $version to was an explicitly specified version, we better switch to the original
				# branch we were on (unless we are not in the git repository)
				if [ "$vernum" != "3" ]; then 
					git checkout $origver; 
				fi; 
		 fi; } 2>&1 > /dev/null
		 ;;

	"d") # initdb
		 # Set up data directory
		 rm -r $PGDATAPATH;
		 rm -r $PGARCHPATH;
		 initdb -D $PGDATAPATH;
		 mkdir -p $PGARCHPATH
		 echo "#" >> $PGDATAPATH/postgresql.conf;
		 if [[ -z $port ]]; then 
			:; 
		 else 
			echo "port = $port" >> $PGDATAPATH/postgresql.conf; 
		 fi
		 echo "# For the sake of a non-default shared_buffers value" >> $PGDATAPATH/postgresql.conf;
		 echo "shared_buffers = 256MB" >> $PGDATAPATH/postgresql.conf;
		 echo "# Following settings (for master) to allow streaming replication business" >> $PGDATAPATH/postgresql.conf;
		 echo "wal_level = hot_standby" >> $PGDATAPATH/postgresql.conf;
		 echo "max_wal_senders = 3" >> $PGDATAPATH/postgresql.conf;
		 echo "wal_keep_segments = 3" >> $PGDATAPATH/postgresql.conf;
		 echo "archive_mode = on" >> $PGDATAPATH/postgresql.conf;
		 echo "archive_command = 'cp %p $PGARCHPATH/%f'" >> $PGDATAPATH/postgresql.conf;
		 echo "# logging" >> $PGDATAPATH/postgresql.conf;
		 echo "logging_collector = on" >> $PGDATAPATH/postgresql.conf;
		 echo "log_line_prefix = '[%p, %c, %x]: '" >> $PGDATAPATH/postgresql.conf;
		 echo "# get rid of those frequent checkpoint warnings" >> $PGDATAPATH/postgresql.conf;
		 echo "checkpoint_segments = 64" >> $PGDATAPATH/postgresql.conf;
		 echo "checkpoint_timeout = 300" >> $PGDATAPATH/postgresql.conf;
		 
		 echo "local   replication     $USER                                trust" >> $PGDATAPATH/pg_hba.conf;
		 ;;

	"s") # start server
		 if [ "$version" != "7.4" ]; then
		 	pg_ctl -wD $PGDATAPATH start;
		 else
			pg_ctl -D $PGDATAPATH start;
		 fi
		 ;;
	
	 "ss") # start a standby server
		 if [ "$version" != "7.4" ]; then
		 	pg_ctl -wD $PGSBYDATAPATH start;
		 else
			pg_ctl -D $PGSBYDATAPATH start;
		 fi
		 ;;

	"x") # stop server
		 if [ "$version" != "7.4" ]; then
		 	pg_ctl -wD $PGDATAPATH -mf stop;
		 else
			pg_ctl -D $PGDATAPATH -mf stop;
		 fi
		 ;;
	
	"sx") # stop a standby server
		 if [ "$version" != "7.4" ]; then
		 	pg_ctl -wD $PGSBYDATAPATH -mf stop;
		 else
			pg_ctl -D $PGSBYDATAPATH -mf stop;
		 fi
		 ;;

	"r") # restart server
		 if [ "$version" != "7.4" ]; then
		 	pg_ctl -wD $PGDATAPATH -mf restart;
		 else
			pg_ctl -D $PGDATAPATH -mf restart;
		 fi
		 ;;

	"sr") # restart a standby server
		 if [ "$version" != "7.4" ]; then
		 	pg_ctl -wD $PGSBYDATAPATH -mf restart;
		 else
			pg_ctl -D $PGSBYDATAPATH -mf restart;
		 fi
		 ;;

	"e") # export current path
		 echo $PGINSTALLPATH
		 export PATH=$PGINSTALLPATH/bin:$PATH
		 ;;

	"q") # export current path
          	 exit;
                 ;;
	
	"bs") # build a streaming replication standby 
		 PGSBYDATAPATH=`echo $PGDATAPATH"-sby"`
		 if [[ -z $PGSBYDATAPATH ]]; then 
		 	echo 1; 
		 else rm -rf $PGSBYDATAPATH/*; 
		 fi;
		 
		 pg_basebackup -p $port -x -D $PGSBYDATAPATH

		 echo "#" >> $PGSBYDATAPATH/postgresql.conf;
         echo "# Following settings (for standby) to allow streaming replication business" >>$PGSBYDATAPATH/postgresql.conf;
		 echo "hot_standby = on" >>$PGSBYDATAPATH/postgresql.conf;
		 echo "max_standby_archive_delay = -1"  >>$PGSBYDATAPATH/postgresql.conf;
		 echo "max_standby_streaming_delay = -1" >>$PGSBYDATAPATH/postgresql.conf;
		 echo "wal_receiver_status_interval = 10s" >>$PGSBYDATAPATH/postgresql.conf;
		 echo "hot_standby_feedback = on" >>$PGSBYDATAPATH/postgresql.conf;

		 echo "# Better change port for the standby" >>$PGSBYDATAPATH/postgresql.conf;
		 echo "port = 15433" >>$PGSBYDATAPATH/postgresql.conf;

		 echo "standby_mode = on"  >>$PGSBYDATAPATH/recovery.conf;
		 echo "primary_conninfo = 'port=$port'"  >>$PGSBYDATAPATH/recovery.conf;

		 #if [ "$version" != "7.4" ]; then
		 #	pg_ctl -wD $PGSBYDATAPATH start;
		 #else
		#	pg_ctl -D $PGSBYDATAPATH start;
		 #fi
		 ;;
	
	"ds") # destroy the standby 
		 PGSBYDATAPATH=`echo $PGDATAPATH"-sby"`
		 if [[ -z $PGSBYDATAPATH ]]; then 
		 	echo 1; 
		 else rm -rf $PGSBYDATAPATH/*; 
		 fi;
		 ;;

	"get") # Get a stable PostgreSQL tarball of the said version
		 
		 wget -P $HOME/pg_tar_files/ http://ftp.postgresql.org/pub/source/v"$version"/postgresql-"$version".tar.gz &&\
		 tar -xzf $HOME/pg_tar_files/postgresql-"$version".tar.gz -C $HOME/pg_tar_files/ 
		 ;;

	"rc") # For now, check buffer caching status for pgbench test related tables

		 echo "============================================================================================"
		 echo "Read output as follows:"
		 echo ""
		 echo "--------------------------------------------------------------------------------------------"
		 echo " Relation name"
		 echo "--------------------------------------------------------------------------------------------"
		 echo " fork   size(B)   total_pages   min_cached_pages   cached_pages   cached_size(B)   cached_perc"
		 echo ""
		 echo "============================================================================================"

		 psql -d pgbench -tc \
		 	"SELECT '$PGDATAPATH/base/' || d.oid::text || '/' || c.relfilenode::text, c.relname\
			 FROM pg_class c, pg_database d\
			 WHERE c.relname LIKE 'pgbench_%' AND d.datname='pgbench'" | \

		 tr -d " " | \
		 sed 's/|/\t/g' |\
		 grep -v "^$" | \

		 while read path relname; \
		 do \
			percent=`psql -d pgbench -tc \
				"WITH relcached(val) as\
				 	(SELECT count(*)\
					 FROM pg_class c, pg_buffercache b\
					 WHERE b.relfilenode=c.relfilenode AND c.relname = '$relname')\
				 SELECT (rc.val::float/(s.setting::int) * 100)::numeric(4,2) as percent\
				 FROM pg_settings s, relcached rc\
				 WHERE s.name = 'shared_buffers'" | tr -d " "`
			echo ""
		 	echo "--------------------------------------------------------------------------------------------"
		 	echo " "$relname" ($percent% of shared_buffers)";
		 	echo "--------------------------------------------------------------------------------------------"
		 	linux-fincore -so $path* | \
		 	grep -v "filename\|-" |\
		 	awk -v OFS="\t" \
		 	'{printf " "; gsub(/\/.*\//,"",$1); print; }' | \
		 	tr -d ","; \
		done
esac;

cd $origdir;
