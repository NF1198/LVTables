SQLite3 Palette
========================

.. figure:: _images/SQLite3LV_palette.*
	:alt: The SQLite3LV top-level palette
	
.. index::
   single: connect
   
Connect
*************************
.. figure:: _images/SQLite3LV_lvlib_sqlite3_lvclass_Connectc.*

Opens a connection to an SQLite3 database. The database connection has behavior 
similar to a reference in LabVIEW, i.e. the connection can be passed as if it were
a reference.

The path should be a valid resource. The default path is to open an in-memory database.

The SQLITE3 Open Flags must be a valid combination of open flags. Incorrect open flags will likely result in SQLITE3 error 21 (library misuse).

Refer to the `sqlite3_open_v2() <https://www.sqlite.org/c3ref/open.html>`_ documentation for details.

|STRINGC| **path**
	Path to an SQLite3 database
	
	**:memory:** will create and open an in-memory database

|U32C| **SQLITE3 open flags**
	Flags to apply when opening the database.

	Flags may be combined using the OR primitive. For example,
	
.. image:: _images/SQLite3LV_lvlib_sqlite3_lvclass_Connectc_options.*
	
|SQLite3LVI| **SQLite3LV Connection out**
	A new SQLite3LV connection
	
	The new connection will be invalid if there was an error opening the database connection.

.. index::
   single: disconnect
   
Disconnect
***************************
.. figure:: _images/SQLite3LV_lvlib_sqlite3_lvclass_Disconnectc.*

Disconnects and releases all resources related to an SQLite3LV database connection.

Failure to disconnect from a database connection can cause a memory leak can will cause the 
database file to remain locked until the current application instance is closed.

It is possbile that the disconnection fails and an error is returned. In this case, 
appropriate error handling code should be implemented to prevent leaking the database connection.

Using this subVI on an invalid connection is a no-op.

|SQLite3LVC| **SQLite3LV Connection in**
	The database connection to close.

.. index::
   single: cursor
	
Get Cursor
***************************
.. figure:: _images/SQLite3LV_lvlib_sqlite3_lvclass_Get_Cursorc.*

Returns a cursor for the specified database connection. The cursor data behaves
like a cluster in LabVIEW, e.g. if used in a loop a shift register must be used
to maintain the state of the cursor.

The cursor does not need to be released or closed.

|SQLite3LVC| **SQLite3LV Connection in/out**
	The database connection
	
|CursorI| **SQLite3LV Cursor**
	A new database cursor. The cursor may be used to execute queries using the parent
	database connection.

.. index::
   single: backup
	
Backup Database
******************************
.. figure:: _images/SQLite3LV_lvlib_sqlite3_lvclass_Backup_Databasec.*

Initiates a backup from one active database connection to another. A second active 
database connection must be supplied to this function.

Refer to the `SQLite3 backup API documentation <https://www.sqlite.org/backup.html>`_ 
for more information regarding backing up databases.

This VI may be used to backup an in-memory database to a disk-based database.

The database IDs input controls the name of the source and destination database (default is MAIN)

Progress notifications will be posted to the optionally supplied U8-typed user event. 
Progress is reported as values ranging from 0 to 100.

The destination database is automatically locked for the duration of the backup 
operation.

The source database may be locked and unlocked multiple times during the backup 
operation so that other threads may use the source database connection while the 
backup operation is in progress.

|SQLite3LVC| **SQLite3LV Connection src in/out**
	The source database connection
	
|SQLite3LVC| **SQLite3LV Connection dst in/out**
	The destination database connection. *This connection will remain locked
	throughout the backup operation.*
	
|CLUSTC| **database IDs** (optional)
	Names of the source and destination database. Defaults to "MAIN".
	
|EVENTU8C| **progress event** (optional)
	A U8-typed event reference. Backup progress will be periodically posted to this 
	event. Use a LabVIEW event structure to capture progress notifications.
	
	Progress vaules range from 0 - 100.
	
.. index::
   single: lock
	
Get Lock
******************************************
.. figure:: _images/SQLite3LV_lvlib_sqlite3_lvclass_Get_Lockc.*

Returns a memory reference that can be used as a lock for the database connection.
The contents of the memory reference are un-used (zero). Refer to the multithreading 
topic for further information.

The **Cursor::Get Lock** VI will return the same lock for a given database connection.
Either method may be used to obtain a lock for a database connection.

The following code snippet demonstrates how to use a database connection lock.

.. figure:: _images/SQLite3_lock_example.*
	:alt: example of how to use a database lock
	
SQLite3 Utilities Palette
======================================
.. figure:: _images/SQLite3LV_utilities_palette.*

.. index::
   single: glob

Match GLOB
**********************
.. figure:: _images/SQLite3LV_lvlib_sqlite3_lvclass_Match_GLOBc.*

This VI can be used to apply the SQLite3 GLOB matching function to an arbitrary
pair of strings. GLOB matching is case-sensitive.

|STRINGC| **string**
	String to test
	
|STRINGC| **GLOB**
	GLOB pattern to use.  
	
	For example, the GLOB "``ca*``" matchs ``cat``, ``car``, and ``cake``, but doesn't match ``CAT``.
	
|BOOLI| **match?**
	Returns TRUE if the glob matches.

.. index::
   single: strings
	
String Compare (case in-sensitive)
*******************************************
.. figure:: _images/SQLite3LV_lvlib_sqlite3_lvclass_String_Compare_(case_insensitive)c.*

This VI can be used to compare two strings using the SQLite3 API case in-sensitive 
string comparison function.

|STRINGC| **string A**
	String to test
	
|STRINGC| **string B**
	String to test
	
|I32I| **result**
	Result of the string comparison.
	
	positive if A > B
	
	zero if A == B
	
.. index::
   single: random
	
Randomness
****************************************
.. figure:: _images/SQLite3LV_lvlib_sqlite3_lvclass_Randomnessc.*

Generates random bytes using the pseudo-random number generator in the SQLite3 API.
Refer to the `SQLite3 API documentation <https://www.sqlite.org/c3ref/randomness.html>`_ for details.

|I32C| **nbytes** 
	number of bytes of pseudo-random data to generate
	
|U81DI| **random bytes**
	result containing pseudo-random data
	

.. |U81DI| image:: _images/i1du8.*
.. |I32C| image:: _images/ci32.*
.. |I32I| image:: _images/ii32.*	
.. |U32MEMREFI| image:: _images/idatavalref.*
.. |EVENTU8C| image:: _images/cusereventrn.*
.. |CLUSTC| image:: _images/ccclst.*
.. |U32C| image:: _images/cu32.*
.. |STRINGC| image:: _images/cstr.*
.. |BOOLI| image:: _images/ibool.*
.. |SQLite3LVI| image:: _images/iSQLite3LV.*
.. |SQLite3LVC| image:: _images/cSQLite3LV.*
.. |CursorI| image:: _images/iCursor.*
.. |CursorC| image:: _images/cCursor.*

