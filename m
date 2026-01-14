Return-Path: <linux-mips+bounces-12914-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB73D1D048
	for <lists+linux-mips@lfdr.de>; Wed, 14 Jan 2026 09:06:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C001D30807D4
	for <lists+linux-mips@lfdr.de>; Wed, 14 Jan 2026 08:02:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33CCE37F0E9;
	Wed, 14 Jan 2026 08:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="SqgWA4bk";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="7pron36K"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2949136D516;
	Wed, 14 Jan 2026 08:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768377719; cv=none; b=G/dUehPLLuvx04/poTuPflbxu8tLYTakzP7khxpjdwxXEM+uUJS6rxm+jBWn3wZIpJLBr3iineYIC0TmKHN5468hZKUoLzwInsPROBNI8wXEs8L/YWw9K85MFHkWePYPSMPX0Ok/0NwDcu+3PKLDEQyzkeEDf8g8+pjrLoL4CJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768377719; c=relaxed/simple;
	bh=g995SSm3uWzL44zLMQLhSq6MK4ouj0wlKz2rgfV0H+o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=koV2qU3Vz+dtN24C4sfqQixlcHqpMAn+DxKybjPhVr3uEIlNMhLIkg3zP3kNqVyhCOC7sq8sGptifR0AtCbJ6YcB9KPG2s5FswkSubobY818fb2qedsFOhk1KsB2Rg8tmw0dkgN+cKaRLHjcrqf/F8UnoRnvgcrRWwR+HA0Z3tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=SqgWA4bk; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=7pron36K; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768377709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AteQZ3KBIfsVSOXUBvv1Cta9HUtHJMPoDJ4rOsFT/ag=;
	b=SqgWA4bk8SrK6zjJ4XxmwFz+y9tDmHRhrxGxhxl3L/2r2LCR3aoaky67UPQb3Yo2OL+SAZ
	dqEWaBVQ5rsSIViEw2ZmEFFOY8Iaozzv/32+2oCvOLVra/IfN0M5exCxWLzjXGVUTaXhPm
	Cfnbttb4fJrG1BvUQ6dcPkB6I0p/TJdERpSCRzjMapdsB4D3lBDHFvIApWUIalsKjSKeB3
	HZ3Q3KZJo85miX/EGLFz24mL0M/W7KK6QPiW45oT+vNjeBp6aVI/BWVa4uRDEd+sdnBxz8
	fdjlnGTb09ljHzIG/7WGjRgPQEdWVabnJXSo9kk0L+HQavOOYVV535TKUIqkXQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768377709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AteQZ3KBIfsVSOXUBvv1Cta9HUtHJMPoDJ4rOsFT/ag=;
	b=7pron36KPlFyKJz/lpVdvxza0tvjCOJMz4XVlJ7RXgQLmi/jBCCgjvMsNC4VxsjSLC8Wn+
	vQdi+GyFR/2Z/IBA==
Date: Wed, 14 Jan 2026 09:01:45 +0100
Subject: [PATCH 13/15] vdso/datapage: Trim down unnecessary includes
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260114-vdso-header-cleanups-v1-13-803b80ee97b4@linutronix.de>
References: <20260114-vdso-header-cleanups-v1-0-803b80ee97b4@linutronix.de>
In-Reply-To: <20260114-vdso-header-cleanups-v1-0-803b80ee97b4@linutronix.de>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768377702; l=1385;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=g995SSm3uWzL44zLMQLhSq6MK4ouj0wlKz2rgfV0H+o=;
 b=GPOpY+Vh6GpRmj4NnspZfPS6Ur+/TqTHzwbWR6XsnTo2sNXRqpvdnzL0aWD8kRJSVfR2QvHDz
 ykPZv0hL9FFD3T2SL3t5+WRKuyHf1BLRHxL1Lno0Tku8oA1taiA1uim
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

vdso/datapage.h includes a lot of headers which are not strictly necessary.
Some of those headers include architecture-specific vDSO headers which
prevent the usage of vdso/datapage.h in kernel code on architectures
without an vDSO. This would be useful however to write generic code using
IS_ENABLED(), for example in drivers/char/random.c.

Remove the unnecessary includes.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 include/vdso/datapage.h | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/include/vdso/datapage.h b/include/vdso/datapage.h
index 752856b36a3a..9021b9580be2 100644
--- a/include/vdso/datapage.h
+++ b/include/vdso/datapage.h
@@ -4,24 +4,16 @@
 
 #ifndef __ASSEMBLY__
 
-#include <linux/compiler.h>
+#include <linux/types.h>
+
 #include <uapi/linux/bits.h>
 #include <uapi/linux/time.h>
-#include <uapi/linux/types.h>
-#include <uapi/asm-generic/errno-base.h>
 
 #include <vdso/align.h>
 #include <vdso/bits.h>
 #include <vdso/cache.h>
-#include <vdso/clocksource.h>
-#include <vdso/ktime.h>
-#include <vdso/limits.h>
-#include <vdso/math64.h>
 #include <vdso/page.h>
-#include <vdso/processor.h>
 #include <vdso/time.h>
-#include <vdso/time32.h>
-#include <vdso/time64.h>
 
 #ifdef CONFIG_ARCH_HAS_VDSO_TIME_DATA
 #include <asm/vdso/time_data.h>

-- 
2.52.0


