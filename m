Return-Path: <linux-mips+bounces-12906-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D67A0D1D015
	for <lists+linux-mips@lfdr.de>; Wed, 14 Jan 2026 09:04:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E22ED305EE79
	for <lists+linux-mips@lfdr.de>; Wed, 14 Jan 2026 08:01:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AEBF37C10B;
	Wed, 14 Jan 2026 08:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Gat/DG50";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0ACNizg5"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3EF342C8E;
	Wed, 14 Jan 2026 08:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768377711; cv=none; b=SmSV/dPMEYz2ZuQTF3hm6ukRTmxMLfgM0sbM/vhhb+1qjkiMZympI55jQciEgr+cUKsD26iBvlzpwJEbkQ92/AqcDACw4UEdhi/fs0t3kos25bCjjiWpCsVyDL5RbVhkaeawlPFhQshNoQN3KVmmf0v1SPXc+Dk/so9mAKMYffQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768377711; c=relaxed/simple;
	bh=CY5CpcPjq39MxqXMgbeDe7Nib98JfeTlvdi5xywuqgU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h2+iluT5iNu+QIvPqHiwZ6rP+dyGjrPGcdzT8yln7D8QVKqSuk4m/A9vWVP9wW+WZw8coptaF1zmWZ9xRiwCTbcGDrpEYP3G7+cTKe2XAkZYsr4WIsf0n+ppoAq6OFrdJB0ZCAiuzV0lYYFrqhwx9YeJFrtcP4a23L/DN46RdeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Gat/DG50; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0ACNizg5; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768377705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zf5YPzBQZDKrsTEVEPeYB2jMwqKC6r6qPkNYPXsVb+g=;
	b=Gat/DG50EAv/3EUc+6tlnCSA4nVoo2IOEVoTzpJlC8YhGCU8YB49JbSnusWsGweENp3pD6
	MeCm5iMMeRVNtRaZTECKU36redthL+vR6zhLgbGcuqkBqEcG9YSHWl4kEiQrXWjIaga+59
	8O3wGFUmyTObNW1QwcHo6u6UFvqZUdSUNy/NDFpkNnB+qN9vZ10o/AlJWKdgkLCZq3bsqU
	gqUqMUJeLCmQyPKLx8xiluZPTnzLx1ZmAusMQKuy2oD6ESW/LmUX2Peh9p2T0OeCQFpRA+
	lF02K+yP8Mk4lLVr6G0+ld7Di1EHWe9X9mhTGYyNqLI80GqN7t33iQGuGGbWNw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768377705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zf5YPzBQZDKrsTEVEPeYB2jMwqKC6r6qPkNYPXsVb+g=;
	b=0ACNizg5JT1Theaq397XvnVuytrcm3g1AHlXzaxE4xRWbheQ3cG0n5NLWSi+EampNnrqDE
	rLoaSZmZWv3GenBA==
Date: Wed, 14 Jan 2026 09:01:36 +0100
Subject: [PATCH 04/15] powerpc/vdso/gettimeofday: Explicitly include
 vdso/time32.h
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260114-vdso-header-cleanups-v1-4-803b80ee97b4@linutronix.de>
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
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Christophe Leroy <chleroy@kernel.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768377702; l=856;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=CY5CpcPjq39MxqXMgbeDe7Nib98JfeTlvdi5xywuqgU=;
 b=VaXzMveM6w4lOMIzZU6BEqJfNH9Cy5CDDT+7C6Azm9qkQOzBblUXGxZ15dzSZ0L63+fWF8qtf
 69bxDBriopJBCPBqTO8UjWYD6IuNUPAiExJ1TXcZbUCW7yYe0bsacma
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The usage of 'struct old_timespec32' requires vdso/time32.h. Currently
this header is included transitively, but that transitive inclusion is
about to go away.

Explicitly include the header.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/vdso/gettimeofday.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/include/asm/vdso/gettimeofday.h b/arch/powerpc/include/asm/vdso/gettimeofday.h
index ab3df12c8d94..b2f0e971076a 100644
--- a/arch/powerpc/include/asm/vdso/gettimeofday.h
+++ b/arch/powerpc/include/asm/vdso/gettimeofday.h
@@ -8,6 +8,7 @@
 #include <asm/barrier.h>
 #include <asm/unistd.h>
 #include <uapi/linux/time.h>
+#include <vdso/time32.h>
 
 #define VDSO_HAS_CLOCK_GETRES		1
 

-- 
2.52.0


