Return-Path: <linux-mips+bounces-7982-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD67A45993
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2025 10:10:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A1D0189BEA8
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2025 09:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9929D24DFE4;
	Wed, 26 Feb 2025 09:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="FSQXFrRc"
X-Original-To: linux-mips@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE790224220;
	Wed, 26 Feb 2025 09:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740560955; cv=none; b=i+EKYgWbm7KQdNqrZuObKMAxcldMvkkF+2qtEeSvGdsC2SwhOvl0cnydD8WUr7KsOX83tGxpIqrPnxCj2h85kKQ26H/Zkvci+VYKPYTaNx9pwxSlQop/ZrN7GfUdzWRZVuU0qkDrHhr43DjKVSjG4Z7yctmU51p0tubvV82sle8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740560955; c=relaxed/simple;
	bh=mWtuE0d+HNUmp/zyolAa21VUgkJzuk9wG7mXxuiq3eQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O5sReh7MkwDOcyeQLL6ukGoJsMCnmPIN20sZC/5L8/Udg3UOcQwk3RgxDIX+axkFw9N+2brctvPfXobqM6a2N69aJK9+GjE4kZvDun/1l/pngLoed2M6qGG0f3M5z6Joz74XKdnk5u/V3ZbbzqiJpKAGwqWLiC6lAco017f8Sz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=FSQXFrRc; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=CBgt3Q2RUqu1G3RGyPq/Cq1jOTSZdtLEOZ0UeAUsMNE=; b=FSQXFrRcX+ZC4u1vlsZA2JZI+p
	RtWeDBIgjL37PoUBF587B4eF3K1ojR0emEMTmENuCHy0NPIMupAj9u/fZIPutFqGUcj02bcXQbrbc
	Q3OZZymwZhSPwhJaaold2D8C4zFhSsQDj/BATPgfSa3SNOwTpRHYrpLPVpvR5TPc3Ff3M6eLL/zij
	f6WYQel7+0ktoop8T9iNg8b9zN4PGQQ1pZ4gP6g0AXRwF+InKGfyuOJxlt1kViEdoCg5f7UMsmY3H
	Zk3w8FtgSCL9x4li1/vq3X8jlCnC4WFN6UMrycAxY0ecyKZ1P1uhMq+UTlmv+RGmIdvtIVE1S5P95
	1sNDxYkw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1tnDPA-001suY-18;
	Wed, 26 Feb 2025 17:08:37 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Wed, 26 Feb 2025 17:08:36 +0800
Date: Wed, 26 Feb 2025 17:08:36 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Will Deacon <will@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Harald Freudenberger <freude@linux.ibm.com>,
	Holger Dengler <dengler@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@google.com>,
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
	Jarkko Sakkinen <jarkko@kernel.org>, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-s390@vger.kernel.org
Subject: [v2 PATCH] crypto: lib/Kconfig - Hide arch options from user
Message-ID: <Z77aFJCVuXeDXRrs@gondor.apana.org.au>
References: <20250225164216.4807-1-arnd@kernel.org>
 <20250225213344.GA23792@willie-the-truck>
 <f7c298b8-7989-49e7-90a2-5356029a6283@app.fastmail.com>
 <c4896a12-8abe-4fe6-b381-86b23d32b332@app.fastmail.com>
 <Z75xKexTUNm_FnSK@gondor.apana.org.au>
 <Z76aUfPIbhPAsHbv@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z76aUfPIbhPAsHbv@gondor.apana.org.au>

The ARCH_MAY_HAVE patch missed arm64, mips and s390.  But it may
also lead to arch options being enabled but ineffective because
of modular/built-in conflicts.

As the primary user of all these options wireguard is selecting
the arch options anyway, make the same selections at the lib/crypto
option level and hide the arch options from the user.

Instead of selecting them centrally from lib/crypto, simply set
the default of each arch option as suggested by Eric Biggers.

Change the Crypto API generic algorithms to select the top-level
lib/crypto options instead of the generic one as otherwise there
is no way to enable the arch options (Eric Biggers).  Introduce a
set of INTERNAL options to work around dependency cycles on the
CONFIG_CRYPTO symbol.

Fixes: 1047e21aecdf ("crypto: lib/Kconfig - Fix lib built-in failure when arch is modular")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Arnd Bergmann <arnd@kernel.org>
Closes: https://lore.kernel.org/oe-kbuild-all/202502232152.JC84YDLp-lkp@intel.com/
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/arch/arm/crypto/Kconfig b/arch/arm/crypto/Kconfig
index 47d9cc59f254..0c19317a9ce0 100644
--- a/arch/arm/crypto/Kconfig
+++ b/arch/arm/crypto/Kconfig
@@ -3,10 +3,11 @@
 menu "Accelerated Cryptographic Algorithms for CPU (arm)"
 
 config CRYPTO_CURVE25519_NEON
-	tristate "Public key crypto: Curve25519 (NEON)"
+	tristate
 	depends on KERNEL_MODE_NEON
-	select CRYPTO_LIB_CURVE25519_GENERIC
-	select CRYPTO_ARCH_MAY_HAVE_LIB_CURVE25519
+	select CRYPTO_KPP
+	select CRYPTO_ARCH_HAVE_LIB_CURVE25519
+	default CRYPTO_LIB_CURVE25519_INTERNAL
 	help
 	  Curve25519 algorithm
 
@@ -45,9 +46,10 @@ config CRYPTO_NHPOLY1305_NEON
 	  - NEON (Advanced SIMD) extensions
 
 config CRYPTO_POLY1305_ARM
-	tristate "Hash functions: Poly1305 (NEON)"
+	tristate
 	select CRYPTO_HASH
-	select CRYPTO_ARCH_MAY_HAVE_LIB_POLY1305
+	select CRYPTO_ARCH_HAVE_LIB_POLY1305
+	default CRYPTO_LIB_POLY1305_INTERNAL
 	help
 	  Poly1305 authenticator algorithm (RFC7539)
 
@@ -212,9 +214,10 @@ config CRYPTO_AES_ARM_CE
 	  - ARMv8 Crypto Extensions
 
 config CRYPTO_CHACHA20_NEON
-	tristate "Ciphers: ChaCha20, XChaCha20, XChaCha12 (NEON)"
+	tristate
 	select CRYPTO_SKCIPHER
-	select CRYPTO_ARCH_MAY_HAVE_LIB_CHACHA
+	select CRYPTO_ARCH_HAVE_LIB_CHACHA
+	default CRYPTO_LIB_CHACHA_INTERNAL
 	help
 	  Length-preserving ciphers: ChaCha20, XChaCha20, and XChaCha12
 	  stream cipher algorithms
diff --git a/arch/arm64/crypto/Kconfig b/arch/arm64/crypto/Kconfig
index 5636ab83f22a..1b14551cc301 100644
--- a/arch/arm64/crypto/Kconfig
+++ b/arch/arm64/crypto/Kconfig
@@ -26,10 +26,11 @@ config CRYPTO_NHPOLY1305_NEON
 	  - NEON (Advanced SIMD) extensions
 
 config CRYPTO_POLY1305_NEON
-	tristate "Hash functions: Poly1305 (NEON)"
+	tristate
 	depends on KERNEL_MODE_NEON
 	select CRYPTO_HASH
 	select CRYPTO_ARCH_HAVE_LIB_POLY1305
+	default CRYPTO_LIB_POLY1305_INTERNAL
 	help
 	  Poly1305 authenticator algorithm (RFC7539)
 
@@ -186,11 +187,11 @@ config CRYPTO_AES_ARM64_NEON_BLK
 	  - NEON (Advanced SIMD) extensions
 
 config CRYPTO_CHACHA20_NEON
-	tristate "Ciphers: ChaCha (NEON)"
+	tristate
 	depends on KERNEL_MODE_NEON
 	select CRYPTO_SKCIPHER
-	select CRYPTO_LIB_CHACHA_GENERIC
 	select CRYPTO_ARCH_HAVE_LIB_CHACHA
+	default CRYPTO_LIB_CHACHA_INTERNAL
 	help
 	  Length-preserving ciphers: ChaCha20, XChaCha20, and XChaCha12
 	  stream cipher algorithms
diff --git a/arch/mips/crypto/Kconfig b/arch/mips/crypto/Kconfig
index 7decd40c4e20..545fc0e12422 100644
--- a/arch/mips/crypto/Kconfig
+++ b/arch/mips/crypto/Kconfig
@@ -3,9 +3,11 @@
 menu "Accelerated Cryptographic Algorithms for CPU (mips)"
 
 config CRYPTO_POLY1305_MIPS
-	tristate "Hash functions: Poly1305"
+	tristate
 	depends on MIPS
+	select CRYPTO_HASH
 	select CRYPTO_ARCH_HAVE_LIB_POLY1305
+	default CRYPTO_LIB_POLY1305_INTERNAL
 	help
 	  Poly1305 authenticator algorithm (RFC7539)
 
@@ -52,10 +54,11 @@ config CRYPTO_SHA512_OCTEON
 	  Architecture: mips OCTEON using crypto instructions, when available
 
 config CRYPTO_CHACHA_MIPS
-	tristate "Ciphers: ChaCha20, XChaCha20, XChaCha12 (MIPS32r2)"
+	tristate
 	depends on CPU_MIPS32_R2
 	select CRYPTO_SKCIPHER
 	select CRYPTO_ARCH_HAVE_LIB_CHACHA
+	default CRYPTO_LIB_CHACHA_INTERNAL
 	help
 	  Length-preserving ciphers: ChaCha20, XChaCha20, and XChaCha12
 	  stream cipher algorithms
diff --git a/arch/powerpc/crypto/Kconfig b/arch/powerpc/crypto/Kconfig
index e453cb0c82d2..5beed03869c9 100644
--- a/arch/powerpc/crypto/Kconfig
+++ b/arch/powerpc/crypto/Kconfig
@@ -3,10 +3,11 @@
 menu "Accelerated Cryptographic Algorithms for CPU (powerpc)"
 
 config CRYPTO_CURVE25519_PPC64
-	tristate "Public key crypto: Curve25519 (PowerPC64)"
+	tristate
 	depends on PPC64 && CPU_LITTLE_ENDIAN
-	select CRYPTO_LIB_CURVE25519_GENERIC
-	select CRYPTO_ARCH_MAY_HAVE_LIB_CURVE25519
+	select CRYPTO_KPP
+	select CRYPTO_ARCH_HAVE_LIB_CURVE25519
+	default CRYPTO_LIB_CURVE25519_INTERNAL
 	help
 	  Curve25519 algorithm
 
@@ -91,11 +92,11 @@ config CRYPTO_AES_GCM_P10
 	  later CPU. This module supports stitched acceleration for AES/GCM.
 
 config CRYPTO_CHACHA20_P10
-	tristate "Ciphers: ChaCha20, XChacha20, XChacha12 (P10 or later)"
+	tristate
 	depends on PPC64 && CPU_LITTLE_ENDIAN && VSX
 	select CRYPTO_SKCIPHER
-	select CRYPTO_LIB_CHACHA_GENERIC
-	select CRYPTO_ARCH_MAY_HAVE_LIB_CHACHA
+	select CRYPTO_ARCH_HAVE_LIB_CHACHA
+	default CRYPTO_LIB_CHACHA_INTERNAL
 	help
 	  Length-preserving ciphers: ChaCha20, XChaCha20, and XChaCha12
 	  stream cipher algorithms
diff --git a/arch/riscv/crypto/Kconfig b/arch/riscv/crypto/Kconfig
index ad58dad9a580..c67095a3d669 100644
--- a/arch/riscv/crypto/Kconfig
+++ b/arch/riscv/crypto/Kconfig
@@ -22,7 +22,6 @@ config CRYPTO_CHACHA_RISCV64
 	tristate "Ciphers: ChaCha"
 	depends on 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
 	select CRYPTO_SKCIPHER
-	select CRYPTO_LIB_CHACHA_GENERIC
 	help
 	  Length-preserving ciphers: ChaCha20 stream cipher algorithm
 
diff --git a/arch/s390/crypto/Kconfig b/arch/s390/crypto/Kconfig
index b760232537f1..f6f82dab3594 100644
--- a/arch/s390/crypto/Kconfig
+++ b/arch/s390/crypto/Kconfig
@@ -108,11 +108,11 @@ config CRYPTO_DES_S390
 	  As of z196 the CTR mode is hardware accelerated.
 
 config CRYPTO_CHACHA_S390
-	tristate "Ciphers: ChaCha20"
+	tristate
 	depends on S390
 	select CRYPTO_SKCIPHER
-	select CRYPTO_LIB_CHACHA_GENERIC
 	select CRYPTO_ARCH_HAVE_LIB_CHACHA
+	default CRYPTO_LIB_CHACHA_INTERNAL
 	help
 	  Length-preserving cipher: ChaCha20 stream cipher (RFC 7539)
 
diff --git a/arch/x86/crypto/Kconfig b/arch/x86/crypto/Kconfig
index c189dad0969b..d3128e99bac5 100644
--- a/arch/x86/crypto/Kconfig
+++ b/arch/x86/crypto/Kconfig
@@ -3,10 +3,11 @@
 menu "Accelerated Cryptographic Algorithms for CPU (x86)"
 
 config CRYPTO_CURVE25519_X86
-	tristate "Public key crypto: Curve25519 (ADX)"
+	tristate
 	depends on X86 && 64BIT
-	select CRYPTO_LIB_CURVE25519_GENERIC
-	select CRYPTO_ARCH_MAY_HAVE_LIB_CURVE25519
+	select CRYPTO_KPP
+	select CRYPTO_ARCH_HAVE_LIB_CURVE25519
+	default CRYPTO_LIB_CURVE25519_INTERNAL
 	help
 	  Curve25519 algorithm
 
@@ -348,11 +349,11 @@ config CRYPTO_ARIA_GFNI_AVX512_X86_64
 	  Processes 64 blocks in parallel.
 
 config CRYPTO_CHACHA20_X86_64
-	tristate "Ciphers: ChaCha20, XChaCha20, XChaCha12 (SSSE3/AVX2/AVX-512VL)"
+	tristate
 	depends on X86 && 64BIT
 	select CRYPTO_SKCIPHER
-	select CRYPTO_LIB_CHACHA_GENERIC
-	select CRYPTO_ARCH_MAY_HAVE_LIB_CHACHA
+	select CRYPTO_ARCH_HAVE_LIB_CHACHA
+	default CRYPTO_LIB_CHACHA_INTERNAL
 	help
 	  Length-preserving ciphers: ChaCha20, XChaCha20, and XChaCha12
 	  stream cipher algorithms
@@ -417,10 +418,11 @@ config CRYPTO_POLYVAL_CLMUL_NI
 	  - CLMUL-NI (carry-less multiplication new instructions)
 
 config CRYPTO_POLY1305_X86_64
-	tristate "Hash functions: Poly1305 (SSE2/AVX2)"
+	tristate
 	depends on X86 && 64BIT
-	select CRYPTO_LIB_POLY1305_GENERIC
-	select CRYPTO_ARCH_MAY_HAVE_LIB_POLY1305
+	select CRYPTO_HASH
+	select CRYPTO_ARCH_HAVE_LIB_POLY1305
+	default CRYPTO_LIB_POLY1305_INTERNAL
 	help
 	  Poly1305 authenticator algorithm (RFC7539)
 
diff --git a/crypto/Kconfig b/crypto/Kconfig
index 74ae5f52b784..b7771d7bd3b3 100644
--- a/crypto/Kconfig
+++ b/crypto/Kconfig
@@ -317,7 +317,7 @@ config CRYPTO_ECRDSA
 config CRYPTO_CURVE25519
 	tristate "Curve25519"
 	select CRYPTO_KPP
-	select CRYPTO_LIB_CURVE25519_GENERIC
+	select CRYPTO_LIB_CURVE25519_INTERNAL
 	help
 	  Curve25519 elliptic curve (RFC7748)
 
@@ -615,7 +615,7 @@ config CRYPTO_ARC4
 
 config CRYPTO_CHACHA20
 	tristate "ChaCha"
-	select CRYPTO_LIB_CHACHA_GENERIC
+	select CRYPTO_LIB_CHACHA_INTERNAL
 	select CRYPTO_SKCIPHER
 	help
 	  The ChaCha20, XChaCha20, and XChaCha12 stream cipher algorithms
@@ -936,7 +936,7 @@ config CRYPTO_POLYVAL
 config CRYPTO_POLY1305
 	tristate "Poly1305"
 	select CRYPTO_HASH
-	select CRYPTO_LIB_POLY1305_GENERIC
+	select CRYPTO_LIB_POLY1305_INTERNAL
 	help
 	  Poly1305 authenticator algorithm (RFC7539)
 
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index c542ef1d64d0..b09e78da959a 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -48,11 +48,6 @@ config CRYPTO_ARCH_HAVE_LIB_CHACHA
 	  accelerated implementation of the ChaCha library interface,
 	  either builtin or as a module.
 
-config CRYPTO_ARCH_MAY_HAVE_LIB_CHACHA
-	tristate
-	select CRYPTO_ARCH_HAVE_LIB_CHACHA if CRYPTO_LIB_CHACHA=m
-	select CRYPTO_ARCH_HAVE_LIB_CHACHA if CRYPTO_ARCH_MAY_HAVE_LIB_CHACHA=y
-
 config CRYPTO_LIB_CHACHA_GENERIC
 	tristate
 	select CRYPTO_LIB_UTILS
@@ -63,9 +58,14 @@ config CRYPTO_LIB_CHACHA_GENERIC
 	  implementation is enabled, this implementation serves the users
 	  of CRYPTO_LIB_CHACHA.
 
+config CRYPTO_LIB_CHACHA_INTERNAL
+	tristate
+	select CRYPTO_LIB_CHACHA_GENERIC if CRYPTO_ARCH_HAVE_LIB_CHACHA=n
+
 config CRYPTO_LIB_CHACHA
 	tristate "ChaCha library interface"
-	select CRYPTO_LIB_CHACHA_GENERIC if CRYPTO_ARCH_HAVE_LIB_CHACHA=n
+	select CRYPTO
+	select CRYPTO_LIB_CHACHA_INTERNAL
 	help
 	  Enable the ChaCha library interface. This interface may be fulfilled
 	  by either the generic implementation or an arch-specific one, if one
@@ -78,13 +78,9 @@ config CRYPTO_ARCH_HAVE_LIB_CURVE25519
 	  accelerated implementation of the Curve25519 library interface,
 	  either builtin or as a module.
 
-config CRYPTO_ARCH_MAY_HAVE_LIB_CURVE25519
-	tristate
-	select CRYPTO_ARCH_HAVE_LIB_CURVE25519 if CRYPTO_LIB_CURVE25519=m
-	select CRYPTO_ARCH_HAVE_LIB_CURVE25519 if CRYPTO_ARCH_MAY_HAVE_LIB_CURVE25519=y
-
 config CRYPTO_LIB_CURVE25519_GENERIC
 	tristate
+	select CRYPTO_LIB_UTILS
 	help
 	  This symbol can be depended upon by arch implementations of the
 	  Curve25519 library interface that require the generic code as a
@@ -92,10 +88,14 @@ config CRYPTO_LIB_CURVE25519_GENERIC
 	  implementation is enabled, this implementation serves the users
 	  of CRYPTO_LIB_CURVE25519.
 
+config CRYPTO_LIB_CURVE25519_INTERNAL
+	tristate
+	select CRYPTO_LIB_CURVE25519_GENERIC if CRYPTO_ARCH_HAVE_LIB_CURVE25519=n
+
 config CRYPTO_LIB_CURVE25519
 	tristate "Curve25519 scalar multiplication library"
-	select CRYPTO_LIB_CURVE25519_GENERIC if CRYPTO_ARCH_HAVE_LIB_CURVE25519=n
-	select CRYPTO_LIB_UTILS
+	select CRYPTO
+	select CRYPTO_LIB_CURVE25519_INTERNAL
 	help
 	  Enable the Curve25519 library interface. This interface may be
 	  fulfilled by either the generic implementation or an arch-specific
@@ -118,11 +118,6 @@ config CRYPTO_ARCH_HAVE_LIB_POLY1305
 	  accelerated implementation of the Poly1305 library interface,
 	  either builtin or as a module.
 
-config CRYPTO_ARCH_MAY_HAVE_LIB_POLY1305
-	tristate
-	select CRYPTO_ARCH_HAVE_LIB_POLY1305 if CRYPTO_LIB_POLY1305=m
-	select CRYPTO_ARCH_HAVE_LIB_POLY1305 if CRYPTO_ARCH_MAY_HAVE_LIB_POLY1305=y
-
 config CRYPTO_LIB_POLY1305_GENERIC
 	tristate
 	help
@@ -132,9 +127,14 @@ config CRYPTO_LIB_POLY1305_GENERIC
 	  implementation is enabled, this implementation serves the users
 	  of CRYPTO_LIB_POLY1305.
 
+config CRYPTO_LIB_POLY1305_INTERNAL
+	tristate
+	select CRYPTO_LIB_POLY1305_GENERIC if CRYPTO_ARCH_HAVE_LIB_POLY1305=n
+
 config CRYPTO_LIB_POLY1305
 	tristate "Poly1305 library interface"
-	select CRYPTO_LIB_POLY1305_GENERIC if CRYPTO_ARCH_HAVE_LIB_POLY1305=n
+	select CRYPTO
+	select CRYPTO_LIB_POLY1305_INTERNAL
 	help
 	  Enable the Poly1305 library interface. This interface may be fulfilled
 	  by either the generic implementation or an arch-specific one, if one
@@ -142,9 +142,10 @@ config CRYPTO_LIB_POLY1305
 
 config CRYPTO_LIB_CHACHA20POLY1305
 	tristate "ChaCha20-Poly1305 AEAD support (8-byte nonce library version)"
-	depends on CRYPTO
+	select CRYPTO
 	select CRYPTO_LIB_CHACHA
 	select CRYPTO_LIB_POLY1305
+	select CRYPTO_LIB_UTILS
 	select CRYPTO_ALGAPI
 
 config CRYPTO_LIB_SHA1
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

