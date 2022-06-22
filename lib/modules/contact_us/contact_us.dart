import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlineauction/modules/contact_us/cubit/cubit.dart';
import 'package:onlineauction/modules/contact_us/cubit/states.dart';
import 'package:onlineauction/shared/components/components.dart';
import 'package:onlineauction/shared/styles/colors.dart';

class ContactUsScreen extends StatelessWidget {
  var FullNameController = TextEditingController();
  var EmailController = TextEditingController();
  var PhoneController = TextEditingController();
  var MessageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContactCubit(),
      child: BlocConsumer<ContactCubit, ContactsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: defaultColor,
              appBar: AppBar(
                backgroundColor: defaultColor,
                title: Text('Contact Us'),
                centerTitle: true,
              ),
              drawer: DrawerItem(context),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  defaultFormField(
                      controller: FullNameController,
                      type: TextInputType.name,
                      validate: (String? value) {},
                      label: 'Full Name',
                      prefix: Icons.person),
                  SizedBox(
                    height: 15,
                  ),
                  defaultFormField(
                      controller: EmailController,
                      type: TextInputType.name,
                      validate: (String? value) {},
                      label: 'Email',
                      prefix: Icons.email),
                  SizedBox(
                    height: 15,
                  ),
                  defaultFormField(
                      controller: PhoneController,
                      type: TextInputType.name,
                      validate: (String? value) {},
                      label: 'Subject',
                      prefix: Icons.subject),
                  SizedBox(
                    height: 15,
                  ),
                  defaultFormField(
                      controller: MessageController,
                      type: TextInputType.multiline,
                      validate: (String? value) {},
                      label: 'Message',
                      lines: 4,
                      prefix: Icons.message),
                  SizedBox(
                    height: 15,
                  ),
                  defaultButton(
                      function: () {
                        ContactCubit.get(context).SendRequest(
                            name: FullNameController.text,
                            email: EmailController.text,
                            subject: PhoneController.text,
                            message: MessageController.text,
                            context: context);
                      },
                      text: 'Send Message',
                      radius: 12,
                      width: 190),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
