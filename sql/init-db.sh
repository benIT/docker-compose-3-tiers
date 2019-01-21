#!/usr/bin/env bash
#some sample database insctruction to test data persistance
#todo check f not exits?
#psql -U postgres -c "create database webapp";
#psql -U postgres -d webapp -c "CREATE TABLE account(user_id serial PRIMARY KEY,username VARCHAR (50) UNIQUE NOT NULL,created_on TIMESTAMP NOT NULL);" ;
#psql -U postgres -d webapp -c "INSERT INTO account (username,created_on ) VALUES ('foo','2019-01-01') ;" ;
#psql -U postgres -d webapp -c "INSERT INTO account (username,created_on ) VALUES ('bar','2019-01-02') ;" ;

#moodle
USER_NAME=moodle
USER_PASSWORD=moodle
DATABASE_NAME=moodle
psql -U postgres -c "DROP DATABASE ${DATABASE_NAME}"
psql -U postgres -c "DROP USER ${USER_NAME}"
psql -U postgres -c "CREATE DATABASE ${DATABASE_NAME}"
psql -U postgres -c "CREATE USER ${DATABASE_NAME}"
psql -U postgres -c "alter user ${USER_NAME} with encrypted password '${USER_PASSWORD}';"
psql -U postgres -c "grant all privileges on database ${DATABASE_NAME} to ${USER_NAME} ;"
service apache2 restart
service postgresql restart