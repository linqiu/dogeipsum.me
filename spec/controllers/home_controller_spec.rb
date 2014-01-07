require 'spec_helper'

describe HomeController do
  describe "GET #index" do
    it "should respond with 200 status" do
      get :index

      response.should be_success
      response.status.should == 200
    end
  end

  describe "dogeipsum API" do
    context "no query params" do
      it "gives one paragraph" do
        get :wow

        response.body.scan(/[!]/).count.should == 4
      end
    end

    context "query of 2 para and 1 line" do
      it "gives 9 lines" do
        get :wow, query: { paragraphs: 2, lines: 1 }.to_json

        response.body.scan(/[!]/).count.should == 9
      end
    end
  end
end