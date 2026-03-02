Return-Path: <linux-mips+bounces-13314-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kOLVGwuCpWl1CgYAu9opvQ
	(envelope-from <linux-mips+bounces-13314-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 02 Mar 2026 13:26:51 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 173101D8542
	for <lists+linux-mips@lfdr.de>; Mon, 02 Mar 2026 13:26:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 65D1230219E5
	for <lists+linux-mips@lfdr.de>; Mon,  2 Mar 2026 12:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 515DE373C1A;
	Mon,  2 Mar 2026 12:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="r/CSxxEZ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="S21YjUM3"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6247E36EA8E;
	Mon,  2 Mar 2026 12:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772454354; cv=none; b=ECBfhWMbSvCJNY/ibNruPV6JWWfnu+ODhYPl+Ltojt+Bby5og9+exiwHmJwo0IcSYkKk9eSyJHpGEYiZpFGvJaIQPpIAPFPlMTooLA72V29PndsUy1TebPRkd7TQDTy7lx43c5ZXNT1nOMTzwrJwa00YYcXL5AneMA2lXSL9vSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772454354; c=relaxed/simple;
	bh=TLuD8XFHYeCFVZxgca4zMFKNXfKPCtPRG8z7BYiMKxc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gHioHgrHFnOgCTCdJ5/ue0Vef9TN/NowFLYYknNdI5rYpyi8nzxAG+cHxBhAQQvEjT6dIplVlPwHIsCQdGrgfNZh0VklFVGbeJiOCIE63pIoN3jWPL/zh5C4UwJ2knBwyFG8rDVjPhY0BXSUooHe9xnZ1VjbaEd+RrLqou48ojw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=r/CSxxEZ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=S21YjUM3; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772454351;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ecfuUU5azHq8roSLF5Ax0HiBG0Iw5IvlHchWrSnBNHs=;
	b=r/CSxxEZZPx25noWnuLPEOlvg405Xw3xca3EQ0DE8oLM2u4AtAQKtb0mTgYGT7zNHayXKG
	BQcz8N1JHly/LqSLJydEWe+r3AoQ9SjVio2xtukiWONbZ7tY/j6K9f9K/VAjR8Y+XIZzRg
	Gc3NPnb6uEX0qpxuX6WKeYi+5XpUgY123rtr0SMPuI2QKA/Rp/0x4Yn05tRyih5Vmihiq1
	9LOdeK/U4wIXyctQGqk4grG7EJUMxQHBdiNQ768uDI5Dv6mpUX8ufkZ5jaGs7ki5MemiOk
	Kn0+iI9vvKr8GdhcFoMuZ0AFt61kGSLtejHCDQWf6JNj0nKrPOa3fswYI5rCNg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772454351;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ecfuUU5azHq8roSLF5Ax0HiBG0Iw5IvlHchWrSnBNHs=;
	b=S21YjUM37qvJpPQjuNWiTVpxOK1UlM+hhPYM3nYbn/dEZid8oxS5V9nRwJIuc/r7qqTqec
	PWpqTrRguz3wgvCQ==
Date: Mon, 02 Mar 2026 13:25:35 +0100
Subject: [PATCH 11/15] MIPS: Remove AT_VECTOR_SIZE_ARCH from UAPI
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260302-at-vector-size-arch-v1-11-a11f03ba2ca8@linutronix.de>
References: <20260302-at-vector-size-arch-v1-0-a11f03ba2ca8@linutronix.de>
In-Reply-To: <20260302-at-vector-size-arch-v1-0-a11f03ba2ca8@linutronix.de>
To: Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-sh@vger.kernel.org, linux-alpha@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772454343; l=1842;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=TLuD8XFHYeCFVZxgca4zMFKNXfKPCtPRG8z7BYiMKxc=;
 b=1ouhbDL/O9yTtFSwv4lrq+riHwXSRD0g9+uI9iWaUTHNLcjc0IXfS0sFkkdYUE4260PFKC7dE
 4P5ShG0H57pDHM2jDb3gFoqedukI/2cts2/yo62lyKCENJaUAL69pb8
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13314-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linutronix.de:mid,linutronix.de:dkim,linutronix.de:email,imgtec.com:email]
X-Rspamd-Queue-Id: 173101D8542
X-Rspamd-Action: no action

There is nothing userspace can do with this value. In the kernel is
always combined with AT_VECTOR_SIZE_BASE, which is not exposed to
userspace and also changes from time to time.

Move the symbol to a kernel-internal header.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/mips/include/asm/auxvec.h      | 17 +++++++++++++++++
 arch/mips/include/uapi/asm/auxvec.h |  8 +++-----
 2 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/arch/mips/include/asm/auxvec.h b/arch/mips/include/asm/auxvec.h
new file mode 100644
index 000000000000..76c445e7890f
--- /dev/null
+++ b/arch/mips/include/asm/auxvec.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright (C) 2015 Imagination Technologies
+ * Author: Alex Smith <alex.smith@imgtec.com>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation;  either version 2 of the  License, or (at your
+ * option) any later version.
+ */
+
+#ifndef __ASM_AUXVEC_H
+#define __ASM_AUXVEC_H
+
+#define AT_VECTOR_SIZE_ARCH 1 /* entries in ARCH_DLINFO */
+
+#endif /* __ASM_AUXVEC_H */
diff --git a/arch/mips/include/uapi/asm/auxvec.h b/arch/mips/include/uapi/asm/auxvec.h
index 612c2c41f60b..1331ac4d935e 100644
--- a/arch/mips/include/uapi/asm/auxvec.h
+++ b/arch/mips/include/uapi/asm/auxvec.h
@@ -9,12 +9,10 @@
  * option) any later version.
  */
 
-#ifndef __ASM_AUXVEC_H
-#define __ASM_AUXVEC_H
+#ifndef __UAPI_ASM_AUXVEC_H
+#define __UAPI_ASM_AUXVEC_H
 
 /* Location of VDSO image. */
 #define AT_SYSINFO_EHDR		33
 
-#define AT_VECTOR_SIZE_ARCH 1 /* entries in ARCH_DLINFO */
-
-#endif /* __ASM_AUXVEC_H */
+#endif /* __UAPI_ASM_AUXVEC_H */

-- 
2.53.0


