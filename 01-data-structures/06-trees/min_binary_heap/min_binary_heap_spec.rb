include RSpec

require_relative 'min_binary_heap'

RSpec.describe MinBinaryHeap, type: Class do
  let (:root) { Node.new("The Matrix", 87) }

  let (:tree) { MinBinaryHeap.new(root) }
  let (:pacific_rim) { Node.new("Pacific Rim", 72) }
  let (:braveheart) { Node.new("Braveheart", 78) }
  let (:jedi) { Node.new("Star Wars: Return of the Jedi", 80) }
  let (:donnie) { Node.new("Donnie Darko", 85) }
  let (:inception) { Node.new("Inception", 86) }
  let (:district) { Node.new("District 9", 90) }
  let (:shawshank) { Node.new("The Shawshank Redemption", 91) }
  let (:martian) { Node.new("The Martian", 92) }
  let (:hope) { Node.new("Star Wars: A New Hope", 93) }
  let (:empire) { Node.new("Star Wars: The Empire Strikes Back", 94) }
  let (:mad_max_2) { Node.new("Mad Max 2: The Road Warrior", 98) }

  describe "#insert(root, data)" do
    it "properly inserts a new node as the left child" do
      tree.insert(root, district)
      expect(tree.tree_array[1].title).to eq "District 9"
    end

    it "properly inserts a new node as the right child" do
      tree.insert(root, district)
      tree.insert(root, shawshank)
      expect(tree.tree_array[2].title).to eq "The Shawshank Redemption"
    end

    it "properly inserts a new node as the left-left child" do
      tree.insert(root, district)
      tree.insert(root, shawshank)
      tree.insert(root, martian)
      expect(tree.tree_array[3].title).to eq "The Martian"
    end

    it "properly inserts a new node as the left-right child" do
      tree.insert(root, district)
      tree.insert(root, shawshank)
      tree.insert(root, martian)
      tree.insert(root, hope)
      expect(tree.tree_array[4].title).to eq "Star Wars: A New Hope"
    end

    it "properly inserts a new node as a replacement for the root" do
      tree.insert(root, pacific_rim)
      expect(tree.root.title).to eq "Pacific Rim"
    end

    it "properly inserts a new node as the replacement for the left child" do
      tree.insert(root, shawshank)
      tree.insert(root, martian)
      tree.insert(root, district)
      expect(tree.tree_array[1].title).to eq "District 9"
    end

    it "properly inserts a new node as the replacement for the right child" do
      tree.insert(root, shawshank)
      tree.insert(root, martian)
      tree.insert(root, hope)
      tree.insert(root, empire)
      tree.insert(root, district)
      expect(tree.tree_array[2].title).to eq "District 9"
    end
  end

  describe "#find(data)" do
    it "handles nil gracefully" do
      tree.insert(root, empire)
      tree.insert(root, mad_max_2)
      expect(tree.find(root, nil)).to eq nil
    end

    it "properly finds a left node" do
      tree.insert(root, pacific_rim)
      expect(tree.find(pacific_rim, root.title).title).to eq "The Matrix"
    end

    it "properly finds a right node" do
      tree.insert(root, district)
      tree.insert(root, shawshank)
      expect(tree.find(root, shawshank.title).title).to eq "The Shawshank Redemption"
    end
  end

  describe "#delete(data)" do
    it "handles nil gracefully" do
      expect(tree.delete(root, nil)).to eq nil
    end

    it "properly deletes a left node" do
      tree.insert(root, hope)
      tree.insert(root, pacific_rim)
      tree.delete(root, hope.title)
      expect(tree.find(root, hope.title)).to be_nil
      expect(tree.tree_array[1]).to be root
    end

    it "properly deletes a right node" do
      tree.insert(root, district)
      tree.insert(root, shawshank)
      tree.insert(root, hope)
      tree.delete(root, shawshank.title)
      expect(tree.find(root, shawshank.title)).to be_nil
      expect(tree.tree_array[2]).to be hope
    end

  end

  describe "#print" do
     specify {
       expected_output = "Pacific Rim: 72\nBraveheart: 78\nStar Wars: Return of the Jedi: 80\nThe Matrix: 87\nDistrict 9: 90\nStar Wars: The Empire Strikes Back: 94\nInception: 86\nStar Wars: A New Hope: 93\nThe Shawshank Redemption: 91\nThe Martian: 92\nMad Max 2: The Road Warrior: 98\n"
       tree.insert(root, hope)
       tree.insert(root, empire)
       tree.insert(root, jedi)
       tree.insert(root, martian)
       tree.insert(root, pacific_rim)
       tree.insert(root, inception)
       tree.insert(root, braveheart)
       tree.insert(root, shawshank)
       tree.insert(root, district)
       tree.insert(root, mad_max_2)
       tree.print(pacific_rim)
       expect { tree.print(pacific_rim) }.to output(expected_output).to_stdout
     }
  end
end
