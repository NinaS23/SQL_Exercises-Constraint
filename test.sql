CREATE DATABASE  magicbanck;

-- 1
CREATE TABLE states {
    id SERIAL NOT NULL PRIMARY KEY,
	name TEXT NOT NULL  UNIQUE
};

--2
CREATE TABLE cities {
 id SERIAL NOT NULL PRIMARY KEY,
 name  TEXT NOT NULL,
 "stateId" INTEGER REFERENCES states(id)
};

--3
CREATE TABLE "customerPhones"{
 id SERIAL NOT NULL PRIMARY KEY
 "customerId" INTEGER REFERENCES customers(id)
 number  NUMERIC NOT NULL
 type VARCHAR (15) NOT NULL
};

--4
CREATE TABLE "customerAddresses" (
	id SERIAL NOT NULL PRIMARY KEY,
	"customerId" INTEGER NOT NULL  REFERENCES customers(id),
	street TEXT NOT NULL,
	number TEXT NOT NULL,
	complement TEXT,
	"postalCode" TEXT NOT NULL,
	"cityId" INTEGER NOT NULL REFERENCES cities(id)
);
