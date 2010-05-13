require File.dirname(__FILE__) + '/../spec_helper'

describe FLAML::Page do
  Page = FLAML::Page

  it "renders basic block elements" do
    Page.render("%div").should == "<div></div>\n"
  end

  it "renders from a File" do
    file = mock(:file)
    file.stub(:each).and_yield("%div\n")
    Page.render(file).should == "<div></div>\n"
  end

  it "renders content nested in block elements" do
    Page.render(File.open(FIXTURES + '/div_with_nested_content.haml')).
      should render_as(%{
        <div>
          Nested content
        </div>
      })
  end

  it "renders content nested deeply in block elements" do
    Page.render(File.open(FIXTURES + '/div_with_deeply_nested_content.haml')).
      should render_as(%{
        <div>
          <div>
            Nested content
          </div>
        </div>
      })
  end
end
