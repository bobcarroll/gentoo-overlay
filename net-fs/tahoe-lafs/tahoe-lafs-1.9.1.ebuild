# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
SUPPORT_PYTHON_ABIS="1"

inherit eutils distutils python

MY_PN="allmydata-tahoe"
MY_P="${MY_PN}-${PV}"
S="${WORKDIR}/${MY_P}"

DESCRIPTION="A secure, decentralized, data store"
HOMEPAGE="http://tahoe-lafs.org/trac/tahoe-lafs"
SRC_URI="http://tahoe-lafs.org/source/tahoe-lafs/releases/${MY_P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~x86-fbsd"
IUSE="doc"

DEPEND="dev-python/argparse
	>=dev-python/foolscap-0.6.1
	dev-python/nevow
	dev-python/pyopenssl
	>=dev-python/twisted-9.0.0-r1
	dev-python/setuptools
	net-zope/zope-interface
	dev-python/zfec
	dev-python/pycryptopp
	dev-python/pyutil
	dev-python/zbase32
	dev-python/simplejson
	dev-python/pysqlite
	dev-python/mock"

RDEPEND="${DEPEND}
	dev-python/pyasn1
	dev-python/pycrypto"

RESTRICT_PYTHON_ABIS="3*"

src_prepare() {
	sed -i "/setup_requires.append('setuptools_darcs >= 1.1.0')/d" "${S}/setup.py"
	sed -i "/setup_requires.append('darcsver >= 1.7.1')/d" "${S}/setup.py"
	sed -i "/if False:/d" "${S}/setup.py"
}

src_test() {
	testing() {
		PYTHONPATH="build-${PYTHON_ABI}/lib" "$(PYTHON)" src/allmydata/test/__init__.py
	}
	python_execute_function testing
}

src_install() {
	distutils_src_install --single-version-externally-managed
	if use doc; then
		insinto /usr/share/doc/${PF}/
		doins -r docs/*
	fi
}

