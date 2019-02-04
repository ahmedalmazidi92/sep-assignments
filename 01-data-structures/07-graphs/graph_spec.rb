include RSpec

require_relative 'graph'

RSpec.describe Graph, type: Class do
  let (:kevin_bacon) { Node.new("Kevin Bacon") }
  let (:graph) { Graph.new(kevin_bacon) }

  # Footloose
  let (:lori_singer) { Node.new("Lori Singer") }
  let (:sarah_jessica_parker) { Node.new("Sarah Jessica Parker") }
  let (:john_lithgow) { Node.new("John Lithgow") }

  # The Man with One Red Shoe
  let (:tom_hanks) { Node.new("Tom Hanks") }
  let (:carrie_fisher) { Node.new("Carrie Fisher") }
  let (:jim_belushi) { Node.new("Jim Belushi") }

  # Apollo 13
  let (:bill_paxton) { Node.new("Bill Paxton") }
  let (:gary_sinise) { Node.new("Gary Sinise") }

  # Star Wars
  let (:mark_hamill) { Node.new("Mark Hamill") }
  let (:harrison_ford) { Node.new("Harrison Ford") }
  let (:anthony_daniels) { Node.new("Anthony Daniels") }

  # Slipstream
  let (:ben_kingsley) { Node.new("Ben Kingsley") }

  let (:super_mario) { Node.new("Super Mario") }

  before (:each) do
    kevin_bacon.add_film('Footloose', [lori_singer, sarah_jessica_parker, john_lithgow])
    lori_singer.add_film('The Man with One Red Shoe', [tom_hanks, carrie_fisher, jim_belushi])
    carrie_fisher.add_film('Star Wars', [mark_hamill, harrison_ford, anthony_daniels])
    mark_hamill.add_film('Slipstream', [bill_paxton, ben_kingsley])
    tom_hanks.add_film('Apollo 13', [kevin_bacon, bill_paxton, gary_sinise])
  end

  describe "#find_kevin_bacon(actor)" do
    it "returns an empty array if actor is Kevin Bacon" do
      expect(graph.find_kevin_bacon(kevin_bacon)).to eq []
    end

    it "returns an error message if we couldn't find Kevin Bacon" do
      expect(graph.find_kevin_bacon(super_mario)).to eq "Could not find Kevin Bacon"
    end

    it "returns an array containing Footloose for Lori Singer" do
      expect(graph.find_kevin_bacon(lori_singer)).to eq ['Footloose']
    end

    it "returns an array of 2 movies that connect Carrie Fisher to Kevin Bacon" do
      expect(graph.find_kevin_bacon(carrie_fisher)).to eq ['The Man with One Red Shoe', 'Apollo 13']
    end

    it "returns an array of 2 movies that connect Ben Kingsley to Kevin Bacon" do
      expect(graph.find_kevin_bacon(ben_kingsley)).to eq ['Slipstream', 'Apollo 13']
    end

    it "returns an array of 3 movies that connect Anthony Daniels to Kevin Bacon" do
      expect(graph.find_kevin_bacon(anthony_daniels)).to eq ['Star Wars', 'Slipstream', 'Apollo 13']
    end
  end
end
