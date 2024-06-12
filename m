Return-Path: <linux-mips+bounces-3593-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B90904E4A
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 10:38:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6E461C225F3
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 08:38:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60B9916C875;
	Wed, 12 Jun 2024 08:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="QR4mtu4Q";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LV3x6O+L"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh3-smtp.messagingengine.com (fhigh3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1F116C6AF;
	Wed, 12 Jun 2024 08:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718181507; cv=none; b=YEOhiUeqwvIwLSlyrquSh0sVB/Sb0SqBev6T5EOjJMeGP8e2J5tL4sZmboW14Dpb3q2FZogyrRwQFMon9uDeJiy47zrShQl8PpAqwUyFwtbn1BS6PnFbssEWAAxgzaDvTIPN/EUBczwCGWCsCTiDx7mXTA9rCNOSXvAkZy/r2Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718181507; c=relaxed/simple;
	bh=YWtk753VKbXICjxbUaMpl058KAPoF0f/CE+ytNJPs8s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=i2PfCKHlBHFKfXuZO++V6TgzoYU+MmfN2kvNBoaz7W/k7w8D9MmT2L2Jmsf7PgsqwC6jgvGkeSe78RALMsaWMwMkPL/qnkzijQ9bgp/qV3KQDCL2Cvz0Chl1eEoaKegKy3PYjQBrsdzbJvgH3y+POBSDa191/wT8VVqHyo0BKvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=QR4mtu4Q; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LV3x6O+L; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 3E14611400C2;
	Wed, 12 Jun 2024 04:38:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 12 Jun 2024 04:38:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1718181504; x=1718267904; bh=rZ
	avWNgK9bWUu4tKzoeFNgjPgkMNXtCWKxY3QEFPpxQ=; b=QR4mtu4QkKm/ehGlCL
	fyS5lG9rREWk2DiZKOZs3VC2EnEYCeWHISO7eW3mGggsUNX3ZqRrD07w3SZLa2NY
	n6rhIXrdKTBbo84unZEevvrZsaTnl+plCEy/SMo+vTqaFlrbYo3Ed8wOtUklT0v5
	0EhYs5yOYaUK5fqfb280tTkBh8Fidg+agUgWGxBG8qn7IMaKHOG2XxSzrMuyRl3E
	14EbeIgZOpD7ZlmCrF/8ZY2vE4hEiwz0ZvNPfhu7K5/TEwXvg8EZtzfbeUzUGipt
	2nISveffagvUJcvdSb9eQqN9zkZEzvgyaS5B5h3PcYVtha0XkdG5wB/4d+6sTRHc
	cZjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1718181504; x=1718267904; bh=rZavWNgK9bWUu
	4tKzoeFNgjPgkMNXtCWKxY3QEFPpxQ=; b=LV3x6O+Lj9KkLO40kaFLQ1PNZI414
	4CvAtsEdYX02NNL/eSeevfZfherFNXYaPwW2jA/4n5q3vg4IEoWreANMewYy/z02
	gpFr8uPG5Xk8xpH0mWHljFzfTG7k/LRNNss5DejANTfMeYWdtmEJTClAsoWq0/FC
	YwAXcLidWYPI098dYqCFeCzjMN6dPEIeAqB6amcxGxcvCuXA9tYMwrKq3qTTYxNr
	2sJMP4mmknHso+NqkotHxvg6PX+9ayEX9aFnPNkfzwjSqJqxVIjKs+ZPNh6mn959
	L2HHuukcdHyiN2JPNxcqsHRQPFMIs5YH2Yx3QOazATT3cx5RJe5usrsPw==
X-ME-Sender: <xms:f15pZjvoP5roakX8fytarFKl5e7G8kz5ov1fsplqPSPW9hss6MQSwQ>
    <xme:f15pZkf_NKDQ_muq9ER-o60I0S9P4DCCr5zyu8M9kvWDiq5YT18OsCL6Y2daWmkr5
    sSWomDOYFjoIbuQqVA>
X-ME-Received: <xmr:f15pZmzTvrLRvMmH__goRZYdW_mSLJq8GGC0erTB5rtTn59Nqr7p1RY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedugedgtdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkffvvefosehtkeertdertdejnecuhfhrohhmpeflihgrgihu
    nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
    ftrfgrthhtvghrnhepkefhueffudekhfelvdffieejheegtdeuieffveelkeevhfevvedt
    keefhfegvddtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehf
    lhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:f15pZiN5pmF4ifi4rn0RZCPxi2e2pjtC6ZulOwo8EXXufZ66G_IZVQ>
    <xmx:f15pZj_KPmd_OpczBU2GSxlKPrhQhonY4R9kHJD6uGE6fUserkadTg>
    <xmx:f15pZiVTa_SLWLH-l8HnFDDpDPXOfG_Jf0DJSzlpJrqaec2ymP9fKw>
    <xmx:f15pZkc2H63vGk1wJyz05tu0QeiYvFZjQ64ipVrSFAe03GkckZ_PlA>
    <xmx:gF5pZkPpCFZuNibZW7mFHS3_SSvlUGplwVSSr6ESNwotI9g2WiYJed2Z>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Jun 2024 04:38:22 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Wed, 12 Jun 2024 09:38:19 +0100
Subject: [PATCH v3] MIPS: Implement ieee754 NAN2008 emulation mode
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240612-mips_ieee754_emul-v3-1-2c21b450abdb@flygoat.com>
X-B4-Tracking: v=1; b=H4sIAHpeaWYC/33NSwqDMBCA4atI1k1J4iO2q96jFAnJRAfUSGJDR
 bx7o6sWSpnVPzDfrCSARwjkmq3EQ8SAbkyRnzKiOzW2QNGkJoKJgpVM0gGn0CAAyLJoYHj21HB
 ZV6U1l1oyku4mDxZfh3l/pO4wzM4vx4vI9+0/LXKaxmipmeG5Vvpm+6V1aj5rN5Ddi+LD4PyXI
 ZKhrLxUoAQHy76Nbdvevqmo6fgAAAA=
To: Jonathan Corbet <corbet@lwn.net>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5330;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=YWtk753VKbXICjxbUaMpl058KAPoF0f/CE+ytNJPs8s=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrTMuLrqWzPuy5zXXPhvz6cYY/9F/X9a5P/vStMVr5yqK
 mKxziOto5SFQYyLQVZMkSVEQKlvQ+PFBdcfZP2BmcPKBDKEgYtTACaysp7hv6+h2NqczuAqjbBl
 DTcPy5i8v3FRZdnf2fFXDWS4k4tC9Rj+ipiwzY9c/FK9cuqyT3Z7ex7wr4hSmX9N2cOKIZp7pch
 DHgA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Implement ieee754 NAN2008 emulation mode.

When this mode is enabled, kernel will accept ELF file
compiled for both NaN 2008 and NaN legacy, but if hardware
does not have capability to match ELF's NaN mode, __own_fpu
will fail for corresponding thread and fpuemu will then kick
in.

This mode trade performance for correctness, while maintaining
support for both NaN mode regardless of hardware capability.
It is useful for multilib installation that have both types
of binary exist in system.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
Changes in v3:
- Fix typo in commit message
- Collect R-b tags
- Link to v2: https://lore.kernel.org/r/20240511-mips_ieee754_emul-v2-1-af796ea21ef0@flygoat.com

Changes in v2:
- Fix a typo
- Link to v1: https://lore.kernel.org/r/20240507-mips_ieee754_emul-v1-1-1dc7c0d13cac@flygoat.com
---
 Documentation/admin-guide/kernel-parameters.txt |  4 +++-
 arch/mips/include/asm/fpu.h                     | 15 +++++++++++++++
 arch/mips/kernel/elf.c                          |  4 ++++
 arch/mips/kernel/fpu-probe.c                    |  9 ++++++++-
 4 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 500cfa776225..dee487b03c9d 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2000,7 +2000,7 @@
 			for the device. By default it is set to false (0).
 
 	ieee754=	[MIPS] Select IEEE Std 754 conformance mode
-			Format: { strict | legacy | 2008 | relaxed }
+			Format: { strict | legacy | 2008 | relaxed | emulated }
 			Default: strict
 
 			Choose which programs will be accepted for execution
@@ -2020,6 +2020,8 @@
 				by the FPU
 			relaxed	accept any binaries regardless of whether
 				supported by the FPU
+			emulated accept any binaries but enable FPU emulator
+				if binary mode is unsupported by the FPU.
 
 			The FPU emulator is always able to support both NaN
 			encodings, so if no FPU hardware is present or it has
diff --git a/arch/mips/include/asm/fpu.h b/arch/mips/include/asm/fpu.h
index 86310d6e1035..bc5ac9887d09 100644
--- a/arch/mips/include/asm/fpu.h
+++ b/arch/mips/include/asm/fpu.h
@@ -129,6 +129,18 @@ static inline int __own_fpu(void)
 	if (ret)
 		return ret;
 
+	if (current->thread.fpu.fcr31 & FPU_CSR_NAN2008) {
+		if (!cpu_has_nan_2008) {
+			ret = SIGFPE;
+			goto failed;
+		}
+	} else {
+		if (!cpu_has_nan_legacy) {
+			ret = SIGFPE;
+			goto failed;
+		}
+	}
+
 	KSTK_STATUS(current) |= ST0_CU1;
 	if (mode == FPU_64BIT || mode == FPU_HYBRID)
 		KSTK_STATUS(current) |= ST0_FR;
@@ -137,6 +149,9 @@ static inline int __own_fpu(void)
 
 	set_thread_flag(TIF_USEDFPU);
 	return 0;
+failed:
+	__disable_fpu();
+	return ret;
 }
 
 static inline int own_fpu_inatomic(int restore)
diff --git a/arch/mips/kernel/elf.c b/arch/mips/kernel/elf.c
index 7aa2c2360ff6..f0e7fe85a42a 100644
--- a/arch/mips/kernel/elf.c
+++ b/arch/mips/kernel/elf.c
@@ -318,6 +318,10 @@ void mips_set_personality_nan(struct arch_elf_state *state)
 	t->thread.fpu.fcr31 = c->fpu_csr31;
 	switch (state->nan_2008) {
 	case 0:
+		if (!(c->fpu_msk31 & FPU_CSR_NAN2008))
+			t->thread.fpu.fcr31 &= ~FPU_CSR_NAN2008;
+		if (!(c->fpu_msk31 & FPU_CSR_ABS2008))
+			t->thread.fpu.fcr31 &= ~FPU_CSR_ABS2008;
 		break;
 	case 1:
 		if (!(c->fpu_msk31 & FPU_CSR_NAN2008))
diff --git a/arch/mips/kernel/fpu-probe.c b/arch/mips/kernel/fpu-probe.c
index e689d6a83234..6bf3f19b1c33 100644
--- a/arch/mips/kernel/fpu-probe.c
+++ b/arch/mips/kernel/fpu-probe.c
@@ -144,7 +144,7 @@ static void cpu_set_fpu_2008(struct cpuinfo_mips *c)
  * IEEE 754 conformance mode to use.  Affects the NaN encoding and the
  * ABS.fmt/NEG.fmt execution mode.
  */
-static enum { STRICT, LEGACY, STD2008, RELAXED } ieee754 = STRICT;
+static enum { STRICT, EMULATED, LEGACY, STD2008, RELAXED } ieee754 = STRICT;
 
 /*
  * Set the IEEE 754 NaN encodings and the ABS.fmt/NEG.fmt execution modes
@@ -160,6 +160,7 @@ static void cpu_set_nofpu_2008(struct cpuinfo_mips *c)
 
 	switch (ieee754) {
 	case STRICT:
+	case EMULATED:
 		if (c->isa_level & (MIPS_CPU_ISA_M32R1 | MIPS_CPU_ISA_M64R1 |
 				    MIPS_CPU_ISA_M32R2 | MIPS_CPU_ISA_M64R2 |
 				    MIPS_CPU_ISA_M32R5 | MIPS_CPU_ISA_M64R5 |
@@ -204,6 +205,10 @@ static void cpu_set_nan_2008(struct cpuinfo_mips *c)
 		mips_use_nan_legacy = !cpu_has_nan_2008;
 		mips_use_nan_2008 = !!cpu_has_nan_2008;
 		break;
+	case EMULATED:
+		/* Pretend ABS2008/NAN2008 options are dynamic */
+		c->fpu_msk31 &= ~(FPU_CSR_NAN2008 | FPU_CSR_ABS2008);
+		fallthrough;
 	case RELAXED:
 		mips_use_nan_legacy = true;
 		mips_use_nan_2008 = true;
@@ -226,6 +231,8 @@ static int __init ieee754_setup(char *s)
 		return -1;
 	else if (!strcmp(s, "strict"))
 		ieee754 = STRICT;
+	else if (!strcmp(s, "emulated"))
+		ieee754 = EMULATED;
 	else if (!strcmp(s, "legacy"))
 		ieee754 = LEGACY;
 	else if (!strcmp(s, "2008"))

---
base-commit: 93a39e4766083050ca0ecd6a3548093a3b9eb60c
change-id: 20240507-mips_ieee754_emul-d17865fd9870

Best regards,
-- 
Jiaxun Yang <jiaxun.yang@flygoat.com>


