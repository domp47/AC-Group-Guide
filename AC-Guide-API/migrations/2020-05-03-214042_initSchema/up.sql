CREATE TABLE "acUsers" (
  "id" SERIAL PRIMARY KEY,
  "googleId" varchar(28) NOT NULL,
  "displayName" varchar(255) NOT NULL,
  "groupId" integer,
  "roleId" integer NOT NULL
);

CREATE TABLE "acRoles" (
  "id" integer PRIMARY KEY,
  "label" varchar(255) NOT NULL
);

CREATE TABLE "groups" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(255) NOT NULL,
  "joinCode" varchar(8) NOT NULL
);

CREATE TABLE "collectableTypes" (
  "id" integer PRIMARY KEY,
  "type" varchar(255) NOT NULL
);

CREATE TABLE "collectables" (
  "id" SERIAL PRIMARY KEY,
  "displayName" varchar(255) NOT NULL,
  "imgLocation" varchar(255) NOT NULL,
  "typeId" integer NOT NULL,
  "price" integer NOT NULL,
  "spawnLocation" varchar(255),
  "northMask" integer,
  "southMask" integer,
  "northLabel" VARCHAR(255),
  "southLabel" VARCHAR(255),
  "timeMask" integer,
  "timeLabel" VARCHAR(255),
  "shadowSize" VARCHAR(32),
  "original" VARCHAR(255),
  "artist" VARCHAR(255),
  "imgLocationAlt" VARCHAR(255)
);

CREATE TABLE "collectedItems" (
  "id" SERIAL PRIMARY KEY,
  "userId" integer NOT NULL,
  "collectableId" integer NOT NULL
);

ALTER TABLE "acUsers" ADD FOREIGN KEY ("groupId") REFERENCES "groups" ("id");

ALTER TABLE "acUsers" ADD FOREIGN KEY ("roleId") REFERENCES "acRoles" ("id");

ALTER TABLE "collectables" ADD FOREIGN KEY ("typeId") REFERENCES "collectableTypes" ("id");

ALTER TABLE "collectedItems" ADD FOREIGN KEY ("userId") REFERENCES "acUsers" ("id");

ALTER TABLE "collectedItems" ADD FOREIGN KEY ("collectableId") REFERENCES "collectables" ("id");

ALTER TABLE "collectedItems" ADD UNIQUE ("userId", "collectableId");