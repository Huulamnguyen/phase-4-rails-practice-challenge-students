class InstructorsController < ApplicationController

    def index
        render json: Instructor.all, status: :ok
    end

    def show
        render json: find_instructor, status: :ok
    end

    def create
        instructor = Instructor.create!(instructor_params)
        render json: instructor, status: :created
    end

    def update
        find_instructor.update!(instructor_params)
        render json: find_instructor, status: :ok
    end

    def destroy
        find_instructor.destroy
        head :no_content
    end

    private

    def find_instructor
        Instructor.find(params[:id])
    end

    def instructor_params
        params.permit(:name)
    end

end
