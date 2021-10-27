/*
  Warnings:

  - A unique constraint covering the columns `[genericId]` on the table `Goal` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[genericId]` on the table `Habit` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[genericId]` on the table `Journal` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[genericId]` on the table `Task` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[taskId]` on the table `TimeSlot` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `status` to the `Task` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "Status" AS ENUM ('NEW', 'PENDING', 'IN_PROGRESS', 'COMPLETED', 'BLOCKED');

-- AlterTable
ALTER TABLE "Task" ADD COLUMN     "projectId" TEXT,
ADD COLUMN     "status" "Status" NOT NULL;

-- CreateTable
CREATE TABLE "Project" (
    "id" TEXT NOT NULL,
    "genericId" TEXT NOT NULL,
    "userId" TEXT,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_GenericToTag" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Project.id_unique" ON "Project"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Project.genericId_unique" ON "Project"("genericId");

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
CREATE UNIQUE INDEX "Task.genericId_unique" ON "Task"("genericId");

-- CreateIndex
CREATE UNIQUE INDEX "TimeSlot.taskId_unique" ON "TimeSlot"("taskId");

-- AddForeignKey
ALTER TABLE "Task" ADD FOREIGN KEY ("projectId") REFERENCES "Project"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Project" ADD FOREIGN KEY ("genericId") REFERENCES "Generic"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Project" ADD FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_GenericToTag" ADD FOREIGN KEY ("A") REFERENCES "Generic"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_GenericToTag" ADD FOREIGN KEY ("B") REFERENCES "Tag"("id") ON DELETE CASCADE ON UPDATE CASCADE;
