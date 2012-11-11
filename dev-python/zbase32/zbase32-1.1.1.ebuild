# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
SUPPORT_PYTHON_ABIS="1"

inherit distutils 

DESCRIPTION="Base32 encoder/decoder"
HOMEPAGE="http://allmydata.org/trac/zbase32"
SRC_URI="http://pypi.python.org/packages/source/z/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools
	dev-python/setuptools_darcs
	dev-python/pyutil"

RESTRICT_PYTHON_ABIS="3*"

src_test() {
    testing() {
        PYTHONPATH="$(ls -d build-${PYTHON_ABI}/lib.*)" "$(PYTHON)" zbase32/test/__init__.py
    }
    python_execute_function testing
}
