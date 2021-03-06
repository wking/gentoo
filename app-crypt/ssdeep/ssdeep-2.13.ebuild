# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools multilib-minimal

DESCRIPTION="Computes context triggered piecewise hashes (fuzzy hashes)"
HOMEPAGE="http://ssdeep.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="static-libs"

DOCS=(
	AUTHORS ChangeLog FILEFORMAT NEWS README TODO
)

PATCHES=(
	"${FILESDIR}/${PN}-2.10-shared.patch"
)

src_prepare() {
	default
	eautoreconf
}

multilib_src_configure() {
	ECONF_SOURCE=${S} \
		econf
}
