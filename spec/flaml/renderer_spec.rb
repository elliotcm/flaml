require File.dirname(__FILE__) + '/../spec_helper'

describe FLAML::Renderer do
  Renderer = FLAML::Renderer

  it "renders divs" do
    Renderer.render("%div").should == "<div></div>"
  end
end
