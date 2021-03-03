# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Collection.destroy_all
Product.destroy_all

puts "Creating collections"

collection_one = Collection.create!(name: "Casa")
collection_two = Collection.create!(name: "Jóias")

puts "Collections created"
puts "Creating products"

product = Product.create!(name: "Vaso de cerâmica", description: "Vaso feito à mão", price: "R$ 300,00", availability: "Em estoque", category: "Vasos e Esculturas", collection: collection_one)

puts "Products created"
