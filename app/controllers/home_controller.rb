require "recursos"

class HomeController < ApplicationController

          def initialize
                super
               #logo
               @logo1 =  Logo.new
               @logo1.txt = "Marcelo A. Magalhães"

               #menu
               @menu1 = Menu.new
               @menu1.setUlClass ("nav navbar-nav navbar-right")
               @menu1.setOps [
                               ["Portfólio","#portfolio"],
                               ["Sobre","#about"],
                               ["contato","#contact"]
                             ]
          end

          def index
               @page = Txt.new
               @page.label = "Bem vindo"
               @page.body << "Desenvolvedor Web"

               @page.img = "/assets/profile.png"
           

			   @por = Portfolio.new
			   @por.item << {
			   	img: "/assets/portfolio/cabin.png",
			   	titulo: "Site teste",
			   	txt: "Este é um teste muito legal",
			   	cliente_nome: "Fidelito",
			   	cliente_site: "fidelis.com",
			   	data: "10/10/12",
				servico: "Programação"
			   }

			   @por.item << {
			   	img: "/assets/portfolio/cake.png",
			   	titulo: "Site teste",
			   	txt: "Este é um teste muito legal",
			   	cliente_nome: "Fidelito",
			   	cliente_site: "fidelis.com",
			   	data: "10/10/12",
			   	servico: "Programação"
			   }

			   @por.item << {
			   	img: "/assets/portfolio/circus.png",
			   	titulo: "Site teste",
			   	txt: "Este é um teste muito legal",
			   	cliente_nome: "Fidelito",
			   	cliente_site: "fidelis.com",
			   	data: "10/10/12",
			   	servico: "Programação"
			   }

			   @por.item << {
			   	img: "/assets/portfolio/game.png",
			   	titulo: "Site teste",
			   	txt: "Este é um teste muito legal",
			   	cliente_nome: "Fidelito",
			   	cliente_site: "fidelis.com",
			   	data: "10/10/12",
			   	servico: "Programação"
			   }

			   @por.item << {
			   	img: "/assets/portfolio/safe.png",
			   	titulo: "Site teste",
			   	txt: "Este é um teste muito legal",
			   	cliente_nome: "Fidelito",
			   	cliente_site: "fidelis.com",
			   	data: "10/10/12",
			   	servico: "Programação"
			   }

			   @por.item << {
			   	img: "/assets/portfolio/submarine.png",
			   	titulo: "Site teste",
			   	txt: "Este é um teste muito legal",
			   	cliente_nome: "Fidelito",
			   	cliente_site: "fidelis.com",
			   	data: "10/10/12",
			   	servico: "Programação"
			   }


			   @sobre = Txt.new
			   @sobre.label = "Sobre"
			   @sobre.body << "d jkakjd sakjdh skjdhas kdjh sdfh skjdfh sdkjfhsd kfjsdh "
			   @sobre.body << "d jksdfh skjdfh sdkjfhsd kfjslksdj laskdj aslkdj dh "

          end

         

          def contato_do
              @page = Txt.new
              @page.label = "Contato"
              @page.body = "Obrigado pelo contato! Retornaremos em breve ;)"
              @page.img = "contact/contact-bg.jpg"
              
              @contact = Contact.new(params[:contact])
              @contact.request = request
              if @contact.deliver
                flash.now[:notice] = 'Mensagem enviada com sucesso.'
              else
                flash.now[:error] = 'Sua mensagem não pode ser enviada. Favor tentar novamente.'
              end
              render "page/home"
          end

     
end

