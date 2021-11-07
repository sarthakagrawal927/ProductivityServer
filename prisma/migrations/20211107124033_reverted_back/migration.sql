/*
  Warnings:

  - You are about to drop the column `createdAt` on the `Goal` table. All the data in the column will be lost.
  - You are about to drop the column `description` on the `Goal` table. All the data in the column will be lost.
  - You are about to drop the column `name` on the `Goal` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `Goal` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `Habit` table. All the data in the column will be lost.
  - You are about to drop the column `description` on the `Habit` table. All the data in the column will be lost.
  - You are about to drop the column `name` on the `Habit` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `Habit` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `Journal` table. All the data in the column will be lost.
  - You are about to drop the column `description` on the `Journal` table. All the data in the column will be lost.
  - You are about to drop the column `journalType` on the `Journal` table. All the data in the column will be lost.
  - You are about to drop the column `name` on the `Journal` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `Journal` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `Project` table. All the data in the column will be lost.
  - You are about to drop the column `description` on the `Project` table. All the data in the column will be lost.
  - You are about to drop the column `name` on the `Project` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `Project` table. All the data in the column will be lost.
  - You are about to drop the column `goalId` on the `Tag` table. All the data in the column will be lost.
  - You are about to drop the column `habitId` on the `Tag` table. All the data in the column will be lost.
  - You are about to drop the column `journalId` on the `Tag` table. All the data in the column will be lost.
  - You are about to drop the column `projectId` on the `Tag` table. All the data in the column will be lost.
  - You are about to drop the column `taskId` on the `Tag` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `Task` table. All the data in the column will be lost.
  - You are about to drop the column `description` on the `Task` table. All the data in the column will be lost.
  - You are about to drop the column `name` on the `Task` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `Task` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[genericId]` on the table `Goal` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[genericId]` on the table `Habit` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[genericId]` on the table `Journal` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[genericId]` on the table `Project` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[genericId]` on the table `Task` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `genericId` to the `Goal` table without a default value. This is not possible if the table is not empty.
  - Added the required column `genericId` to the `Habit` table without a default value. This is not possible if the table is not empty.
  - Added the required column `genericId` to the `Journal` table without a default value. This is not possible if the table is not empty.
  - Added the required column `type` to the `Journal` table without a default value. This is not possible if the table is not empty.
  - Added the required column `genericId` to the `Project` table without a default value. This is not possible if the table is not empty.
  - Added the required column `genericId` to the `Task` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Tag" DROP CONSTRAINT "Tag_goalId_fkey";

-- DropForeignKey
ALTER TABLE "Tag" DROP CONSTRAINT "Tag_habitId_fkey";

-- DropForeignKey
ALTER TABLE "Tag" DROP CONSTRAINT "Tag_journalId_fkey";

-- DropForeignKey
ALTER TABLE "Tag" DROP CONSTRAINT "Tag_projectId_fkey";

-- DropForeignKey
ALTER TABLE "Tag" DROP CONSTRAINT "Tag_taskId_fkey";

-- AlterTable
ALTER TABLE "Goal" DROP COLUMN "createdAt",
DROP COLUMN "description",
DROP COLUMN "name",
DROP COLUMN "updatedAt",
ADD COLUMN     "genericId" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "Habit" DROP COLUMN "createdAt",
DROP COLUMN "description",
DROP COLUMN "name",
DROP COLUMN "updatedAt",
ADD COLUMN     "genericId" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "Journal" DROP COLUMN "createdAt",
DROP COLUMN "description",
DROP COLUMN "journalType",
DROP COLUMN "name",
DROP COLUMN "updatedAt",
ADD COLUMN     "genericId" TEXT NOT NULL,
ADD COLUMN     "type" "JournalType" NOT NULL;

-- AlterTable
ALTER TABLE "Project" DROP COLUMN "createdAt",
DROP COLUMN "description",
DROP COLUMN "name",
DROP COLUMN "updatedAt",
ADD COLUMN     "genericId" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "Tag" DROP COLUMN "goalId",
DROP COLUMN "habitId",
DROP COLUMN "journalId",
DROP COLUMN "projectId",
DROP COLUMN "taskId",
ADD COLUMN     "genericId" TEXT;

-- AlterTable
ALTER TABLE "Task" DROP COLUMN "createdAt",
DROP COLUMN "description",
DROP COLUMN "name",
DROP COLUMN "updatedAt",
ADD COLUMN     "genericId" TEXT NOT NULL;

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
CREATE TABLE "_GenericToTag" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Generic.id_unique" ON "Generic"("id");

-- CreateIndex
CREATE UNIQUE INDEX "_GenericToTag_AB_unique" ON "_GenericToTag"("A", "B");

-- CreateIndex
CREATE INDEX "_GenericToTag_B_index" ON "_GenericToTag"("B");

-- CreateIndex
CREATE UNIQUE INDEX "Goal.genericId_unique" ON "Goal"("genericId");

-- CreateIndex
CREATE UNIQUE INDEX "Habit.genericId_unique" ON "Habit"("genericId");

-- CreateIndex
CREATE UNIQUE INDEX "Journal.genericId_unique" ON "Journal"("genericId");

-- CreateIndex
CREATE UNIQUE INDEX "Project.genericId_unique" ON "Project"("genericId");

-- CreateIndex
CREATE UNIQUE INDEX "Task.genericId_unique" ON "Task"("genericId");

-- AddForeignKey
ALTER TABLE "Tag" ADD FOREIGN KEY ("genericId") REFERENCES "Generic"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Journal" ADD FOREIGN KEY ("genericId") REFERENCES "Generic"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Task" ADD FOREIGN KEY ("genericId") REFERENCES "Generic"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Goal" ADD FOREIGN KEY ("genericId") REFERENCES "Generic"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Habit" ADD FOREIGN KEY ("genericId") REFERENCES "Generic"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Project" ADD FOREIGN KEY ("genericId") REFERENCES "Generic"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_GenericToTag" ADD FOREIGN KEY ("A") REFERENCES "Generic"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_GenericToTag" ADD FOREIGN KEY ("B") REFERENCES "Tag"("id") ON DELETE CASCADE ON UPDATE CASCADE;
