Return-Path: <linux-mips+bounces-14670-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNvoLJSsDmqqBAYAu9opvQ
	(envelope-from <linux-mips+bounces-14670-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2026 08:56:20 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F4759FC24
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2026 08:56:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F1AE3072D4C
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2026 06:53:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3476C384CF6;
	Thu, 21 May 2026 06:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="05dZLUbX";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2FeQHdOE"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA13395AEA;
	Thu, 21 May 2026 06:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779346406; cv=none; b=GT7gdk4HLLU18k7b5YlUC6Md1VQf0Jns/qo83P0JcI71RBWUezIGJGbUVeGdEtF0MBPR9nUXvkeG+k+oRrk9G6/g8QFzbEJREN603f3loWdd0a6hWew5naO6QNyNx+HbUxCEwWU8VlOy52tvV/xcT+sNN/6I8JiSrLCsDVZcJMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779346406; c=relaxed/simple;
	bh=k5y6mhg47PkKW3NG3mli/fa0fpt+8vCI0NkWxuFN+Jc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fIWF7drxu/m+1NhY4dioO3X0HToi4ajYnCIZewOYRdDG9cUAIR+k6jAmIOrBAL+ibu9iFk8grpJ7TvXipFoj6gIuW3fAXkH+AoXVePGzWv7vDEMPl/g7F7C3GniKQBpUad9XNI1WLxHcQWD+N9psoShlOSs1MBzU26DGulLfMaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=05dZLUbX; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2FeQHdOE; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779346401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nf18gitBVQzFrXc+yGpE5m2ORwt5+KE3lHgDXrZnDvI=;
	b=05dZLUbXDfNjQcb58/z04BHAZ35W6uScmEeHXYKYo3TpdBdbEQv6iUOUock338mKpul+MD
	BlN10Q9dNXC5B8Z8z3NWpVvMKtk4InI2nkgiHeDbc0CJX6tjN7oONqXe5r6iRYSqPb/0TW
	6SGkHW5YjFi2f2kHtB653oyNm4eHBa1zKSJUtEowdW4Eaz4EvJjWQA4k3+4L6fkaNea9l2
	rdj8Xon/64XL4LQOBjXw3Dz+Q4taou5f6+DCT7Mh2y/sB0oOCVgzZJ9CsI+H6bc/LL0gIi
	PfezzylK/eXmrqooxHtCG82doi2cFGC9MM/Kjtss7NTH5MP6u6hdYz0f3Huwjw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779346401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nf18gitBVQzFrXc+yGpE5m2ORwt5+KE3lHgDXrZnDvI=;
	b=2FeQHdOENNmtaPGpadOc6UG6KKuHGecy2zGtY0MspZTkPf8Gv0rwrqMtCfOrp7g4bFedCk
	OBEKWsT7IpN68cAw==
Date: Thu, 21 May 2026 08:53:19 +0200
Subject: [PATCH 5/9] MIPS: csrc-r4k: Only use VDSO_CLOCKMODE_R4K when it is
 a available
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260521-vdso-mips-kconfig-v1-5-2f79dcd6c78f@linutronix.de>
References: <20260521-vdso-mips-kconfig-v1-0-2f79dcd6c78f@linutronix.de>
In-Reply-To: <20260521-vdso-mips-kconfig-v1-0-2f79dcd6c78f@linutronix.de>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Andy Lutomirski <luto@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779346397; l=1064;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=k5y6mhg47PkKW3NG3mli/fa0fpt+8vCI0NkWxuFN+Jc=;
 b=oLxSimcsSXVDwxxn3b/5fZ5B4bE8sgVcmfO8KAYDVqabYPzVWDCJ6VqZhsl2uON4MlXqrWsqS
 luZJ+NBOAetC8PTu0cF7DbLKZVgI8Ih6OhutRvOR9pfdc/64bAHilwM
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14670-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,linux-mips@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linutronix.de:email,linutronix.de:mid,linutronix.de:dkim]
X-Rspamd-Queue-Id: 32F4759FC24
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

VDSO_CLOCKMODE_R4K is only defined if CONFIG_GENERIC_GETTIMEOFDAY is
enabled. Right now this is always the case, but it will change soon.

Prepare for the potential unavailability of VDSO_CLOCKMODE_R4K.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/mips/kernel/csrc-r4k.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/csrc-r4k.c b/arch/mips/kernel/csrc-r4k.c
index 59eca397f297..7c431119bb14 100644
--- a/arch/mips/kernel/csrc-r4k.c
+++ b/arch/mips/kernel/csrc-r4k.c
@@ -130,8 +130,11 @@ int __init init_r4k_clocksource(void)
 	 * R2 onwards makes the count accessible to user mode so it can be used
 	 * by the VDSO (HWREna is configured by configure_hwrena()).
 	 */
-	if (cpu_has_mips_r2_r6 && rdhwr_count_usable())
+	if (cpu_has_mips_r2_r6 && rdhwr_count_usable()) {
+#ifdef CONFIG_GENERIC_GETTIMEOFDAY
 		clocksource_mips.vdso_clock_mode = VDSO_CLOCKMODE_R4K;
+#endif
+	}
 
 	clocksource_register_hz(&clocksource_mips, mips_hpt_frequency);
 

-- 
2.54.0


