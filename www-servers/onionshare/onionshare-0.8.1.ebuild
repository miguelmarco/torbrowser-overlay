# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python2_7 )
DISTUTILS_SINGLE_IMPL=1

inherit distutils-r1 gnome2-utils

DESCRIPTION="Share a file securely and anonymously over Tor"
HOMEPAGE="https://onionshare.org/"
SRC_URI="https://github.com/micahflee/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="dev-python/flask[${PYTHON_USEDEP}]
	dev-python/PyQt4[${PYTHON_USEDEP}]
	>=net-libs/stem-1.4.0[${PYTHON_USEDEP}]
	|| ( >=net-misc/tor-0.2.7.1 www-client/torbrowser-launcher )"

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postinst() {
if [[ -z ${REPLACING_VERSIONS} ]]; then
	elog "Onionshare expects Tor to run on either port 9150, 9152 or 9050"
	elog "and a control port accessible on either port 9151, 9153 or 9051"
fi

	gnome2_icon_cache_update
}

pkg_postrm() {
	gnome2_icon_cache_update
}
