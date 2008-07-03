use inc::Module::Install;

name 'Catalyst-Plugin-Devel-ModuleVersions';
all_from 'lib/Catalyst/Plugin/Devel/ModuleVersions.pm';

test_requires 'Catalyst::Runtime';
test_requires 'Test::WWW::Mechanize::Catalyst';
test_requires 'Test::More';
test_requires 'ok';
test_requires 'Test::MockObject';

requires 'Catalyst';
requires 'Class::C3';

WriteAll();
