import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:task_one/provider/todo_provider.dart';
import 'package:task_one/utils/widgets/app_colors/app_colors.dart';
import 'package:task_one/utils/widgets/roundbutton.dart';
import 'package:task_one/utils/widgets/text_styles.dart/app_text_style.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final databasecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoProvider>(
      builder: (context, todoProvider, child) {
        return ModalProgressHUD(
          inAsyncCall: todoProvider.isLoading,
          progressIndicator: const CircularProgressIndicator(),
          child: Scaffold(
            backgroundColor: Colors.grey.shade300,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: true,
              title: Text(
                'Write Todo',
                style:
                    AppTextStyle.defaulttextsize.copyWith(color: Colors.black),
              ),
              backgroundColor: AppColors.backgroundcolor,
            ),
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: databasecontroller,
                    decoration: const InputDecoration(
                      hintText: 'Write Today Todo',
                      fillColor: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Button(
                    title: 'Set Todo',
                    ontap: () async {
                      FocusScope.of(context).unfocus();
                      await todoProvider
                          .addTodo(databasecontroller.text.toString());
                      Navigator.pop(context);
                    },
                    bgcolor: AppColors.backgroundcolor.withOpacity(0.6),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
