class ProdutosController < ApplicationController
	def new
		@produto = Produto.new
	end

	def index
		@produtos = Produto.order(:nome).limit 5
	end
	def create
		valores = params.require(:produto).permit :nome, :preco, :descricao, :quantidade
		@produto = Produto.new valores
		if @produto.save
			flash[:notice] = "Produto salvo com sucesso"
			redirect_to root_url
		else
			render :new
		end 		
	end
	def destroy
		id = params[:id]
		Produto.destroy id
		redirect_to root_url		
	end
	def busca
		@nome_a_buscar = params[:nome]
		@produtos = Produto.where "nome like ?", "%#{@nome_a_buscar}%"
	end
end
