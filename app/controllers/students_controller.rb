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
      if student.update(age: student_data[:age]) == false
        flash[:alert] = "データ更新が失敗しました"
        redirect_to edit_student_path
        return
      end
    end
    redirect_to root_path
  end
end