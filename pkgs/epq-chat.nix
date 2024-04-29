{ pkgs ? import <nixpkgs> {} }:
let
	mvn2nix = import
	(pkgs.fetchFromGitHub {
  owner = "fzakaria";
  repo = "mvn2nix";
  rev = "e27562cb6fc5b546eb8a3a6be79b7f1ac7676e4b";
  hash = "sha256-5ZnRlGhWFD3U9AzCbZ7L8Yf2lTvO81dVv138nbqHEFI=";
}
)
	{ };
	mavenRepository =
	mvn2nix.buildMavenRepositoryFromLockFile { file = ./mvn2nix-lock.json; };
	inherit (pkgs) lib stdenv jdk17_headless maven makeWrapper fetchFromGitLab;
	inherit (stdenv) mkDerivation;
in mkDerivation rec {
	pname = "epqapi";
	version = "1.1.0";
	name = "${pname}-${version}";
	src = lib.cleanSource fetchFromGitLab {
		owner = "stvnliu";
		repo = "epq-api";
		rev = "b128628f499ee89b01bb826a3534c474edf9d52a";
		hash = "sha256-dF9VeBsok4y29K28LLqlIJdgDiML51kSN6H83OL6KBc=";
	};
	nativeBuildInputs = [ jdk17_headless maven makeWrapper ];
	buildPhase = ''
		echo "Building with maven repository ${mavenRepository}"
		mvn package --offline -Dmaven.repo.local=${mavenRepository}
	'';

	installPhase = ''
# create the bin directory
		mkdir -p $out/bin

# create a symbolic link for the lib directory
		ln -s ${mavenRepository} $out/lib

# copy out the JAR
# Maven already setup the classpath to use m2 repository layout
# with the prefix of lib/
		cp target/${name}.jar $out/

# create a wrapper that will automatically set the classpath
# this should be the paths from the dependency derivation
		makeWrapper ${jdk17_headless}/bin/java $out/bin/${pname} \
		--add-flags "-jar $out/${name}.jar"
		'';
}
