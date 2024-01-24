import 'package:flutter/material.dart';
import 'package:kw_store_app/core/color/app_color.dart';
import 'package:kw_store_app/view/utils/utils.dart';

import '../../model/company.dart';

class CompaniesScreen extends StatefulWidget {
  const CompaniesScreen({super.key});

  @override
  State<CompaniesScreen> createState() => _CompaniesScreenState();
}

class _CompaniesScreenState extends State<CompaniesScreen> {
  List<Company> _companies = List.empty();

  @override
  void initState() {
    super.initState();
    _companies = CompanyList.companies;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 24.0,
        vertical: 12.0,
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'الشركات',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontSize: 25.0,
                  ),
            ),
            const SizedBox(
              height: 37.0,
            ),
            _CompaniesListWidget(
              companies: _companies,
            ),
          ],
        ),
      ),
    );
  }
}

class _CompaniesListWidget extends StatelessWidget {
  final List<Company> companies;

  const _CompaniesListWidget({
    super.key,
    required this.companies,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) =>
          _CompanyWidget(company: companies[index]),
      separatorBuilder: (context, index) => const SizedBox(
        height: 10.0,
      ),
      itemCount: companies.length,
    );
  }
}

class _CompanyWidget extends StatelessWidget {
  final Company company;

  const _CompanyWidget({
    super.key,
    required this.company,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.all(13.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(8.0),
        border: Border.all(
          color: AppColorScheme.blackWithAlphaThird,
        ),
      ),
      child: Row(
        children: <Widget>[
          Container(
            height: 36.0,
            width: 36.0,
            constraints: const BoxConstraints(
              maxHeight: 36.0,
              maxWidth: 36.0,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  company.image,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Text(
            company.name,
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontSize: 16.0,
                ),
          ),
          const Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '${company.numberOfLikes}',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 10.0,
                      color: AppColorScheme.companyNameColor,
                    ),
              ),
              Text(
                '+',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 10.0,
                      color: AppColorScheme.companyNameColor,
                    ),
              ),
            ],
          ),
          const SizedBox(
            width: 4.0,
          ),
          const Icon(
            Icons.favorite,
            color: AppColorScheme.black,
          ),
        ],
      ),
    );
  }
}
