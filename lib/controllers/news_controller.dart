import 'package:get/get.dart';
import 'package:greenvilllage/models/news.dart';
import 'package:greenvilllage/repositories/news_repository.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NewsController extends GetxController {
  RxInt currentIndex = 1.obs;

  RxBool isLoading = true.obs;

  RxList<News> newsList = <News>[].obs;

  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  void onRefresh() async {
    if (newsList.length < 10) {
      refreshController.refreshCompleted();
    } else {
      fetchApi().then((value) {
        refreshController.loadComplete();
      });
    }
  }

  void onLoading() async {
    if (newsList.length < 10) {
      refreshController.refreshCompleted();
    } else {
      currentIndex.value++;
      fetchApi().then((value) {
        refreshController.loadComplete();
      });
    }
  }

  @override
  void onInit() {
    fetchApi();
    super.onInit();
  }

  Future<void> fetchApi() async {
    final newsResponse = await newsRepository.getNews(currentIndex.value);

    newsResponse.fold((l) {
      isLoading.value = false;
      print(l);
    }, (r) {
      print(r.data);

      final data = r.data['data'].map((e) => News.fromMap(e)).toList();
      for (var item in data) {
        newsList.add(item);
      }
      isLoading.value = false;
    });
  }
}
