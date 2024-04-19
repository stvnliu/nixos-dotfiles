{config, libs, pkgs, ...}:
{
	environment.systemPackages = with pkgs; [
		dmenu
		(st.overrideAttrs (oldAttrs: rec {
			patches = [
			(fetchpatch {
				url = "https://st.suckless.org/patches/anysize/st-expected-anysize-0.9.diff";
				sha256 = "04gvkf80lhaiwyv3m7fdkf81msf8al1kfb7inx1bf02ygx9152v2";
				}
			)
			(fetchpatch {
				url = "https://st.suckless.org/patches/gruvbox/st-gruvbox-dark-0.8.5.diff";
				sha256 = "0jvn0i0fl0w3c8dcmwyh9w19g3hsi22cqmyqly5zjzjwjhc8qnjv";
			})
			(fetchpatch {
				url = "https://st.suckless.org/patches/alpha/st-alpha-osc11-20220222-0.8.5.diff";
				sha256 = "0vhnjjwzx6skbh8zs47arsb0yk5m8c5maxbiiwsa4ajzccrapbbx";
			})
			];
		}))
		slstatus
		dunst
		libnotify
		(
		where-is-my-sddm-theme.override {
		 	themeConfig.General = {
		 	background = "./login.jpg";
		 	backgroundMode = "fill";
		 	};
		 }
		)

	];
}
