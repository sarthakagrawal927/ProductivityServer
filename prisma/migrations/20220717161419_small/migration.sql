/*
  Warnings:

  - You are about to drop the column `timeslotId` on the `Habit` table. All the data in the column will be lost.
  - You are about to drop the column `name` on the `TimeSlot` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Habit" DROP COLUMN "timeslotId";

-- AlterTable
ALTER TABLE "TimeSlot" DROP COLUMN "name";
