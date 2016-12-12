class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]

  # GET /lessons
  # GET /lessons.json
  def index
    @lessons = Lesson.where(category_id: params[:category_id],
                            user_id: current_user.id)
  end

  # GET /lessons/1
  # GET /lessons/1.json
  def show
    @result = @lesson.learns
  end

  # GET /lessons/new
  def new
    category = Category.find(params[:category_id])
    learned_ids = Learn.learned_ids(current_user,category)
    if learned_ids.empty?
      flash[:danger] = "We has some error. Sory about that"
      redirect_to request.referer
    else
      questions = category.questions.question_not_learn(learned_ids).take(5)
      @lesson = category.lessons.build
      questions.each do |question|
        @lesson.learns.build question_id: question.id
      end
    end
  end

  # GET /lessons/1/edit
  def edit
  end

  # POST /lessons
  # POST /lessons.json
  def create
    @lesson = current_user.lessons.build(category_id: params[:category_id])
    learns = params[:lesson][:learns_attributes]
    if @lesson.save
      learns.each do |key, value|
        @lesson.learns.create(answer_id: value["answer_id"],
                              question_id: value["question_id"],
                              is_correct: Learn.correct?(value["answer_id"]))
        end
        score = @lesson.learns.where(is_correct: true).count
        @lesson.update(score: score)
        Activity.create!(user_id: current_user.id, action: 3, source: @lesson.id)
        redirect_to category_lesson_path(@lesson.category, @lesson), 
        notice: 'Lesson was successfully created.'
      else
        render :new
      end
    end

  # PATCH/PUT /lessons/1
  # PATCH/PUT /lessons/1.json
  def update
    respond_to do |format|
      if @lesson.update(lesson_params)
        format.html { redirect_to @lesson, notice: 'Lesson was successfully updated.' }
        format.json { render :show, status: :ok, location: @lesson }
      else
        format.html { render :edit }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lessons/1
  # DELETE /lessons/1.json
  def destroy
    @lesson.destroy
    respond_to do |format|
      format.html { redirect_to lessons_url, notice: 'Lesson was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson
      @lesson = Lesson.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lesson_params
      params.require(:lesson).permit(:category_id, :score, :user_id, learns_attributes: [:question_id, :answer_id])
    end
  end
