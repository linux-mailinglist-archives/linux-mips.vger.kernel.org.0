Return-Path: <linux-mips+bounces-12902-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E15D1D003
	for <lists+linux-mips@lfdr.de>; Wed, 14 Jan 2026 09:03:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F5A93056754
	for <lists+linux-mips@lfdr.de>; Wed, 14 Jan 2026 08:01:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1A3237BE9B;
	Wed, 14 Jan 2026 08:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="X2n9lkHE";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="7G3UuikP"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C1835F8AF;
	Wed, 14 Jan 2026 08:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768377709; cv=none; b=hIh/rPAw1gizwYpUmZbAyzuEK0X/MTuTvgP+P/H74aN169AtGOlVH09+vp9/7UuzNcQzbPuYuJVlvUjD3UR8sAroGC7FTsby0S5Yc/susgy2BYOqo39KjfGRTsERagBkMYivtphiTYbfzhmWfNlrXYvx+sTnEPV5YTuWSfxzrAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768377709; c=relaxed/simple;
	bh=8dTNv+yVf4Z8az2E9ZQfv2/XdTFEorjE3dqOlt1qLCc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IFioY8ZKprXBwFvcgZxr9IdEsj89Xkz2E5G73aB1yp7I3H5KQdS285TcEJGeP+hkFdnDRVsTF8cYxZfejkJDLruVior3C06SwyXONVA0lZH3W+nfRl7tdTI+xJOlWghM97leWYU5Tx/vG55dzyK8zWyVwy0el3ivCGqQwDLM19M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=X2n9lkHE; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=7G3UuikP; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768377703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CZ4al2SPwjZRA5ArbmTM9kL6oha9+6/vJmT8I4plK7g=;
	b=X2n9lkHENZ4jfYgkIQ0C0U7KDMwiB/Rg2H2tdkd9A6BbnYGQPssZLxfBLWKDTbgxIrY/ur
	oXEl5UwdXS1/q1kXweuIY6KGKTNjDO18nlwRuPS0OKxUu+p3RAcGGSSv3TZr4o/cIa8sZQ
	1qlbd3VXxwi6M2SxeEAL/T/JANsRH+WI/8qWOnJh7mZpfb2m1nkTWDObXGYA8jNPwOqLi5
	UrzMlcBaRCIoSA955H6MQOSIqIIQSolCNrUd/zWbdpxZBiuaOwc7lKqtSqcTmFgjhVLpnY
	iBiQnI2wKNG6psVu+pogvmjS6xrs9jy+uW5UChHoqypIet1/Pnd/iQIYJ/l7vQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768377703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CZ4al2SPwjZRA5ArbmTM9kL6oha9+6/vJmT8I4plK7g=;
	b=7G3UuikPqM3fOKDGIyjEvivukjlLNfUfcdUPQWvDD+A26guirPEHCHpTzVW/XT9icRpcsf
	BkLU7S3q2MMxxXCQ==
Date: Wed, 14 Jan 2026 09:01:34 +0100
Subject: [PATCH 02/15] arm64: vDSO: compat_gettimeofday: Add explicit
 includes
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260114-vdso-header-cleanups-v1-2-803b80ee97b4@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768377702; l=920;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=8dTNv+yVf4Z8az2E9ZQfv2/XdTFEorjE3dqOlt1qLCc=;
 b=xtjZ67L1Em5phMztPWgzg+bM7UF3KsFOj9j8pFZJbq6H0oFSziF7X7lFCJyq48vPbE7jeJ7H9
 NtolTY0TjEjAce/TkjdesOrSUKjHjDD4T8aqlg3hZeamMTgUF8NYuU+
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The reference to VDSO_CLOCKMODE_ARCHTIMER requires vdso/clocksource.h and
'struct old_timespec32' requires vdso/time32.h. Currently these headers
are included transitively, but those transitive inclusions are about to go
away.

Explicitly include the headers.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/arm64/include/asm/vdso/compat_gettimeofday.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/include/asm/vdso/compat_gettimeofday.h b/arch/arm64/include/asm/vdso/compat_gettimeofday.h
index 0d513f924321..a03e34b572f1 100644
--- a/arch/arm64/include/asm/vdso/compat_gettimeofday.h
+++ b/arch/arm64/include/asm/vdso/compat_gettimeofday.h
@@ -7,6 +7,9 @@
 
 #ifndef __ASSEMBLER__
 
+#include <vdso/clocksource.h>
+#include <vdso/time32.h>
+
 #include <asm/barrier.h>
 #include <asm/unistd_compat_32.h>
 #include <asm/errno.h>

-- 
2.52.0


