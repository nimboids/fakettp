require File.dirname(__FILE__) + '/../spec_helper'

describe Fakettp::Expectation do
  before :all do
    @expectation_dir = File.join FAKETTP_BASE, 'expectations'
    FileUtils.mkdir_p @expectation_dir
  end
  
  def setup_files *names
    FileUtils.rm_rf Dir.glob(File.join(@expectation_dir, '*'))
    names.each do |name|
      FileUtils.touch File.join(@expectation_dir, name)
    end
  end
  
  describe 'clearing all expectations' do
    before do
      setup_files '1', '2'
    end
    
    it 'should remove the contents of tmp/expectations' do
      Fakettp::Expectation.clear_all
      Dir.glob(File.join(@expectation_dir, '**', '*')).should be_empty
    end
  end
  
  describe 'adding an expectation' do
    describe 'when there are existing expectations' do
      before do
        setup_files '1', '2'
      end
    
      it 'should copy the supplied code to the next numbered expectation' do
        expectation = "foo\nbar"
        Fakettp::Expectation << expectation
        File.read(File.join(@expectation_dir, '3')).should == expectation
      end
    end
    
    describe 'when there are no existing expectations' do
      before do
        setup_files
      end

      it 'should start at 1' do
        expectation = "foo\nbar"
        Fakettp::Expectation << expectation
        File.read(File.join(@expectation_dir, '1')).should == expectation
      end
    end
  end
  
  describe 'getting the next expectation' do
    describe 'when there are remaining expectations' do
      before do
        setup_files '3', '4'
        @contents = "foo\nbar"
        File.open File.join(@expectation_dir, '2'), 'w' do |f|
          f.write @contents
        end
      end
  
      it 'should return an expectation with the contents of the first file' do
        expectation = stub :expectation
        Fakettp::Expectation.stub!(:new).with(@contents).and_return expectation
        Fakettp::Expectation.next.should == expectation
      end
    
      it 'should delete the file' do
        Fakettp::Expectation.next
        File.exist?(File.join(@expectation_dir, '2')).should be_false
      end
    end

    describe 'when there are no remaining expectations' do
      before do
        setup_files
      end
      
      it 'should raise an error' do
        lambda {Fakettp::Expectation.next}.should raise_error(Fakettp::Expectation::Error)
      end
    end
  end
  
  describe 'executing' do
    it 'should eval the expectation code' do
      Fakettp::Expectation.new('2 + 2').execute.should == 4
    end
  end
end