Return-Path: <linux-mips+bounces-13262-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLwAJMk9oWkyrgQAu9opvQ
	(envelope-from <linux-mips+bounces-13262-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 07:46:33 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D3ADB1B36F2
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 07:46:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 66D45305B053
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 06:45:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F13533EF0B0;
	Fri, 27 Feb 2026 06:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dCLNqQkf";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="eVLtN9AW"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CAC3ED12B;
	Fri, 27 Feb 2026 06:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772174689; cv=none; b=i+zEypRFFQHvqT02FoJPuEdyBbE0bWa3pleV6UcW5tnQuhJcEAkBrzLl+o0tdDxMA8+zayekx2kBE88ZGhTbi/KsB/2vR7i753FGDrNrJknoz41GG7/vawJ5BUGECiydCT23aN2q+kxjhnFPqXZLsqgp91LHCq0wq8yDIzzY78s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772174689; c=relaxed/simple;
	bh=JcvE3kQiMg07X05oSReGQNnDSkDG6pLjGh3SaRJFDSk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BB3mbiahFdTUTrfxzzwrRyunlK0Rm0fWlq5Mr44S30LRylEk+geX2qfTBBPr+CsQP/wW53oO1c8Mj/rRCApElx2h/NEQ4z9E7NgSyI+4UVe9FWTrTpDqZZcXmBBPcPTE755zvin4jyXFintUdOJBrcq9vNYNxrqRVi93HxVjXAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dCLNqQkf; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=eVLtN9AW; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772174686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NLji6Amx+w4gkoyKP87sApLv4hbvr/R4BbROA9mF7Qw=;
	b=dCLNqQkfH1i//wSvIpnoq3xDDTzR2xeibPPMp/z9eZz64hGWimn0Lzumwy5pZBFei6FZLf
	G1v7mQUgTptwXQOorAhU4ZJk6uoK4C6efBUGJuSSMAW+9LwDA65lAhe7BLSk1GcozF7A+h
	ZlAAYWN/CSrxWHeMBVbf0yTx1gerVfh7lptz5Ry5V2dWHSqH2M2TME6HCKkyYogti0sP2G
	P6tZEdTPnz+Ch4F3lgRI/UyLbXCV97/qFf8eP3ybFVgQsdVbUJOJHabtbAoOaVU3QyEflS
	7DG9IaKYRC6xXbioku99cIA+Ibmq04T5oJ9d97OkF/WEyLWHLQ4myVt0QjtBUA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772174686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NLji6Amx+w4gkoyKP87sApLv4hbvr/R4BbROA9mF7Qw=;
	b=eVLtN9AWbevcPEHUTybrUg+PUlahm/LpMjWb5A6zQ6iJSsUcLh5Op7xSCyS6qNu2Uawows
	K8JJTt0JPIDm1MBg==
Date: Fri, 27 Feb 2026 07:44:35 +0100
Subject: [PATCH v2 09/15] random: vDSO: add explicit includes
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260227-vdso-header-cleanups-v2-9-35d60acf7410@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772174681; l=844;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=JcvE3kQiMg07X05oSReGQNnDSkDG6pLjGh3SaRJFDSk=;
 b=RZXvHH2HxCYtijPWzFmGuHR3sRa73ICHOAJnT8sgpwEldcg8giFkj0QCEeXbaQyeRwjE8NIZG
 3G4L52NK7P+AtsNoMk77ybqM5aiSaWAXCceP66bohc97O91JdCE0VU8
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,armlinux.org.uk,linux.ibm.com,ellerman.id.au,gmail.com,xen0n.name,alpha.franken.de,mit.edu,zx2c4.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13262-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,zx2c4.com:email,linutronix.de:mid,linutronix.de:dkim,linutronix.de:email]
X-Rspamd-Queue-Id: D3ADB1B36F2
X-Rspamd-Action: no action

Various used symbols are only visible through transitive includes.
These transitive includes are about to go away.

Explicitly include the necessary headers.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Acked-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 lib/vdso/getrandom.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/vdso/getrandom.c b/lib/vdso/getrandom.c
index 440f8a6203a6..7e29005aa208 100644
--- a/lib/vdso/getrandom.c
+++ b/lib/vdso/getrandom.c
@@ -7,8 +7,11 @@
 #include <linux/minmax.h>
 #include <vdso/datapage.h>
 #include <vdso/getrandom.h>
+#include <vdso/limits.h>
 #include <vdso/unaligned.h>
+#include <asm/barrier.h>
 #include <asm/vdso/getrandom.h>
+#include <uapi/linux/errno.h>
 #include <uapi/linux/mman.h>
 #include <uapi/linux/random.h>
 

-- 
2.53.0


