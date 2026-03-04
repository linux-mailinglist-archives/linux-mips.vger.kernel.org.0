Return-Path: <linux-mips+bounces-13344-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oL+lLDbkp2mrlAAAu9opvQ
	(envelope-from <linux-mips+bounces-13344-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 04 Mar 2026 08:50:14 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7541A1FBE32
	for <lists+linux-mips@lfdr.de>; Wed, 04 Mar 2026 08:50:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 09FBF307F00D
	for <lists+linux-mips@lfdr.de>; Wed,  4 Mar 2026 07:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DEB738551C;
	Wed,  4 Mar 2026 07:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="LyzgGUL9";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="59pX2e/f"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10719388E40;
	Wed,  4 Mar 2026 07:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772610558; cv=none; b=Wgn9EsCUi+5HyOU0By67tP73lZ99jfp7qRywFntrRlmFayuWvfuLGiiN5ip7JNAjCui/albzvrnkXHwEj4w2KXjB9+Ne7MXEzh0bUAc1+3aLRevAms3XAzkCyiIbFBdaqxPZ98HCNzN8p95iLPaetrciu9vZpCczxy8k/E2J5tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772610558; c=relaxed/simple;
	bh=uvUMiIWcfXjU7/EzaxsEgKgYSiRCVfCnLWW65nkdgxo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n1GcxZFwTQSzRov613U9hYIiWzTYMft923TcI++qzoiTRmfjYZZk/V/3w5pP4eED/B6AOSrjGjPLhCmIxrvDUgN5M1BXbdY0adifQkRHMgropCiuE99C4DtzY0bypXiFcI2Hhqfu7C808nH/jTrYO0liDGEZUdjyJKmZ7PIWS7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=LyzgGUL9; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=59pX2e/f; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772610552;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RnZKZBmYr4ceBeK3e35WzrNjvlhaTZHtKIQbUEGmOF4=;
	b=LyzgGUL9R9gijctFQpnURyO74FAZPQIhEzpn92rOhi+rqdUMobnwLvA/XJ1lRc7tNVwrGc
	O9r/flvRZM5pE/odEJObleViPiZijuzGQSiMuM2kmE1uinZIXi2dTdlqxC4eH37HzjhtrT
	ZImQZL/XGjfUn2K3NTbMiX2PqsOgAaOKawj6qkFvOddrNqb3mQ7lPuAaTCdnmmZ0WJeDul
	Ds5cZ0Vj8vsUjUr+N/OqJ/Fgb0JT7D43NBzJN3vC0SmtfkH7sDV8DnGQsPqSCjqoIi4uo7
	okJWi1KyT0CV/V8n1KB5tgAnf7R/Z2PTkJjQaMPKqrj+u4je8m+d+B3iuFtQLQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772610552;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RnZKZBmYr4ceBeK3e35WzrNjvlhaTZHtKIQbUEGmOF4=;
	b=59pX2e/fytADAEYLh30rm0MfR5cMXtemqGQCW45I6ECwN6e/dinEpeYSPsqbxOPFO/NJAy
	145MypOmforAFOCQ==
Date: Wed, 04 Mar 2026 08:48:59 +0100
Subject: [PATCH v6 02/14] vdso/datastore: Drop inclusion of
 linux/mmap_lock.h
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260304-vdso-sparc64-generic-2-v6-2-d8eb3b0e1410@linutronix.de>
References: <20260304-vdso-sparc64-generic-2-v6-0-d8eb3b0e1410@linutronix.de>
In-Reply-To: <20260304-vdso-sparc64-generic-2-v6-0-d8eb3b0e1410@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Nick Alcock <nick.alcock@oracle.com>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Shuah Khan <shuah@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Shannon Nelson <sln@onemain.com>, 
 Thomas Gleixner <tglx@kernel.org>, Christophe Leroy <chleroy@kernel.org>
Cc: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772610551; l=813;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=uvUMiIWcfXjU7/EzaxsEgKgYSiRCVfCnLWW65nkdgxo=;
 b=XllL5cGs3jsrCqJAmyHwOhy/PXaWdoIqh8MmFM1mAmpXsY4DzkaFM3BSuAw5RE6gFO6VBrtyw
 +TE8wBR025/DIh0UwGva3/uc3S4dPzUGLXgPK0DcBB4JuoymIO41EJM
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Rspamd-Queue-Id: 7541A1FBE32
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,arndb.de,davemloft.net,gaisler.com,oracle.com,google.com,physik.fu-berlin.de,mit.edu,zx2c4.com,armlinux.org.uk,linux.ibm.com,ellerman.id.au,gmail.com,xen0n.name,alpha.franken.de,onemain.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13344-lists,linux-mips=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[38];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linutronix.de:dkim,linutronix.de:email,linutronix.de:mid,gaisler.com:email]
X-Rspamd-Action: no action

This header is unnecessary and together with some upcoming changes would
introduce compiler warnings.

Link: https://lore.kernel.org/lkml/20250916-mm-rcuwait-v1-1-39a3beea6ec3@linutronix.de/
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Tested-by: Andreas Larsson <andreas@gaisler.com>
Reviewed-by: Andreas Larsson <andreas@gaisler.com>
---
 lib/vdso/datastore.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/lib/vdso/datastore.c b/lib/vdso/datastore.c
index 2cca4e84e5b5..7377fcb6e1df 100644
--- a/lib/vdso/datastore.c
+++ b/lib/vdso/datastore.c
@@ -1,7 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
 #include <linux/linkage.h>
-#include <linux/mmap_lock.h>
 #include <linux/mm.h>
 #include <linux/time_namespace.h>
 #include <linux/types.h>

-- 
2.53.0


