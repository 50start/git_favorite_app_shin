class CarsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
  end

  def new
    @car = Car.new
  end
  
  def create
    @car = Car.new(car_params)
    @car.user_id = current_user.id #誰が投稿したのかを記述
    if @car.save
      redirect_to car_path(@car), notice: '投稿に成功しました'
    else
      render :new
    end
  end

  def edit
    @car = Car.find(params[:id])
    if @car.user != current_user
      redirect_to cars_path, alert: '不正なアクセスです'
    end
  end
  
  def update
    @car = Car.find(params[:id])
    if @car.update(car_params)
      redirect_to car_path(@car), notice: "更新に成功しました"
    else
      render :edit
    end
  end
  
  def destroy
    car = Car.find(params[:id])
    car.destroy
    redirect_to cars_path
  end

private

def car_params
  params.require(:car).permit(:title, :body)
end

end
