package Catalyst::Plugin::Devel::ModuleVersions;
use strict;
use warnings;

use Class::C3;

our $VERSION = '0.0001';

=head1 NAME

Catalyst::Plugin::Devel::ModuleVersions - 

=cut


=head1 INTERFACE

=head2 EXTENDED METHODS

=head3 dump_these

Uses Class::C3 to extend the catalyst dump_these, and add some more information
at the end of the debug screen, containing a list of strings that each is
"Module::Name VERSION", ala:

    "Catalyst::Plugin::Devel::ModuleVersions 0.0001"

=cut

sub dump_these {
    my $c = shift; 
     
    ($c->next::method(@_), [ "Loaded Modules" => 
        [ grep {
            defined $_
        } map { 
            my $mod = $_;
            $mod =~ s/\.pm$//;
            $mod =~ s/\//::/g;
            my $version = eval {no strict; ${"${mod}::VERSION"} };
            $version && "$version" ne "-1"
            ? $mod . " " . $version 
            :  undef
        } sort keys %INC
        ]
    ]); 
}

=head1 AUTHOR

Andreas Marienborg C<<andremar@cpan.org>>

=head1 LICENCE

This library is free software, you can redistribute it and/or modify it
under the same terms as Perl itself.


1;
