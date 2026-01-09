Return-Path: <linux-mips+bounces-12791-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF25D0876F
	for <lists+linux-mips@lfdr.de>; Fri, 09 Jan 2026 11:14:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 09B1D304DAFA
	for <lists+linux-mips@lfdr.de>; Fri,  9 Jan 2026 10:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 648A733557C;
	Fri,  9 Jan 2026 10:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ecrM2OLC";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="/Vr3oD+I"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B4E2D878D;
	Fri,  9 Jan 2026 10:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767953335; cv=none; b=pYe9i9HXSzu6kSaGB0r71RGZ5KwpGDA1IaQ+0bj9z3Gb4ETrTXW1/CGA9PmiMMluqrwg9wfk6H73SSh6stXg9KX250Ys5i7bMdlng5zGGShZY1yFAx0QaN/ulqa8mppwAEauTfzGM2GXvHy5cRetmdnIUmPnUktbTwttjRwse3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767953335; c=relaxed/simple;
	bh=2Ot3+P3TK5IGco1MKfvx/Pr9OQeUrqrUxlYQQRZTzdE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JuSK04NqRyHspFlgvRaWevCTi/3K1K2GoDqV0Ep/QImLCB/8/M93MsLMETex1qF/vTO8S9FFMoZCjlSHRPJ/Q06SKKw/jVUB7qDvG9GVRwxTcozt/5UPWki6ObXz5IEX8NzoBoOLXlAaj3UmaLmkrWo9U9s/sBXWzPrXtQgGESQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ecrM2OLC; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=/Vr3oD+I; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1767953332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hiWnSWZMqvtFwCijTWDIW4H2LrOeKESwb+4fOEG4YhY=;
	b=ecrM2OLClVWukRuY6OzAVicbQZO5OWtPUZpKX35SvEnkDjdDMlpuq6uOYae4JPqpu811uR
	jxpu60SXSVJw45kaUXTriYfeKaOn4WZv8wumV+Nl5TZCvjpQmm0MOy/05hOPY5IFFPWj/y
	gLyLo0AiZxsM4RwLNiubj3AcZP0gyEfgmoPfQuTIecDs+pjqslJlBidcAMvwcWojxRzrcN
	h5Dg/eG4Zkec82C5hktNjhI1JhcjqTMD9PZpPV4KSWH07Y6W1Crh9hj9dPT1N3NSD3mucN
	JeQ5j8pfdFG2N3UgLkSQ+B3V7tJeMrproMOxv8w9tPnVw2wy2c6bnWZGacX2YA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1767953332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hiWnSWZMqvtFwCijTWDIW4H2LrOeKESwb+4fOEG4YhY=;
	b=/Vr3oD+IXhKyGNsdyg4cC1B0DMKHtCCSLK3ThhruY3RTy7Ix90hLdkZmXiypdsS6IcoBO8
	592Wn2f4uMVIlfAA==
Date: Fri, 09 Jan 2026 11:08:49 +0100
Subject: [PATCH v2] MIPS: Implement ARCH_HAS_CC_CAN_LINK
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260109-cc-can-link-mips-v2-1-38123bfc5628@linutronix.de>
X-B4-Tracking: v=1; b=H4sIALDTYGkC/32NQQ6CMBBFr0Jm7Rg6QUBX3MOwqO1UJmpLWiQYw
 t2tHMDl+z///RUSR+EEl2KFyLMkCT4DHQowg/Z3RrGZgUo6KSJCY9Boj0/xD3zJmNCcTcllfau
 VayDPxshOll157TMPkqYQP/vDrH7pH9msUGFt20a32nFVUZe79xSDl+VoGfpt277E5XvCtAAAA
 A==
X-Change-ID: 20251222-cc-can-link-mips-c9c0e06b61f7
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767953331; l=2849;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=2Ot3+P3TK5IGco1MKfvx/Pr9OQeUrqrUxlYQQRZTzdE=;
 b=oplmTeLR4X1pZF75Y9hB8jAvJd3PPgKw25DVTQdiP5H+CKGzkEgXkBOYfu43GbH0X89Nxn7mR
 UnYyM6Ja8v4CIMv2fisntdvDRRRBxdxujah2ctN8thQ5tsnEzgycwEM
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The generic CC_CAN_LINK detection does not handle different byte orders
or ABIs. This may lead to userprogs which are not actually runnable on
the target kernel.

Use architecture-specific logic supporting byte orders instead.

Modern 64-bit toolchains default to a n32 libc, which are not
supported by all kernel configurations, as MIPS32_N32 is optional.
On 64-bit, test for a n32 ABI libc first and fall back to o64 and
o32 if necessary.

Link: https://lore.kernel.org/lkml/20260105100507-14db55e3-aa71-48bf-a6ac-33b186bd082f@linutronix.de/
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Changes in v2:
- Use -mabi= over -m32/-m64
- Link to v1: https://lore.kernel.org/r/20251222-cc-can-link-mips-v1-1-6d87a8afe442@linutronix.de
---
 arch/mips/Kconfig | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index b88b97139fa8..862a86cec501 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -4,6 +4,7 @@ config MIPS
 	default y
 	select ARCH_32BIT_OFF_T if !64BIT
 	select ARCH_BINFMT_ELF_STATE if MIPS_FP_SUPPORT
+	select ARCH_HAS_CC_CAN_LINK
 	select ARCH_HAS_CPU_CACHE_ALIASING
 	select ARCH_HAS_CPU_FINALIZE_INIT
 	select ARCH_HAS_CURRENT_STACK_POINTER
@@ -3126,6 +3127,33 @@ config CC_HAS_MNO_BRANCH_LIKELY
 config CC_HAS_BROKEN_INLINE_COMPAT_BRANCH
 	def_bool y if CC_IS_CLANG
 
+config ARCH_CC_CAN_LINK_N32
+	bool
+	default $(cc_can_link_user,-mabi=n32 -EL) if MIPS32_N32 && CPU_LITTLE_ENDIAN
+	default $(cc_can_link_user,-mabi=n32 -EB) if MIPS32_N32 && CPU_BIG_ENDIAN
+
+config ARCH_CC_CAN_LINK_N64
+	bool
+	default $(cc_can_link_user,-mabi=64 -EL) if 64BIT && CPU_LITTLE_ENDIAN
+	default $(cc_can_link_user,-mabi=64 -EB) if 64BIT && CPU_BIG_ENDIAN
+
+config ARCH_CC_CAN_LINK_O32
+	bool
+	default $(cc_can_link_user,-mabi=32 -EL) if (32BIT || MIPS32_O32) && CPU_LITTLE_ENDIAN
+	default $(cc_can_link_user,-mabi=32 -EB) if (32BIT || MIPS32_O32) && CPU_BIG_ENDIAN
+
+config ARCH_CC_CAN_LINK
+	def_bool ARCH_CC_CAN_LINK_N32 || ARCH_CC_CAN_LINK_N64 || ARCH_CC_CAN_LINK_O32
+
+config ARCH_USERFLAGS
+	string
+	default "-mabi=n32 -EL" if ARCH_CC_CAN_LINK_N32 && CPU_LITTLE_ENDIAN
+	default "-mabi=n32 -EB" if ARCH_CC_CAN_LINK_N32 && CPU_BIG_ENDIAN
+	default "-mabi=64 -EL" if ARCH_CC_CAN_LINK_N64 && CPU_LITTLE_ENDIAN
+	default "-mabi=64 -EB" if ARCH_CC_CAN_LINK_N64 && CPU_BIG_ENDIAN
+	default "-mabi=32 -EL" if ARCH_CC_CAN_LINK_O32 && CPU_LITTLE_ENDIAN
+	default "-mabi=32 -EB" if ARCH_CC_CAN_LINK_O32 && CPU_BIG_ENDIAN
+
 menu "Power management options"
 
 config ARCH_HIBERNATION_POSSIBLE

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251222-cc-can-link-mips-c9c0e06b61f7

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


