# DBMS JDBC implementation

## Pre-requisites
- Java Runtime Environment supporting Version 8 reachable on command prompt
- Configuration file `dbms.properties` on the current path
- A postgres database should be available with our schema already loaded (to do so, run the `cardealership.sql` file). Furthermore,
  to get some result from the applications the `insert.sql` file should be executed to populate the db.

## Configuration file
Applications search `dbms.properties` for connection parameters.
The parameters currently available are: `host`, `port`, `database`, `user` and `pass`.

## Compiling the applications
On the command line, execute the following command:

`javac -d build/classes/java -sourcepath src src/dbms/*.java`

## Running an application
On the command line, execute the following command:

`java -classpath build/classes/java:lib/* dbms.<application> <arguments>`

## Available applications
A detailed list of available applications can be found in [APPLICATIONS.md](APPLICATIONS.md) file.
