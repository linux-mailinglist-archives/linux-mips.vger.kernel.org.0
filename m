Return-Path: <linux-mips+bounces-12913-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 513AAD1D039
	for <lists+linux-mips@lfdr.de>; Wed, 14 Jan 2026 09:05:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D0AC2307674D
	for <lists+linux-mips@lfdr.de>; Wed, 14 Jan 2026 08:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A41F37C114;
	Wed, 14 Jan 2026 08:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="pJFUzWW0";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zIgedRcN"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2872437A494;
	Wed, 14 Jan 2026 08:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768377716; cv=none; b=Oe7spJqNRSYf48E0KiQCsPweYGjj0J50EfiktIsjMfoAkxRr2JJWOr2fwQniex9FjPrMgIKYZtPRJo95+RrLtBnmp5RKM72QHUiII1ubkaVcXBc8fzP8iplMtprzKRFV9zRI4GmQpGz79SgTBbLEMrkgV9dCyji+t8c/Jwd/K7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768377716; c=relaxed/simple;
	bh=Ko7rOXN2f5vKh19n3ut994p4BW56m9dv4kY+PIvm7Yk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WHtWaWSgXJc3QqsXp3dEd92AiTzyTElfIvTeDpfVOUxWnkOgUCKC2+OvtZWATtdRmJOZYGDtbbDCf66NOP8U8cLOGOfptd9QGPFlqCRwUfINdUIDsIxz/Jy4htUFouW/uA+4mZg4Tj9oIJVi1eh/coSXwzJL7eDJQRXvpPje844=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=pJFUzWW0; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zIgedRcN; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768377707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2g3QVbHrWMxbltOpJFbYJDEOEW8Rpv5rFE4qRg3bpXo=;
	b=pJFUzWW05k5+SSg3f6116KzG9PtFSdPOXjYr/Y7ZNCV3dg2pqVk0Kh5F+WEGurOMxEvGLE
	e8WYlK46AjuQ1yAo4BHqfJ7OBebZp9MdZHX/jDMy6KeCFNsxRRgpaPLB5+rXbS+BVb9BbV
	MdHbtBPXSJK6/lrYeASQ+abCoQtNAKK3tHtoIvyNXqHLJIhPgkdoxHW7gsd6MbPwBPk7/I
	A9/vclGzyQH7p0C7So8wjn6VhQZDZQSlkSeHaDhxa3PVylvsORCST058MJx0LkJiKLlUSx
	jXp/no7CybdXDtdCD4+m5u6u7nyLj+SYsl4j4+SUUX/anoXGPOcxt9lfEZaYGA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768377707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2g3QVbHrWMxbltOpJFbYJDEOEW8Rpv5rFE4qRg3bpXo=;
	b=zIgedRcNd3q11NN2zkOnafQCoSRyD8+2dkrpNSIdUlN8QrHNXHEcE4bTlFmXGrUE5jATc9
	9KB/8Yf/M60VhQBQ==
Date: Wed, 14 Jan 2026 09:01:41 +0100
Subject: [PATCH 09/15] random: vDSO: Add explicit includes
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260114-vdso-header-cleanups-v1-9-803b80ee97b4@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768377702; l=796;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Ko7rOXN2f5vKh19n3ut994p4BW56m9dv4kY+PIvm7Yk=;
 b=PbIRfpWFNk9BAu4/xZnM8LVqwnYh83cMAfcRW7ldaxC8YUzNBltZ6iiaNDxvKbJrUjBSDRKG8
 VF9TendS0JWAdSkvD00Kqbs3zGzzNt5ZkyIFAgLOrROICTue30rPSrW
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Various used symbols are only visible through transitive includes.
These transitive includes are about to go away.

Explicitly include the necessary headers.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 lib/vdso/getrandom.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/vdso/getrandom.c b/lib/vdso/getrandom.c
index 440f8a6203a6..7e29005aa208 100644
--- a/lib/vdso/getrandom.c
+++ b/lib/vdso/getrandom.c
@@ -7,8 +7,11 @@
 #include <linux/minmax.h>
 #include <vdso/datapage.h>
 #include <vdso/getrandom.h>
+#include <vdso/limits.h>
 #include <vdso/unaligned.h>
+#include <asm/barrier.h>
 #include <asm/vdso/getrandom.h>
+#include <uapi/linux/errno.h>
 #include <uapi/linux/mman.h>
 #include <uapi/linux/random.h>
 

-- 
2.52.0


