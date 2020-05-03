CREATE TABLE "acUsers" (
  "id" SERIAL PRIMARY KEY,
  "googleId" varchar(28),
  "displayName" varchar(255),
  "groupId" integer,
  "roleId" integer
);

CREATE TABLE "acRoles" (
  "id" integer PRIMARY KEY,
  "label" varchar(255)
);

CREATE TABLE "groups" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(255),
  "joinCode" varchar(8)
);

CREATE TABLE "collectableTypes" (
  "id" integer PRIMARY KEY,
  "type" varchar(255)
);

CREATE TABLE "collectables" (
  "id" SERIAL PRIMARY KEY,
  "displayName" varchar(255),
  "imgLocation" varchar(255),
  "typeId" integer,
  "spawnLocation" varchar(255),
  "northMask" integer,
  "southMask" integer,
  "northLabel" VARCHAR(255),
  "southLabel" VARCHAR(255),
  "timeMask" integer,
  "timeLabel" VARCHAR(255),
  "shadowSize" VARCHAR(32),
  "orgiginal" VARCHAR(255),
  "artist" VARCHAR(255),
  "imgLocationAlt" VARCHAR(255)
);

CREATE TABLE "collectedItems" (
  "id" SERIAL PRIMARY KEY,
  "userId" integer,
  "collectableId" integer
);

ALTER TABLE "acUsers" ADD FOREIGN KEY ("groupId") REFERENCES "groups" ("id");

ALTER TABLE "acUsers" ADD FOREIGN KEY ("roleId") REFERENCES "acRoles" ("id");

ALTER TABLE "collectables" ADD FOREIGN KEY ("typeId") REFERENCES "collectableTypes" ("id");

ALTER TABLE "collectedItems" ADD FOREIGN KEY ("userId") REFERENCES "acUsers" ("id");

ALTER TABLE "collectedItems" ADD FOREIGN KEY ("collectableId") REFERENCES "collectables" ("id");

ALTER TABLE "collectedItems" ADD UNIQUE ("userId", "collectableId");