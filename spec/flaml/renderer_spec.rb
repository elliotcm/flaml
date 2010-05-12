require File.dirname(__FILE__) + '/../spec_helper'

describe FLAML::PageRenderer do
  PageRenderer = FLAML::PageRenderer

  it "renders basic block elements" do
    PageRenderer.render("%div").should == "<div></div>\n"
  end

  it "renders from a File" do
    file = mock(:file)
    file.stub(:each).and_yield("%div\n")
    PageRenderer.render(file).should == "<div></div>\n"
  end

  it "renders content nested in block elements" do
    PageRenderer.render(File.open(FIXTURES + '/div_with_nested_content.haml')).should ==
%{<div>
  Nested content
</div>
}
  end
end
