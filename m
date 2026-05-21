Return-Path: <linux-mips+bounces-14668-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHh1OnasDmr6AwYAu9opvQ
	(envelope-from <linux-mips+bounces-14668-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2026 08:55:50 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 741CC59FC0E
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2026 08:55:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 325B3306447D
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2026 06:53:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A783C397694;
	Thu, 21 May 2026 06:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="lYXY/QWg";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qzUSBmxy"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCF5395AE9;
	Thu, 21 May 2026 06:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779346405; cv=none; b=VTZyIIVd+swDIqLl4WUu8CscQ9+g/a72hgHKsTqPnyyY8grZSqcPEx80BEl0EhF2GvGJ8/dILn5M3TpTBi3i1j39cY8zQGIG4KCS2jRut8Ul5vsYuM+qPjw3P9vepUx3rz2ECSv+i6BHj/c0zQNo2l1/emwaQ+IOiEx4ILG+gU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779346405; c=relaxed/simple;
	bh=QsDfvsWvWffVCiwKb6Wor4fGAHs+70c4y3p7kuNqC+o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fxEF6VV/sJ6gg5h7J8ELwhWmA/dvNvXPVWLL5kUEalZMC9D8EZZ0AibNW/2A23O9+h7c0/5FdRYLZm7lOG7YJYh/Oa6vJDpwMu3t4B6cQXNuHc/Ex5Vc8BfGLlqrJ+OWXTjbsyN3VB2gB3wfWE8mkfywsyWv2lxF1U+MdT4MB2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=lYXY/QWg; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qzUSBmxy; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779346402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LBYA8E165eIAxxUbk1ZW1SZ9ewSPkgr6E8pVal91xJE=;
	b=lYXY/QWgBhZBnfGxWUDDjbdIJX6UX/peWV7DZg9iKxVQSYAIrylcmLcz2SeGuwpQPUav8m
	uhRQwyhVKJjVrnQrsqharApFnLwNhfqYK3Oy/XAk/knmUFI2nlJ2FpPfq0geUkwV8G1KxR
	TpsgfxQ/FwoZFiOffYGSL+5BBVa3V1WMpUonpO37BBLdiG/QSC0H81cQWIZezWHZormG8k
	SC6jY2MkCjRfpGP6/seFBXXuWB44qv3rsFoVoC0YrMKr3lYEjbkSvWk59GNUywGDNSDLVf
	k3ZQpEZsaL98vEqp0PCuo1RwJZKZpacOitgiPWPwICkYInYr8M4PaayyA+9qUg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779346402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LBYA8E165eIAxxUbk1ZW1SZ9ewSPkgr6E8pVal91xJE=;
	b=qzUSBmxyG7TKMaK2pskXhbhHad9fNPQuGp6hllENz7v8Li4ieIi2B1Qa9wb4roqXGo8lF5
	GwNXBC8xTb4N5YCw==
Date: Thu, 21 May 2026 08:53:20 +0200
Subject: [PATCH 6/9] clocksource/drivers/mips-gic-timer: Only use
 VDSO_CLOCKMODE_GIC when it is a available
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260521-vdso-mips-kconfig-v1-6-2f79dcd6c78f@linutronix.de>
References: <20260521-vdso-mips-kconfig-v1-0-2f79dcd6c78f@linutronix.de>
In-Reply-To: <20260521-vdso-mips-kconfig-v1-0-2f79dcd6c78f@linutronix.de>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Andy Lutomirski <luto@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779346397; l=903;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=QsDfvsWvWffVCiwKb6Wor4fGAHs+70c4y3p7kuNqC+o=;
 b=fbXC9XdaN8jrZidPP1OEW2Nlz+wGmkX6xnSw52ecBKtdd8bbOL4QAcF2piqYx9/hDfGn0E9+5
 hizUED+qnfWB9C1ceQevsXQVfS0MHR89KPKWA3JH+HLVY7gYDuKIyIg
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14668-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,linux-mips@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linutronix.de:email,linutronix.de:mid,linutronix.de:dkim]
X-Rspamd-Queue-Id: 741CC59FC0E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

VDSO_CLOCKMODE_GIC is only defined if CONFIG_GENERIC_GETTIMEOFDAY is
enabled. Right now this is always the case, but it will change soon.

Prepare for the potential unavailability of VDSO_CLOCKMODE_GIC.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 drivers/clocksource/mips-gic-timer.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clocksource/mips-gic-timer.c b/drivers/clocksource/mips-gic-timer.c
index 1501c7db9a8e..a1669266c94d 100644
--- a/drivers/clocksource/mips-gic-timer.c
+++ b/drivers/clocksource/mips-gic-timer.c
@@ -198,7 +198,9 @@ static struct clocksource gic_clocksource = {
 	.name			= "GIC",
 	.read			= gic_hpt_read,
 	.flags			= CLOCK_SOURCE_IS_CONTINUOUS,
+#ifdef CONFIG_GENERIC_GETTIMEOFDAY
 	.vdso_clock_mode	= VDSO_CLOCKMODE_GIC,
+#endif
 };
 
 static void gic_clocksource_unstable(char *reason)

-- 
2.54.0


