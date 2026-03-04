Return-Path: <linux-mips+bounces-13353-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iE0NGFzlp2mrlAAAu9opvQ
	(envelope-from <linux-mips+bounces-13353-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 04 Mar 2026 08:55:08 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D981FC03E
	for <lists+linux-mips@lfdr.de>; Wed, 04 Mar 2026 08:55:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1292730C8B92
	for <lists+linux-mips@lfdr.de>; Wed,  4 Mar 2026 07:51:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE5C3391838;
	Wed,  4 Mar 2026 07:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TUma8354";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TA4XhvsB"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AA6390227;
	Wed,  4 Mar 2026 07:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772610567; cv=none; b=IqoIWLl0h2UfQQ3Na/HIjD9QwWrQOEHVrQQ6cKJZWo0r2S0tDpfu8V0HH/3Wzp6ZicmxJKpWXO8Wpr8Lc1+Ovv7S8EchgZtVEOfLEASJzfVPwg8m4iBkYJWHsKXaZkn/rUlhiKmUej5EZt7teqTAjvtvGBVnxEeqgM86TLrLijE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772610567; c=relaxed/simple;
	bh=iDk9V3ntFR0lAxAs8pK3LQ+mKj4dz/ED90/1ffGx9Gc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nKKo+Zpz/u3IX5vF+LNyK8kYsyKFl+n1HQJpGNKd/4qWwjAmQy2163387pLnBbArC5odv3tErRMQd32CNu9RFukc0rMoWCRjWFckK9ySeUmLQ56yZ4L8s0SX1K/guwapJ+MFXypXvyY7aQCNhQYewoaq1puVqgwi+uWWeu5gtTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=TUma8354; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=TA4XhvsB; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772610558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=stPu/Pg7Gwp256syBXoA2wyw5RrUxZ2jR6oZuDBIiJo=;
	b=TUma8354NtDFrG+4mvtIyyxhQq+HbNOuW6P01b3HFq770OndKpi+KVGQjtmVZChDoJFHtO
	rUOAFUFIPaIf/I2+EMWQxhXlSF9RZaQQaQJsfIvxMaeZVdX5F8x+Vu5qrRs1QNSlmRbxXL
	xdX6cHqBHExnQzax2FZNXtcQZrSQ3JXCja5BO4C8fQ4jxbazWuPWYLlUAG1HOiM3FTIz8G
	c8QTT+NVgmeQjWAFu6XPRLH6xPEnguKx+eYf6l5C9z62UeGDgdZfPd+jkInI2Z84B41Slr
	7Z6S1bJi6Ay00ofBeqckEJyevjsjaROkKkvBwaE5NcOGCjfBZtVsWdT+FE+ncw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772610558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=stPu/Pg7Gwp256syBXoA2wyw5RrUxZ2jR6oZuDBIiJo=;
	b=TA4XhvsBc/Q0Yq6jgA1qHBG/SEgChu3ZoC5WbDRldbPdXp9yt2MXZe5nFO1AFXq5csFCDJ
	owQS7zApkrMG0UBA==
Date: Wed, 04 Mar 2026 08:49:11 +0100
Subject: [PATCH v6 14/14] clocksource: remove ARCH_CLOCKSOURCE_DATA
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260304-vdso-sparc64-generic-2-v6-14-d8eb3b0e1410@linutronix.de>
References: <20260304-vdso-sparc64-generic-2-v6-0-d8eb3b0e1410@linutronix.de>
In-Reply-To: <20260304-vdso-sparc64-generic-2-v6-0-d8eb3b0e1410@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Nick Alcock <nick.alcock@oracle.com>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Shuah Khan <shuah@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Shannon Nelson <sln@onemain.com>, 
 Thomas Gleixner <tglx@kernel.org>, Christophe Leroy <chleroy@kernel.org>
Cc: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772610551; l=1674;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=9TopgYtPeKt3Ys7DxpwdywNMetiSuLHZh2lbdA88NxM=;
 b=KDIxPtrm+ydN9kSM9xMEmIzwIYBDq8jh59lJNtxjYHfiL1HmOTsC+gGTurS+pBQQ1s0H9GjbY
 onjpu6/WQ85D/1/+V1Td63v3IXx8HzglV4KTwC/Nx1uzM/E1ZG66gs4
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Rspamd-Queue-Id: E5D981FC03E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,arndb.de,davemloft.net,gaisler.com,oracle.com,google.com,physik.fu-berlin.de,mit.edu,zx2c4.com,armlinux.org.uk,linux.ibm.com,ellerman.id.au,gmail.com,xen0n.name,alpha.franken.de,onemain.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13353-lists,linux-mips=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[38];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:email,linutronix.de:dkim,linutronix.de:email,linutronix.de:mid,gaisler.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

From: Arnd Bergmann <arnd@arndb.de>

After sparc64, there are no remaining users of ARCH_CLOCKSOURCE_DATA
and it can just be removed.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: John Stultz <jstultz@google.com>
[Thomas: drop sparc64 bits from the patch]
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Tested-by: Andreas Larsson <andreas@gaisler.com>
Reviewed-by: Andreas Larsson <andreas@gaisler.com>
---
 include/linux/clocksource.h | 6 +-----
 kernel/time/Kconfig         | 4 ----
 2 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/include/linux/clocksource.h b/include/linux/clocksource.h
index 65b7c41471c3..12d853b18832 100644
--- a/include/linux/clocksource.h
+++ b/include/linux/clocksource.h
@@ -25,8 +25,7 @@ struct clocksource_base;
 struct clocksource;
 struct module;
 
-#if defined(CONFIG_ARCH_CLOCKSOURCE_DATA) || \
-    defined(CONFIG_GENERIC_GETTIMEOFDAY)
+#if defined(CONFIG_GENERIC_GETTIMEOFDAY)
 #include <asm/clocksource.h>
 #endif
 
@@ -106,9 +105,6 @@ struct clocksource {
 	u64			max_idle_ns;
 	u32			maxadj;
 	u32			uncertainty_margin;
-#ifdef CONFIG_ARCH_CLOCKSOURCE_DATA
-	struct arch_clocksource_data archdata;
-#endif
 	u64			max_cycles;
 	u64			max_raw_delta;
 	const char		*name;
diff --git a/kernel/time/Kconfig b/kernel/time/Kconfig
index 7c6a52f7836c..fe3311877097 100644
--- a/kernel/time/Kconfig
+++ b/kernel/time/Kconfig
@@ -9,10 +9,6 @@
 config CLOCKSOURCE_WATCHDOG
 	bool
 
-# Architecture has extra clocksource data
-config ARCH_CLOCKSOURCE_DATA
-	bool
-
 # Architecture has extra clocksource init called from registration
 config ARCH_CLOCKSOURCE_INIT
 	bool

-- 
2.53.0


