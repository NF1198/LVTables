Cursor Palette
===================================
.. figure:: _images/SQLite3LV_cursor_palette.*

.. index:: execute, statement, binding
   
Execute Statement
************************************
.. figure:: _images/SQLite3LV_lvlib_cursor_lvclass_Exceute_Statementc.*

Executes a single SQL statement terminated by a semicolon (;).

If multiple statements are included in the SQL statement input, only the first statement will be executed.

The statement may contain unnamed parameters and may return query results.

|CursorC| **SQLite3LV Cursor in/out**
	A valid SQLite3LV cursor
	
|STRINGC| **SQL statement**
	A valid SQL statement. Only the first statement found in the string will be executed.
	The statement may contain indexed parameters. Parameters are specified by a question mark (?).
	Refer to the SQLite3 documentation `Binding Values to Prepared Statements <https://www.sqlite.org/c3ref/bind_blob.html>`_
	article for more information on parameter binding syntax. Named parameters can only be accessed
	by index and the binding API is not aware of named parameters.
	
	Values may be bound after executing this VI using property node binding.

Examples of valid SQL Statements:
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

``SELECT `LastName` from `Persons`;``

Returns zero or more results of type string. Use "Column String" property, followed by the "Rows Finished?" property to retrieve results.

``SELECT `LastName` from `Persons` WHERE `LastName` GLOB ?``

Returns zero or more results of type string. One string-typed query parameter. Use the "Bind String" property node after executing the query to bind the parameter. Use the "Column String" and "Rows Finished?" property to retrieve results.

``SELECT ? + ?;``

Returns a single result of arbitrary type. Accepts two parameters of arbitrary type. Use the "Bind DBL" two bind two input parameters. Use the "Column DBL" to retrieve the query result.

	
.. index:: property node, binding
   
Property Node Binding
************************************
.. figure:: _images/Cursor_property_node.*

A property node may be used to bind values into an SQL statement that utilizes
parameter binding. The statement will be automatically executed after the Nth expected value 
is bound. Supported types are ``Blob``, ``Double``, ``I32``, ``I64``, and ``Text``. ``Blob`` data is bound as raw bytes
while ``Text`` data is bound as UTF-8 character data.

If fewer than expected values are bound, the statement will not be executed.

If more than expected values are bound, the extra values are ignored.

Example of property node binding
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
.. figure:: _images/Cursor_property_node_02.*
	:alt: Example of binding text and a double value into a statement.

.. index:: property node, query
	
Property Node Query Results
***************************************
.. figure:: _images/Cursor_property_node_03.*
	:alt: Column data property nodes
.. figure:: _images/Cursor_property_node_RowsFinished.*
	:alt: The **Rows Finished?** property node returns TRUE when there are no more rows of data in the query result. 
.. figure:: _images/Cursor_property_node_ColumnCount.*
	:alt: The **Column Count** property node returns the number of columns in the query result.

A property node may be used to retrieve values from a query. Values are extracted
in the order defined by the property node. Client code is responsible for ensuring
that the number of columns extracted matches the number of columns returned by the query.

Query results may be extracted as ``Blob``, ``Double``, ``I32``, ``I64``, or ``Text``. 
``Blob`` data is returned as raw bytes. ``Text`` data is returned as a UTF-8 string. 

A special boolean property **Rows Finished?** will return TRUE if the query is finished 
and no further data is available in the query result.

The **Column Count** property can be used to determine the number of columns of data in the query result.

Example of property node query extraction
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The following example demonstrates how to retrieve results from a query.

A shift-register (|CURSORSHIFT|) is used to maintain cursor state within the while loop. 

.. figure:: _images/Cursor_property_node_04.*
	:alt: Example of retrieving results from a query
	
.. index:: fetch
   
Fetch N Results
**************************************
.. figure:: _images/SQLite3LV_lvlib_cursor_lvclass_Fetch_Nc.*
.. figure:: _images/SQLite3LV_lvlib_cursor_lvclass_Fetch_N_instances.*

Use this VI to extract N rows of identically typed data from a query result.
Manually select the polymorphic instance of the VI to use.

|CursorC| **SQlite3LV Cursor in/out**
	A valid SQLite3 cursor
	
|I32C| **n rows**
	Number of rows to read (default is all rows, -1).
	
|STRING2DI| **result**
	Query result (type depends on polymorphic instance)
	
|BOOLI| **finished?**
	Returns TRUE if all rows have been read from the query result.
	
.. index:: lock	

Get Lock
******************************************
.. figure:: _images/SQLite3LV_lvlib_sqlite3_lvclass_Get_Lockc.*

Returns a memory reference that can be used as a lock for the database connection.
The contents of the memory reference are un-used (zero). Refer to the multithreading 
topic for further information.

The **SQLite3LV::Get Lock** VI will return the same lock for a given database connection.
Either method may be used to obtain a lock for a database connection.

The following code snippet demonstrates how to use a database connection lock.

.. figure:: _images/SQLite3_lock_example.*
	:alt: example of how to use a database lock

Cursor Utilities Palette
===================================
.. figure:: _images/SQLite3LV_cursor_utilities_palette.*

.. index:: utility

Table Info
*****************
.. figure:: _images/SQLite3LV_lvlib_cursor_lvclass_Table_Infoc.*

Returns information about the specified table. 

This VI is equivalent to executing ``PRAGMA table_info(table-name)`` 
and formatting the results into an array of clusters.

|CursorC| **SQlite3LV Cursor in/out**
	A valid SQLite3 cursor
	
|STRINGC| **table**
	Name of the table about which to retrieve information
	
|CLUSTI| **table info**
	Information about the columns in the specified table
	
Table Exists?
************************
.. figure:: _images/SQLite3LV_lvlib_cursor_lvclass_Table_Existsc.*

Returns TRUE if the specified table exists in the database.

This subVI is equivalent to the following SQL query::

	SELECT COUNT(name) FROM sqlite_master WHERE type='table' AND name = ?;

|CursorC| **SQlite3LV Cursor in/out**
	A valid SQLite3 cursor

|STRINGC| **table**
	Name of the table to check
	
|BOOLI| **exists?**
	TRUE if the specified table exists

.. |CURSORSHIFT| image:: _images/cursor_shift_register.*
.. |U81DI| image:: _images/i1du8.*
.. |STRING2DI| image:: _images/i2dstr.*
.. |I32C| image:: _images/ci32.*
.. |I32I| image:: _images/ii32.*	
.. |U32MEMREFI| image:: _images/idatavalref.*
.. |EVENTU8C| image:: _images/cusereventrn.*
.. |CLUSTC| image:: _images/ccclst.*
.. |CLUSTI| image:: _images/icclst.*
.. |U32C| image:: _images/cu32.*
.. |STRINGC| image:: _images/cstr.*
.. |BOOLI| image:: _images/ibool.*
.. |SQLite3LVI| image:: _images/iSQLite3LV.*
.. |SQLite3LVC| image:: _images/cSQLite3LV.*
.. |CursorI| image:: _images/iCursor.*
.. |CursorC| image:: _images/cCursor.*
