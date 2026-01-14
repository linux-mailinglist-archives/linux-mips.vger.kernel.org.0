Return-Path: <linux-mips+bounces-12903-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF85D1D009
	for <lists+linux-mips@lfdr.de>; Wed, 14 Jan 2026 09:04:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A5A62305B1F6
	for <lists+linux-mips@lfdr.de>; Wed, 14 Jan 2026 08:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81E2E301022;
	Wed, 14 Jan 2026 08:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Cjmfgcm3";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MTKqHMuA"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137DE2BE652;
	Wed, 14 Jan 2026 08:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768377709; cv=none; b=OvRP5aFXqMKEzNx+2DGf8HMC1kJbf6mX7XNdrW2vj6TP4f0AKFEXvLZLMqx2trydhwRIYh1j8CFPq2wppFgoC3Xk7EFkH4YruKNviWBajfqPWD4cmnKlpJOUHD/MAWopauQCg23RzSpZSscepmI0L6z4wB2CRO78xGXHaCr9iis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768377709; c=relaxed/simple;
	bh=MGIkY0CNSmg8aEEnDJvrpAOVG5mHT6sc+hCNGJPRU7Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iVen8X5IWq8mhtEQExHpG5M0XQZOUJQG70pTtma+mptGzIh1wzQppysyZAIk8ck3MQI7py+CtNv1Gk/yz1bToq8PSbLr6mBd0q2hB9PuHopTPPYj6Er8416RLEAzqbE4O/0Tp1elSrKJwoY2UnAQURPCpfiWkHXejCI0JmdZKes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Cjmfgcm3; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MTKqHMuA; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768377703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aey3W1GcF5/kk2rrmPxnaG8WX8/5pWHilYSE2+aWcjY=;
	b=Cjmfgcm32JhqkCEoeaSa9m2cIcMi8btvnt3YSf8E5s//imPdGugSjw298WAFNu+zQWvhyH
	Cy3fXO4wRSLdsdNe0neZS8UQfPnxTKhfqp349re7O8SAHxyEfUntmEmXiYvUiqmnhruBNh
	4bvnrbwt1xy1/T7b+axMGi7AHRxXh7vmVO06sXGFjb0A1C6FH7dRuvAezFI1QFxnZWsKOn
	YTC3U89Aqkdrl66NZST0xt8xuv4u7pgbiM/ZRcOTp1oRJUj3Z5Bbl4NZLfm9dcFT5DAky3
	XTsG90yM3cWzTbbCT68qcNmUSCK3b6hwbVpUCTomFS2Wg8e7b32WyWLLiwMbNA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768377703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aey3W1GcF5/kk2rrmPxnaG8WX8/5pWHilYSE2+aWcjY=;
	b=MTKqHMuAYUsqIwBOH4XjiusWx952DVnyz7WgydQWEvzRnedDf/Jg+FWUTUooorWrpXWk89
	BKb4+xxeiroGAdBw==
Date: Wed, 14 Jan 2026 09:01:33 +0100
Subject: [PATCH 01/15] arm64: vDSO: gettimeofday: Explicitly include
 vdso/clocksource.h
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260114-vdso-header-cleanups-v1-1-803b80ee97b4@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768377702; l=793;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=MGIkY0CNSmg8aEEnDJvrpAOVG5mHT6sc+hCNGJPRU7Y=;
 b=X5KSM5ToYToqgQd2Uf6oIkrmBvM99b3NT57ZSfONBWJXgIK1bfM5/+g+FO9eWk6dgSUdSXSTi
 HTI2+uEr87BBN/4H1eV6/rt8WfmZKL5MYQtWQoWgId1EwNAUplCOeO7
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The reference to VDSO_CLOCKMODE_NONE requires vdso/clocksource.h. Currently
this header is included transitively, but that transitive inclusion is
about to go away.

Explicitly include the header.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/arm64/include/asm/vdso/gettimeofday.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/include/asm/vdso/gettimeofday.h b/arch/arm64/include/asm/vdso/gettimeofday.h
index 3658a757e255..96d2eccd4995 100644
--- a/arch/arm64/include/asm/vdso/gettimeofday.h
+++ b/arch/arm64/include/asm/vdso/gettimeofday.h
@@ -9,6 +9,8 @@
 
 #ifndef __ASSEMBLER__
 
+#include <vdso/clocksource.h>
+
 #include <asm/alternative.h>
 #include <asm/arch_timer.h>
 #include <asm/barrier.h>

-- 
2.52.0


