import 'package:dio/dio.dart';
import 'package:get/get.dart' hide FormData, MultipartFile, Response;
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../data/config.dart';
import '../../../data/models/salary_by_id_model.dart';
import '../../../data/models/salary_model.dart';

class SalaryController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  var dio = Dio();
  final String userToken = GetStorage().read('access_token');

  final Rx<SalaryModel> listSalary = SalaryModel().obs;
  final Rx<SalaryModelById> listSalaryById = SalaryModelById().obs;

  Future<void> launchPDFToBrowser(int id) async {
    final Uri url = Uri.parse('${base_url}/api/${id}/pdf');
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
      webViewConfiguration: WebViewConfiguration(
        enableJavaScript: true,
        enableDomStorage: true,
      ),
    )) {
      throw 'Could not launch url';
    }
  }

  Future<SalaryModelById> getSalaryById(int? id) async {
    dio.options.headers['Authorization'] = "Bearer $userToken";
    dio.options.headers['Accept'] = 'application/json';
    dio.options.headers["Content-Type"] = "multipart/form-data";

    Response response = await dio.get("${getSalaryUrl}/${id}").then(
      (value) {
        return value;
      },
    ).catchError(
      (error) {
        print(error.toString());
      },
    );

    if (response.statusCode == 200) {
      listSalaryById.value = SalaryModelById.fromJson(response.data);
    }

    return listSalaryById.value = SalaryModelById.fromJson(response.data);
  }

  Future<SalaryModel> getSalary() async {
    dio.options.headers['Authorization'] = "Bearer $userToken";
    dio.options.headers['Accept'] = 'application/json';
    dio.options.headers["Content-Type"] = "multipart/form-data";

    Response response = await dio.get(getSalaryUrl).then(
      (value) {
        return value;
      },
    ).catchError(
      (error) {
        print(error.toString());
      },
    );

    if (response.statusCode == 200) {
      listSalary.value = SalaryModel.fromJson(response.data);
    }

    return listSalary.value = SalaryModel.fromJson(response.data);
  }
}
