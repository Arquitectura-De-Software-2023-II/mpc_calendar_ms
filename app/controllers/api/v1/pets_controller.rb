#require_relative '.\clients_controller.rb'

class Api::V1::PetsController < ApplicationController
  def index
    pet = Pet.all
    render json: pet, status:200
  end
  def show
    pet = Pet.find_by(id: params[:id])
    if pet
      render json: pet, status: 200
    else
      render json: { error: 'No se encontró o no existe el registro de la mascota' }
    end
  end

  def create
    owner = Client.find_by(user_id: params[:user_id])
    if owner
      pet = Pet.new(
        pet_id: pet_params[:pet_id],
        user_id: pet_params[:user_id]
      )
      if pet.save
        render json: pet, status: 200
      else
        render json: { error: 'No se pudo crear el registro de la mascota' }
      end
    else
      render json: { error: 'El dueño de la mascota no existe' }
    end
  end
  def update
    pet = Pet.find(params[:id])
      if pet.update(
        pet_id: pet_params[:pet_id],
        name: pet_params[:name],
        breed: pet_params[:breed])
        render json: "Datos de la mascota actualizados", status: 200
      else
        render json: { error: 'No se pudo actualizar el registro de la mascota' }
      end
  end

  def destroy
    pet = Pet.find(params[:id])
    if pet
      pet.destroy
      render json: { message: 'Registro de mascota eliminado correctamente' }, status: 200
    else
      render json: { error: 'Ese registro de mascota no existe o ya fue eliminado' }
    end
  end

  private
  
    def pet_params
      params.require(:pet).permit(:pet_id, :user_id)
    end
end
