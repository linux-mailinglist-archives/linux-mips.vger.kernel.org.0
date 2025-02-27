Return-Path: <linux-mips+bounces-8019-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF38A47CB5
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2025 12:57:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 882787A0FC3
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2025 11:56:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C52C022A1D1;
	Thu, 27 Feb 2025 11:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="DoV6UI/n";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="wrCaUkxd"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A1F1662EF;
	Thu, 27 Feb 2025 11:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740657427; cv=none; b=BesKwny7MeiBsXS7B8apX1xW/3m45Mq6eOKEaNTHzF9KMqzrl13JLctJFVW1l0Yst9tuM1+k6D1MY9nH8RqxYYJs1i+TU9wN8e2LS5tnRR8aa9bupjly9F8RdA15LHX7glLXc5Fv0VtaoJKmgS8IhB6K5bzn0Q2k6Rd8iXyZKH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740657427; c=relaxed/simple;
	bh=aMcbCUyIH0LdhPXZy489NqCaUbzMbAkTVRt4OmfaGLg=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ln30RPJIMZn4KwVFT6k+udAB45gM9bkBTced5RFor0M2ZOnxP62CZKnt2FjWarxHx0KnSwhXgWG+7PDAsCQlbL6Y2tIeU7lyrXVFHzC8QnJlGNXxv79uNhB1mtBNBrdgneL3XGpIBxpFzgFqmu48xqgSJFvKYSqE3xW3DN+xAVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=DoV6UI/n; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=wrCaUkxd; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id 7C4F51382D43;
	Thu, 27 Feb 2025 06:57:03 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-11.internal (MEProxy); Thu, 27 Feb 2025 06:57:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1740657423;
	 x=1740743823; bh=aJKPkC1SVbHcQfArtN7jy51GLZ3HD2OHCzJzLYvRUEw=; b=
	DoV6UI/naig9BSabGeoNIsRIpTRCuNoe+mx/a9YK0cyJadJW2ItzOfaVuyAzexFI
	NZqGvWvq1S+J23s02J5WkViB2tN0R6zwfh9i4PleihgBwcmQV+OKit6x9iaaDccY
	JVa8VyYJRpQ+HmFUdir3959PYZzVO39wQIv5r4OVeA3DYF8v31Z40AmywR4uc8pk
	8oTjOqoIQXbAA6EUb3667+8E18W4jMphoNOQF+bhcuOcg8pGOsvwT0+LxwQkxsef
	vkytNRDa/NmhNwBeGAX+FYthf6ZALXcj5Fch+wxP0dZ3Muvh5lxxLYIZe1hOUdz7
	LHjgV2PFE4yCTiIdDQQ2bQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1740657423; x=
	1740743823; bh=aJKPkC1SVbHcQfArtN7jy51GLZ3HD2OHCzJzLYvRUEw=; b=w
	rCaUkxdyW8REeIBS0h9XKI7JFXRz4qNDuhgNgCxhRQgHB0aAJ04OqeqYDXRtyacQ
	dTqQAA1SUiTQxqz74DNZp1nkm72rON6r1TKNR0kNSmpHoTRzzqWMe6BWnd85Y/Gh
	9CLWF/YZReqZtGtbnkA1j+PHRI4goSxlgRix1NdpVLTB7xQI/L5i8z1na2ybqL1m
	8g+YYi1BMvmk55wqyjIpXSf7o7u5ztbjkpTX2rjJuY/Qk78hI9ESg4oNZOvZPskZ
	waGb/mLnXvIBM+M3Ju0Pu+PmTeYrp7cj6A3mF2goyT0NCGyN9lEJNhoX07g//bpG
	iusT245dsE1+EPRkcVC6g==
X-ME-Sender: <xms:DVPAZxVNXxIgHuoAEv3H98vRTkmQL-M_q3WJ376NbiH8H-CPT0MV3Q>
    <xme:DVPAZxnMJv-LmiL-MV_RR594lDx97AMLZEZhOcBSLsJhJJpSzhXmTFp-0r1GURdAE
    HdRKezdKj5wEXH6pi8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekjeeflecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteef
    gffgvedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopedv
    fedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthhssghoghgvnhgusegrlhhphh
    grrdhfrhgrnhhkvghnrdguvgdprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghs
    segrrhhmrdgtohhmpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvth
    dprhgtphhtthhopehhvghrsggvrhhtsehgohhnughorhdrrghprghnrgdrohhrghdrrghu
    pdhrtghpthhtohepvggsihhgghgvrhhssehgohhoghhlvgdrtghomhdprhgtphhtthhope
    hjrghmvghsrdgsohhtthhomhhlvgihsehhrghnshgvnhhprghrthhnvghrshhhihhprdgt
    ohhmpdhrtghpthhtoheprghruggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrh
    hnugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhgrrhhkkhhosehkvghrnhgvlhdr
    ohhrgh
X-ME-Proxy: <xmx:DVPAZ9a0T0sNxKcnP1Ahd3eGoyei5KF2Q4cq6K7LT8drEQmX98VW9A>
    <xmx:DVPAZ0WvkzvLzKr2bAKfDoj0SOQSKd_Z7WTfN4Wn_QSWMjfsSNt2yg>
    <xmx:DVPAZ7liObMsY4CAH-LOssq-fNi4_T8QoMpzLbspplivwsK8bsFYFw>
    <xmx:DVPAZxfbk88XyltpU7eAEl-QSgn-Gpp3zTqRyVqjLfr8pEXnKuDywQ>
    <xmx:D1PAZ9WVcS6szVJNbb177L1ZeSDVjGXYO_CI7fV9X5Gfa1J__jGCCCDG>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id AD8542220077; Thu, 27 Feb 2025 06:57:01 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Feb 2025 12:56:30 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Herbert Xu" <herbert@gondor.apana.org.au>
Cc: "Arnd Bergmann" <arnd@kernel.org>, "Will Deacon" <will@kernel.org>,
 "David S . Miller" <davem@davemloft.net>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Harald Freudenberger" <freude@linux.ibm.com>,
 "Holger Dengler" <dengler@linux.ibm.com>,
 "Heiko Carstens" <hca@linux.ibm.com>, "Vasily Gorbik" <gor@linux.ibm.com>,
 "Alexander Gordeev" <agordeev@linux.ibm.com>,
 "Christian Borntraeger" <borntraeger@linux.ibm.com>,
 "Sven Schnelle" <svens@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "Ard Biesheuvel" <ardb@kernel.org>, "Eric Biggers" <ebiggers@google.com>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Jarkko Sakkinen" <jarkko@kernel.org>, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org
Message-Id: <9f4e5f41-e553-4f2a-88fe-478f074b62cb@app.fastmail.com>
In-Reply-To: <Z8All3G80gGXzfaU@gondor.apana.org.au>
References: <20250225164216.4807-1-arnd@kernel.org>
 <20250225213344.GA23792@willie-the-truck>
 <f7c298b8-7989-49e7-90a2-5356029a6283@app.fastmail.com>
 <c4896a12-8abe-4fe6-b381-86b23d32b332@app.fastmail.com>
 <Z75xKexTUNm_FnSK@gondor.apana.org.au> <Z76aUfPIbhPAsHbv@gondor.apana.org.au>
 <Z77aFJCVuXeDXRrs@gondor.apana.org.au> <Z8AY16EIqAYpfmRI@gondor.apana.org.au>
 <134f64aa-65bd-4de0-9ac6-52326e35d6d6@app.fastmail.com>
 <Z8All3G80gGXzfaU@gondor.apana.org.au>
Subject: Re: [v3 PATCH] crypto: lib/Kconfig - Hide arch options from user
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Feb 27, 2025, at 09:43, Herbert Xu wrote:
> On Thu, Feb 27, 2025 at 09:32:51AM +0100, Arnd Bergmann wrote:
>> It appears that the two above are missing a
>> 'depends on KERNEL_MODE_NEON' line. There is still
>> a runtime check that prevents it from being used on
>> non-neon machines, but I think you should add these
>> lines here since it's no longer possible to turn
>> them off individually when building a kernel for a
>> non-NEON target.
>
> Good catch.  But I think this was deliberate as it also includes
> a non-NEON implementation:
>
> commit b36d8c09e710c71f6a9690b6586fea2d1c9e1e27
> Author: Ard Biesheuvel <ardb@kernel.org>
> Date:   Fri Nov 8 13:22:14 2019 +0100
>
>     crypto: arm/chacha - remove dependency on generic ChaCha driver

Ah, I see. That's fine then.

>     Instead of falling back to the generic ChaCha skcipher driver for
>     non-SIMD cases, use a fast scalar implementation for ARM authored
>     by Eric Biggers. This removes the module dependency on chacha-generic
>     altogether, which also simplifies things when we expose the ChaCha
>     library interface from this module.
>    
>     Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>     Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
> 
>> I'm not sure why we need the extra "_INTERNAL" symbols, but I
>> may be missing something here. What problem does this solve
>> for you?
>
> Without them Kconfig will bomb out because of a loop centering
> on CONFIG_CRYPTO.

I've tried to undo that portion here and don't run into a
dependency loop so far with the patch below on top of yours
(around 100 randconfigs in). I'll keep testing and will let
you know when something goes wrong.

One issue I've already found in your version is that removing
the  'select CRYPTO_LIB_CHACHA_GENERIC' is broken in the majority
of the cases where an architecture specific implementation
is enabled, because the architecture code typically contains
a fallback to the generic version for the case where the
custom CPU instructions are not present.

I've added the 'select' lines to the architecture versions
here, but since it's almost always needed, we could decide
to just leave the generic version built-in anyway to
make it less error-prone at the cost of kernel bloat
in the few cases where it's not used.

An unrelated issue I noticed is that CRYPTO_LIB_CHACHA20POLY1305
depends on CRYPTO in order to pull in CRYPTO_ALGAPI, this
looks like a mistake and could be resolved by moving
crypto/scatterwalk.c into lib/crypto/ with its own symbol.
That should be a separate patch of course.

      Arnd

diff --git a/arch/arm/crypto/Kconfig b/arch/arm/crypto/Kconfig
index 0c19317a9ce0..f2e3b62c1379 100644
--- a/arch/arm/crypto/Kconfig
+++ b/arch/arm/crypto/Kconfig
@@ -7,7 +7,8 @@ config CRYPTO_CURVE25519_NEON
 	depends on KERNEL_MODE_NEON
 	select CRYPTO_KPP
 	select CRYPTO_ARCH_HAVE_LIB_CURVE25519
-	default CRYPTO_LIB_CURVE25519_INTERNAL
+	select CRYPTO_LIB_CURVE25519_GENERIC
+	default CRYPTO_LIB_CURVE25519
 	help
 	  Curve25519 algorithm
 
@@ -49,7 +50,8 @@ config CRYPTO_POLY1305_ARM
 	tristate
 	select CRYPTO_HASH
 	select CRYPTO_ARCH_HAVE_LIB_POLY1305
-	default CRYPTO_LIB_POLY1305_INTERNAL
+	select CRYPTO_LIB_POLY1305_GENERIC
+	default CRYPTO_LIB_POLY1305
 	help
 	  Poly1305 authenticator algorithm (RFC7539)
 
@@ -217,7 +219,8 @@ config CRYPTO_CHACHA20_NEON
 	tristate
 	select CRYPTO_SKCIPHER
 	select CRYPTO_ARCH_HAVE_LIB_CHACHA
-	default CRYPTO_LIB_CHACHA_INTERNAL
+	select CRYPTO_LIB_CHACHA_GENERIC
+	default CRYPTO_LIB_CHACHA
 	help
 	  Length-preserving ciphers: ChaCha20, XChaCha20, and XChaCha12
 	  stream cipher algorithms
diff --git a/arch/arm64/crypto/Kconfig b/arch/arm64/crypto/Kconfig
index 1b14551cc301..17f447240f9a 100644
--- a/arch/arm64/crypto/Kconfig
+++ b/arch/arm64/crypto/Kconfig
@@ -30,7 +30,7 @@ config CRYPTO_POLY1305_NEON
 	depends on KERNEL_MODE_NEON
 	select CRYPTO_HASH
 	select CRYPTO_ARCH_HAVE_LIB_POLY1305
-	default CRYPTO_LIB_POLY1305_INTERNAL
+	default CRYPTO_LIB_POLY1305
 	help
 	  Poly1305 authenticator algorithm (RFC7539)
 
@@ -191,7 +191,8 @@ config CRYPTO_CHACHA20_NEON
 	depends on KERNEL_MODE_NEON
 	select CRYPTO_SKCIPHER
 	select CRYPTO_ARCH_HAVE_LIB_CHACHA
-	default CRYPTO_LIB_CHACHA_INTERNAL
+	select CRYPTO_LIB_CHACHA_GENERIC
+	default CRYPTO_LIB_CHACHA
 	help
 	  Length-preserving ciphers: ChaCha20, XChaCha20, and XChaCha12
 	  stream cipher algorithms
diff --git a/arch/mips/crypto/Kconfig b/arch/mips/crypto/Kconfig
index 545fc0e12422..e0d8ee2677df 100644
--- a/arch/mips/crypto/Kconfig
+++ b/arch/mips/crypto/Kconfig
@@ -7,7 +7,7 @@ config CRYPTO_POLY1305_MIPS
 	depends on MIPS
 	select CRYPTO_HASH
 	select CRYPTO_ARCH_HAVE_LIB_POLY1305
-	default CRYPTO_LIB_POLY1305_INTERNAL
+	default CRYPTO_LIB_POLY1305
 	help
 	  Poly1305 authenticator algorithm (RFC7539)
 
@@ -58,7 +58,7 @@ config CRYPTO_CHACHA_MIPS
 	depends on CPU_MIPS32_R2
 	select CRYPTO_SKCIPHER
 	select CRYPTO_ARCH_HAVE_LIB_CHACHA
-	default CRYPTO_LIB_CHACHA_INTERNAL
+	default CRYPTO_LIB_CHACHA
 	help
 	  Length-preserving ciphers: ChaCha20, XChaCha20, and XChaCha12
 	  stream cipher algorithms
diff --git a/arch/powerpc/crypto/Kconfig b/arch/powerpc/crypto/Kconfig
index 5beed03869c9..49f929f49e45 100644
--- a/arch/powerpc/crypto/Kconfig
+++ b/arch/powerpc/crypto/Kconfig
@@ -7,7 +7,8 @@ config CRYPTO_CURVE25519_PPC64
 	depends on PPC64 && CPU_LITTLE_ENDIAN
 	select CRYPTO_KPP
 	select CRYPTO_ARCH_HAVE_LIB_CURVE25519
-	default CRYPTO_LIB_CURVE25519_INTERNAL
+	select CRYPTO_LIB_CURVE25519_GENERIC
+	default CRYPTO_LIB_CURVE25519
 	help
 	  Curve25519 algorithm
 
@@ -96,7 +97,8 @@ config CRYPTO_CHACHA20_P10
 	depends on PPC64 && CPU_LITTLE_ENDIAN && VSX
 	select CRYPTO_SKCIPHER
 	select CRYPTO_ARCH_HAVE_LIB_CHACHA
-	default CRYPTO_LIB_CHACHA_INTERNAL
+	select CRYPTO_LIB_CHACHA_GENERIC
+	default CRYPTO_LIB_CHACHA
 	help
 	  Length-preserving ciphers: ChaCha20, XChaCha20, and XChaCha12
 	  stream cipher algorithms
diff --git a/arch/s390/crypto/Kconfig b/arch/s390/crypto/Kconfig
index f6f82dab3594..13245d569d4d 100644
--- a/arch/s390/crypto/Kconfig
+++ b/arch/s390/crypto/Kconfig
@@ -112,7 +112,8 @@ config CRYPTO_CHACHA_S390
 	depends on S390
 	select CRYPTO_SKCIPHER
 	select CRYPTO_ARCH_HAVE_LIB_CHACHA
-	default CRYPTO_LIB_CHACHA_INTERNAL
+	select CRYPTO_LIB_CHACHA_GENERIC
+	default CRYPTO_LIB_CHACHA
 	help
 	  Length-preserving cipher: ChaCha20 stream cipher (RFC 7539)
 
diff --git a/arch/x86/crypto/Kconfig b/arch/x86/crypto/Kconfig
index d3128e99bac5..1f20425f6c87 100644
--- a/arch/x86/crypto/Kconfig
+++ b/arch/x86/crypto/Kconfig
@@ -7,7 +7,8 @@ config CRYPTO_CURVE25519_X86
 	depends on X86 && 64BIT
 	select CRYPTO_KPP
 	select CRYPTO_ARCH_HAVE_LIB_CURVE25519
-	default CRYPTO_LIB_CURVE25519_INTERNAL
+	select CRYPTO_LIB_CURVE25519_GENERIC
+	default CRYPTO_LIB_CURVE25519
 	help
 	  Curve25519 algorithm
 
@@ -353,7 +354,8 @@ config CRYPTO_CHACHA20_X86_64
 	depends on X86 && 64BIT
 	select CRYPTO_SKCIPHER
 	select CRYPTO_ARCH_HAVE_LIB_CHACHA
-	default CRYPTO_LIB_CHACHA_INTERNAL
+	select CRYPTO_LIB_CHACHA_GENERIC
+	default CRYPTO_LIB_CHACHA
 	help
 	  Length-preserving ciphers: ChaCha20, XChaCha20, and XChaCha12
 	  stream cipher algorithms
@@ -422,7 +424,8 @@ config CRYPTO_POLY1305_X86_64
 	depends on X86 && 64BIT
 	select CRYPTO_HASH
 	select CRYPTO_ARCH_HAVE_LIB_POLY1305
-	default CRYPTO_LIB_POLY1305_INTERNAL
+	select CRYPTO_LIB_POLY1305_GENERIC
+	default CRYPTO_LIB_POLY1305
 	help
 	  Poly1305 authenticator algorithm (RFC7539)
 
diff --git a/crypto/Kconfig b/crypto/Kconfig
index aac27a4668fd..6013850c114c 100644
--- a/crypto/Kconfig
+++ b/crypto/Kconfig
@@ -317,7 +317,7 @@ config CRYPTO_ECRDSA
 config CRYPTO_CURVE25519
 	tristate "Curve25519"
 	select CRYPTO_KPP
-	select CRYPTO_LIB_CURVE25519_INTERNAL
+	select CRYPTO_LIB_CURVE25519
 	help
 	  Curve25519 elliptic curve (RFC7748)
 
@@ -615,7 +615,7 @@ config CRYPTO_ARC4
 
 config CRYPTO_CHACHA20
 	tristate "ChaCha"
-	select CRYPTO_LIB_CHACHA_INTERNAL
+	select CRYPTO_LIB_CHACHA
 	select CRYPTO_SKCIPHER
 	help
 	  The ChaCha20, XChaCha20, and XChaCha12 stream cipher algorithms
@@ -936,7 +936,7 @@ config CRYPTO_POLYVAL
 config CRYPTO_POLY1305
 	tristate "Poly1305"
 	select CRYPTO_HASH
-	select CRYPTO_LIB_POLY1305_INTERNAL
+	select CRYPTO_LIB_POLY1305_GENERIC
 	help
 	  Poly1305 authenticator algorithm (RFC7539)
 
diff --git a/drivers/net/Kconfig b/drivers/net/Kconfig
index 1fd5acdc73c6..417b691c7c53 100644
--- a/drivers/net/Kconfig
+++ b/drivers/net/Kconfig
@@ -82,18 +82,6 @@ config WIREGUARD
 	select CRYPTO
 	select CRYPTO_LIB_CURVE25519
 	select CRYPTO_LIB_CHACHA20POLY1305
-	select CRYPTO_CHACHA20_X86_64 if X86 && 64BIT
-	select CRYPTO_POLY1305_X86_64 if X86 && 64BIT
-	select CRYPTO_BLAKE2S_X86 if X86 && 64BIT
-	select CRYPTO_CURVE25519_X86 if X86 && 64BIT
-	select CRYPTO_CHACHA20_NEON if ARM || (ARM64 && KERNEL_MODE_NEON)
-	select CRYPTO_POLY1305_NEON if ARM64 && KERNEL_MODE_NEON
-	select CRYPTO_POLY1305_ARM if ARM
-	select CRYPTO_BLAKE2S_ARM if ARM
-	select CRYPTO_CURVE25519_NEON if ARM && KERNEL_MODE_NEON
-	select CRYPTO_CHACHA_MIPS if CPU_MIPS32_R2
-	select CRYPTO_POLY1305_MIPS if MIPS
-	select CRYPTO_CHACHA_S390 if S390
 	help
 	  WireGuard is a secure, fast, and easy to use replacement for IPSec
 	  that uses modern cryptography and clever networking tricks. It's
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index b09e78da959a..8fdb1a5de909 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -42,7 +42,7 @@ config CRYPTO_LIB_BLAKE2S_GENERIC
 	  of CRYPTO_LIB_BLAKE2S.
 
 config CRYPTO_ARCH_HAVE_LIB_CHACHA
-	bool
+	tristate
 	help
 	  Declares whether the architecture provides an arch-specific
 	  accelerated implementation of the ChaCha library interface,
@@ -58,21 +58,16 @@ config CRYPTO_LIB_CHACHA_GENERIC
 	  implementation is enabled, this implementation serves the users
 	  of CRYPTO_LIB_CHACHA.
 
-config CRYPTO_LIB_CHACHA_INTERNAL
-	tristate
-	select CRYPTO_LIB_CHACHA_GENERIC if CRYPTO_ARCH_HAVE_LIB_CHACHA=n
-
 config CRYPTO_LIB_CHACHA
 	tristate "ChaCha library interface"
-	select CRYPTO
-	select CRYPTO_LIB_CHACHA_INTERNAL
+	select CRYPTO_LIB_CHACHA_GENERIC if CRYPTO_ARCH_HAVE_LIB_CHACHA=n
 	help
 	  Enable the ChaCha library interface. This interface may be fulfilled
 	  by either the generic implementation or an arch-specific one, if one
 	  is available and enabled.
 
 config CRYPTO_ARCH_HAVE_LIB_CURVE25519
-	bool
+	tristate
 	help
 	  Declares whether the architecture provides an arch-specific
 	  accelerated implementation of the Curve25519 library interface,
@@ -88,14 +83,9 @@ config CRYPTO_LIB_CURVE25519_GENERIC
 	  implementation is enabled, this implementation serves the users
 	  of CRYPTO_LIB_CURVE25519.
 
-config CRYPTO_LIB_CURVE25519_INTERNAL
-	tristate
-	select CRYPTO_LIB_CURVE25519_GENERIC if CRYPTO_ARCH_HAVE_LIB_CURVE25519=n
-
 config CRYPTO_LIB_CURVE25519
 	tristate "Curve25519 scalar multiplication library"
-	select CRYPTO
-	select CRYPTO_LIB_CURVE25519_INTERNAL
+	select CRYPTO_LIB_CURVE25519_GENERIC if CRYPTO_ARCH_HAVE_LIB_CURVE25519=n
 	help
 	  Enable the Curve25519 library interface. This interface may be
 	  fulfilled by either the generic implementation or an arch-specific
@@ -112,7 +102,7 @@ config CRYPTO_LIB_POLY1305_RSIZE
 	default 1
 
 config CRYPTO_ARCH_HAVE_LIB_POLY1305
-	bool
+	tristate
 	help
 	  Declares whether the architecture provides an arch-specific
 	  accelerated implementation of the Poly1305 library interface,
@@ -127,14 +117,9 @@ config CRYPTO_LIB_POLY1305_GENERIC
 	  implementation is enabled, this implementation serves the users
 	  of CRYPTO_LIB_POLY1305.
 
-config CRYPTO_LIB_POLY1305_INTERNAL
-	tristate
-	select CRYPTO_LIB_POLY1305_GENERIC if CRYPTO_ARCH_HAVE_LIB_POLY1305=n
-
 config CRYPTO_LIB_POLY1305
 	tristate "Poly1305 library interface"
-	select CRYPTO
-	select CRYPTO_LIB_POLY1305_INTERNAL
+	select CRYPTO_LIB_POLY1305_GENERIC if CRYPTO_ARCH_HAVE_LIB_POLY1305=n
 	help
 	  Enable the Poly1305 library interface. This interface may be fulfilled
 	  by either the generic implementation or an arch-specific one, if one

