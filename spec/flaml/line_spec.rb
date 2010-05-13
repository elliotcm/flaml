require File.dirname(__FILE__) + '/../spec_helper'

describe FLAML::Line do
  Line = FLAML::Line
  
  describe "#new" do
    it "gets the indentation level from the line string" do
      Line.new("%div").indentation.should == 0
      Line.new("   %div").indentation.should == 3
      Line.new("     %div").indentation.should == 5
    end
    
    it "sets the line body to everything after the leading whitespace" do
      Line.new("").instance_variable_get('@body').
        should == ""

      Line.new("%div").instance_variable_get('@body').
        should == "%div"

      Line.new("   %div Some content").instance_variable_get('@body').
        should == "%div Some content"

      Line.new("   %div").instance_variable_get('@body').
        should == "%div"
    end
    
    it "marks a line with no body as empty" do
      Line.new("").should be_empty
    end
    
    it "marks a line with an opener tag as an element" do
      Line.new("%ul").should be_an_element
    end
    
    it "sets content to anything after whitespace after a tag definition" do
      Line.new(" %div Some content").content.should == "Some content"
    end
  end
  
  describe "#single_line?" do
    context "an element" do
      context "with no content" do
        before(:each) do
          @line = Line.new("%div")
        end

        it "is false" do
          @line.should_not be_a_single_line
        end
      end

      context "with content" do
        before(:each) do
          @line = Line.new("%div An element with content")
        end

        it "is true" do
          @line.should be_a_single_line
        end
      end
    end
    
    context "not an element" do
      before(:each) do
        @line = Line.new("Not an element")
      end
      
      it "is false" do
        @line.should_not be_a_single_line
      end
    end
  end
end
