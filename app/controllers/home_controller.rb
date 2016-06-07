require "recursos"

class HomeController < ApplicationController
          
          def initialize

               super

               ###################################################
               # Header
               ###################################################

               #logo
               @logo =  Txtbox.new
               @logo.label = "Marcelo A. Magalhães"
               @logo.link = "#page-top"

               #menu
               @menu = Menu.new
               @menu.setUlClass ("nav navbar-nav navbar-right")
               @menu.op << { label: "Portfólio", link: "#portfolio"}
               @menu.op << { label: "Sobre",     link: "#about"}
               @menu.op << { label: "Contato",   link: "#contact"}
               @menu.doTree

               
               ###################################################
               # footer
               ###################################################

               #endereço
               @box1 =  Txtbox.new
               @box1.label = "Local"
               @box1.body = "Rio de Janeiro - RJ - Brasil"
                
               #Social links
               @box2 = SocialLink.new ({
               	           facebook:   "marcelo.a.magalhaes.5",
                           googleplus: "marcelo5",
                           twitter:    "marcelo.a.magalhaes5"})

			   #créditos
			   @box3 = Txtbox.new
			   @box3.label = "Créditos"
			   @box3.body = "Ruby on Rails,<br>tema <a href='http://blackrockdigital.github.io/startbootstrap-freelancer/'>Freelancer</a>"

			   #copyright
			   @box4 = Txtbox.new
			   @box4.label = "Marcelo A. Magalhães - 2016"
			   
          end

          
          def index
               
               @page = Txtbox.new
               @page.img = "/assets/profile.png"
               @page.label = "Bem vindo"
               @page.bodyl << "Desenvolvedor Web - Web master"

			   
			   # Portfólio
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

			   # Sobre
			   @sobre = Txtbox.new
			   @sobre.label = "Sobre"
			   @sobre.bodyl << "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur dolor arcu, suscipit at turpis id, dictum hendrerit lectus. Suspendisse sed tempor nibh. Nunc dignissim risus nec mauris porttitor placerat. Ut sodales ligula vel lorem pretium finibus. Nam id sodales metus. Suspendisse maximus accumsan magna."
			   @sobre.bodyl << "Nam ut facilisis mauris. Nulla varius pulvinar lorem, sit amet porttitor lacus pulvinar eu. Pellentesque non cursus neque, vel tristique mauris. Proin tincidunt ut sapien id suscipit. Vestibulum sed pellentesque lorem. Cras malesuada libero tincidunt venenatis ultrices. Pellentesque ac pretium turpis, eu bibendum dolor. "

			   # Contact
			   @contact = Contact.new
			   
          end

         
          def contato_do
		      # Envio dos dados do formulário de contato      
              @contact = Contact.new(params[:contact])
              @contact.request = request
              if @contact.deliver
                flash.now[:notice] = 'Mensagem enviada com sucesso.'
              else
                flash.now[:error] = 'Sua mensagem não pode ser enviada. Favor tentar novamente.'
              end
              self.index
              render "home/index"
          end

     
end

