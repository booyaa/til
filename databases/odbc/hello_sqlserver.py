#!/usr/bin/env python

# Assumes a windows installation with integration authentication
# otherwise, you'll need a sql user account.
#
# Use the driver names in ODBC Admininstrator under the Drivers tab
#
# You can only use the drivers install for your bitness i.e. 32-bit
# drivers with 32-bit python.
import pyodbc

cnxn = pyodbc.connect("DRIVER={SQL Server Native Client 11.0};SERVER=sqlserver;DATABASE=master")
cursor = cnxn.cursor()
cursor.execute("select top 5 table_schema, table_name from INFORMATION_SCHEMA.TABLES")
while True:
    row=cursor.fetchone()
    if not row:
        break
    print("schema:{}- name:{}...".format(row[0], row[1][:20]))
