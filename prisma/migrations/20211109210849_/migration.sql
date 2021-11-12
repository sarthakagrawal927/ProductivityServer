/*
  Warnings:

  - The `priority` column on the `Task` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `status` column on the `Task` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - Changed the type of `journalType` on the `Journal` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- DropForeignKey
ALTER TABLE "TimeSlot" DROP CONSTRAINT "TimeSlot_taskId_fkey";

-- AlterTable
ALTER TABLE "Journal" DROP COLUMN "journalType",
ADD COLUMN     "journalType" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "Task" DROP COLUMN "priority",
ADD COLUMN     "priority" TEXT NOT NULL DEFAULT E'MEDIUM',
ALTER COLUMN "predictedHours" DROP NOT NULL,
DROP COLUMN "status",
ADD COLUMN     "status" TEXT NOT NULL DEFAULT E'NEW';

-- AlterTable
ALTER TABLE "TimeSlot" ALTER COLUMN "taskId" DROP NOT NULL;

-- DropEnum
DROP TYPE "JournalType";

-- DropEnum
DROP TYPE "Priority";

-- DropEnum
DROP TYPE "Status";

-- AddForeignKey
ALTER TABLE "TimeSlot" ADD CONSTRAINT "TimeSlot_taskId_fkey" FOREIGN KEY ("taskId") REFERENCES "Task"("id") ON DELETE SET NULL ON UPDATE CASCADE;
