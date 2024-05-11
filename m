Return-Path: <linux-mips+bounces-3230-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1648C30D2
	for <lists+linux-mips@lfdr.de>; Sat, 11 May 2024 13:22:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE6B21F2104E
	for <lists+linux-mips@lfdr.de>; Sat, 11 May 2024 11:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 769831EA74;
	Sat, 11 May 2024 11:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="mdg5YGSn";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Gl/UHAZT"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout4-smtp.messagingengine.com (fout4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432DE2F26;
	Sat, 11 May 2024 11:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715426523; cv=none; b=mqZX2nbebwdM/38h5xaaz9U/UFTENoqwKet1CmaePwapm+w/pE/HYYfiYY+/1o5TS9ApbifVx4BwCVVCOoCrYQO55+s2NRucc/XMKhYnfj181SGpca373NjbiNkzDFSz0bILgERhOmSOfB4zJp4vuq2yxsk5ztD0we7rWh2beFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715426523; c=relaxed/simple;
	bh=hkf4rEOCgdFntx/Mu1+PPXNkVUuEi+F6I9iRdoIj6vw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=L1vreo7RYL91luht5a9UJWCfgJ2h1Fqg8/cty4VuPTeAONbo6adJzYUKi4fdbX0aEf0eDuAFpImu8NqDbrgE3oNYdKmbNeBv/3CSByPPCH1yLXhbnBp0DO2CiSQXrX+NQdDWTe+Nf0vmcLVGF9pgNYlVBpft6F9WKVSfARomJLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=mdg5YGSn; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Gl/UHAZT; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailfout.nyi.internal (Postfix) with ESMTP id 45A2F1380234;
	Sat, 11 May 2024 07:22:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Sat, 11 May 2024 07:22:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1715426520; x=1715512920; bh=uw
	KqFrzk6W2ITMOqoowChbKdFFtrKD3DJW7TgtnFfqg=; b=mdg5YGSnDWeuUJmnmt
	prow9YFbdnNaWFWnQSMbYIEpSTzV3Zn3Scjc+TJ7Ykpx3fdebA/6sRpjyCSZr8cd
	jZAUyZk3G3Kxgr9UaT6ljxw1kkiTJ1aKa7Yrft2hLc7NBvSg6MI+HKHoTCp+Rt6P
	9SUHT9fsopB6TgGXMfz7F1LM0/dBh7RBYRsdEG2Q7ppe9FqpKBrTUsiQyJnHonJJ
	99PIUkD3c4kYNAylNhOqj7HNg+s7xMSrkOKeC/qlZSUVpbqaHUxA1KkiR2vKuJzo
	8yNb2rZmdGS9lkc5osNw5AXPrv5HjCP9+Kr7TCInP/TMjxA2nir4g6SjlHs9bg5L
	kpfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1715426520; x=1715512920; bh=uwKqFrzk6W2IT
	MOqoowChbKdFFtrKD3DJW7TgtnFfqg=; b=Gl/UHAZTdShA5IbCKHIscCv3CwCir
	gsPIayApKSUMmWx0awY6mAPuJQfPcOfC9/A0YNNXg3F7Vm2pNroOkubjQcNaY53G
	3Xz5tAVBOE9IePzimX3whHQezg1FGB6KrnfmDANMkjihfE5nwT3Cn98CFhjjGeOk
	dqNgGQhm9/gUx0hcpbLVPOqFVFvUATBEf368biRP9Ey+lK/mK3nXIVCgWQ7eeMsf
	j31Hko+3kIn0+DX/wQZSfKC4V9F4ns14P3H3OVgaUcRwyLXTJv/NO7tafAIUq5/G
	z9lYe0EuZ2iVQkZV7gsaTHZFvCdRoX/7pWrn144G8zv8AjpNpfPHaNgyQ==
X-ME-Sender: <xms:11Q_ZjkoMaQ1n56Jh1v7_7vV0hYpVB0ZY8F4BEBPeVvL0cdWzwa-Lg>
    <xme:11Q_Zm1yk90UqUtMYbejIZW3k5xOdpJx7rz2cWRhv2la9mgCVE_mSmuhZT6tCnmD3
    r8ErwX2R8gd9cYTHnU>
X-ME-Received: <xmr:11Q_Zpr-ccqLSXxiEItWLL2ozsrNOE_9fmoF68myYEBteSxKsxxXyxY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdegtddgfeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkffvvefosehtjeertdertdejnecuhfhrohhmpeflihgrgihu
    nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
    ftrfgrthhtvghrnhephfffgeejgfejieeugffgudegvdekffevgeeuteetgeejveeiteei
    vedvffehlefgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehf
    lhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:11Q_ZrkvIyRK-dOO6FRcJB-InV-sfEvy56BJ8aFnUo6M1mzBE1cSEg>
    <xmx:11Q_Zh1Mq6gvcwYizl82NL27piKmlMQW0vko8cOFpoaXEbyMfwo2Aw>
    <xmx:11Q_ZqsS9IjEspYMcGuMaLgmltLT-gVf2lTyY8SFmoFWC3PMaKaziQ>
    <xmx:11Q_ZlUm84rrK9r4mwLUHoBQIiaMb1OOQXL23--Bf3k3v_8-SoZVZA>
    <xmx:2FQ_ZroNDVgtBEWH1iDVsUspeItog0N8sd-ecQ2Yzk5jMxqMQYRCR2hV>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 11 May 2024 07:21:58 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sat, 11 May 2024 12:21:54 +0100
Subject: [PATCH v2] MIPS: Implement ieee754 NAN2008 emulation mode
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240511-mips_ieee754_emul-v2-1-af796ea21ef0@flygoat.com>
X-B4-Tracking: v=1; b=H4sIANFUP2YC/32NUQqDMBBEryL73ZQk1cb61XsUkbBZdUGNJFYq4
 t2beoAyX29g3uwQKTBFqLIdAq0c2U8J9CUD7O3UkWCXGLTUuSykESPPsWEiMkXe0PgehFOmvBe
 te5RGQtrNgVr+nM5XnbjnuPiwnRer+rX/bKsSKQ4NSqduaPHZDlvn7XJFP0J9HMcXGvFFl7QAA
 AA=
To: Jonathan Corbet <corbet@lwn.net>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5105;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=hkf4rEOCgdFntx/Mu1+PPXNkVUuEi+F6I9iRdoIj6vw=;
 b=owGbwMvMwCHmXMhTe71c8zDjabUkhjT7kOtTLj09yXBucUdUmm/czEsXMy9N3x1TtbLzkrvM4
 Yibl+P0OkpZGMQ4GGTFFFlCBJT6NjReXHD9QdYfmDmsTCBDGLg4BWAiz2sZGfrlrOM5FZfvnP9X
 /1+gyQWD7PrJN/tm6JWeXXPUhSWGNZ/hf/a5C3rX7DrCV0X6SV8wEVn/3MJQd/ZRnegZ1ikc+wp
 L2AE=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Implement ieee754 NAN2008 emulation mode.

When this mode is enabled, kernel will accept ELF file
compiled for both NaN 2008 and NaN legacy, but if hardware
does not have capability to match ELF's NaN mode, __own_fpu
will fail for corresponding thread and fpuemu will then kick
in.

This mode trade performance for corretness, while maintaining
support for both NaN mode regardless of hardware capability.
It is useful for multilib installation that have both types
of binary exist in system.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
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


