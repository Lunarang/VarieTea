teas = [
   {name: "Green", preparation: "Steep 3 minutes"}, 
    {name: "Lemon & Echinacea", preparation: "Steep 4 minutes"}, 
    {name: "Chamomile & Lavender", preparation: "Steep 4 minutes"}, 
    {name: "Orange Spice Black", preparation: "Steep 3-5 minutes"}, 
    {name: "Pomegranate, Blueberry, & Acai Green", preparation: "Steep 1-2 minutes"}
]
teas.each do |t|
    Tea.create!(t)
end

benefits = [
    {name: "Energizing"}, 
    {name: "Calming"}, 
    {name: "Immune Support"}, 
    {name: "Digestive Support"}, 
    {name: "Anti-Inflammatory"}
]
benefits.each do |b|
    Benefit.create!(b)
end

ingredients = [
    {name: "Lemon"}, 
    {name: "Echinacea"}, 
    {name: "Chamomile"}, 
    {name: "Lavender"}, 
    {name: "Pomegranate"}, 
    {name: "Blueberry"}, 
    {name: "Acai"}, 
    {name: "Orange Peel"}, 
    {name: "Clove"}, 
    {name: "Cinnamon"}
]
ingredients.each do |i|
    Ingredient.create!(i)
end

Tea.find(1).benefits << [Benefit.find(1), Benefit.find(5)]

Tea.find(2).benefits << Benefit.find(3)
Tea.find(2).ingredients << [Ingredient.find(1), Ingredient.find(2)]

Tea.find(3).benefits << [Benefit.find(2), Benefit.find(5)]
Tea.find(3).ingredients << [Ingredient.find(3), Ingredient.find(4)]

Tea.find(4).benefits << Benefit.find(1)
Tea.find(4).ingredients << [Ingredient.find(8), Ingredient.find(9), Ingredient.find(10)]

Tea.find(5).benefits << [Benefit.find(1), Benefit.find(5)]
Tea.find(5).ingredients << [Ingredient.find(5), Ingredient.find(6), Ingredient.find(7)]