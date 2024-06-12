Return-Path: <linux-mips+bounces-3604-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D357904F9F
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 11:53:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 863891C23680
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 09:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65FDC16E868;
	Wed, 12 Jun 2024 09:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="fVu1ZxqR";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WX+kJWVe"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B300516DECA;
	Wed, 12 Jun 2024 09:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718186019; cv=none; b=NLaa3sZ3BrV+GIn5LIPSiUs+dcTV6/pGK+69K16Wz2hfRXZIsRjzt2PIIXz7Ip8IBLa6m1biv04lBzd2LBRzCO/jx7TNXF645zNp0rgDZ0N2dJKFuYHMGxY8asApVR1hxYevm5Sjh8YwHUYd/2I3EJwXv/NYhlqWfBFOwrohJo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718186019; c=relaxed/simple;
	bh=dBYBJUV94eWDrUQ36fbRfMft6NGiZT3vPMdQLOfyh3s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j0T4tO3+rP27l5DuXODUIKu9TCHgRWReU/Vwwhlum7ai+Zpj01I+Zjp/QHWEbPSmLtA+kNA+K/ZhQdNqrJExErZuVuHUxri7u9WwG2zQG0+vXJwPR/2ThvTKId3tT2TPlO/rgpmuAgbJ+OhtdWbhpK2ozoeZX+5FIMF/PVGjJRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=fVu1ZxqR; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WX+kJWVe; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id CE5FD11400E2;
	Wed, 12 Jun 2024 05:53:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 12 Jun 2024 05:53:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1718186016;
	 x=1718272416; bh=ESHl3L3OxDQSgcJHHY7pIck3NL6/jnLr7SbwhIcuKmI=; b=
	fVu1ZxqRvlMRGc2b746PzJ0K+0qXpKdlRQf5FVUCvmuqpbn81piBGsnWh5H0m2/s
	BCWdhImlCJsD90ssAF+MR0tIcc+zD6MhAZwp4gIIt9+75NW18eO2nSafudzSm0Jb
	8uXmlGsFTlPFo/GSh6LPOlmCfSPh5QLqcct2ml015jtaEwmeFSnyY/inLNZ+3lM5
	MoqCLoMmrAHpwhSUqWVeFy2ny+rIl6IQjac3/7bCsXUV5ppbtbguu0kuOSJ2fmwl
	aO0zFeftEhMaIb/scmg5x/g941QlGOyi2kB58HFotPEA3iNebJjOBkALyz7hOJNI
	iQZyk4TPxLX6VPhO5SL55g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718186016; x=
	1718272416; bh=ESHl3L3OxDQSgcJHHY7pIck3NL6/jnLr7SbwhIcuKmI=; b=W
	X+kJWVeObf0vh5+s38ilk+JU98RmdkUtOedk3dcEk1o3qxCOjObuYa1NGLZ9QOCZ
	jOXQNAnUU/YTo1Z5wRrBBeBxe8vMqPM6l5GWFX6ioJh6e9RtaUclBFMDhV1GOEG1
	bZP5Yo3pbLI4STA/yCtwUh1My+Urai4T6y8yEGQ3a8NyCK4jr3pPALNseFnReJ7R
	6O3fOPRVyAR4v0mYkVdneVzio8pmBIwEmGhEHBL34kWrOKQlXvgFVdXXb/ESc/Zn
	8vyckr68Q2+GM4GICbtxdjqvCLnZzqITbXNjLq0KGhvIKYGTh2R8qs2A9f20XonR
	9A4JNHAA8Apn4JaH8SX+Q==
X-ME-Sender: <xms:IHBpZlKvSJCCPfRjyv1lLEKTFcCGnDcrJrsTs5-eAqCtpg4OSx8yrw>
    <xme:IHBpZhJuBMDkD7wuoyYbN8__ASNugyLmlGammm2V0beDxd2UYbQyTCXuDKnJwyL2c
    okpfXOuAV9gnC9NhyE>
X-ME-Received: <xmr:IHBpZtthv8juk68gUv5K7Y_BMV7tLBjkAgSTmAhREBE4oWk0OBuavb8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedugedgvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffekgedugefhtdduudeghfeu
    veegffegudekjeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:IHBpZmbYLtAyAuQcIrhJZhsXEA347DM-xNzsFSEDICxYX3vBykV7Dg>
    <xmx:IHBpZsaLqehEjvBTgbKZDLApdUeAN-2nPoftZbEJ6ob_MgOsRBdv5A>
    <xmx:IHBpZqADM3Px2ilqK9Vne09Qhex1uYZEpgCF3LoAWdSRWAVMGW4ZTQ>
    <xmx:IHBpZqbcF2zKn-xrPUoYyRhn22SKGh3iX41hf49Fg00P1LscU8aTyg>
    <xmx:IHBpZhONaBDPO3MWIPVBbmrXTg0sCesxmNZlMzHP7eDQyz_2ytr7J45C>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Jun 2024 05:53:35 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Wed, 12 Jun 2024 10:53:30 +0100
Subject: [PATCH v2 2/4] MIPS: Introduce config options for LLSC
 availability
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-mips-llsc-v2-2-a42bd5562bdb@flygoat.com>
References: <20240612-mips-llsc-v2-0-a42bd5562bdb@flygoat.com>
In-Reply-To: <20240612-mips-llsc-v2-0-a42bd5562bdb@flygoat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Jonas Gorski <jonas.gorski@gmail.com>, 
 "Maciej W. Rozycki" <macro@orcam.me.uk>, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4430;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=dBYBJUV94eWDrUQ36fbRfMft6NGiZT3vPMdQLOfyh3s=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrTMAlmzSrE/796uPNV07vnHpS420tFOBWfeN9T2Za1dO
 XnvzEflHaUsDGJcDLJiiiwhAkp9GxovLrj+IOsPzBxWJpAhDFycAjCRHUIM/8vyl+5S6T35LO6E
 94LeZ1PdP3hlNphHZ9dVeFSml6pURzD8T8mIqtVpO/c3xGzJtLc3z/CX1UbPNXulmV2+ifnWx+f
 nWQA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Introduce CPU_HAS_LLSC and CPU_MAY_HAVE_LLSC to determine availability
of LLSC and Kconfig level.

They are both true for almost all supported CPUs besides:

R3000: Doesn't have LLSC, so both false.
R5000 series: LLSC is unusable for 64bit kernel, so both false.
R10000: Some platforms decided to opt-out LLSC due to errata, so only
	select CPU_MAY_HAVE_LLSC.
WAR_4KC_LLSC: LLSC is buggy on certain reversion, which can be detected
	at cpu-probe or platform override, so only select CPU_MAY_HAVE_LLSC.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
v2: Make cpu_has_llsc logic clear
---
 arch/mips/Kconfig                    | 20 ++++++++++++++++++++
 arch/mips/include/asm/cpu-features.h |  9 ++++++++-
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 8ac467c1f9c8..50260a7e9b54 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1548,6 +1548,7 @@ config CPU_R3000
 config CPU_R4300
 	bool "R4300"
 	depends on SYS_HAS_CPU_R4300
+	select CPU_HAS_LLSC
 	select CPU_SUPPORTS_32BIT_KERNEL
 	select CPU_SUPPORTS_64BIT_KERNEL
 	help
@@ -1556,6 +1557,7 @@ config CPU_R4300
 config CPU_R4X00
 	bool "R4x00"
 	depends on SYS_HAS_CPU_R4X00
+	select CPU_HAS_LLSC
 	select CPU_SUPPORTS_32BIT_KERNEL
 	select CPU_SUPPORTS_64BIT_KERNEL
 	select CPU_SUPPORTS_HUGEPAGES
@@ -1566,6 +1568,7 @@ config CPU_R4X00
 config CPU_TX49XX
 	bool "R49XX"
 	depends on SYS_HAS_CPU_TX49XX
+	select CPU_HAS_LLSC
 	select CPU_HAS_PREFETCH
 	select CPU_SUPPORTS_32BIT_KERNEL
 	select CPU_SUPPORTS_64BIT_KERNEL
@@ -1574,6 +1577,7 @@ config CPU_TX49XX
 config CPU_R5000
 	bool "R5000"
 	depends on SYS_HAS_CPU_R5000
+	select CPU_HAS_LLSC if !64BIT
 	select CPU_SUPPORTS_32BIT_KERNEL
 	select CPU_SUPPORTS_64BIT_KERNEL
 	select CPU_SUPPORTS_HUGEPAGES
@@ -1583,6 +1587,7 @@ config CPU_R5000
 config CPU_R5500
 	bool "R5500"
 	depends on SYS_HAS_CPU_R5500
+	select CPU_HAS_LLSC
 	select CPU_SUPPORTS_32BIT_KERNEL
 	select CPU_SUPPORTS_64BIT_KERNEL
 	select CPU_SUPPORTS_HUGEPAGES
@@ -1593,6 +1598,7 @@ config CPU_R5500
 config CPU_NEVADA
 	bool "RM52xx"
 	depends on SYS_HAS_CPU_NEVADA
+	select CPU_HAS_LLSC if !64BIT
 	select CPU_SUPPORTS_32BIT_KERNEL
 	select CPU_SUPPORTS_64BIT_KERNEL
 	select CPU_SUPPORTS_HUGEPAGES
@@ -1602,6 +1608,8 @@ config CPU_NEVADA
 config CPU_R10000
 	bool "R10000"
 	depends on SYS_HAS_CPU_R10000
+	select CPU_HAS_LLSC if !WAR_R10000_LLSC
+	select CPU_MAY_HAVE_LLSC
 	select CPU_HAS_PREFETCH
 	select CPU_SUPPORTS_32BIT_KERNEL
 	select CPU_SUPPORTS_64BIT_KERNEL
@@ -1613,6 +1621,7 @@ config CPU_R10000
 config CPU_RM7000
 	bool "RM7000"
 	depends on SYS_HAS_CPU_RM7000
+	select CPU_HAS_LLSC
 	select CPU_HAS_PREFETCH
 	select CPU_SUPPORTS_32BIT_KERNEL
 	select CPU_SUPPORTS_64BIT_KERNEL
@@ -1622,6 +1631,7 @@ config CPU_RM7000
 config CPU_SB1
 	bool "SB1"
 	depends on SYS_HAS_CPU_SB1
+	select CPU_HAS_LLSC
 	select CPU_SUPPORTS_32BIT_KERNEL
 	select CPU_SUPPORTS_64BIT_KERNEL
 	select CPU_SUPPORTS_HIGHMEM
@@ -1656,6 +1666,7 @@ config CPU_BMIPS
 	select CPU_BMIPS4350 if SYS_HAS_CPU_BMIPS4350
 	select CPU_BMIPS4380 if SYS_HAS_CPU_BMIPS4380
 	select CPU_BMIPS5000 if SYS_HAS_CPU_BMIPS5000
+	select CPU_HAS_LLSC
 	select CPU_SUPPORTS_32BIT_KERNEL
 	select DMA_NONCOHERENT
 	select IRQ_MIPS_CPU
@@ -2381,6 +2392,15 @@ config CPU_DIEI_BROKEN
 config CPU_HAS_RIXI
 	bool
 
+# For CPU that must have LLSC
+config CPU_HAS_LLSC
+	def_bool TARGET_ISA_REV > 0 && !WAR_4KC_LLSC
+	select CPU_MAY_HAVE_LLSC
+
+# For CPU that LLSC support is optional
+config CPU_MAY_HAVE_LLSC
+	def_bool TARGET_ISA_REV > 0
+
 config CPU_NO_LOAD_STORE_LR
 	bool
 	help
diff --git a/arch/mips/include/asm/cpu-features.h b/arch/mips/include/asm/cpu-features.h
index 404390bb87ea..40f5570de563 100644
--- a/arch/mips/include/asm/cpu-features.h
+++ b/arch/mips/include/asm/cpu-features.h
@@ -185,8 +185,15 @@
 #ifndef cpu_has_ejtag
 #define cpu_has_ejtag		__opt(MIPS_CPU_EJTAG)
 #endif
+
 #ifndef cpu_has_llsc
-#define cpu_has_llsc		__isa_ge_or_opt(1, MIPS_CPU_LLSC)
+# if defined(CONFIG_CPU_HAS_LLSC)
+#  define cpu_has_llsc		1
+# elif defined(CONFIG_CPU_MAY_HAVE_LLSC)
+#  define cpu_has_llsc		__opt(MIPS_CPU_LLSC)
+# else
+#  define cpu_has_llsc		0
+# endif
 #endif
 #ifndef kernel_uses_llsc
 #define kernel_uses_llsc	cpu_has_llsc

-- 
2.43.0


