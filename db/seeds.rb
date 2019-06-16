# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create({ email: "vidriloco@gmail.com", name: "Alejandro", password: "virusdisk", password_confirmation: "virusdisk" })

SeoForPage.create(
  page_identifier: SeoForPage::PageIds::MAIN, 
  title: "Artistica: galería en la nube - Conoce la obra de diversos artistas locales en México", 
  description: "Artistica es un espacio en la nube diseñado para que artistas emergentes cuenten con un espacio en internet donde sus seguidores y conocedores de arte en general puedan seguir su trabajo materializado en sus obras.",
  keywords: "galería, arte, pintura, escultura, fotografía, acuarela, óleo, acrílico, cuadros, lienzos, pastel",
  image_url: "https://images.unsplash.com/photo-1458322493962-69c5a4ef7ddf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80",
  url: "http://artistica.gallery")
  
SeoForPage.create(
  page_identifier: SeoForPage::PageIds::ARTISTS_INDEX, 
  title: "Conoce a nuestros artistas - Artistica: galería en la nube", 
  description: "Conoce la historia de los artistas detrás de cada una de las obras publicadas en Artistica.",
  keywords: "galería, artistas, arte, pintura, escultura, fotografía, acuarela, óleo, acrílico, cuadros, lienzos, pastel, creadores, creativos",
  image_url: "https://images.unsplash.com/photo-1420802532821-8a885e88e95c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=967&q=80",
  url: "http://artistica.gallery/artistas")
  
SeoForPage.create(
  page_identifier: SeoForPage::PageIds::ARTWORKS_INDEX, 
  title: "Nuestro acervo artístico - Artistica: galería en la nube", 
  description: "Todas las obras de nuestros artistas para tu deleite.",
  keywords: "galería, artistas, arte, colección, acervo, pintura, escultura, fotografía, acuarela, óleo, acrílico, cuadros, lienzos, pastel, creadores, creativos",
  image_url: "https://images.unsplash.com/photo-1505416795390-0beeb662b1f2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1051&q=80",
  url: "http://artistica.gallery/obras")

  

