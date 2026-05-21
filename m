Return-Path: <linux-mips+bounces-14664-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCHFN+2rDmqmBAYAu9opvQ
	(envelope-from <linux-mips+bounces-14664-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2026 08:53:33 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9112859FB65
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2026 08:53:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 301CB301FA7E
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2026 06:53:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A61D53939B1;
	Thu, 21 May 2026 06:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="uXzZZwhP";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Qi6onu77"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AE4385D78;
	Thu, 21 May 2026 06:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779346402; cv=none; b=fg7+V320wXLyAeGM6lQuCVmQ5x+LWuYc/OcEWFzxLpBKsXi2ix1dXo0Cd1cXCWgD107POzRjrV78jyW2KDm9RI2Uh0S6aSAzDv7KPLHubwDa+mlyDWZeuxBnQVywzCfpRVWqHorwFOY6easDsa4jXygnGVWG4sMM2nRXJxJZYyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779346402; c=relaxed/simple;
	bh=OVak7TKpeaRIUbVyvb+zHBuH7k1GG910atn5riKp+FU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lZSc0oyE32qgwguM8VTIPnOAjudvpbRiLjZet3GI3krtwljzyqdXbjTk9bIDWK9GmQLZIyWmWZbwC2Y+NqZKG0Yt9W2zGxVLy3YCkp/ziFA+XU3XbWxGESe15DD70AhIuNYesu/0TJzwrtLoBt2tfH+7dhhQqp3Dy93NTyY2cn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=uXzZZwhP; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Qi6onu77; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779346400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/LQVuGzqTtzYNoVCLleBW959g/lofVvNzrc4DQR59Eg=;
	b=uXzZZwhPxbNkKiONbSJCh+HWphCzXhNfNnA96MvTvKh1gopWbYM1Z5LGpPXq6trjNw3fTF
	fqlhme/24FJahbt9fPjeNIRn51P0pMjTKhO+PnSGNz9mkwErRSZHBQ4R9RrQK99Q29M7B6
	ZPCxMr5D7Y60HxGe0IirLQLjfA3YAfCgnYEeKbQ3GhPKbB1mCshUlWc7IpqSpXlsCx53Of
	GgWbtV9hJ341Wo8JEde8cwi+krUKn7GLfDmbd8563VaZNBpDuY9hraLe5FhItXoIWyWnTS
	D2oS56z+y8ViTR4vvlMOL8yuaNsZ2L8hVYLGfWa2smv/aibvr6S/KzHFmJdX3g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779346400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/LQVuGzqTtzYNoVCLleBW959g/lofVvNzrc4DQR59Eg=;
	b=Qi6onu77Hddis9pLYBZ4do8/J095b/2afIZID5guBuIrIDaIuiErSFFoAsEEWbPdZHMK4x
	6V1CI9Czr5GvySCg==
Date: Thu, 21 May 2026 08:53:16 +0200
Subject: [PATCH 2/9] vdso/datastore: Always provide symbol declarations
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260521-vdso-mips-kconfig-v1-2-2f79dcd6c78f@linutronix.de>
References: <20260521-vdso-mips-kconfig-v1-0-2f79dcd6c78f@linutronix.de>
In-Reply-To: <20260521-vdso-mips-kconfig-v1-0-2f79dcd6c78f@linutronix.de>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Andy Lutomirski <luto@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779346397; l=1162;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=OVak7TKpeaRIUbVyvb+zHBuH7k1GG910atn5riKp+FU=;
 b=mwErtyHXZD6XHk9u2EdnASrNaB5g6aRHgp5pgDiI+jrQ0EJADIkyVxJVqBA8Ln5mRmNuqXJ5X
 rt2/i0WSlLpBpFnDJ5e2kHYWhz3V7F9czE0+J9LPMq3hgj0oWPUR1+0
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
	TAGGED_FROM(0.00)[bounces-14664-lists,linux-mips=lfdr.de];
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
X-Rspamd-Queue-Id: 9112859FB65
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Allow callers to easily reference these symbols in code that is built
even when the generic datastore is disabled.

As there are no good default no-op variants of these symbols, do not
provide stubs but require users to have their own fallback handling
using IS_ENABLED(CONFIG_HAVE_GENERIC_VDSO).

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 include/linux/vdso_datastore.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/vdso_datastore.h b/include/linux/vdso_datastore.h
index 0b530428db71..3dfba9502d78 100644
--- a/include/linux/vdso_datastore.h
+++ b/include/linux/vdso_datastore.h
@@ -2,12 +2,12 @@
 #ifndef _LINUX_VDSO_DATASTORE_H
 #define _LINUX_VDSO_DATASTORE_H
 
-#ifdef CONFIG_HAVE_GENERIC_VDSO
 #include <linux/mm_types.h>
 
 extern const struct vm_special_mapping vdso_vvar_mapping;
 struct vm_area_struct *vdso_install_vvar_mapping(struct mm_struct *mm, unsigned long addr);
 
+#ifdef CONFIG_HAVE_GENERIC_VDSO
 void __init vdso_setup_data_pages(void);
 #else /* !CONFIG_HAVE_GENERIC_VDSO */
 static inline void vdso_setup_data_pages(void) { }

-- 
2.54.0


