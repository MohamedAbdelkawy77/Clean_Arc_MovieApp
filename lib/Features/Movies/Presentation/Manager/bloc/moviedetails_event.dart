part of 'moviedetails_bloc.dart';

 class MoviedetailsEvent extends Equatable {
  const MoviedetailsEvent(this.id);
  final int id;
  @override
  List<Object> get props => [id];
}
