import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_function/functions.dart';
import 'package:provider/provider.dart';
import '../../../core/core_config/config_color.dart';
import '../../Admin/screen/admin_screen.dart';
import '../../employee_create/screen/employee_create_screen.dart';
import '../../employee_edit/screen/employee_edit_screen.dart';
import '../../employee_list/widgets/employee_title_view.dart';
import '../../inventory/widgets/common_app_bar_view.dart';
import '../bloc/employee_list_bloc.dart';
import '../widgets/employee_detail_view.dart';

class EmployeeListScreen extends StatelessWidget {
  bool newScreen;
  EmployeeListScreen({
    Key? key,
    this.newScreen = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EmployeeListBloc(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: BUTTON_COLOR,
          onPressed: () {
            Functions.rightToLeftTransition(
                context, const EmployeeCreateScreen());
          },
          child: const Icon(
            Icons.add_circle_outline,
            color: WHITE_COLOR,
          ),
        ),
        appBar: PreferredSize(
          preferredSize: Size(scaleWidth(context), scaleHeight(context) / 8),
          child: CommonAppBarView(
            isEnableBack: true,
            onTapBack: () {
              if (newScreen) {
                Functions.replacementTransition(context, const AdminScreen());
              } else {
                Navigator.pop(context);
              }
            },
            title: "Employee List Page",
          ),
        ),
        body: Selector<EmployeeListBloc, bool>(
          selector: (context, bloc) => bloc.isLoading,
          builder: (context, isLoading, child) => Stack(
            children: [
              if (isLoading)
                const Center(
                  child: CircularProgressIndicator(),
                )
              else
                SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: scaleWidth(context) / 5,
                      right: scaleWidth(context) / 5,
                      top: 6,
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: APP_THEME_COLOR_TWO_REDUCE,
                          ),
                          child: EmployeeTitleView(),
                        ),
                        const SizedBox(height: 3),
                        SizedBox(
                          height: scaleHeight(context) / 1.6,
                          child: Consumer<EmployeeListBloc>(
                            builder: (context, bloc, child) => ListView.builder(
                              itemBuilder: (context, index) =>
                                  EmployeeDetailView(
                                name: bloc.employeeList?[index].name ?? "",
                                email: bloc.employeeList?[index].email ?? "",
                                salary: bloc.employeeList?[index].salary ?? 0,
                                onTap: () {
                                  Functions.editDialog(
                                    context,
                                    scaleHeight(context) / 3.4,
                                    () {
                                      Functions.rightToLeftTransition(
                                          context,
                                          EmployeeEditScreen(
                                            employeeVO:
                                                bloc.employeeList?[index],
                                          ));
                                    },
                                    () {
                                      Navigator.pop(context);
                                      Functions.toast(msg: "Cancel Editing");
                                    },
                                    "Edit Data",
                                    "Do you want to edit data?",
                                    "EDIT",
                                    "CANCEL",
                                  );
                                },
                              ),
                              itemCount: bloc.employeeList?.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: const BouncingScrollPhysics(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
