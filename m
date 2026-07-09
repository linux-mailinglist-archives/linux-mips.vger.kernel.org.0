Return-Path: <linux-mips+bounces-15701-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5TcSAeuIT2oRjAIAu9opvQ
	(envelope-from <linux-mips+bounces-15701-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 13:41:31 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 734FF7307F1
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 13:41:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linutronix.de header.s=2020 header.b=3Tlr8lwj;
	dkim=pass header.d=linutronix.de header.s=2020e header.b=1odo7jSN;
	dmarc=pass (policy=none) header.from=linutronix.de;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15701-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15701-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9B39C3097CEF
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jul 2026 11:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C853E41F7F2;
	Thu,  9 Jul 2026 11:32:43 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0958641DED0;
	Thu,  9 Jul 2026 11:32:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783596763; cv=none; b=TJgBESwwNLFChtl6lfRs4I2tHMxByocp/dzAlCV6+1HJRVJzG9YKro8nSgqDknvNvLp+sf6FyKvkgXatHmRrIcepYNU2bZMZJiEzRhDC5xjQ+YfXV0eFDs0T1Xy9t+EuAfgNGdUX+EZBUvI73O9N6GOe+cTe4ZV3bO3tQF4I4zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783596763; c=relaxed/simple;
	bh=Xax8qgR+SGGeOkJrm9ZK8P3x7lKX/ptqrxvCpMAlK6g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N53xQjORzDReKK01mp3s1yo2uhOvxx05BIVw7GMF/5/ZF5weNoAR84tDzA1T8Lu9RPXxVbfJ3Matp8G042UKKxPx9s6/XeVfE310kanmb/2vzz/Pjq7Y5F+E5nMOZLOpadtPkn9y/N3IuR06fA1WJWZUBQAVPIvDP+qVyAsjy4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3Tlr8lwj; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=1odo7jSN; arc=none smtp.client-ip=193.142.43.55
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783596760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zk86msNEN/gnWpX9C3rxNSV4hOokUpTWZRuN8F96/Nc=;
	b=3Tlr8lwjEQMKUWzx2INzXGyqzMn7U7cffmZUVyqa4EabPGgOlth6pNXkh69SdZD9IyTuva
	P6LcVPAyvPH3BR3XWD80JId7SB7vxgjFqLOoFYZ96eBUfQJ+7qbelhC2Unbdz/e9/LRmRS
	h3tZILA4lKwjjPrtBBwTmXGFxOb/6mO5Ofba3hxsKasNgfNb4LCABYp2ii3FDuD2zF/BY0
	8L8WSMyub4zU02TewatPe06w2I5TmQ7U4+JVhko2v2LVy6s7TOTsc7gkdIYwZnPzIMcrB7
	77BbGmtoZSIrFl5xdnSY3IvvMH6O5q2zThMK3fn7WxLCpVpOu8Xa1fJtP2NnVA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783596760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zk86msNEN/gnWpX9C3rxNSV4hOokUpTWZRuN8F96/Nc=;
	b=1odo7jSNfz5NW/HvHzWtgVuuOaD6TIOwysekv2u0iL+FsKAjM1a56kySZs9tXkR5a3FEY/
	9DyNKWP5h645jWDg==
Date: Thu, 09 Jul 2026 13:32:38 +0200
Subject: [PATCH 2/7] vDSO: Make clockmode constants available without
 CONFIG_GENERIC_GETTIMEOFDAY
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260709-vdso-arch-clockmodes-v1-2-3fd780bbf851@linutronix.de>
References: <20260709-vdso-arch-clockmodes-v1-0-3fd780bbf851@linutronix.de>
In-Reply-To: <20260709-vdso-arch-clockmodes-v1-0-3fd780bbf851@linutronix.de>
To: Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 loongarch@lists.linux.dev, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783596759; l=1850;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Xax8qgR+SGGeOkJrm9ZK8P3x7lKX/ptqrxvCpMAlK6g=;
 b=46BCx+9PphfTRayVEAxbIQeVvMzW/0LWqNLBEcXQOqP9X9mObQV+e21QCB2KfVXaitBboNNYq
 iSHkBBI2pMPDE6SOc1YgmV5vYEtwJ8WyMhnDMk7paHoHTHPKge8t1Pz
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:arnd@arndb.de,m:luto@kernel.org,m:tglx@kernel.org,m:vincenzo.frascino@arm.com,m:nathan@kernel.org,m:nsc@kernel.org,m:tsbogend@alpha.franken.de,m:daniel.lezcano@kernel.org,m:mark.rutland@arm.com,m:maz@kernel.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:linux-arch@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:linux-mips@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-riscv@lists.infradead.org,m:loongarch@lists.linux.dev,m:thomas.weissschuh@linutronix.de,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[thomas.weissschuh@linutronix.de,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	TAGGED_FROM(0.00)[bounces-15701-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linutronix.de:from_mime,linutronix.de:email,linutronix.de:mid,linutronix.de:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 734FF7307F1

Some code, for example clocksource drivers, may want to use the vDSO
clockmode constants even when CONFIG_GENERIC_GETTIMEOFDAY=n.
But the symbols are completely hidden in that case, making ugly
ifdeffery necessary.

Provide unlinkable dummy definitions. These can be used with
IS_ENABLED(CONFIG_GENERIC_GETTIMEOFDAY).

As not all architectures provide asm/vdso/clocksource.h,
provide an empty stub in asm-generic for it.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 include/asm-generic/Kbuild             | 1 +
 include/asm-generic/vdso/clocksource.h | 0
 include/vdso/clocksource.h             | 7 +++++--
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/asm-generic/Kbuild b/include/asm-generic/Kbuild
index 15df9dcb42a5..2bc00c67dc54 100644
--- a/include/asm-generic/Kbuild
+++ b/include/asm-generic/Kbuild
@@ -62,6 +62,7 @@ mandatory-y += topology.h
 mandatory-y += trace_clock.h
 mandatory-y += uaccess.h
 mandatory-y += unwind_user.h
+mandatory-y += vdso/clocksource.h
 mandatory-y += vermagic.h
 mandatory-y += vga.h
 mandatory-y += video.h
diff --git a/include/asm-generic/vdso/clocksource.h b/include/asm-generic/vdso/clocksource.h
new file mode 100644
index 000000000000..e69de29bb2d1
diff --git a/include/vdso/clocksource.h b/include/vdso/clocksource.h
index c682e7c60273..63ee8c4ea15c 100644
--- a/include/vdso/clocksource.h
+++ b/include/vdso/clocksource.h
@@ -4,9 +4,12 @@
 
 #include <vdso/limits.h>
 
-#ifdef CONFIG_GENERIC_GETTIMEOFDAY
 #include <asm/vdso/clocksource.h>
-#endif /* CONFIG_GENERIC_GETTIMEOFDAY */
+
+#if !IS_ENABLED(CONFIG_GENERIC_GETTIMEOFDAY) && defined(VDSO_ARCH_CLOCKMODES)
+/* Unlinkable dummy stubs */
+extern int VDSO_ARCH_CLOCKMODES;
+#endif
 
 enum vdso_clock_mode {
 	VDSO_CLOCKMODE_NONE,

-- 
2.55.0


