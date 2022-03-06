{ curl,
  fetchurl,
  pcre2,
  php,
  php74
}:

let
  datadog_trace = php.buildPecl rec {
      pname = "ddtrace";
      version = "0.70.0";

      src = fetchurl {
        url = "http://pecl.php.net/get/datadog_trace-${version}.tgz";
        sha256 = "s1uJNAP7LI6FmNIcitCJaoRxTgceWOopIHQH9PkZ6vI=";
      };

      buildInputs = [ curl pcre2 ];
  };
in php74.buildEnv {
  extensions = { all, enabled }:
    enabled ++ (with all; [
        imap
        exif
        gd
        intl
        mysqli
        opcache
        soap
        bcmath
        xmlrpc
        zip
        imap
        sockets
        igbinary
        redis
        pdo_odbc

        # custom exts
        datadog_trace
    ]);
}

# https://ryantm.github.io/nixpkgs/languages-frameworks/php/