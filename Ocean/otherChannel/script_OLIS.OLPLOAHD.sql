-- Drop table

-- DROP TABLE OLIS.OLPLOAHD;

CREATE TABLE OLIS.OLPLOAHD (
 "LHPOL#" CHAR(7) DEFAULT ' ' NOT NULL,
 LHTYPE CHAR(2) DEFAULT ' ' NOT NULL,
 LHCMDT NUMERIC(8,0) DEFAULT 0 NOT NULL,
 "LHLOA#" NUMERIC(10,0) DEFAULT 0 NOT NULL,
 LHACDT NUMERIC(8,0) DEFAULT 0 NOT NULL,
 "LHRCP#" NUMERIC(10,0) DEFAULT 0 NOT NULL,
 LHAMT NUMERIC(14,2) DEFAULT 0 NOT NULL,
 LHAMTC NUMERIC(14,2) DEFAULT 0 NOT NULL,
 LHCMP NUMERIC(14,2) DEFAULT 0 NOT NULL,
 LHRATE NUMERIC(4,2) DEFAULT 0 NOT NULL,
 LHTODT NUMERIC(8,0) DEFAULT 0 NOT NULL,
 "LHSTS@" CHAR(1) DEFAULT ' ' NOT NULL,
 LHCRDT NUMERIC(8,0) DEFAULT 0 NOT NULL,
 LHCRTM NUMERIC(6,0) DEFAULT 0 NOT NULL,
 LHCRUS CHAR(20) DEFAULT ' ' NOT NULL,
 LHCRPG CHAR(10) DEFAULT ' ' NOT NULL,
 LHUPDT NUMERIC(8,0) DEFAULT 0 NOT NULL,
 LHUPTM NUMERIC(6,0) DEFAULT 0 NOT NULL,
 LHUPUS CHAR(20) DEFAULT ' ' NOT NULL,
 LHUPPG CHAR(10) DEFAULT ' ' NOT NULL
);
CREATE INDEX OLLLOAH1 ON OLIS.OLPLOAHD ("LHPOL#",LHCMDT,"LHLOA#");
CREATE INDEX OLLLOAH2 ON OLIS.OLPLOAHD ("LHPOL#","LHLOA#");
CREATE INDEX OLLLOAHD ON OLIS.OLPLOAHD (LHCMDT,"LHPOL#");
CREATE INDEX OLPLOAHD ON OLIS.OLPLOAHD ("LHPOL#","LHLOA#","LHRCP#");