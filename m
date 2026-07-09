Return-Path: <linux-mips+bounces-15672-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /QHuK2xOT2oTeAIAu9opvQ
	(envelope-from <linux-mips+bounces-15672-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 09:31:56 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5B572DBA6
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 09:31:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linutronix.de header.s=2020 header.b=mueP3uDT;
	dkim=pass header.d=linutronix.de header.s=2020e header.b=TxRhWqDn;
	dmarc=pass (policy=none) header.from=linutronix.de;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15672-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15672-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AF9E8303F87A
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jul 2026 07:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F19CC3E0749;
	Thu,  9 Jul 2026 07:28:54 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C833DEACE;
	Thu,  9 Jul 2026 07:28:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783582134; cv=none; b=LVpjVUZyw9NJKrDSmlOXiuxwFr9GOI9dBJeFucj9NOZbWZsv+3Vu1fnyBI+EWpsjJSfefc7JzwwSOhZ/p+MGI2wyMcX3voILYQ+mPekuryyC55J5xJ0CO2IMk/mn1HIbj+ND6RmZv7pkwWiP5/gEoAt6hQoiK4vLSZQxZWfNyQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783582134; c=relaxed/simple;
	bh=8qE0oMbynwSOROhKuM7iHfRRGxHwkJk4NgKjfLWz29M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nqPwQJYcuTqrln+PfKR0i4DbwJXkuZ+EAu/HAKkjKT9kAq0MpV8pcdfDTTgYKWEfe69jRp6B5w6jjFIVPpxufwnUh7IlDv22DV8rK0v/G+yEA9vokXU4LVC5oT6DhnMDBEMqmsL44BNscz9Uq4nFg+UeFMKhmwZZW+HdHomZuV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=mueP3uDT; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=TxRhWqDn; arc=none smtp.client-ip=193.142.43.55
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783582132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vhw5vt9hJ8kZ5fxkfrEHHf51RQ8XGRe4qi0Gll2jKhY=;
	b=mueP3uDTtHTAwQWdl6aZEl1wK8rwUusxbQGmcQFigWMvJUajk6tfvIhW8ydksHVmwjHSN3
	m0lMinTZ9RHqGTX//MNyZjQeQU2LTK83cGE0cuG0ucwyK6ZL4JjnehahTzej/VsCMOiuns
	wrH9DWKuuAzhVTtQjhWFz3Q7Y1UlnDAwefHkVo8gjstviR0/coVWpblhPbtiV7eQQZsYtW
	OAbs/VhE+GeeIOniXeuye9BeIxoJ9sR2YVNvtEPrGWFUMvrFvcyZs2VYLJUsbvi1l544GN
	U5dptSyrcPB1qG9ssQItMiP67GdaJvowvlFZFqDZHUfi1oyyJU/9WL9t5wzL6w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783582132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vhw5vt9hJ8kZ5fxkfrEHHf51RQ8XGRe4qi0Gll2jKhY=;
	b=TxRhWqDnq02JxgJGXLwxtwcgq12TwcootOcrrjOG12VCSlC70WkuswpAmn7m6+iQVSo+zx
	XGiBfA7qr4rnxYAg==
Date: Thu, 09 Jul 2026 09:28:39 +0200
Subject: [PATCH 3/6] MIPS: vdso: Stop using CONFIG_HAVE_GENERIC_VDSO
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260709-vdso-have_generic_vdso-v1-3-d2e1061f268b@linutronix.de>
References: <20260709-vdso-have_generic_vdso-v1-0-d2e1061f268b@linutronix.de>
In-Reply-To: <20260709-vdso-have_generic_vdso-v1-0-d2e1061f268b@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783582129; l=1369;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=8qE0oMbynwSOROhKuM7iHfRRGxHwkJk4NgKjfLWz29M=;
 b=HDDok6k//jeiKj2mN0v1LMbFCvSHCaP3isQLB8wYixy2cKxRzat1TObLLq6PwohS+QO9TCPoN
 3oSh3Q+23kNA8qfzhEGNfIr35swsTnv8kcMuFqs9nzJhwkgaKz8euD0
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15672-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
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
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:from_mime,linutronix.de:email,linutronix.de:mid,linutronix.de:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2D5B572DBA6

HAVE_GENERIC_VDSO is about to become an implementation detail.

Use the MIPS-specific symbol instead. It is equivalent here.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/mips/kernel/vdso.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/vdso.c b/arch/mips/kernel/vdso.c
index bd1fc17d3975..29a10045f2b6 100644
--- a/arch/mips/kernel/vdso.c
+++ b/arch/mips/kernel/vdso.c
@@ -129,7 +129,7 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 	 * This ensures that when the kernel updates the VDSO data userland
 	 * will observe it without requiring cache invalidations.
 	 */
-	if (cpu_has_dc_aliases && IS_ENABLED(CONFIG_HAVE_GENERIC_VDSO)) {
+	if (cpu_has_dc_aliases && IS_ENABLED(CONFIG_MIPS_GENERIC_GETTIMEOFDAY)) {
 		base = __ALIGN_MASK(base, shm_align_mask);
 		base += ((unsigned long)vdso_k_time_data - gic_size) & shm_align_mask;
 	}
@@ -137,7 +137,7 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 	data_addr = base + gic_size;
 	vdso_addr = data_addr + VDSO_NR_PAGES * PAGE_SIZE;
 
-	if (IS_ENABLED(CONFIG_HAVE_GENERIC_VDSO)) {
+	if (IS_ENABLED(CONFIG_MIPS_GENERIC_GETTIMEOFDAY)) {
 		vma = vdso_install_vvar_mapping(mm, data_addr);
 		if (IS_ERR(vma)) {
 			ret = PTR_ERR(vma);

-- 
2.55.0


