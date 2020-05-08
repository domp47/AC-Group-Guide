CREATE TABLE "ac_users" (
  "google_id" varchar(28) PRIMARY KEY,
  "display_name" varchar(255) NOT NULL,
  "group_id" integer,
  "role_id" integer
);

CREATE TABLE "ac_roles" (
  "id" integer PRIMARY KEY,
  "label" varchar(255) NOT NULL
);

CREATE TABLE "groups" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(255) NOT NULL,
  "join_code" varchar(10) NOT NULL UNIQUE
);

CREATE TABLE "collectable_types" (
  "id" integer PRIMARY KEY,
  "type" varchar(255) NOT NULL
);

CREATE TABLE "collectables" (
  "id" SERIAL PRIMARY KEY,
  "display_name" varchar(255) NOT NULL,
  "img_location" varchar(255) NOT NULL,
  "type_id" integer NOT NULL,
  "price" integer NOT NULL,
  "spawn_location" varchar(255),
  "north_mask" integer,
  "south_mask" integer,
  "north_label" VARCHAR(255),
  "south_label" VARCHAR(255),
  "time_mask" integer,
  "time_label" VARCHAR(255),
  "shadow_size" VARCHAR(32),
  "original" VARCHAR(255),
  "artist" VARCHAR(255),
  "img_location_alt" VARCHAR(255)
);

CREATE TABLE "collected_items" (
  "user_id" varchar(28) NOT NULL,
  "collectable_id" integer NOT NULL,
  PRIMARY KEY ("user_id", "collectable_id")
);

ALTER TABLE "ac_users" ADD FOREIGN KEY ("group_id") REFERENCES "groups" ("id");

ALTER TABLE "ac_users" ADD FOREIGN KEY ("role_id") REFERENCES "ac_roles" ("id");

ALTER TABLE "collectables" ADD FOREIGN KEY ("type_id") REFERENCES "collectable_types" ("id");

ALTER TABLE "collected_items" ADD FOREIGN KEY ("user_id") REFERENCES "ac_users" ("google_id");

ALTER TABLE "collected_items" ADD FOREIGN KEY ("collectable_id") REFERENCES "collectables" ("id");