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
CREATE TYPE "phone" AS ENUM ('landline', 'mobile');

CREATE TABLE "customerPhones"{
    id SERIAL NOT NULL PRIMARY KEY,
    "customerId" INTEGER REFERENCES customers(id),
    number  TEXT NOT NULL,
    type "phone" NOT NULL
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
 
 --5
CREATE TABLE  customers (
	id SERIAL NOT NULL PRIMARY KEY,
	"fullName" TEXT NOT NULL,
	cpf VARCHAR(11) NOT NULL UNIQUE,
	email TEXT NOT NULL UNIQUE,
	password TEXT NOT NULL
);

--6
CREATE TABLE "bankAccount" (
	id SERIAL NOT NULL PRIMARY KEY,
	"customerId" INTEGER NOT NULL REFERENCES customers(id),
	"accountNumber" TEXT NOT NULL UNIQUE,
	"agency" TEXT NOT NULL,
	"openDate" DATE NOT NULL DEFAULT NOW(),
	"closeDate" timestamp NOT NULL DEFAULT NOW()
);

--7
CREATE TYPE "transaction" AS ENUM ('deposit', 'withdraw'); 

CREATE TABLE transactions (
	id SERIAL NOT NULL PRIMARY KEY,
	"bankAccountId"	INTEGER NOT NULL REFERENCES "bankAccount"(id),
	amount INTEGER NOT NULL,
	type "transaction" NOT NULL,
	"time" TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW(),
	description TEXT NOT NULL,
	cancelled BOOLEAN NOT NULL DEFAULT false
);

--8
CREATE TABLE "creditCards" (
	id SERIAL NOT NULL PRIMARY KEY,
	"bankAccountId"	INTEGER NOT NULL REFERENCES "bankAccount"(id),
	name TEXT NOT NULL,
	number TEXT NOT NULL UNIQUE,
	"securityCode" TEXT NOT NULL,
	"expirationMonth" INTEGER NOT NULL,
	"expirationYear" INTEGER NOT NULL,
	password TEXT NOT NULL,
	"limit" INTEGER 
);