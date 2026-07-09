Return-Path: <linux-mips+bounces-15673-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4a08BBpOT2r5dwIAu9opvQ
	(envelope-from <linux-mips+bounces-15673-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 09:30:34 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0729C72DB5F
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 09:30:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linutronix.de header.s=2020 header.b="Vg7LNT/K";
	dkim=pass header.d=linutronix.de header.s=2020e header.b=B9zksMsF;
	dmarc=pass (policy=none) header.from=linutronix.de;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15673-lists+linux-mips=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-mips+bounces-15673-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7BB7C3014246
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jul 2026 07:29:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAE9C3E1CF0;
	Thu,  9 Jul 2026 07:28:55 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215643DFC6B;
	Thu,  9 Jul 2026 07:28:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783582135; cv=none; b=etM1HYW8OkTi0sFvuH8huxT9xzTJTnTx6p0mksfV5RwZ8vckZ6zEs/3F9vOWDzmmSXUMJIBa3wvEvbGM/ptcD8LhztSwKt/uSrxHbfb2rNDaZnx8vteg5JhYfWOg9S5a5+49G6vIuL/NfBxh1eQFcRX/8Fzh/uC/b11BJVarXmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783582135; c=relaxed/simple;
	bh=4FZUWqD6GYqAsCwRnUdaF2OQs1vawY1ekNwgCxZEi4s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GR0O5ReU03YrntWsO+2i6l0RLMMBoXio13SQyosMwi01mSnjVcuHGIRnE4fTysAF1GvAXbvlK/p7aOT2i3kx8IuVdB0z2F2CBqhIwBJSgrSBkN92u2NHNJT0X8mohWBJgKTx6Wq9RcbpmvwQTN3QGClDRb8MjEdsDixtnj+yQfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Vg7LNT/K; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=B9zksMsF; arc=none smtp.client-ip=193.142.43.55
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783582132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pVZyGpd7vKaHEUUhhbnUuimbApzNemwda7I/kt7gbTY=;
	b=Vg7LNT/KsGGuSda7Kwsk9Rb0kwbgf9MMZ3j+v00pjf0ZPuL9CUYFCTFksjj+yFbIXtmQp4
	dne4+IsMLs1Cpm5BeI+DvOknMC9Bmno9cjqlED1yRAoPYXGyWw7Qf/I5P3nPQ7NfFXkAWp
	RIRruTqRtHzJSBegpJJ5tVGSrH8+xpnYDaM9GeUfv5RxaColVFSwCmHHjjGYzCnIjaNL+L
	2Je2t3a8jDMZNgc9l3wYbEs8VoOYXlmyUzMGmepF5w7M2nAQ/AKw6VF9vu0me0NrU0+5W7
	Lk/M+WWaB12UQR/KaqbwzTWIaZepaIibBQSYHsP6XBD/NONnUsUG5KDd6Gw+QA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783582132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pVZyGpd7vKaHEUUhhbnUuimbApzNemwda7I/kt7gbTY=;
	b=B9zksMsF+3nHv108I3CsEg+gGpproxOdLePavzTDJBWKkZauZfu9iVmnA6g2GMyNxoOh4y
	P3mU2tye+kfv41Bw==
Date: Thu, 09 Jul 2026 09:28:40 +0200
Subject: [PATCH 4/6] vDSO: Automatically select HAVE_GENERIC_VDSO if
 necessary
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260709-vdso-have_generic_vdso-v1-4-d2e1061f268b@linutronix.de>
References: <20260709-vdso-have_generic_vdso-v1-0-d2e1061f268b@linutronix.de>
In-Reply-To: <20260709-vdso-have_generic_vdso-v1-0-d2e1061f268b@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783582129; l=968;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=4FZUWqD6GYqAsCwRnUdaF2OQs1vawY1ekNwgCxZEi4s=;
 b=D07HcIcBZkPjNMMWSm0ECVSbDmqr8/0Y34UM0PAARVBOxBnNzO+Mz/1oSXLwS2s+IBwk/Al0K
 mYsdK56rBB/AHMXYv1dAx4dJewNWZsgHBhJ2sTGtscFBuqBtRhVKJeb
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15673-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,linux-mips@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[thomas.weissschuh@linutronix.de,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:luto@kernel.org,m:tglx@kernel.org,m:vincenzo.frascino@arm.com,m:tsbogend@alpha.franken.de,m:linux-kernel@vger.kernel.org,m:linux-mips@vger.kernel.org,m:thomas.weissschuh@linutronix.de,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:from_mime,linutronix.de:email,linutronix.de:mid,linutronix.de:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0729C72DB5F

gettimeofday() and getrandom() in the vDSO require the vDSO datastore.

Enable it automatically if either one of them is enabled so the
architecture code doesn't need to know this.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 lib/vdso/Kconfig | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/lib/vdso/Kconfig b/lib/vdso/Kconfig
index db87ba34ef19..eedb04974fd5 100644
--- a/lib/vdso/Kconfig
+++ b/lib/vdso/Kconfig
@@ -3,10 +3,9 @@
 config HAVE_GENERIC_VDSO
 	bool
 
-if HAVE_GENERIC_VDSO
-
 config GENERIC_GETTIMEOFDAY
 	bool
+	select HAVE_GENERIC_VDSO
 	help
 	  This is a generic implementation of gettimeofday vdso.
 	  Each architecture that enables this feature has to
@@ -21,7 +20,6 @@ config GENERIC_VDSO_OVERFLOW_PROTECT
 
 config VDSO_GETRANDOM
 	bool
+	select HAVE_GENERIC_VDSO
 	help
 	  Selected by architectures that support vDSO getrandom().
-
-endif

-- 
2.55.0


