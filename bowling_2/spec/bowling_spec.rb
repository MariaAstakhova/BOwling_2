describe 'bowling' do
require 'bowling'

let(:line) {[[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0]]} 
let(:bowling) {Bowling.new}

    it "evaluates a line with no pins knocked down" do
        expect(bowling.score(line)).to eq(0)
    end

    it "evaluates the first frame in the line with pins knocked down" do
        line[0] = [1, 2]
        expect(bowling.score(line)).to eq(3)
    end

    it "evaluates any frame in the line with pins knocked down" do
        line[2] = [1, 2]
        expect(bowling.score(line)).to eq(3)
    end

    it "evaluates a frame in the line with spares" do
        line[0] = [8, 2] 
        line[1] = [1, 2]
        expect(bowling.score(line)).to eq(14)
    end

    it "evaluates frames in the line with two spares in a row" do
        line[0] = [8, 2] 
        line[1] = [7, 3] 
        line[2] = [1, 2] 
        expect(bowling.score(line)).to eq(31)
    end

    it "evaluates frames in the line with a strike" do
        line[0] = [10, 0] 
        line[1] = [1, 2]
        expect(bowling.score(line)).to eq(16)
    end

   it "evaluates frames in the line with two strikes in a row" do
        line[0] = [10, 0] 
        line[1] = [10, 0] 
        line[2] = [1, 2] 
        expect(bowling.score(line)).to eq(37)
    end

    it "evaluates frames in the line with three strikes in a row" do
        line[0] = [10, 0] 
        line[1] = [10, 0]
        line[2] = [10, 0] 
        line[3] = [1, 2]  
        expect(bowling.score(line)).to eq(67)
    end

    it "counts score when the last frame is a spare" do 
        line[9] = [4, 6]
        line[10] = [4]
        expect(bowling.score(line)).to eq(14)
    end

    it "counts score when the last frame is a strike" do 
        line[9] = [10]
        line[10] = [4, 2]
        expect(bowling.score(line)).to eq(16)
    end

  it "counts score when all frames are strikes" do 
        line[9] = [10]
        line[10] = [4, 2]
        expect(bowling.score(line)).to eq(16)
    end

   # [10][10][10][10][10] [10][10][10][10][10] [10][10][10]
    #30+ 30 + 30 +30 +30 + 30 +30+ 30+ 30+ +30+ 30+ 20+ 10
end