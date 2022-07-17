/*
  Warnings:

  - The `journalType` column on the `Journal` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - You are about to drop the column `goalId` on the `Tag` table. All the data in the column will be lost.
  - You are about to drop the column `habitId` on the `Tag` table. All the data in the column will be lost.
  - You are about to drop the column `journalId` on the `Tag` table. All the data in the column will be lost.
  - You are about to drop the column `projectId` on the `Tag` table. All the data in the column will be lost.
  - You are about to drop the column `taskId` on the `Tag` table. All the data in the column will be lost.
  - You are about to drop the column `projectId` on the `Task` table. All the data in the column will be lost.
  - The `priority` column on the `Task` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `status` column on the `Task` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - You are about to drop the column `goalId` on the `TimeSlot` table. All the data in the column will be lost.
  - You are about to drop the column `taskId` on the `TimeSlot` table. All the data in the column will be lost.
  - You are about to drop the column `userId` on the `TimeSlot` table. All the data in the column will be lost.
  - You are about to drop the `Project` table. If the table is not empty, all the data it contains will be lost.
  - Made the column `userId` on table `Goal` required. This step will fail if there are existing NULL values in that column.
  - Made the column `userId` on table `Habit` required. This step will fail if there are existing NULL values in that column.
  - Made the column `userId` on table `Journal` required. This step will fail if there are existing NULL values in that column.
  - Made the column `userId` on table `Task` required. This step will fail if there are existing NULL values in that column.

*/
-- CreateEnum
CREATE TYPE "JournalType" AS ENUM ('GRATITUDE', 'EVENT', 'IDEA', 'LEARNING');

-- CreateEnum
CREATE TYPE "Priority" AS ENUM ('TOP', 'HIGH', 'MEDIUM', 'LOW', 'MAYBE');

-- CreateEnum
CREATE TYPE "Status" AS ENUM ('NEW', 'PENDING', 'PROGRESSING', 'COMPLETED', 'BLOCKED', 'PARKED');

-- DropForeignKey
ALTER TABLE "Goal" DROP CONSTRAINT "Goal_userId_fkey";

-- DropForeignKey
ALTER TABLE "Habit" DROP CONSTRAINT "Habit_timeslotId_fkey";

-- DropForeignKey
ALTER TABLE "Habit" DROP CONSTRAINT "Habit_userId_fkey";

-- DropForeignKey
ALTER TABLE "Journal" DROP CONSTRAINT "Journal_userId_fkey";

-- DropForeignKey
ALTER TABLE "Project" DROP CONSTRAINT "Project_userId_fkey";

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

-- DropForeignKey
ALTER TABLE "Task" DROP CONSTRAINT "Task_projectId_fkey";

-- DropForeignKey
ALTER TABLE "Task" DROP CONSTRAINT "Task_userId_fkey";

-- DropForeignKey
ALTER TABLE "TimeSlot" DROP CONSTRAINT "TimeSlot_goalId_fkey";

-- DropForeignKey
ALTER TABLE "TimeSlot" DROP CONSTRAINT "TimeSlot_taskId_fkey";

-- DropForeignKey
ALTER TABLE "TimeSlot" DROP CONSTRAINT "TimeSlot_userId_fkey";

-- DropIndex
DROP INDEX "TimeSlot_taskId_key";

-- AlterTable
ALTER TABLE "Goal" ADD COLUMN     "tagIDs" TEXT[],
ALTER COLUMN "userId" SET NOT NULL,
ALTER COLUMN "why" DROP NOT NULL,
ALTER COLUMN "relevance" DROP NOT NULL;

-- AlterTable
ALTER TABLE "Habit" ADD COLUMN     "tagIDs" TEXT[],
ALTER COLUMN "userId" SET NOT NULL,
ALTER COLUMN "startDate" SET DEFAULT CURRENT_TIMESTAMP,
ALTER COLUMN "timeslotId" DROP NOT NULL;

-- AlterTable
ALTER TABLE "Journal" ADD COLUMN     "tagIDs" TEXT[],
ALTER COLUMN "userId" SET NOT NULL,
DROP COLUMN "journalType",
ADD COLUMN     "journalType" "JournalType" NOT NULL DEFAULT E'IDEA';

-- AlterTable
ALTER TABLE "Tag" DROP COLUMN "goalId",
DROP COLUMN "habitId",
DROP COLUMN "journalId",
DROP COLUMN "projectId",
DROP COLUMN "taskId";

-- AlterTable
ALTER TABLE "Task" DROP COLUMN "projectId",
ADD COLUMN     "goalId" TEXT,
ADD COLUMN     "habitId" TEXT,
ADD COLUMN     "tagIDs" TEXT[],
ADD COLUMN     "timeSlotId" TEXT,
ALTER COLUMN "userId" SET NOT NULL,
DROP COLUMN "priority",
ADD COLUMN     "priority" "Priority" NOT NULL DEFAULT E'LOW',
DROP COLUMN "status",
ADD COLUMN     "status" "Status" NOT NULL DEFAULT E'NEW';

-- AlterTable
ALTER TABLE "TimeSlot" DROP COLUMN "goalId",
DROP COLUMN "taskId",
DROP COLUMN "userId";

-- DropTable
DROP TABLE "Project";
