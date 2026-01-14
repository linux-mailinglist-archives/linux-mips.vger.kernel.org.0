Return-Path: <linux-mips+bounces-12911-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E80CD1D036
	for <lists+linux-mips@lfdr.de>; Wed, 14 Jan 2026 09:05:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3E7983071578
	for <lists+linux-mips@lfdr.de>; Wed, 14 Jan 2026 08:02:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CCD037E2F7;
	Wed, 14 Jan 2026 08:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="gNSUNHT2";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MaPGvtNJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287E237A49B;
	Wed, 14 Jan 2026 08:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768377716; cv=none; b=TC7tnScM4t7wy2LhQmxoNgnoliVoDlcmumBN6rqDJiztEGCkHMTpxGSt08zbUulzdq+YpaWbjXSicaJmT5q/6lhzGSaSSNsgxtxl0JnbP5tnJknEFsLWZQBBeyMHr0w8c3RlNG6CK0lGjLkZZCdPekuzhrjj0E7K2k9FqU94okw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768377716; c=relaxed/simple;
	bh=THNDDXQ5TJBoKfKwxJAGg9FjA6LPNIXQ/ren/+Tn+Gg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tNLIdGElMimpMYPhOewJOpcMkGVmjQ5L7J4rjRI08y4L8O8bpA9dnQEqVp2WH9DmLc2ZeQthrj0CeAKzlHuQ6EpMsLwEK//Udb6lWYWcycJxhdJVokEzdFgrmgiXTpqLD193UxGSO1OIbGIHVkFBXrTN0PpH+00kM31Hp3tAiPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=gNSUNHT2; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MaPGvtNJ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768377709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=srutgp5ltsK5marNkXQAClosvwfX5paP7Qw50M/lPDc=;
	b=gNSUNHT2Rz5KWbaYoJZcHnn2Z7Cm9xqgr++QSlSfckMUpi0W5cuqFkFGzXeNa7z4g1q79U
	B9K69bs/QTv6p2Ng3PW2GEtZjpgTa6u8uYIfAQyUNOUNKara8IXmwUuXfoKNVFnDZUiPCX
	fpB4dfv3i6hJd8Lfj+gbWx3laWHB9UTQjZlQ0Oo3vkRCSJupPnoiDdMz/D8e2Awb3tlztf
	kKp9xnhEhN7JJM44fgdmClbROa9nCbeSjSuj0WBZy3e8dbcxnsTlgDNesFZ8OS2hjjvfGg
	AWUImUCRUAuskq5Sv7lKK3iZPkkDxy82K45E5X4tZ+vb+kQj4ZbTsEwFGY9fHQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768377709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=srutgp5ltsK5marNkXQAClosvwfX5paP7Qw50M/lPDc=;
	b=MaPGvtNJuMUPnfncILTFe2Zf99j2549MU4IWOa7gyBdFT/i9VYhXllWkbHCgTiFecCpppF
	A1i5EXra5kq7wLCQ==
Date: Wed, 14 Jan 2026 09:01:44 +0100
Subject: [PATCH 12/15] vdso/datapage: Remove inclusion of gettimeofday.h
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260114-vdso-header-cleanups-v1-12-803b80ee97b4@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768377702; l=1781;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=THNDDXQ5TJBoKfKwxJAGg9FjA6LPNIXQ/ren/+Tn+Gg=;
 b=hfSBhCE095e3Dj2NAT41lp2oiOrF4FT96hfOuVk3jxeSncAn8rDr8dcwKf9HFHyeu3O8JEIZt
 QlK94/k4dWsDrhSqlhjs+eLBNm+uf5y5tW11k4se4l4taKK7aJW69kc
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

vdso/datapage.h is useful without pulling in the architecture-specific
gettimeofday() helpers.

Move the include to the only users which needs it.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 include/vdso/datapage.h | 11 -----------
 lib/vdso/gettimeofday.c | 11 +++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/include/vdso/datapage.h b/include/vdso/datapage.h
index 23c39b96190f..752856b36a3a 100644
--- a/include/vdso/datapage.h
+++ b/include/vdso/datapage.h
@@ -184,17 +184,6 @@ enum vdso_pages {
 	VDSO_NR_PAGES
 };
 
-/*
- * The generic vDSO implementation requires that gettimeofday.h
- * provides:
- * - __arch_get_hw_counter(): to get the hw counter based on the
- *   clock_mode.
- * - gettimeofday_fallback(): fallback for gettimeofday.
- * - clock_gettime_fallback(): fallback for clock_gettime.
- * - clock_getres_fallback(): fallback for clock_getres.
- */
-#include <asm/vdso/gettimeofday.h>
-
 #else /* !__ASSEMBLY__ */
 
 #ifdef CONFIG_VDSO_GETRANDOM
diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index 7b3fbae85544..9dddf6c23913 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -12,6 +12,17 @@
 #include <vdso/time32.h>
 #include <vdso/time64.h>
 
+/*
+ * The generic vDSO implementation requires that gettimeofday.h
+ * provides:
+ * - __arch_get_hw_counter(): to get the hw counter based on the
+ *   clock_mode.
+ * - gettimeofday_fallback(): fallback for gettimeofday.
+ * - clock_gettime_fallback(): fallback for clock_gettime.
+ * - clock_getres_fallback(): fallback for clock_getres.
+ */
+#include <asm/vdso/gettimeofday.h>
+
 /* Bring in default accessors */
 #include <vdso/vsyscall.h>
 

-- 
2.52.0


