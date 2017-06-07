# zipfile

An LWRP for extracting zip files.

## Platforms

This is implemented in pure ruby, so it should run anywhere.

Its tests are run on CentOS and Windows.

## Resources

### zipfile

`zipfile` provides a resource for extracting zip files.

#### Actions

  * `:extract` - extract a zip file; default action

#### Attribute Parameters

Since `zipfile` will eventually support both creating and extracting zip files, its attributes are
essentially "input" and "output".

  * `from` - source for extraction; name attribute
  * `into` - destination for extraction
  * `overwrite` - whether to overwrite existing files

#### Examples

Extract `/tmp/my_stuff.zip` into the directory `/tmp/my_stuff`:

```ruby
zipfile '/my/my_stuff.zip' do
  into '/tmp/my_stuff'
end
```

## Contributing

If you wish to contribute, please update the chefspec and kitchen tests to reflect your changes.

### Tests

This cookbook has unit and integration tests to verify its functionality. Since `zipfile` has no recipes, the tests
use a testing cookbook that uses the `zipfile` resource.

### Running unit tests

```
$ bundle install
$ rake chefspec
```

### Running integration tests

The integration tests depend upon a particular zip file. It may be created by running the `package` rake task. If you
use the rake tasks to run Test Kitchen, it will take care of this for you.

```
$ rake test
```

The tests expect the content of the spec file to be the same as the file in the `pkg` directory, so any spec changes
must be followed by re-provisioning the VM.

## License

```
Copyright 2015-2017 Benjamin Jansen

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
