#
# sample_csv.ctl -- Control file to load CSV input data
#
#    Copyright (c) 2007-2011, NIPPON TELEGRAPH AND TELEPHONE CORPORATION
#
OUTPUT = cust                   # [<schema_name>.]table_name
INPUT = /mnt/vbox_share/us-500/us-500.csv  # Input data location (absolute path)
TYPE = CSV                            # Input file type
QUOTE = "\""                          # Quoting character
ESCAPE = \                            # Escape character for Quoting
DELIMITER = ","                       # Delimiter
ENCODING = SQL_ASCII
#LOADER = DIRECT
#LOADER = PARALLEL
#FILTER = sql_filter
#FILTER = c_filter 
