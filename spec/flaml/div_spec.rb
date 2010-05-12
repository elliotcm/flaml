require File.dirname(__FILE__) + '/../spec_helper'

describe FLAML::Div do
  Div = FLAML::Div

  describe "#takes(haml_line)" do
    def self.it_returns_true
      it "returns true" do
        @div.takes(@line).should be_true
      end
    end

    before(:each) do
      @div = Div.new(mock(:line, :indentation => rand(10) + 5))
      @line = mock(:line, :empty? => false)
    end

    context "if the line is empty" do
      before(:each) do
        @line.stub(:empty? => true)
      end

      it_returns_true
    end

    context "if the line is not empty" do
      context "and the line has a higher indentation" do
        before(:each) do
          @line.stub(:indentation => @div.indentation + 1)
        end

        it_returns_true
      end

      context "and the line has a lower indentation" do
        before(:each) do
          @line.stub(:indentation => @div.indentation - 1)
        end

        it "returns false" do
          @div.takes(@line).should be_false
        end
      end
    end
  end
end
