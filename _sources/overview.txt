Overview
========================

SQLite3LV is an `SQLite3 <http://sqlite.org/>`_ binding for LabVIEW™

.. image:: _images/SQLite3LV_palette.*


The bindings expose the following SQLite3 capabilities to LabVIEW™:

* Connect to an SQLite3 database using the SQLite3 api
* Execute SQL queries, including queries with ? parameters (no named parameters)
* Retrieve query results
* Backup SQLite3 databases (SQLite3 backup API)

The API includes the following features, specific to LabVIEW™

* Simple API for executing parameterized queries using property nodes
* Simple API for collecting query results using property nodes
* Perform multi-threaded operations on SQLite3 database connections using a built-in synchronization mechanism
* Automatic caching of prepared statements
* Automatic clean-up of SQLite3 resources (upon database disconnection)

The SQLite3LV library is provided in source form and as a packed library.  This project is 
licensed under the `Apache 2.0 license <http://www.apache.org/licenses/LICENSE-2.0>`_.

`SQLite3 <http://sqlite.org/>`_ is a free software library that implements a file-based database.
