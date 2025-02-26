CREATE TABLE IF NOT EXISTS "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE IF NOT EXISTS "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
CREATE TABLE IF NOT EXISTS "users" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "password_digest" varchar);
CREATE TABLE IF NOT EXISTS "user_authentications" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer NOT NULL, "provider" varchar, "external_id" varchar);
CREATE INDEX "index_user_authentications_on_user_id" ON "user_authentications" ("user_id") /*application='RailsWithAuth'*/;
CREATE UNIQUE INDEX "index_user_authentications_on_user_id_and_provider" ON "user_authentications" ("user_id", "provider") /*application='RailsWithAuth'*/;
CREATE UNIQUE INDEX "index_user_authentications_on_provider_and_external_id" ON "user_authentications" ("provider", "external_id") /*application='RailsWithAuth'*/;
INSERT INTO "schema_migrations" (version) VALUES
('20250226063023'),
('20250226061101');

