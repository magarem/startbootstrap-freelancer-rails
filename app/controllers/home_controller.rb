require "recursos"

class HomeController < ApplicationController

		  attr_accessor :logo1, :menu1
          
          def initialize
               super
               
               #logo
               @logo1 =  Txtbox.new
               @logo1.label = "Marcelo A. Magalhães"
               @logo1.link = "home/index"

               #menu
               @menu1 = Menu.new
               @menu1.setUlClass ("nav navbar-nav navbar-right")
               @menu1.op << { label: "Portfólio", link: "#portfolio"}
               @menu1.op << { label: "Sobre", link: "#about"}
               @menu1.op << { label: "contato", link: "#contact"}
               @menu1.doTree

               
               #
               #  footer
               #

               #endereço
               @footer_endereco =  Txtbox.new
               @footer_endereco.label = "Local"
               @footer_endereco.body = "Rio de Janeiro - RJ - Brasil"
                
               #Social links
               @sl = SocialLink.new ({
               	           facebook:   "marcelo.a.magalhaes.5",
                           googleplus: "marcelo5",
                           twitter:    "marcelo.a.magalhaes5"})

			   #créditos
			   @box3 = Txtbox.new
			   @box3.label = "Créditos"
			   @box3.body = "Ruby on Rails<br>e tema da <a href='http://startbootstrap.com/'>Start Bootstrap</a>"

			   #copyright
			   @box4 = Txtbox.new
			   @box4.label = "Marcelo A. Magalhães - 2016"
			   
        
          end

          def index
               @page = Txtbox.new
               @page.img = "/assets/profile.png"
               @page.label = "Bem vindo"
               @page.bodyl << "Desenvolvedor Web - Web master"

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

			   @sobre = Txtbox.new
			   @sobre.label = "Sobre"
			   @sobre.bodyl << "d jkakjd sakjdh skjdhas kdjh sdfh skjdfh sdkjfhsd kfjsdh "
			   @sobre.bodyl << "d jksdfh skjdfh sdkjfhsd kfjslksdj laskdj aslkdj dh "

			   @contact = Contact.new
			   
          end

         

          def contato_do
              @page = Txtbox.new
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
              self.index
              render "home/index"
          end

     
end

