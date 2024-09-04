CREATE TABLE IF NOT EXISTS "Name" (
	"fips" varchar(4) NOT NULL,
	"name" varchar(100) NOT NULL UNIQUE,
	PRIMARY KEY ("fips")
);

CREATE TABLE IF NOT EXISTS "Income" (
	"fips" varchar(4) NOT NULL,
	"integer" bigint NOT NULL,
	PRIMARY KEY ("fips", "integer")
);

CREATE TABLE IF NOT EXISTS "Population" (
	"fips" varchar(4) NOT NULL,
	"pop" bigint NOT NULL,
	"year" bigint NOT NULL,
	PRIMARY KEY ("fips", "year")
);


ALTER TABLE "Income" ADD CONSTRAINT "Income_fk0" FOREIGN KEY ("fips") REFERENCES "Name"("fips");
ALTER TABLE "Population" ADD CONSTRAINT "Population_fk0" FOREIGN KEY ("fips") REFERENCES "Name"("fips");
