require 'rails_helper'

RSpec.describe Entry, :type => :model do
  let(:entry) {
    Entry.create(
      date: "2018/07/07",
      comments: "Good workout.",
      journal: journal
    )
  }
  let(:journal) {
    Journal.create(name: "Test Journal")
  }

  it 'is valid with date and comment' do
    expect(entry).to be_valid
  end

  it 'belongs to a journal' do
    expect(entry.journal).to eq(journal)
  end

end
