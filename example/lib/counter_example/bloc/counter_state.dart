// ignore_for_file:  sort_constructors_first
// ignore_for_file: public_member_api_docs, sort_constructors_firs

class CounterState {
  final int countValue;
  CounterState({required this.countValue});

  @override
  bool operator ==(covariant CounterState other) {
    if (identical(this, other)) return true;

    return other.countValue == countValue;
  }

  @override
  int get hashCode => countValue.hashCode;
  CounterState copyWith({int? countValue}) {
    return CounterState(countValue: countValue ?? this.countValue);
  }
}
