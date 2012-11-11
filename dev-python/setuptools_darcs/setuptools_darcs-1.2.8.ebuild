# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="Setuptools plugin for darcs"
HOMEPAGE="http://allmydata.org/trac/setuptools_darcs"
SRC_URI="http://pypi.python.org/packages/source/s/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools"

RESTRICT_PYTHON_ABIS="3*"

