// Copyright (c) 2016, . All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular2/core.dart';

import 'release_list_component.dart' deferred as release_list;

@Component(
  selector: 'my-app',
  styleUrls: const ['app_component.css'],
  templateUrl: 'app_component.html',
)
class AppComponent implements OnInit {
  final DynamicComponentLoader _loader;
  final ViewContainerRef _location;

  AppComponent(this._loader, this._location);

  @override
  ngOnInit() async {
    await release_list.loadLibrary();
    _loader.loadNextToLocation(release_list.ReleaseListComponent, _location);
  }
}
