#!/bin/bash

clear
mvn validate
mvn clean install -DskipTests=true
