require_relative '../../app/lib/core_ext/integer'

RSpec.describe Integer, '#to_roman' do
  it 'converts 1' do
    expect(1.to_roman).to eql('I')
  end

  it 'converts 2' do
    expect(2.to_roman).to eql('II')
  end

  it 'converts 3' do
    expect(3.to_roman).to eql('III')
  end

  it 'converts 4' do
    expect(4.to_roman).to eql('IV')
  end

  it 'converts 5' do
    expect(5.to_roman).to eql('V')
  end

  it 'converts 6' do
    expect(6.to_roman).to eql('VI')
  end

  it 'converts 9' do
    expect(9.to_roman).to eql('IX')  
  end

  it 'converts 27' do
    expect(27.to_roman).to eql('XXVII')
  end

  it 'converts 48' do
    expect(48.to_roman).to eql('XLVIII')
  end

  it 'converts 59' do
    expect(59.to_roman).to eql('LIX')
  end

  it 'converts 163' do
    expect(163.to_roman).to eql('CLXIII')
  end

  it 'converts 402' do
    expect(402.to_roman).to eql('CDII')
  end

  it 'converts 575' do
    expect(575.to_roman).to eql('DLXXV')
  end

  it 'converts 1024' do
    expect(1024.to_roman).to eql('MXXIV')
  end

  it 'converts 3000' do
    expect(3000.to_roman).to eql('MMM')
  end

end