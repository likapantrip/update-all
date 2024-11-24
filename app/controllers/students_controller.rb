class StudentsController < ApplicationController
  def index
  end

  def edit
      # 一括更新するため、全レコードを取得
      @students = Student.all
  end

  def update
    # studentsテーブルのレコード件数を取得
    count = Student.count

    count.times do |c|
      # 更新するデータを取得
      c += 1
      student_id = c.to_s
      student = Student.find(student_id)
      student_data = params.require(:"student").require(:"students").require(student_id).permit(:age)
      
      # データを更新
      student.update!(age: student_data[:age])
      # データ更新に失敗した場合
      rescue ActiveRecord::RecordInvalid => e
        flash[:alert] = "#{e.record.errors.full_messages} ※#{Student.find(e.record.id).name}以降のデータは更新されていません"
        redirect_to edit_student_path
        return
    end
    # 全件更新成功した場合
    redirect_to root_path
  end
end