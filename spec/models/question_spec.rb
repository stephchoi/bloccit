require 'rails_helper'

RSpec.describe Question, type: :model do
    let(:question) { Question.create!(title: "Question Title", body: "Question Body", resolved: false) }
    
    describe "attributes" do
        it "has title, body, and resolved attributes" do
            expect(question).to have_attributes(title:"Question Title", body:"Question Body", resolved:false)
        end
    end
end

