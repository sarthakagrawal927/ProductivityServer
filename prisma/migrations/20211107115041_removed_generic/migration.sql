/*
  Warnings:

  - You are about to drop the column `genericId` on the `Goal` table. All the data in the column will be lost.
  - You are about to drop the column `genericId` on the `Habit` table. All the data in the column will be lost.
  - You are about to drop the column `genericId` on the `Journal` table. All the data in the column will be lost.
  - You are about to drop the column `type` on the `Journal` table. All the data in the column will be lost.
  - You are about to drop the column `genericId` on the `Project` table. All the data in the column will be lost.
  - You are about to drop the column `genericId` on the `Tag` table. All the data in the column will be lost.
  - You are about to drop the column `genericId` on the `Task` table. All the data in the column will be lost.
  - You are about to drop the `Generic` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_GenericToTag` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `name` to the `Goal` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `Goal` table without a default value. This is not possible if the table is not empty.
  - Added the required column `name` to the `Habit` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `Habit` table without a default value. This is not possible if the table is not empty.
  - Added the required column `journalType` to the `Journal` table without a default value. This is not possible if the table is not empty.
  - Added the required column `name` to the `Journal` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `Journal` table without a default value. This is not possible if the table is not empty.
  - Added the required column `name` to the `Project` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `Project` table without a default value. This is not possible if the table is not empty.
  - Added the required column `name` to the `Task` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `Task` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "JournalType" AS ENUM ('GRATITUDE', 'EVENT', 'IDEA', 'LEARNING');

-- DropForeignKey
ALTER TABLE "Goal" DROP CONSTRAINT "Goal_genericId_fkey";

-- DropForeignKey
ALTER TABLE "Habit" DROP CONSTRAINT "Habit_genericId_fkey";

-- DropForeignKey
ALTER TABLE "Journal" DROP CONSTRAINT "Journal_genericId_fkey";

-- DropForeignKey
ALTER TABLE "Project" DROP CONSTRAINT "Project_genericId_fkey";

-- DropForeignKey
ALTER TABLE "Tag" DROP CONSTRAINT "Tag_genericId_fkey";

-- DropForeignKey
ALTER TABLE "Task" DROP CONSTRAINT "Task_genericId_fkey";

-- DropForeignKey
ALTER TABLE "_GenericToTag" DROP CONSTRAINT "_GenericToTag_A_fkey";

-- DropForeignKey
ALTER TABLE "_GenericToTag" DROP CONSTRAINT "_GenericToTag_B_fkey";

-- DropIndex
DROP INDEX "Goal.genericId_unique";

-- DropIndex
DROP INDEX "Habit.genericId_unique";

-- DropIndex
DROP INDEX "Journal.genericId_unique";

-- DropIndex
DROP INDEX "Project.genericId_unique";

-- DropIndex
DROP INDEX "Task.genericId_unique";

-- AlterTable
ALTER TABLE "Goal" DROP COLUMN "genericId",
ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "description" TEXT,
ADD COLUMN     "name" TEXT NOT NULL,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Habit" DROP COLUMN "genericId",
ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "description" TEXT,
ADD COLUMN     "name" TEXT NOT NULL,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL,
ALTER COLUMN "trackRecord" DROP NOT NULL,
ALTER COLUMN "trackRecord" SET DEFAULT E'';

-- AlterTable
ALTER TABLE "Journal" DROP COLUMN "genericId",
DROP COLUMN "type",
ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "description" TEXT,
ADD COLUMN     "journalType" "JournalType" NOT NULL,
ADD COLUMN     "name" TEXT NOT NULL,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Project" DROP COLUMN "genericId",
ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "description" TEXT,
ADD COLUMN     "name" TEXT NOT NULL,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Tag" DROP COLUMN "genericId",
ADD COLUMN     "goalId" TEXT,
ADD COLUMN     "habitId" TEXT,
ADD COLUMN     "journalId" TEXT,
ADD COLUMN     "projectId" TEXT,
ADD COLUMN     "taskId" TEXT;

-- AlterTable
ALTER TABLE "Task" DROP COLUMN "genericId",
ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "description" TEXT,
ADD COLUMN     "name" TEXT NOT NULL,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL;

-- DropTable
DROP TABLE "Generic";

-- DropTable
DROP TABLE "_GenericToTag";

-- DropEnum
DROP TYPE "Type";

-- AddForeignKey
ALTER TABLE "Tag" ADD FOREIGN KEY ("journalId") REFERENCES "Journal"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Tag" ADD FOREIGN KEY ("taskId") REFERENCES "Task"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Tag" ADD FOREIGN KEY ("goalId") REFERENCES "Goal"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Tag" ADD FOREIGN KEY ("habitId") REFERENCES "Habit"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Tag" ADD FOREIGN KEY ("projectId") REFERENCES "Project"("id") ON DELETE SET NULL ON UPDATE CASCADE;
