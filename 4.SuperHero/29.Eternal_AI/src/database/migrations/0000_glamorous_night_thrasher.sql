CREATE TABLE IF NOT EXISTS "bankCards" (
	"id" serial PRIMARY KEY NOT NULL,
	"card_number" integer,
	"expiry_date" varchar(5),
	"cvc" integer,
	"user_id" integer
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "questionsAnswers" (
	"id" serial PRIMARY KEY NOT NULL,
	"question" text,
	"answer" text,
	"timestamp" timestamp (6) with time zone,
	"user_id" integer
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "users" (
	"id" serial PRIMARY KEY NOT NULL,
	"phone_number" varchar(256),
	"email" varchar(256),
	"password" varchar(256),
	"name" varchar(256),
	"is_subscribed" boolean,
	"free_questions" integer DEFAULT 0
);
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "bankCards" ADD CONSTRAINT "bankCards_user_id_users_id_fk" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "questionsAnswers" ADD CONSTRAINT "questionsAnswers_user_id_users_id_fk" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
