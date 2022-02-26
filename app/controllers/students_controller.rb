class StudentsController < ApplicationController

    def index
        render json: Student.all, status: :ok
    end

    def show
        render json: find_student, status: :ok
    end

    def create
        student = Student.create!(student_params)
        render json: student, status: :created
    end

    def update
        find_student.update!(student_params)
        render json: find_student, status: :ok
    end

    def destroy
        find_student.destroy
        head :no_content
    end

    private

    def find_student
        Student.find(params[:id])
    end

    def student_params
        params.permit(:name, :major, :age, :instructor_id)
    end

end
