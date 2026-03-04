Return-Path: <linux-mips+bounces-13351-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHwtBVDlp2mrlAAAu9opvQ
	(envelope-from <linux-mips+bounces-13351-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 04 Mar 2026 08:54:56 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 858531FC02F
	for <lists+linux-mips@lfdr.de>; Wed, 04 Mar 2026 08:54:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4274030C4EF6
	for <lists+linux-mips@lfdr.de>; Wed,  4 Mar 2026 07:51:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C1B9391515;
	Wed,  4 Mar 2026 07:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="FgrMGw+0";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="oCmPdg4P"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FC438F624;
	Wed,  4 Mar 2026 07:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772610566; cv=none; b=CZu0BBV8TzOSw0Pmzit6lNqIFmvjWFgkgzz/bmJ7+wzdc+Ea1yuquFID0tLhix8iQ1RR7XL+WvTgcOtgjpRJrxcafeSvAfAwLadLX4CIYKWNeawaRMbvKxgLhJSrmBGSQKd70RbWXXVLJBQ5nt9SSGbBJLnUBy+55LZuS5KctPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772610566; c=relaxed/simple;
	bh=lAm54urt5GeKbrhjyma6H2Eqz4yOWeFSr0NbX7+a7M8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oN3mQLh5RGxvNFH5ZqSkByRuiMLcrwdbtBUuoNqlG93voRyYpONWCeP+Hd2vV3MSS6+ki8Q15718lU+8E4ooPiWV3eZF2mkDh8VxZ873Jh2kE8WjZjM6a6/LBp1e34jZv85o2OdHsxgnzHsODLhjzc0RP1CrmV1Oy3AvyXhaKTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=FgrMGw+0; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=oCmPdg4P; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772610557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kJIJ4haN/w6vuaqusVIG8WNni7LxRg4LJbwm81SsxRs=;
	b=FgrMGw+0tDqATS7VwFn8jniFPxJsB1ys8YQGHcvAHXkxmFMvYo6Su3Bt0V4VMk2Y4kVrdM
	dLSWl2sXdEhJkfN+thXnqeDTJO9tF3Q+GFZkArXzG58ZAELVAd5ePAS0t/05yJv32pQJtr
	X249I8HKclhJSXnQ9SSOLoszCvitctXN39T2GrOGypkuf4Twrv2AJvUId15eRl0ml5NYun
	q0lgkc05M41XY33v3Q7EwwlIs7TVNNc6/stetmzcpT6OFhls/hNTXsaSLJLPGH8iS6Z5QJ
	G7xyia40qtFY2IO09BkRWCrWuSP+lMCV/J9Bpw7bAWCsMzAK0gPM2ZNxiomtiw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772610557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kJIJ4haN/w6vuaqusVIG8WNni7LxRg4LJbwm81SsxRs=;
	b=oCmPdg4PYMuRU28zbCRjZi00Kgg7Vz/AMlJi7v/8L4i0VKJBR7Gvw83sDhM3TFAxcPROYG
	1swfM4HYiuR6GOBQ==
Date: Wed, 04 Mar 2026 08:49:08 +0100
Subject: [PATCH v6 11/14] sparc64: vdso2c: Drop sym_vvar_start handling
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260304-vdso-sparc64-generic-2-v6-11-d8eb3b0e1410@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772610551; l=1941;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=lAm54urt5GeKbrhjyma6H2Eqz4yOWeFSr0NbX7+a7M8=;
 b=vKnzLJwiTGLossMMdtO2qf7gplf5mOJDMBQibefKfyvuPYaMi9b+gqFaCGXGXyYlvq2XHuYd+
 udeFTC0sjXUBWp7AIwh8IXBxRQmiYo8pDDgSjJjmpHs3cgPsp+ki3wf
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Rspamd-Queue-Id: 858531FC02F
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
	TAGGED_FROM(0.00)[bounces-13351-lists,linux-mips=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:dkim,linutronix.de:email,linutronix.de:mid,gaisler.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

After the adoption of the generic vDSO library this symbol does not exist.

The alignment invariant is now guaranteed by the generic code.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Tested-by: Andreas Larsson <andreas@gaisler.com>
Reviewed-by: Andreas Larsson <andreas@gaisler.com>
Acked-by: Andreas Larsson <andreas@gaisler.com>
---
 arch/sparc/include/asm/vdso.h | 2 --
 arch/sparc/vdso/vdso2c.c      | 6 ------
 arch/sparc/vdso/vdso2c.h      | 4 ----
 3 files changed, 12 deletions(-)

diff --git a/arch/sparc/include/asm/vdso.h b/arch/sparc/include/asm/vdso.h
index 59e79d35cd73..f08562d10215 100644
--- a/arch/sparc/include/asm/vdso.h
+++ b/arch/sparc/include/asm/vdso.h
@@ -8,8 +8,6 @@
 struct vdso_image {
 	void *data;
 	unsigned long size;   /* Always a multiple of PAGE_SIZE */
-
-	long sym_vvar_start;  /* Negative offset to the vvar area */
 };
 
 #ifdef CONFIG_SPARC64
diff --git a/arch/sparc/vdso/vdso2c.c b/arch/sparc/vdso/vdso2c.c
index b97af5ec9f35..70b14a436fe2 100644
--- a/arch/sparc/vdso/vdso2c.c
+++ b/arch/sparc/vdso/vdso2c.c
@@ -58,18 +58,12 @@
 
 const char *outfilename;
 
-/* Symbols that we need in vdso2c. */
-enum {
-	sym_vvar_start,
-};
-
 struct vdso_sym {
 	const char *name;
 	int export;
 };
 
 struct vdso_sym required_syms[] = {
-	[sym_vvar_start] = {"vvar_start", 1},
 };
 
 __attribute__((format(printf, 1, 2))) __attribute__((noreturn))
diff --git a/arch/sparc/vdso/vdso2c.h b/arch/sparc/vdso/vdso2c.h
index 60d69acc748f..ba0794659eb5 100644
--- a/arch/sparc/vdso/vdso2c.h
+++ b/arch/sparc/vdso/vdso2c.h
@@ -104,10 +104,6 @@ static void BITSFUNC(go)(void *raw_addr, size_t raw_len,
 		}
 	}
 
-	/* Validate mapping addresses. */
-	if (syms[sym_vvar_start] % 8192)
-		fail("vvar_begin must be a multiple of 8192\n");
-
 	if (!name) {
 		fwrite(stripped_addr, stripped_len, 1, outfile);
 		return;

-- 
2.53.0


