import 'package:flutter/material.dart';
import 'package:flutter_abdan_rpl3/navigation/menu.dart';
import 'package:flutter_abdan_rpl3/gridview/grid_latihan_widget.dart';
import 'package:flutter_abdan_rpl3/listview_widget/latihan_list_widget.dart';
import 'package:flutter_abdan_rpl3/listview_widget/list_basic.dart';
import 'package:flutter_abdan_rpl3/container_widget/latihan_container.dart';
import 'package:flutter_abdan_rpl3/pages/album_page.dart';
import 'package:flutter_abdan_rpl3/pages/formulir_input_page.dart';
import 'package:flutter_abdan_rpl3/pages/latihan_formulir_input_page.dart';
import 'package:flutter_abdan_rpl3/row_column.dart/row_column.dart';
import 'package:flutter_abdan_rpl3/sized_box_stack_expanded_position/SizeBoxWidget.dart';

class AppRoute {
  static const menu = '/';
  static const list = '/list';
  static const grid = '/grid';
  static const listBasic = '/list-basic';
  static const gridview = '/gridview';
  static const containerWidget = '/latihan_container';
  static const rowColumn = '/row_column';
  static const sizedBox = '/sized_box';
  static const formEkskul = '/form_ekskul';
  static const formPpdb = '/formppdb';
  static const albumpage = '/album_page';


  static Map<String, WidgetBuilder> routes = {
    menu: (context) => MenuNav(),
    grid: (context) => GridLatihanWidget(),
    gridview: (context) => GridLatihanWidget(),
    list: (context) => latihanlistwidget(),
    listBasic: (context) => ListBasic(),
    containerWidget: (context) => LatihanContainer(),
    formEkskul: (context) => const FormEkskul(),
    formPpdb: (context) => const FormPpdb(),

    rowColumn: (context) => RowColumnWidget(),
    sizedBox: (context) => SizedBoxWidget(),
    albumpage: (context) => AlbumPage(),
  };
}