Return-Path: <linux-mips+bounces-14667-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mAsJJiqsDmr6AwYAu9opvQ
	(envelope-from <linux-mips+bounces-14667-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2026 08:54:34 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F21A959FBB7
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2026 08:54:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E23E304DC91
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2026 06:53:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06BA8395AF3;
	Thu, 21 May 2026 06:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="NnfNQBML";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4i/rYZkS"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7177F386C12;
	Thu, 21 May 2026 06:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779346403; cv=none; b=FCMr/D8pY+eqUJnyQwIodnmVD5FqLZ13Bk7xZmoSDz1Xz+Eqv4JwYv6R+zxizgLZmRfbAf6EYGlm4w8PaFajN1xEeDenawUhLAKlw2vs3ipA+jJ4Mgw2c1EnxXviFQwcBLX3at0nZwBkLnRapkuLD08Dw/OCjwZlbQp2DR7EzFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779346403; c=relaxed/simple;
	bh=PyMNV1JJg8wjJfWAFS5o3wUdk0QWKNX1OKuKircEbYQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aptlAU1nC4ncYdNyu9MVelKD5cljvAmaA6P9XsSsbPpXVvd7r9yMTu0qfurYibMM9DKXzxSefv+gTaEjvJmMMBzOhQG3KRKSTVFMGCdNU6Z6nKT+okk226kObLMLGCJS4F+/g7t3osTmXNHIAU4n7ZqK2lYLUBrun+hoyELXCCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=NnfNQBML; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4i/rYZkS; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779346401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GFRGrKy4q9od/mzOS61iRuF0vEFrRaRT+0Nme72HCCw=;
	b=NnfNQBMLxl7iNBztMqBOas+EqlReOQP+VWBpiRRqXdtxd5+yrjT8OAijRifCsW9BXFOe7Z
	Lx3bn0b7Su231LrxhditNssUF/Zprmpx2OuIsbCvGtxHdhcvkf92Y5zoKS2ee5oAZtjG9M
	oDIKyGA8q8MHSjXzBiOJy5VU8gBGWTCOM0bq4X2uQhdqqURIk2DvfS9WbgA4PbiQ8dtjJc
	+NXAAaXgHVKmWh9pPf/RyF8/47R2T4EfkFObt8OUmtcrvMDGkD4KJpOH/slEOfERr427x7
	7Cm+ZwCeRUWJoao1jnHUpYnAUh8u0XUo1v+VjxIoUv0MLRJFsn1EM80yzvoEAA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779346401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GFRGrKy4q9od/mzOS61iRuF0vEFrRaRT+0Nme72HCCw=;
	b=4i/rYZkS38crrexDMA7C4xJV/FwShmGCmmw9VlyKhWIZlifwhJ1Cpgq99amnApdZ0xDLG7
	jLxdnlMbHxdhPyBg==
Date: Thu, 21 May 2026 08:53:18 +0200
Subject: [PATCH 4/9] MIPS: VDSO: Only map the data pages when the vDSO is
 used
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260521-vdso-mips-kconfig-v1-4-2f79dcd6c78f@linutronix.de>
References: <20260521-vdso-mips-kconfig-v1-0-2f79dcd6c78f@linutronix.de>
In-Reply-To: <20260521-vdso-mips-kconfig-v1-0-2f79dcd6c78f@linutronix.de>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Andy Lutomirski <luto@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779346397; l=2082;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=PyMNV1JJg8wjJfWAFS5o3wUdk0QWKNX1OKuKircEbYQ=;
 b=PC3u2A1gmunF8ye85WjeePaYwopQIj+YsBZjg49P12WoxtH3XGyMmSHVeCp5DLhxdX8tYYPYK
 w3b17YdvrCpBylNLYFu9kiOeTSIuMKijXkwb3Sk+PKx1e5gtzlB0P6l
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
	TAGGED_FROM(0.00)[bounces-14667-lists,linux-mips=lfdr.de];
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
X-Rspamd-Queue-Id: F21A959FBB7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

A future change will make it possible to disable the time-related vDSO.
In that case there is no point in calling into the datastore.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/mips/Kconfig       |  2 +-
 arch/mips/kernel/vdso.c | 12 +++++++-----
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index af610af7ed08..3a01cc85bd6a 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -74,7 +74,6 @@ config MIPS
 	select HAVE_FUNCTION_GRAPH_TRACER
 	select HAVE_FUNCTION_TRACER
 	select HAVE_GCC_PLUGINS
-	select HAVE_GENERIC_VDSO
 	select HAVE_IOREMAP_PROT
 	select HAVE_IRQ_EXIT_ON_IRQ_STACK
 	select HAVE_IRQ_TIME_ACCOUNTING
@@ -3172,6 +3171,7 @@ config MIPS_GENERIC_GETTIMEOFDAY
 	def_bool y
 	select GENERIC_GETTIMEOFDAY
 	select GENERIC_TIME_VSYSCALL
+	select HAVE_GENERIC_VDSO
 
 menu "CPU Power Management"
 
diff --git a/arch/mips/kernel/vdso.c b/arch/mips/kernel/vdso.c
index 2fa4df3e46e4..bd1fc17d3975 100644
--- a/arch/mips/kernel/vdso.c
+++ b/arch/mips/kernel/vdso.c
@@ -129,7 +129,7 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 	 * This ensures that when the kernel updates the VDSO data userland
 	 * will observe it without requiring cache invalidations.
 	 */
-	if (cpu_has_dc_aliases) {
+	if (cpu_has_dc_aliases && IS_ENABLED(CONFIG_HAVE_GENERIC_VDSO)) {
 		base = __ALIGN_MASK(base, shm_align_mask);
 		base += ((unsigned long)vdso_k_time_data - gic_size) & shm_align_mask;
 	}
@@ -137,10 +137,12 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 	data_addr = base + gic_size;
 	vdso_addr = data_addr + VDSO_NR_PAGES * PAGE_SIZE;
 
-	vma = vdso_install_vvar_mapping(mm, data_addr);
-	if (IS_ERR(vma)) {
-		ret = PTR_ERR(vma);
-		goto out;
+	if (IS_ENABLED(CONFIG_HAVE_GENERIC_VDSO)) {
+		vma = vdso_install_vvar_mapping(mm, data_addr);
+		if (IS_ERR(vma)) {
+			ret = PTR_ERR(vma);
+			goto out;
+		}
 	}
 
 	/* Map GIC user page. */

-- 
2.54.0


