# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="A collection of mature utilities for Python programmers"
HOMEPAGE="http://tahoe-lafs.org/trac/pyutil"
SRC_URI="http://pypi.python.org/packages/source/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools
	dev-python/setuptools_trial"
#	dev-python/zbase32"

RESTRICT_PYTHON_ABIS="3*"

src_prepare() {
	sed -i "/setup_requires.append('setuptools_darcs >= 1.1.0')/d" "${S}/setup.py"
	sed -i "/if False:/d" "${S}/setup.py"
	}

src_test() {
	testing() {
		PYTHONPATH="build-${PYTHON_ABI}/lib" "$(PYTHON)" pyutil/test/__init__.py
	PYTHONPATH="build-${PYTHON_ABI}/lib" "$(PYTHON)" pyutil/test/json_tests/__init__.py
   }
	python_execute_function testing
}

