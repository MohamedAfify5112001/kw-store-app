import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kw_store_app/core/color/app_color.dart';
import 'package:kw_store_app/model/product.dart';
import 'package:kw_store_app/view/details/bloc/details_controller_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  Product _product = Product.empty();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _product = ModalRoute.of(context)!.settings.arguments as Product;
  }

  DetailsControllerBloc get _bloc =>
      BlocProvider.of<DetailsControllerBloc>(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20.0),
        child: BlocListener<DetailsControllerBloc, DetailsControllerState>(
          listener: (context, state) {
            if (state is AddProductToCartSuccessState) {
              showTopSnackBar(
                Overlay.of(context),
                const CustomSnackBar.success(
                  message: "تمت العملية بنجاح",
                ),
              );
            } else if (state is AddProductToCartFailureState) {
              showTopSnackBar(
                Overlay.of(context),
                const CustomSnackBar.error(
                  message: "لم تتم العملية بنجاح",
                ),
              );
            }
          },
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => _bloc.add(
                    AddProductToCartEvent(product: _product),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColorScheme.black,
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    child: Text(
                      'الذهاب الى الشراء',
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            color: AppColorScheme.white,
                            fontSize: 12.0,
                          ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 28.0,
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColorScheme.addFavColorBg,
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    child: Text(
                      'أضف الى المفضلة',
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            color: AppColorScheme.black,
                            fontSize: 12.0,
                          ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        physics: const BouncingScrollPhysics(),
        child: FractionallySizedBox(
          widthFactor: 1.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  _product.image,
                  fit: BoxFit.cover,
                  width: 250.0,
                  height: 250.0,
                ),
              ),
              const SizedBox(height: 10.0),
              Directionality(
                textDirection: TextDirection.ltr,
                child: Text(
                  _product.name,
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontSize: 16.0,
                      ),
                ),
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${_product.salaryAfterDiscount} دينار',
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          fontSize: 12.0,
                        ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    '${_product.salary} دينار',
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          decoration: TextDecoration.lineThrough,
                          fontSize: 12.0,
                          color: AppColorScheme.greyCategory,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
