func linearSearch<T: Equatable>(_ array: [T], _ object: T) -> Int? {
    for(index, obj) in array.enumrated() where obj == object {
        return index
    }
    return nil
}

func linearSearch<T: Equatable>(_ array: [T], _ object: T) -> Array<T>.Index? {
    return array.index { $0 == object }
}
