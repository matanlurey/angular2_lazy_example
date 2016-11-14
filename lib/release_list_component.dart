import 'dart:html';
import 'dart:convert';

import 'package:angular2/angular2.dart';

@Component(
  selector: 'release-list',
  templateUrl: 'release_list_component.html',
  styleUrls: const ['release_list_component.css'],
)
class ReleaseListComponent implements OnInit {
  static const _apiUrl = 'https://api.github.com/repos/dart-lang/angular2/tags';

  List<GithubTag> releases = const [];

  @override
  ngOnInit() async {
    final tags = JSON.decode(await HttpRequest.getString(_apiUrl));
    releases = (tags as List<Map>)
        .map((t) => new GithubTag(t['name'], t['commit']['url']))
        .toList();
  }
}

class GithubTag {
  final String name;
  final String url;

  GithubTag(this.name, this.url);
}
