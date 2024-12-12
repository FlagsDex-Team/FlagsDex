-- upgrade --
ALTER TABLE "carinstance" ADD "exclusive_id" INT;
CREATE TABLE IF NOT EXISTS "exclusive" (
    "id" SERIAL NOT NULL PRIMARY KEY,
    "name" VARCHAR(64) NOT NULL,
    "image" VARCHAR(200) NOT NULL,
    "emoji" VARCHAR(20) NOT NULL,
    "rebirth_required" INT NOT NULL  DEFAULT 0,
    "catch_phrase" VARCHAR(128),
    "rarity" DOUBLE PRECISION NOT NULL
);

COMMENT ON COLUMN "exclusive"."image" IS '1428x2000 PNG image';
ALTER TABLE "carinstance" ADD CONSTRAINT "fk_carinst_exclusive_5eb32xaf" FOREIGN KEY ("exclusive_id") REFERENCES "exclusive" ("id") ON DELETE SET NULL;
ALTER TABLE "carinstance" ADD "exclusive" INT NOT NULL DEFAULT 0;

-- downgrade --
ALTER TABLE "carinstance" DROP CONSTRAINT "fk_carinst_exclusive_5eb32xaf";
ALTER TABLE "carinstance" DROP COLUMN "exclusive_id";
DROP TABLE IF EXISTS "exclusive";

