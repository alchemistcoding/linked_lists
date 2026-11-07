require_relative '../linked_lists'

describe LinkedList do
  context 'creating a linked list' do
    subject(:linked_list) {described_class.new(1)}
    it 'return 1 for value' do
      expect(linked_list.list.value).to eq(1)
    end

    it 'return nil for next_node' do
      expect(linked_list.list.next_node).to eq(nil)
    end
  end

  context '#append' do
    subject(:append_list) {described_class.new(1) }
    
    it 'return next_node.value 2 when append(2)' do
      append_list.append(2)
      expect(append_list.list.next_node.value).to eq(2)
    end

    it 'it return next_node.next_node nil' do
      append_list.append(2)
      expect(append_list.list.next_node.next_node).to eq(nil)
    end
  end

  context '#prepend' do
    subject(:prepend_list) {described_class.new('a')}
    
    it 'return b for list.value' do
      prepend_list.prepend('b')
      expect(prepend_list.list.value).to eq('b')
    end

    it 'return a for next value' do
      prepend_list.prepend('b')
      expect(prepend_list.list.next_node.value).to eq('a')
    end

    it 'return nil for next next node' do
      prepend_list.prepend('b')
      expect(prepend_list.list.next_node.next_node).to eq(nil)
    end
  end

  context '#size' do
    subject(:size_list) {described_class.new('a')}

    it 'return 1' do
      expect(size_list.size).to eq(1)
    end
    
    it 'return 3' do
      size_list.append(1)
      size_list.append(2)

      expect(size_list.size).to eq(3)
    end
  end

  context '#head' do
    context 'when list is empty' do
      subject(:head_list) {described_class.new()}

      it 'return nil' do
        expect(head_list.head).to eq(nil)
      end
    end

    context 'when list first letter is a' do
      subject(:a_list) {described_class.new('a')}

      it 'return a' do
        expect(a_list.head).to eq('a')
      end
    end

    context 'when list first letter is a' do
      subject(:c_list) {described_class.new('a')}

      it 'return c' do
        c_list.append('b')
        c_list.prepend('c')
        expect(c_list.head).to eq('c')
      end
    end
  end

  context '#tail' do
    context 'when list is empty' do
      subject(:tail_list) {described_class.new()}
      it 'return nil' do
        expect(tail_list.tail).to eq(nil)
      end
    end

    context 'when list first letter is a' do
      subject(:a_list) {described_class.new('a')}

      it 'return a' do
        expect(a_list.tail).to eq('a')
      end
    end

    context 'when list first letter is a' do
      subject(:d_list) {described_class.new('a')}

      it 'return d' do
        d_list.append('b')
        d_list.prepend('c')
        d_list.append('d')
        expect(d_list.tail).to eq('d')
      end
    end
  end

  context '#at' do
    subject(:at_list) {described_class.new(1)}
    
    it 'return 2' do
      at_list.append(2)
      at_list.append('a')
      at_list.append('b')
      at_list.append('c')
      expect(at_list.at(1)).to eq(2)
    end

    it 'return b' do
      at_list.append(2)
      at_list.append('a')
      at_list.append('b')
      at_list.append('c')
      expect(at_list.at(3)).to eq('b')
    end

    it 'return nil' do
      at_list.append(2)
      at_list.append('a')
      at_list.append('b')
      at_list.append('c')
      expect(at_list.at(5)).to eq(nil)
    end
  end

  context '#pop' do
    subject(:pop_list) {described_class.new('a')}

    it 'return a' do
      pop_list.append('b')
      pop_list.append('c')
      expect(pop_list.pop).to eq('a')
    end

    it 'return b for head' do
      pop_list.append('b')
      pop_list.append('c')
      pop_list.pop
      expect(pop_list.head).to eq('b')
    end
  end

  context '#contains?' do
    subject(:contains_list) {described_class.new(1)}

    it 'return true for 1' do
      contains_list.append(2)
      contains_list.append(3)
      contains_list.prepend('a')
      expect(contains_list.contains?(1)).to eq true
    end

    it 'return ture for a' do
      contains_list.append(2)
      contains_list.append(3)
      contains_list.prepend('a')
      expect(contains_list.contains?('a')).to eq true
    end

    it 'return false for c' do
      contains_list.append(2)
      contains_list.append(3)
      contains_list.prepend('a')
      expect(contains_list.contains?('c')).to eq false
    end

    it 'return false for 10' do
      contains_list.append(2)
      contains_list.append(3)
      contains_list.prepend('a')
      expect(contains_list.contains?(10)).to eq false
    end
  end

  context '#index' do
    subject(:index_list) {described_class.new(1)}

    it 'return 1 for 1' do
      index_list.append(2)
      index_list.append('a')
      index_list.prepend(4)
      expect(index_list.index(1)).to eq(1)
    end

    it 'return 3' do
      index_list.append(2)
      index_list.append('a')
      index_list.prepend(4)
      expect(index_list.index('a')).to eq(3)
    end 

    it 'return nil' do
      index_list.append(2)
      index_list.append('a')
      index_list.prepend(4)
      expect(index_list.index('k')).to eq(nil)
    end
  end

  context '#to_s' do
    subject(:s_list) {described_class.new(1)}

    it 'return the string' do
      s_list.append(2)
      s_list.append('a')
      s_list.append('b')
      s_list.append('c')
      expect(s_list.to_s).to eq('( 1 ) -> ( 2 ) -> ( a ) -> ( b ) -> ( c ) -> nil')
    end
  end
end