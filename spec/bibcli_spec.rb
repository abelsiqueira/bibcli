require 'bibcli'

describe Bibcli do
  describe Bibcli::Parser do
    it "test if openbib works" do
      testbib = Bibcli::Parser.openbib('spec/data/one.bib')
      expect(testbib.keys).to eq([:article])
      expect(testbib[:article].keys).to eq(["siqueira2014first"])
      expected = {:author=>"Siqueira, Abel Soares",
                  :title=>"First test",
                  :year=>"2014",
                  :journal=>"Test journal"}
      expect(testbib[:article]["siqueira2014first"]).to eq(expected)
    end

    it "test if opendb works" do
      testbib = Bibcli::Parser.opendb('spec/data/one.db')
      expect(testbib.keys).to eq(["article"])
      expect(testbib["article"].keys).to eq(["siqueira2014first"])
      expected = {"author"=>"Siqueira, Abel Soares",
                  "title"=>"First test",
                  "year"=>"2014",
                  "journal"=>"Test journal"}
      expect(testbib["article"]["siqueira2014first"]).to eq(expected)
    end
  end

  describe Bibcli::Commands do
    it "test if generate works" do
      text = '\cite{a} \citet{b} \citeauthor{c} \cite{d,e} \cite*{f}'
      expect(Bibcli::Commands::Generate.get_keys(text)).to eq(('a'..'f').to_a)
    end
  end

end
