-- DropForeignKey
ALTER TABLE "Habit" DROP CONSTRAINT "Habit_timeslotId_fkey";

-- DropForeignKey
ALTER TABLE "TimeSlot" DROP CONSTRAINT "TimeSlot_taskId_fkey";

-- AddForeignKey
ALTER TABLE "TimeSlot" ADD CONSTRAINT "TimeSlot_taskId_fkey" FOREIGN KEY ("taskId") REFERENCES "Task"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Habit" ADD CONSTRAINT "Habit_timeslotId_fkey" FOREIGN KEY ("timeslotId") REFERENCES "TimeSlot"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- RenameIndex
ALTER INDEX "Goal.id_unique" RENAME TO "Goal_id_key";

-- RenameIndex
ALTER INDEX "Habit.id_unique" RENAME TO "Habit_id_key";

-- RenameIndex
ALTER INDEX "Journal.id_unique" RENAME TO "Journal_id_key";

-- RenameIndex
ALTER INDEX "Project.id_unique" RENAME TO "Project_id_key";

-- RenameIndex
ALTER INDEX "Tag.id_unique" RENAME TO "Tag_id_key";

-- RenameIndex
ALTER INDEX "Task.id_unique" RENAME TO "Task_id_key";

-- RenameIndex
ALTER INDEX "TimeSlot.id_unique" RENAME TO "TimeSlot_id_key";

-- RenameIndex
ALTER INDEX "TimeSlot.taskId_unique" RENAME TO "TimeSlot_taskId_key";

-- RenameIndex
ALTER INDEX "User.email_unique" RENAME TO "User_email_key";

-- RenameIndex
ALTER INDEX "User.id_unique" RENAME TO "User_id_key";
