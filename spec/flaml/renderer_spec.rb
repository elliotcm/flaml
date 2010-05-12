require File.dirname(__FILE__) + '/../spec_helper'

describe FLAML::Renderer do
  Renderer = FLAML::Renderer

  it "renders basic block elements" do
    Renderer.render("%div").should == "<div></div>"
  end

  it "renders from a File" do
    file = mock(:file)
    file.stub(:each).and_yield("%div\n")
    Renderer.render(file).should == "<div></div>"
  end

  xit "renders content nested in block elements" do
    Renderer.render
  end
end
