Return-Path: <linux-mips+bounces-15704-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QoYgN8eIT2r7iwIAu9opvQ
	(envelope-from <linux-mips+bounces-15704-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 13:40:55 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F72A7307D7
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 13:40:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linutronix.de header.s=2020 header.b=XTtNxmBf;
	dkim=pass header.d=linutronix.de header.s=2020e header.b=1XrX6rcc;
	dmarc=pass (policy=none) header.from=linutronix.de;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15704-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15704-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 94FBA316EAEF
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jul 2026 11:33:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A77941B37F;
	Thu,  9 Jul 2026 11:32:44 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD71741DEF4;
	Thu,  9 Jul 2026 11:32:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783596764; cv=none; b=Xb87TzGyeAF3t1F/f6rYBdeJHMyUAg9RNlYScsGwUwSXGpdYF5FzjJTGXZ7Ul/zQu73qe+zrM9O/3+jx3TKYY3S/B5/EKFwriE+gwtK3QXke4rennZ1FPLlp5N52NTPHYsHtiehHP6LYVnu4ssouDzxlQ+KCEl8NHvEh91zbjX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783596764; c=relaxed/simple;
	bh=Cb6TJFKXRTGuFsy7vLwZziq8FlUUov9IjfcXVp4by3I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OyA6dklBkfVgAJX0QZ+upwIlNUeSdOdHI7fxVVWEIkNa9p9NgJ0d9JA2eo4UGWMlvYyXc365cmOcOowUJUM7fsiNpqHWdeYV/79GcYwp7QXqX8muIcd8qnxoAaMMmSRhgTZS0cGH8Ub+Vj2gwdCizihuPH5Y1Hkdz645Dekxo8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=XTtNxmBf; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=1XrX6rcc; arc=none smtp.client-ip=193.142.43.55
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783596761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ig+DEThEdu93PL9Y6RxYfj8TwNueHZcwpbqWNPHipMQ=;
	b=XTtNxmBftIu/MuEyBv5NcpO6SIRsipn237MfFlx7TSonp7OgY2UIoXl2AvNfI9F6j+Rlms
	hS07KntUIQPgEQx/PlNm8jaePOqAfVqdTbSenZGaWdLQlhLy9dvG8/25x+wET/ErFKSq5M
	rvEzVK6bX7+simtsL+h3rxTa36pBFopWWJe1ju6QUuPhCE0q48qRN87I+79ghmh3aPyEHx
	cPa20BRIG43799DXjtIXqP7azrLvJ7i6hfiId8mhIGNMj/dTObASOdZMBGWSZgsxmfFSv0
	whKQJuWBZgNd3b7pFbOfXeOhV876KWTbDqaXnJNxv3XmS48fH+dm2E+SFCzaPg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783596761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ig+DEThEdu93PL9Y6RxYfj8TwNueHZcwpbqWNPHipMQ=;
	b=1XrX6rcc7PYG2uPlLX5PqTQEDfbbYIEXYq56t/8GngEFlHVf7AeZ0HOWQaVfv13O99O3Dd
	F+PS8VM6pQ+A/TCA==
Date: Thu, 09 Jul 2026 13:32:40 +0200
Subject: [PATCH 4/7] clocksource/drivers/mips-gic-timer: Replace
 CONFIG_GENERIC_GETTIMEOFDAY ifdeffery with IS_ENABLED()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260709-vdso-arch-clockmodes-v1-4-3fd780bbf851@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783596759; l=988;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Cb6TJFKXRTGuFsy7vLwZziq8FlUUov9IjfcXVp4by3I=;
 b=RqWMWGndZRR40I+i7U91NW8lFYhmkW3JwUOT571+ZTuaS4OojMQf/+6pQOQe6/Lf4q+EONycO
 Khh/sU1tyFFBtvKuLdI1BUf79Qu52hobMz0j1UJgLb4NcuwFphHLTVO
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
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
	TAGGED_FROM(0.00)[bounces-15704-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linutronix.de:from_mime,linutronix.de:email,linutronix.de:mid,linutronix.de:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3F72A7307D7

Now that there is a dummy declaration of VDSO_CLOCKMODE_GIC, even if no
vDSO is built, the ugly ifdeffery can be replaced with a cleaner
IS_ENABLED() check.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 drivers/clocksource/mips-gic-timer.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clocksource/mips-gic-timer.c b/drivers/clocksource/mips-gic-timer.c
index a1669266c94d..0dd30ba3cce7 100644
--- a/drivers/clocksource/mips-gic-timer.c
+++ b/drivers/clocksource/mips-gic-timer.c
@@ -198,9 +198,8 @@ static struct clocksource gic_clocksource = {
 	.name			= "GIC",
 	.read			= gic_hpt_read,
 	.flags			= CLOCK_SOURCE_IS_CONTINUOUS,
-#ifdef CONFIG_GENERIC_GETTIMEOFDAY
-	.vdso_clock_mode	= VDSO_CLOCKMODE_GIC,
-#endif
+	.vdso_clock_mode	= IS_ENABLED(CONFIG_GENERIC_GETTIMEOFDAY) ?
+					VDSO_CLOCKMODE_GIC : VDSO_CLOCKMODE_NONE,
 };
 
 static void gic_clocksource_unstable(char *reason)

-- 
2.55.0


