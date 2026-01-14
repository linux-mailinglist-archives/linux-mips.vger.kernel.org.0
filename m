Return-Path: <linux-mips+bounces-12917-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C52D1CFE8
	for <lists+linux-mips@lfdr.de>; Wed, 14 Jan 2026 09:03:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 915C93068B90
	for <lists+linux-mips@lfdr.de>; Wed, 14 Jan 2026 08:02:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A673A37F742;
	Wed, 14 Jan 2026 08:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="RyurSBgj";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="l7qPGnGH"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA0F37C102;
	Wed, 14 Jan 2026 08:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768377721; cv=none; b=gQgXWC9VzpBPJ/JaUlp3dh0Bu/JxGZnYF5HmVTfZmddMSIxnFZkTQsHPQ8TQHy0/2y8Jfarpa+2CYVVWJsXLaNm16j12utO4/bxHR+HoJzmIF7kr6+afl3pBf12GNb1JRJFJQlvMs2iaW9NnmoEnfPJBT7/e2BKeMpvjizZ34Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768377721; c=relaxed/simple;
	bh=hWNS5r+nVG82qGHJBln+sFq/LMfDMjk+1mqnsZRfOv0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ltZRnVHvSxURKMQDvfKOsPC6vwYav1kHPNeGlV2kOOMj4TVAEp9VOecZe6Ane8eEzJiXkQvqvSczFlx3jXeJZVsDQX/PAG7jRwg+UNBkdUW80Kv4nYo9J8Fpgiv2YWMInNrCmQfI7OE2fiiTlnZj40D7pIGs57CT9WNwTkwaVes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=RyurSBgj; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=l7qPGnGH; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768377710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mmsBDSxMj6qH4s0iKzaJH7Nug/ggM5kSynfO5FTnCzE=;
	b=RyurSBgjrMnPpN/v7XuuODcctqlEwgt8J5X0gQmXLCYO95Ln2RiV8XwaF4Fl5j4YUFO4lY
	696rPN38dXLI3L0pJcq/HngYPzDxyBwDCId7f0s8Vz3OJCSNR7VJAQwgJ53kqgL6RJPpLT
	igj2jTKMkQJ/zxRZj8YAqOlQww0Nn09pf7uR1g7QREOBG9DwfFUuaEwDHXCgDlyhsmCqAV
	kNzLv/7X1Z7uuriUned/Uh6x3M/HjtJi816D/F3YuXS0Gudo4YFAHa3o06w9Ys86v3b8B4
	VYnK+lnmVkhLqnPfnBTgdofGujprEcE0bZKQik5Hig4UeljVINe2w3DOoLRRYw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768377710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mmsBDSxMj6qH4s0iKzaJH7Nug/ggM5kSynfO5FTnCzE=;
	b=l7qPGnGHXJH0KcmQmnTwm1GJP+DHUChsn0oiH4+FraC+bkq8CiTeQ47lnjYNbQgxKFN+Je
	WvEeHFxO18ry+uDA==
Date: Wed, 14 Jan 2026 09:01:47 +0100
Subject: [PATCH 15/15] random: vDSO: remove ifdeffery
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260114-vdso-header-cleanups-v1-15-803b80ee97b4@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768377702; l=2360;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=hWNS5r+nVG82qGHJBln+sFq/LMfDMjk+1mqnsZRfOv0=;
 b=K+9+vpziH6VU/E7N8SWkH0wrpo7XaNAxqoMMFZ3emFBortUZ3UoHCQj7XlPTB+KcBwqZhdmpm
 FrOM7L8+JFpBTtEhmxp8CYwqmrSKBXfUdVWxXKDsrZGp1x5kwnmKm9s
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Recent cleanups of the vDSO headers allow the unconditional inclusion of
vdso/datapage.h and the declarations it provides. This also means that
the declaration of vdso_k_rng_data is always visible and its usage does
not need to be guarded by ifdefs anymore. Instead use IS_ENABLED().

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 drivers/char/random.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/char/random.c b/drivers/char/random.c
index c5122ff33594..64f709fdf434 100644
--- a/drivers/char/random.c
+++ b/drivers/char/random.c
@@ -56,9 +56,7 @@
 #include <linux/sched/isolation.h>
 #include <crypto/chacha.h>
 #include <crypto/blake2s.h>
-#ifdef CONFIG_VDSO_GETRANDOM
 #include <vdso/datapage.h>
-#endif
 #include <asm/archrandom.h>
 #include <asm/processor.h>
 #include <asm/irq.h>
@@ -274,7 +272,7 @@ static void crng_reseed(struct work_struct *work)
 	if (next_gen == ULONG_MAX)
 		++next_gen;
 	WRITE_ONCE(base_crng.generation, next_gen);
-#ifdef CONFIG_VDSO_GETRANDOM
+
 	/* base_crng.generation's invalid value is ULONG_MAX, while
 	 * vdso_k_rng_data->generation's invalid value is 0, so add one to the
 	 * former to arrive at the latter. Use smp_store_release so that this
@@ -288,8 +286,9 @@ static void crng_reseed(struct work_struct *work)
 	 * because the vDSO side only checks whether the value changed, without
 	 * actually using or interpreting the value.
 	 */
-	smp_store_release((unsigned long *)&vdso_k_rng_data->generation, next_gen + 1);
-#endif
+	if (IS_ENABLED(CONFIG_VDSO_GETRANDOM))
+		smp_store_release((unsigned long *)&vdso_k_rng_data->generation, next_gen + 1);
+
 	if (!static_branch_likely(&crng_is_ready))
 		crng_init = CRNG_READY;
 	spin_unlock_irqrestore(&base_crng.lock, flags);
@@ -742,9 +741,8 @@ static void __cold _credit_init_bits(size_t bits)
 		if (system_dfl_wq)
 			queue_work(system_dfl_wq, &set_ready);
 		atomic_notifier_call_chain(&random_ready_notifier, 0, NULL);
-#ifdef CONFIG_VDSO_GETRANDOM
-		WRITE_ONCE(vdso_k_rng_data->is_ready, true);
-#endif
+		if (IS_ENABLED(CONFIG_VDSO_GETRANDOM))
+			WRITE_ONCE(vdso_k_rng_data->is_ready, true);
 		wake_up_interruptible(&crng_init_wait);
 		kill_fasync(&fasync, SIGIO, POLL_IN);
 		pr_notice("crng init done\n");

-- 
2.52.0


