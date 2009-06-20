CREATE TABLE "comments" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "body" text, "post_id" integer, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "languages" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "style" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "posts" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar(255), "body" text, "created_at" datetime, "updated_at" datetime, "language" varchar(255));
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20090618232627');

INSERT INTO schema_migrations (version) VALUES ('20090619005745');

INSERT INTO schema_migrations (version) VALUES ('20090619020602');

INSERT INTO schema_migrations (version) VALUES ('20090619231527');