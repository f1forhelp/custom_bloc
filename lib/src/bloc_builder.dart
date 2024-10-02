part of 'bloc.dart';

class BlocBuilder<T extends Bloc<S>, S> extends StatelessWidget {
  final Widget Function(BuildContext context, S state) builder;

  const BlocBuilder({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<T>(context);
    return StreamBuilder<S>(
      initialData: bloc.state,
      stream: bloc._controller.stream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox();
        }

        return builder(
          context,
          snapshot.data as S,
        );
      },
    );
  }
}
