import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/bloc/switch_example/switch_bloc.dart';
import 'package:learning_bloc/bloc/switch_example/switch_event.dart';
import 'package:learning_bloc/bloc/switch_example/switch_state.dart';

class SwitchExampleBloc extends StatefulWidget {
  const SwitchExampleBloc({super.key});

  @override
  State<SwitchExampleBloc> createState() => _SwitchExampleBlocState();
}

class _SwitchExampleBlocState extends State<SwitchExampleBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Example Two"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Notification"),
                BlocBuilder<SwitchBloc, SwitchState>(
                  builder: (context, state) {
                    return Switch(
                        value: state.isSwitch,
                        onChanged: (newValue) {
                          context
                              .read<SwitchBloc>()
                              .add(EnableOrDisableNotification());
                        });
                  },
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
              builder: (context, state) {
                return Container(
                  height: 200,
                  color: Colors.red.withOpacity(state.slider),
                );
              },
            ),
            SizedBox(
              height: 30,
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
              builder: (context, state) {
                return Slider(
                    value: state.slider,
                    onChanged: (newValue) {
                      context
                          .read<SwitchBloc>()
                          .add(SliderEvent(slider: newValue));
                    });
              },
            )
          ],
        ),
      ),
    );
  }
}
