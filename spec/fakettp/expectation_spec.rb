require File.dirname(__FILE__) + '/../spec_helper'

describe Fakettp::Expectation do
  before do
    Fakettp::Expectation.delete_all
  end
  
  it 'should be an ActiveRecord' do
    Fakettp::Expectation.new.should be_a_kind_of(ActiveRecord::Base)
  end
  
  it 'should store its contents' do
    Fakettp::Expectation.create(:contents => 'foo').contents.should == 'foo'
  end
  
  it 'should track whether it has been executed' do
    Fakettp::Expectation.create(:executed => true).executed.should == true
  end
  
  it 'should start out unexecuted' do
    Fakettp::Expectation.create.executed.should be_false
  end
  
  describe 'checking whether all expected requests have been received' do
    describe 'when there are no expectations' do
      before do
        Fakettp::Expectation.delete_all
      end
      
      it 'should return true' do
        Fakettp::Expectation.should be_all_received
      end
    end

    describe "when there are expectations that haven't been run" do
      before do
        Fakettp::Expectation.create! :executed => true
        Fakettp::Expectation.create! :executed => false
      end
      
      it 'should return false' do
        Fakettp::Expectation.should_not be_all_received
      end
    end

    describe "when all expectations have been run" do
      before do
        Fakettp::Expectation.create! :executed => true
        Fakettp::Expectation.create! :executed => true
      end
      
      it 'should return true' do
        Fakettp::Expectation.should be_all_received
      end
    end
  end
  
  describe 'getting the next expectation' do
    describe 'when there are expectations' do
      before do
        @expectation_1 = Fakettp::Expectation.create :executed => true
        @expectation_2 = Fakettp::Expectation.create :executed => false
        @expectation_3 = Fakettp::Expectation.create :executed => false
      end
  
      it 'should return the first unexecuted expectation' do
        Fakettp::Expectation.next.should == @expectation_2
      end
    end

    describe 'when there are no expectations' do
      before do
        Fakettp::Expectation.delete_all
      end
      
      it 'should raise an error' do
        lambda { Fakettp::Expectation.next }.should raise_error(Fakettp::Expectation::Error,
            'Received unexpected request')
      end
    end
  end
  
  describe 'rendering itself' do
    it 'should show its contents' do
      Fakettp::Expectation.new(:contents => 'foo').render.should == 'foo'
    end
  end
  
  describe 'executing' do
    it 'should eval the expectation code in the context of the supplied binding' do
      def getBinding(n)
        return binding
      end
      Fakettp::Expectation.new(:contents => 'n + 2').execute(getBinding(2)).should == 4
    end
    
    it 'should mark itself as executed' do
      expectation = Fakettp::Expectation.create! :contents => ''
      expectation.execute binding
      expectation.reload
      expectation.executed.should be_true
    end
  end
end
