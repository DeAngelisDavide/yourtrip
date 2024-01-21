import 'package:country_code_picker/country_code_picker.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yourtrip/Control/SingletonCurrecny.dart';
import 'package:yourtrip/Control/SingletonLanguage.dart';
import 'package:yourtrip/Extension/DeviceInfo.dart';
import 'package:yourtrip/Extension/Style.dart';
import 'package:yourtrip/Model/ActualCurrency.dart';
import 'package:yourtrip/Widgets/CustomContainer.dart';

import '../Widgets/AdsWidget.dart';
import '../Widgets/CustomAppBar.dart';
import '../Widgets/Navbar.dart';
import '../generated/l10n.dart';

class Settings extends StatelessWidget {
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: SingletonCurrency.getInstance(),
      child: SettingsProvider(),
    );
  }
}

class SettingsProvider extends StatelessWidget{

  Widget build (BuildContext context) {
    final provider = Provider.of<ActualCurrency>(context, listen: false);
    return Scaffold(
      appBar: CustomAppBar(
        text: S.current.settingsAppBar,
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                showCurrencyPicker(
                  context: context,
                  showFlag: true,
                  showCurrencyName: true,
                  showCurrencyCode: true,
                  onSelect: (Currency currency) {
                    provider.setActualCurrency(currency.symbol);
                  },
                );
              },
              child: CustomContainer(
                widht: 96.ph(context),
                height: DeviceType.mobile.lenghtEquals(context)?9.pv(context):11.pv(context),
                child: LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraint) {
                  return Padding(
                      padding:
                          EdgeInsets.only(left: constraint.maxWidth * 0.02),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              S.current.selectYourCurrency,
                              style: Theme.of(context).textTheme.header1(
                                  context: context,
                                  color: Theme.of(context).colorScheme.primary),
                            ),
                            Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [Consumer<ActualCurrency>(
                                        builder: (_, value, __) =>
                                            Text(value.actualCurrency,
                                                style: Theme.of(context).textTheme.header2(
                                                    context: context,
                                                    constraint: constraint,
                                                    color: Theme.of(context).colorScheme.primary))),
                                      Padding(padding: EdgeInsets.only(left: 7.8.ph(context))),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: DeviceType.mobile.lenghtEquals(context)
                                            ? (constraint.maxWidth * 25) / 100 * 0.2
                                            : (constraint.maxWidth * 27) / 100 * 0.1,
                                        color: Theme.of(context).colorScheme.primary,
                                      )
                                    ]))
                          ]));
                }),
              ),
            ),
            CustomContainer(
                widht: 96.ph(context),
                height: DeviceType.mobile.lenghtEquals(context)?9.pv(context):11.pv(context),
                child: CountryCodePicker(
                  countryFilter: const ['SA', 'DE', 'GB', 'US', 'FR', 'IT', 'PT', 'CN'],
                  onChanged: (element) => _onCountryChange(element),
                  builder: (element) {
                    return LayoutBuilder(builder:
                        (BuildContext context, BoxConstraints constraint) {
                      return Padding(
                          padding:
                              EdgeInsets.only(left: constraint.maxWidth * 0.02),
                          child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                Text(
                                  S.current.chageLeanguages,
                                  style: Theme.of(context).textTheme.header1(
                                      context: context,
                                      color: Theme.of(context).colorScheme.primary),
                                ),
                                Container(
                                    height: DeviceType.mobile.lenghtEquals(context)
                                        ? (constraint.maxWidth * 27) / 100 * 0.2
                                        : (constraint.maxWidth * 29) / 100 * 0.3,
                                    child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [element?.flagUri != null
                                            ? Image.asset(
                                            "${SingletonLanguage.getInstance().flagUri}",
                                            package: 'country_code_picker')
                                            : const Icon(Icons.flag),
                                          Padding(padding: EdgeInsets.only(left: 5.ph(context))),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            size: DeviceType.mobile.lenghtEquals(context)
                                                ? (constraint.maxWidth * 25) / 100 * 0.2
                                                : (constraint.maxWidth * 27) / 100 * 0.1,
                                            color: Theme.of(context).colorScheme.primary,
                                          )]))
                                  ]));
                    });
                  },
                  showCountryOnly: true,
                  showOnlyCountryWhenClosed: true,
                  showDropDownButton: true,
                )),
             AdsWidget(
                  widht: 96.ph(context),
                  height:DeviceType.mobile.lenghtEquals(context)?9.pv(context):11.pv(context)
                ),
          ],
        ),
      )),
      bottomNavigationBar: Navbar(3),
    );
  }

void _onCountryChange(CountryCode countryCode) {
  SingletonLanguage.getInstance().setLanguage(countryCode);
}
}
