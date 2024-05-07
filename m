Return-Path: <linux-mips+bounces-3124-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6F18BE238
	for <lists+linux-mips@lfdr.de>; Tue,  7 May 2024 14:35:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8AAF31F263F0
	for <lists+linux-mips@lfdr.de>; Tue,  7 May 2024 12:34:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0B8F15B96B;
	Tue,  7 May 2024 12:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="wnRbNvKU";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Vy6SA7G+"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfout4-smtp.messagingengine.com (wfout4-smtp.messagingengine.com [64.147.123.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD24A15749B;
	Tue,  7 May 2024 12:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715085286; cv=none; b=Jpgv8VzpbU9RiuKg7qFgTHmzCAbpHoOUYRhaZS/AXQdh7jpz0hRXR0/kXUhYPIufkZ5HpJeTOPtDnV7f/Fv6OsaY8Z9O0Uo3fnVAAfT6V+d6Afoedy+hm9yPScaX5jbpMTDnzWgJ5teG/8/4zmWhTMV36DJJJ0xa6WSP8rxFYgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715085286; c=relaxed/simple;
	bh=iL6GI7aV2jfgN0Ty0EEFCb0zJ1lztC2ii8V+5S1hoV8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Wq/UcZuPGGQgmsC+ajQ3d4sCd/JPyOFTw+cD99GHsjRLxFCGNDBnUNb47OEVu9fYVCZt0NRwFURmaAXmWlfPF4OWQWyucM58Gs3l6mIVQ9SEop60syZ+wnIOZDpobU8QEt7WhwLdM80gayx6d26QVGRUuxdesZj9/V33Ke7rK88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=wnRbNvKU; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Vy6SA7G+; arc=none smtp.client-ip=64.147.123.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfout.west.internal (Postfix) with ESMTP id 77BE41C00161;
	Tue,  7 May 2024 08:34:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Tue, 07 May 2024 08:34:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1715085283; x=1715171683; bh=U1
	dkwENjcmwwYQ8mV+eWVW+5rVqPT400QM8JICAKW8I=; b=wnRbNvKUtTDASqFeE1
	q1xBat7Q3A3bqjIPrkX8O3bJ6AepKUgEQxjAP4xduMEUXvcSF73dgtyfIUbM6mI5
	sVBHsrHSkljMD8hClP3LoqktLrA6r1okfcQEIrw9YPJIQ9ekS9wJz2AEe4Pe/kpt
	Son6pSDWRDQfrqeVVUIOvCLP/dg4FUQKZ3xtqmWAW01rqRBQp1YIx46NabGlUMv5
	PKroQFFLoCxSyoH4vnrVDWkPVMJE7iZfCUaDZeG0/nxjq0niSKinmlPx2NkyJEek
	5/KMTyS6NGak7aIgxmrVmMDJVYLC2W0ar6p1hDHUeLHZdgqomCwfshUCnMbmGJGi
	f2xg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1715085283; x=1715171683; bh=U1dkwENjcmwwY
	Q8mV+eWVW+5rVqPT400QM8JICAKW8I=; b=Vy6SA7G+AlbAwtPQV9oygCTpBP/7+
	DcF8MyHt0hooyYSx2e3gUvnzpJGo9iiJlguQsjKxLz7f6JDclNek4K9wUwMaWQte
	THQ2w5DD/ulnMns+ztxfqOAm6dl19stv1mDIhW+Ip1hMN0gV+dCzKQN4uSXwVwYv
	gocn4bDhkVvnAkI6v0fANh3hVLSc7TNGvP4g/x0crS8wj/cqPgY9oFGI9ThjDfYN
	ZCAzRx0cda2iDkwtMH2aWu3wueMoNfHkgh/Eexdc7K8gxXvEl0C2+spPxFQ/o25s
	kWPjoDY1T+GYLlDR8kMePJi/encOxW/UBIb5KuJfXrQiviMAHG6HmO45w==
X-ME-Sender: <xms:4h86ZmAIWOgZUeHHWauojVlJww50TiWbYWpPfvm4mGas7dsTpYLSvw>
    <xme:4h86Zgjtd0Uvd9h9Gbf1AlKDhwFp_l1rHh_5E3PAzHZ69o-xgQ35_Zt3WZE5B0He7
    hDxL7TZhGALP-popE0>
X-ME-Received: <xmr:4h86Zpl0xb1sFhqQBT6vqiHq-_Md3I6A32wuDL6kVDOZLtzZ0hMK8vQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddvkedgheduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkffvvefosehtjeertdertdejnecuhfhrohhmpeflihgrgihu
    nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
    ftrfgrthhtvghrnhepffetueegkedtgfejveeuvdfghfegtddvgfehudeghfegheetuedu
    heduveejtefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:4h86ZkyHw6MHdrgfyB3ZNrga1CxqFoPbghq_5qGIQVGtyY0F0zKZrg>
    <xmx:4h86ZrSnIkQJ7Cbt2FKqH-8hTAujL6XVsW-ch6InTi37ituOMp5wUw>
    <xmx:4h86Zva7Q1hXyq6lkKRvGLjvbbiX9SJz2yFNlr9_8uSO6qMBJD3gUw>
    <xmx:4h86ZkSdG30cI8O6xlL7xdWPVqXAkTyq3frceMcwzu2C0PgEEs2P4A>
    <xmx:4x86ZqFFWCUWzbXW9cunocsY8O3wxTJj3ENF_KgdquLiGCODIEuF21vg>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 May 2024 08:34:41 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Tue, 07 May 2024 13:34:40 +0100
Subject: [PATCH] MIPS: Implement ieee754 NAN2008 emulation mode
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240507-mips_ieee754_emul-v1-1-1dc7c0d13cac@flygoat.com>
X-B4-Tracking: v=1; b=H4sIAN8fOmYC/x3MSwqAIBRG4a3EHSdYaFZbiYjI37rQC6UIwr0nD
 b/BOS8FeEagNnvJ4+bAx55Q5BlNy7jPEGyTqZSlkloasfEZBgZgtBqwXauwhakr7WxTG0mpOz0
 cP/+z62P8AKGTj5VjAAAA
To: Jonathan Corbet <corbet@lwn.net>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4991;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=iL6GI7aV2jfgN0Ty0EEFCb0zJ1lztC2ii8V+5S1hoV8=;
 b=owGbwMvMwCHmXMhTe71c8zDjabUkhjQr+cczVHdFsE48dsojZR1joJjhtomfhb6asR4Vf7zr7
 d0n09k+dJSyMIhxMMiKKbKECCj1bWi8uOD6g6w/MHNYmUCGMHBxCsBEqjQY/sf/zI/y61G4zu6n
 YOS1rPaa8GqX+Ie5Xw2OcX1+3vbyhADD/zqLBtZ/QVwyC0XEe1POXOJavst28ZJphxuSxFg825P
 t+AE=
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
 Documentation/admin-guide/kernel-parameters.txt |  4 +++-
 arch/mips/include/asm/fpu.h                     | 15 +++++++++++++++
 arch/mips/kernel/elf.c                          |  4 ++++
 arch/mips/kernel/fpu-probe.c                    | 10 +++++++++-
 4 files changed, 31 insertions(+), 2 deletions(-)

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
index e689d6a83234..4b4804bb0c0f 100644
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
@@ -204,6 +205,11 @@ static void cpu_set_nan_2008(struct cpuinfo_mips *c)
 		mips_use_nan_legacy = !cpu_has_nan_2008;
 		mips_use_nan_2008 = !!cpu_has_nan_2008;
 		break;
+	case EMULATED:
+		/* Pretend ABS2008/NAN2008 options are dynamic */
+		c->fpu_msk31 &= ~FPU_CSR_NAN2008;
+		c->fpu_csr31 &= ~FPU_CSR_ABS2008;
+		fallthrough;
 	case RELAXED:
 		mips_use_nan_legacy = true;
 		mips_use_nan_2008 = true;
@@ -226,6 +232,8 @@ static int __init ieee754_setup(char *s)
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


