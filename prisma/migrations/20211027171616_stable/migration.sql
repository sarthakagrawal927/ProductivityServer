/*
  Warnings:

  - The primary key for the `User` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - A unique constraint covering the columns `[id]` on the table `User` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `password` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `User` table without a default value. This is not possible if the table is not empty.
  - Made the column `name` on table `User` required. This step will fail if there are existing NULL values in that column.

*/
-- CreateEnum
CREATE TYPE "Type" AS ENUM ('GRATITUDE', 'EVENT', 'IDEA', 'LEARNING');

-- CreateEnum
CREATE TYPE "Priority" AS ENUM ('VERY_HIGH', 'HIGH', 'MEDIUM', 'LOW', 'VERY_LOW');

-- AlterTable
ALTER TABLE "User" DROP CONSTRAINT "User_pkey",
ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "password" TEXT NOT NULL,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL,
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "name" SET NOT NULL,
ADD PRIMARY KEY ("id");
DROP SEQUENCE "User_id_seq";

-- CreateTable
CREATE TABLE "Tag" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "genericId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Generic" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Journal" (
    "id" TEXT NOT NULL,
    "genericId" TEXT NOT NULL,
    "userId" TEXT,
    "type" "Type" NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Task" (
    "id" TEXT NOT NULL,
    "genericId" TEXT NOT NULL,
    "userId" TEXT,
    "deadline" TIMESTAMP(3),
    "priority" "Priority" NOT NULL,
    "predictedHours" DOUBLE PRECISION NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Goal" (
    "id" TEXT NOT NULL,
    "genericId" TEXT NOT NULL,
    "userId" TEXT,
    "why" TEXT NOT NULL,
    "relevance" TEXT NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Habit" (
    "id" TEXT NOT NULL,
    "genericId" TEXT NOT NULL,
    "userId" TEXT,
    "startDate" TIMESTAMP(3) NOT NULL,
    "trackRecord" BOOLEAN[],
    "timeslotId" TEXT NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TimeSlot" (
    "id" TEXT NOT NULL,
    "start" TIMESTAMP(3) NOT NULL,
    "end" TIMESTAMP(3) NOT NULL,
    "name" TEXT,
    "taskId" TEXT NOT NULL,
    "userId" TEXT,
    "goalId" TEXT,

    PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Tag.id_unique" ON "Tag"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Generic.id_unique" ON "Generic"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Journal.id_unique" ON "Journal"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Task.id_unique" ON "Task"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Goal.id_unique" ON "Goal"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Habit.id_unique" ON "Habit"("id");

-- CreateIndex
CREATE UNIQUE INDEX "TimeSlot.id_unique" ON "TimeSlot"("id");

-- CreateIndex
CREATE UNIQUE INDEX "User.id_unique" ON "User"("id");

-- AddForeignKey
ALTER TABLE "Tag" ADD FOREIGN KEY ("genericId") REFERENCES "Generic"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Journal" ADD FOREIGN KEY ("genericId") REFERENCES "Generic"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Journal" ADD FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Task" ADD FOREIGN KEY ("genericId") REFERENCES "Generic"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Task" ADD FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Goal" ADD FOREIGN KEY ("genericId") REFERENCES "Generic"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Goal" ADD FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Habit" ADD FOREIGN KEY ("genericId") REFERENCES "Generic"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Habit" ADD FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Habit" ADD FOREIGN KEY ("timeslotId") REFERENCES "TimeSlot"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TimeSlot" ADD FOREIGN KEY ("taskId") REFERENCES "Task"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TimeSlot" ADD FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TimeSlot" ADD FOREIGN KEY ("goalId") REFERENCES "Goal"("id") ON DELETE SET NULL ON UPDATE CASCADE;
