Return-Path: <linux-mips+bounces-13263-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNaoBdc9oWnsrQQAu9opvQ
	(envelope-from <linux-mips+bounces-13263-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 07:46:47 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3621B3709
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 07:46:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6A84C306805C
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 06:45:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 770B63EF0C0;
	Fri, 27 Feb 2026 06:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="stdRMCHR";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="+WnbQ4wr"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954B23ECBFC;
	Fri, 27 Feb 2026 06:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772174690; cv=none; b=lDhMQgOQFndUpcQrohsXVg3ZHgNobO9STzJsGk4Fbtct5KmF5L30DTBCh+wTfsGwLcx1Mn2OAzNYsWmTotPKIrGdWnJfx+i8WAMOhXOCQ3E1eTbjQut5bBgYjYSmXmpFj9COs6CC1CrsL/ap1twa4VShGjde82Sfc3lOPEd2uDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772174690; c=relaxed/simple;
	bh=sy5Iw83Mck3+k+fjmUT3MnQ1D2VXltvzXrUk++HeffI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OsWHWxZPyC8nl5U3ascbj20RxpA3JRlNxPGZV3GYZTFHy2auEvFhZBVakpK2hURsdkphHe06nR5C8D7HHBgp55256iATOEr4r87Qc/P9UbP0NVKtupZme1X0/ni3f169SRJw/HYXHgW+vypUE4wanE+payGfdriEqgQQbPQirU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=stdRMCHR; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=+WnbQ4wr; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772174686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9Ry4+WibbULZID6m2Gq5rwGN2Xcc8vgpZAjqk8Y5/xQ=;
	b=stdRMCHRvs0xeu82UFxyQcNCnPhyYkbXy3Fo2ZHSjDbGGRmIU26IulLEEC7iOn80gSRfYl
	JdWJa4E0AZOnDcjiSrIGmMgmTcP8wc3PJKIZ50EAW7jQ04b8tRt5lArZLzhL09e/agJpj8
	a8HGGfHa3tRakQCJKIxMJKCrDMAOI7dJRyJ++8cdaL8uYfUNcMlIXuDixyWEcdURwCnFy0
	a4T+vHkueg/QFZNrYSOn4utqmnjLuvjU2sILDk606jU/7beDwydO9a2/coWViQAsu/eEvL
	2DxN43XmoBlhoQ+I7KiLqP5PtvfHlXbnsDHSMnNph7nt7OiMVS9fYrmKSXvcpw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772174686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9Ry4+WibbULZID6m2Gq5rwGN2Xcc8vgpZAjqk8Y5/xQ=;
	b=+WnbQ4wr/QXZezkGKV43XZn6mvZwovNgHtNtXxl3JgXt8BChHmKwcgG0Z9p9erF0KkIOne
	6tGT4Q4I+ksCavDw==
Date: Fri, 27 Feb 2026 07:44:34 +0100
Subject: [PATCH v2 08/15] MIPS: vdso: Explicitly include asm/vdso/vdso.h
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260227-vdso-header-cleanups-v2-8-35d60acf7410@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772174681; l=696;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=sy5Iw83Mck3+k+fjmUT3MnQ1D2VXltvzXrUk++HeffI=;
 b=gexqOPTBO4Bt3KN2Hw80+zQ1Dm7PNP5n7sIAdmJPRveo0LnMUuplYuKy+W5bveU9pUDhtjgKK
 pk6GG2m6dQYCc7/5EXtBHbdyeNv2+zS74L0qzV37FLmkASdTF1Xw3IS
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,armlinux.org.uk,linux.ibm.com,ellerman.id.au,gmail.com,xen0n.name,alpha.franken.de,mit.edu,zx2c4.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13263-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:mid,linutronix.de:dkim,linutronix.de:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3D3621B3709
X-Rspamd-Action: no action

The usage of __VDSO_PAGES requires asm/vdso/vdso.h. Currently this header
is included transitively, but that transitive inclusion is about to go
away.

Explicitly include the header.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/mips/kernel/vdso.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/kernel/vdso.c b/arch/mips/kernel/vdso.c
index de096777172f..2fa4df3e46e4 100644
--- a/arch/mips/kernel/vdso.c
+++ b/arch/mips/kernel/vdso.c
@@ -21,6 +21,7 @@
 #include <asm/mips-cps.h>
 #include <asm/page.h>
 #include <asm/vdso.h>
+#include <asm/vdso/vdso.h>
 #include <vdso/helpers.h>
 #include <vdso/vsyscall.h>
 

-- 
2.53.0


