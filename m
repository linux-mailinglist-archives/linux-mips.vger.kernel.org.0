Return-Path: <linux-mips+bounces-13266-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MCegJtM9oWkyrgQAu9opvQ
	(envelope-from <linux-mips+bounces-13266-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 07:46:43 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED621B3702
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 07:46:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7F36E304932B
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 06:45:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6132B3F075F;
	Fri, 27 Feb 2026 06:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="rMSSg6Kk";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="z+7rDyIY"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103F33EF0B8;
	Fri, 27 Feb 2026 06:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772174692; cv=none; b=cCZvIcWfuEjnkfTsF9dwUFhZ+6mlnlKGxQ+zr4nV7A/ieW+g8rfmC2u0eYohX2T54hsKIEC1UftwVxVRcnhSaUAG2K48mvGZmdVxqVWnMtWEBGjN/SyMvpjXVPyTkUxYduQU5YltZ2giBN5dY5xNKlddcI/CN2AL+zS8Im39CHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772174692; c=relaxed/simple;
	bh=I1SCO5giHITu1X8K8iGKyItIGK/4mCTfzb50bCLrYKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qq0uEajGfeFQUuAcXcbQ0agXS50wL0dqic4jevhPXVvUu9eXHxW/jU0ILb43ReU0yNeQFJzgx/Tqj2b17qXRADMG5JFj2To+Y/sJ2yZbnYGogLSMjURwkHSyViYqifKmrPhlP66xGYeMe7vg0veRfTRsnKYQsvDoSgcI9vF5TcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=rMSSg6Kk; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=z+7rDyIY; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772174688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3e/NNt95zCxtiCGoXkbHwk0qG7BgGrrwg5COo+2IR4M=;
	b=rMSSg6KkrB+0JkEM1SVz4yxaMDvQUAxB07ZFP9o0HFv6OnuLmfJlM9CHLY8ayOT8Uhnze8
	pLV4mfEgu3dsHx834eCRUmmtN4sob50LIxDOtoV4HLJRpckcONip2LvGVDl/0uetoYfdme
	WYlrXelcW8RoqItBz4pgzGh0g3/tsixL2/scHhnwHl1qFr+6VQK4fNZ+uICoU6db8BK5HX
	mvQ7TDFgU4wiudUQVcteSfUyFjtl7tnEOJkifbpUujp3RFT4F/vZMuuRQtgKgxv4iRvb0q
	NnJyjvFya4aexIexIuGGS4UVVQB8PDNaK4qjW4e55/9HW15nge6lQefC55Rdkw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772174688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3e/NNt95zCxtiCGoXkbHwk0qG7BgGrrwg5COo+2IR4M=;
	b=z+7rDyIYn1phXQcYGsAZsKJBR7n26KW4uUnlAVjzkZZjU2TqDmha5eFw4erHfLHmHrpl4F
	mpFNzwgxd8QHywBg==
Date: Fri, 27 Feb 2026 07:44:38 +0100
Subject: [PATCH v2 12/15] vdso/datapage: Remove inclusion of gettimeofday.h
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260227-vdso-header-cleanups-v2-12-35d60acf7410@linutronix.de>
References: <20260227-vdso-header-cleanups-v2-0-35d60acf7410@linutronix.de>
In-Reply-To: <20260227-vdso-header-cleanups-v2-0-35d60acf7410@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772174681; l=1781;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=I1SCO5giHITu1X8K8iGKyItIGK/4mCTfzb50bCLrYKk=;
 b=cXXrn6n7S+LEJc/Pp/MqAwi+lbezgl7mZP2vqpUPRpYbrjF+hNOZx1xoGZnMYsL/8exZLnqct
 PS2lFy9vGRJA92TiwY/nge/emrraWRcMcE51aTOIQcxtePRxMwT5RuF
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,armlinux.org.uk,linux.ibm.com,ellerman.id.au,gmail.com,xen0n.name,alpha.franken.de,mit.edu,zx2c4.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13266-lists,linux-mips=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:mid,linutronix.de:dkim,linutronix.de:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4ED621B3702
X-Rspamd-Action: no action

vdso/datapage.h is useful without pulling in the architecture-specific
gettimeofday() helpers.

Move the include to the only users which needs it.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 include/vdso/datapage.h | 11 -----------
 lib/vdso/gettimeofday.c | 11 +++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/include/vdso/datapage.h b/include/vdso/datapage.h
index 23c39b96190f..752856b36a3a 100644
--- a/include/vdso/datapage.h
+++ b/include/vdso/datapage.h
@@ -184,17 +184,6 @@ enum vdso_pages {
 	VDSO_NR_PAGES
 };
 
-/*
- * The generic vDSO implementation requires that gettimeofday.h
- * provides:
- * - __arch_get_hw_counter(): to get the hw counter based on the
- *   clock_mode.
- * - gettimeofday_fallback(): fallback for gettimeofday.
- * - clock_gettime_fallback(): fallback for clock_gettime.
- * - clock_getres_fallback(): fallback for clock_getres.
- */
-#include <asm/vdso/gettimeofday.h>
-
 #else /* !__ASSEMBLY__ */
 
 #ifdef CONFIG_VDSO_GETRANDOM
diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index 73b079eb4511..a4b0f06cf970 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -12,6 +12,17 @@
 #include <vdso/time32.h>
 #include <vdso/time64.h>
 
+/*
+ * The generic vDSO implementation requires that gettimeofday.h
+ * provides:
+ * - __arch_get_hw_counter(): to get the hw counter based on the
+ *   clock_mode.
+ * - gettimeofday_fallback(): fallback for gettimeofday.
+ * - clock_gettime_fallback(): fallback for clock_gettime.
+ * - clock_getres_fallback(): fallback for clock_getres.
+ */
+#include <asm/vdso/gettimeofday.h>
+
 /* Bring in default accessors */
 #include <vdso/vsyscall.h>
 

-- 
2.53.0


