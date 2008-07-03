package TestApp::Controller::Root;
use strict;
use warnings;

__PACKAGE__->config(namespace => q{});

use base 'Catalyst::Controller';

# your actions replace this one
sub main :Path { die "forced debug" }

1;
