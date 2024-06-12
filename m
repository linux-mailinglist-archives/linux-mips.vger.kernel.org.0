Return-Path: <linux-mips+bounces-3603-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B283904F9E
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 11:53:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6226A1C232F7
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 09:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AF5C16DED5;
	Wed, 12 Jun 2024 09:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="kpghKClB";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="N8V0OcSj"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F0116D9AD;
	Wed, 12 Jun 2024 09:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718186018; cv=none; b=aCnjqUMSgncAMrhccxrjI3ZpKu6FmFr4T9W73yWAY98xr2KWq96auSVvhBRuxC3Np3tBTfj2LuS33x/grajHp8zw8oJp+PTF5vXfqc3hQaYzKakeSUMwqcu86Mv0TOJOIPPwFfFhd7dLNgsFORPjov64q0ri3u5kIkDgO2ItST8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718186018; c=relaxed/simple;
	bh=9nYC1z3pwGvu5sxqw2LkoGhWr5mHdSDkIDT42XnAyFA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ls/JS5LHYd4Hv9/KtJDI2CXbbpj9o6Ib2ThCclUfe5XuhEFGy97kIzUd8iCk6cPMuRnDmuw4K2jd1lDRySXlbaDnSYL4zRwEYQhZdLfzxaIVWHHBrY+eMt/Vyp1vgWg2vNRdPNfgYdJDxZ/fOBVSD82qWqtAlkV5caeOxvoEFmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=kpghKClB; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=N8V0OcSj; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 9377A11400DD;
	Wed, 12 Jun 2024 05:53:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 12 Jun 2024 05:53:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1718186015;
	 x=1718272415; bh=Lio36dveHM/2JUJ658p4iwLNmnULKJaqe7pYTyb44Xw=; b=
	kpghKClB6sXWt6zH0RE64hpyegoeNjXuxx5UTlD4mwQ/AUktktDMjDeAn4d1//sy
	vqfN5sSbFnMc2QDIe9cZbdNRRqCtSb+DczkN3NcLr2Ib0fds6E4lzrZSdiwf7le4
	Mtu/1TJcnqJ++76erynH5uYRU1GvX95m5Qmje2Wx2twUlvJrISpwbkCAQLkOW7mn
	p25aB9SMiLs+eBY6a+EVTxkdur8pJ8+7o3GBLoAV6soR2ygoaJbbjPFLJ6EA+NMQ
	qngbwdAuyx+6j8tt4kdV8M+nN4LS+FzSw7uUG85evKsRTs7S4BnY/D8+YmwYBd53
	BKXTlI1bdiieIDWnoTqcDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718186015; x=
	1718272415; bh=Lio36dveHM/2JUJ658p4iwLNmnULKJaqe7pYTyb44Xw=; b=N
	8V0OcSjWY+JW7o6wrJSo4U2J1Mh4sNJsTUHQJ7N5c0QKW+akDWO/IiRvf9EvNuw/
	C5zGsr2GevzF3M83i5zPYNAKxkztF+22tpFf9wYdz4vRwelBTZxe6EAztBIL2/ep
	wbhx3rE8CM82dDaqe0wjwQGdSWRum+4eh82gZ21NVLvB3vH702/L+yAZ96X2l92b
	pJWanfp/eQUdzMG7S+s2zpYYf/mJ35KU1mTHTrKXU6pEnAk0KHrMdAnC7XLfcko3
	2MbpNPs7Zr9WQEV+iKNvsZ0/78s2NGvm1F+W0zMp+uk5cn9K03xM+jrHjN/6a0lE
	GfC1uYYwsLh5KyuYJ6D7w==
X-ME-Sender: <xms:H3BpZi6yr8QUYpJodQLJVHDNVBBAoJNcQDxYqJENX_LyxpDu2KCbZA>
    <xme:H3BpZr5NQgdun9a8B6ij7CS1NujKqoaQ-I_ni7aZss5jq1zdeI_C-2K_Av9ORd-0l
    89wkaqXUNlFAMzlU2E>
X-ME-Received: <xmr:H3BpZhcmnA8tvEvv84QFuVB9FCXtlsUd4ALmbGKuN3CunGNtozb_6S0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedugedgvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffekgedugefhtdduudeghfeu
    veegffegudekjeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:H3BpZvJNzENWOxGeM9vKexeh6kSwBdyIkI83qgLJHWX8AeR3CrTPHw>
    <xmx:H3BpZmJgYF8EUkFg6ACLEXFzBJxKsrOMUHYrs1hVCgpVF-NM0X7W2g>
    <xmx:H3BpZgyy34mY_yOJIw1bvVG4lCC8Nq7xo4w9Qlrw-iF-6LoQa7-zPg>
    <xmx:H3BpZqIo46t4gGKCXvSTTacBnzUuHdjPjN_XxV9Iqpen7uqJma7GfQ>
    <xmx:H3BpZu_-Rfi9Bn3YbGA4qaTBkirT2Z4j7IatXJuuV8BOiXKAelGbxGRk>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Jun 2024 05:53:34 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Wed, 12 Jun 2024 10:53:29 +0100
Subject: [PATCH v2 1/4] MIPS: Introduce WAR_4KC_LLSC config option
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-mips-llsc-v2-1-a42bd5562bdb@flygoat.com>
References: <20240612-mips-llsc-v2-0-a42bd5562bdb@flygoat.com>
In-Reply-To: <20240612-mips-llsc-v2-0-a42bd5562bdb@flygoat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Jonas Gorski <jonas.gorski@gmail.com>, 
 "Maciej W. Rozycki" <macro@orcam.me.uk>, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3467;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=9nYC1z3pwGvu5sxqw2LkoGhWr5mHdSDkIDT42XnAyFA=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrTMAtl2hkK5Oz9Ub3t7d035+7b+ewJDo+M8Yd/e+79Uh
 Y5OWr+6o5SFQYyLQVZMkSVEQKlvQ+PFBdcfZP2BmcPKBDKEgYtTACYSsI/hf80GYQ37NzsMljju
 9QkQ+2Xz79DV4iM7BGav5T/64bmqwxVGhs4kJ+v9O7zfHVMW5Zl9mP+Usul2wSmRZtdncAR6rb1
 9lBcA
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

WAR_4KC_LLSC is used to control workaround of 4KC LLSC issue
that affects 4Kc up to version 0.9.

Early ath25 chips are known to be affected.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
v2:
- Improve error message, taint kernel on error
- Don't override cpu_has_llsc if WAR_4KC_LLSC is not selected,
  cpu-probe logic can handle it, there is no need to mess around
  ifdef as suggested in previous review comments as WAR_4KC_LLSC
  is gated by SOC_AR5312.
---
 arch/mips/Kconfig                                        | 6 ++++++
 arch/mips/include/asm/cpu.h                              | 1 +
 arch/mips/include/asm/mach-ath25/cpu-feature-overrides.h | 6 ++----
 arch/mips/kernel/cpu-probe.c                             | 9 +++++++++
 4 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 1236ea122061..8ac467c1f9c8 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -221,6 +221,7 @@ config ATH25
 	select SYS_SUPPORTS_BIG_ENDIAN
 	select SYS_SUPPORTS_32BIT_KERNEL
 	select SYS_HAS_EARLY_PRINTK
+	select WAR_4KC_LLSC if SOC_AR5312
 	help
 	  Support for Atheros AR231x and Atheros AR531x based boards
 
@@ -2543,6 +2544,11 @@ config WAR_ICACHE_REFILLS
 config WAR_R10000_LLSC
 	bool
 
+# On 4Kc up to version 0.9 (PRID_REV < 1) there is a bug that may cause llsc
+# sequences to deadlock.
+config WAR_4KC_LLSC
+	bool
+
 # 34K core erratum: "Problems Executing the TLBR Instruction"
 config WAR_MIPS34K_MISSED_ITLB
 	bool
diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
index ecb9854cb432..84bb1931a8b4 100644
--- a/arch/mips/include/asm/cpu.h
+++ b/arch/mips/include/asm/cpu.h
@@ -247,6 +247,7 @@
 #define PRID_REV_VR4122			0x0070
 #define PRID_REV_VR4181A		0x0070	/* Same as VR4122 */
 #define PRID_REV_VR4130			0x0080
+#define PRID_REV_4KC_V1_0		0x0001
 #define PRID_REV_34K_V1_0_2		0x0022
 #define PRID_REV_LOONGSON1B		0x0020
 #define PRID_REV_LOONGSON1C		0x0020	/* Same as Loongson-1B */
diff --git a/arch/mips/include/asm/mach-ath25/cpu-feature-overrides.h b/arch/mips/include/asm/mach-ath25/cpu-feature-overrides.h
index ec3604c44ef2..4cf3d1ffba1a 100644
--- a/arch/mips/include/asm/mach-ath25/cpu-feature-overrides.h
+++ b/arch/mips/include/asm/mach-ath25/cpu-feature-overrides.h
@@ -24,14 +24,12 @@
 #define cpu_has_counter			1
 #define cpu_has_ejtag			1
 
-#if !defined(CONFIG_SOC_AR5312)
-#  define cpu_has_llsc			1
-#else
 /*
  * The MIPS 4Kc V0.9 core in the AR5312/AR2312 have problems with the
  * ll/sc instructions.
  */
-#  define cpu_has_llsc			0
+#if !defined(WAR_4KC_LLSC)
+#  define cpu_has_llsc			1
 #endif
 
 #define cpu_has_mips16			0
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index bda7f193baab..ff2905f59f2a 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -152,6 +152,15 @@ static inline void check_errata(void)
 	struct cpuinfo_mips *c = &current_cpu_data;
 
 	switch (current_cpu_type()) {
+	case CPU_4KC:
+		if ((c->processor_id & PRID_REV_MASK) < PRID_REV_4KC_V1_0) {
+			c->options &= ~MIPS_CPU_LLSC;
+			if (cpu_has_llsc) {
+				pr_crit("CPU has LLSC erratum, but cpu_has_llsc is force enabled!\n");
+				add_taint(TAINT_CPU_OUT_OF_SPEC, LOCKDEP_STILL_OK);
+			}
+		}
+		break;
 	case CPU_34K:
 		/*
 		 * Erratum "RPS May Cause Incorrect Instruction Execution"

-- 
2.43.0


