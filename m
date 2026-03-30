Return-Path: <linux-mips+bounces-13984-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEEQEsjXyWnq2wUAu9opvQ
	(envelope-from <linux-mips+bounces-13984-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2026 03:54:16 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F888354AA6
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2026 03:54:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 49B3130086F1
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2026 01:54:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4638244694;
	Mon, 30 Mar 2026 01:54:13 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 219442DF68;
	Mon, 30 Mar 2026 01:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774835653; cv=none; b=kqtwpkr537mUWTjSbB0ObPHhYtrPCf1vhYSrFBVZP0Y2T2/Zr++QwCFEXyFjVSLFM5SVbmXEqCQzuSwfHv9vUF7MU4usTQTQlE8tzOBQ2Lh+F16CxHoLWwfRMtFFf9nk+BCIZHZj2MuXJYnAOd336glrwVYGAWfPyi0u3USWvjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774835653; c=relaxed/simple;
	bh=+OC1mgcMNX5wOoCcMPVK20fT0wrltlA2oEpQt/81xZU=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=UI7SakyWyYVaRiCx5uBQG672kp92sk3uF4mIKDYksZDn15oX9pcDGYe7OFmcjFqut1sLztV+zlDv0MevxZ/bROMJxyGXrgiRCoCd00B0fqVyP3DKL3JgkdXNAhBH0+JLugnNl5O0WvmA7hv3cSDilSgKnKiu+GXlR+5T4I7pJcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 92F1292009C; Mon, 30 Mar 2026 03:54:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 8930F92009B;
	Mon, 30 Mar 2026 02:54:09 +0100 (BST)
Date: Mon, 30 Mar 2026 02:54:09 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: Fix the GCC version check for `__multi3' workaround
Message-ID: <alpine.DEB.2.21.2603300218310.60268@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DMARC_NA(0.00)[orcam.me.uk];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-13984-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[macro@orcam.me.uk,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 8F888354AA6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

It was only GCC 10 that fixed a MIPS64r6 code generation issue with a 
`__multi3' libcall inefficiently produced to perform 64-bit widening 
multiplication while suitable machine instructions exist to do such a 
calculation.  The fix went in with GCC commit 48b2123f6336 ("re PR 
target/82981 (unnecessary __multi3 call for mips64r6 linux kernel)").

Adjust our code accordingly, removing build failures such as:

mips64-linux-ld: lib/math/div64.o: in function `mul_u64_add_u64_div_u64':
div64.c:(.text+0x84): undefined reference to `__multi3'

with the GCC versions affected.

Fixes: ebabcf17bcd7 ("MIPS: Implement __multi3 for GCC7 MIPS64r6 builds")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202601140146.hMLODc6v-lkp@intel.com/
Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
Cc: stable@vger.kernel.org # v4.15+
---
 arch/mips/lib/multi3.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

linux-mips-multi3-gcc10.diff
Index: linux-macro/arch/mips/lib/multi3.c
===================================================================
--- linux-macro.orig/arch/mips/lib/multi3.c
+++ linux-macro/arch/mips/lib/multi3.c
@@ -4,12 +4,12 @@
 #include "libgcc.h"
 
 /*
- * GCC 7 & older can suboptimally generate __multi3 calls for mips64r6, so for
+ * GCC 9 & older can suboptimally generate __multi3 calls for mips64r6, so for
  * that specific case only we implement that intrinsic here.
  *
  * See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=82981
  */
-#if defined(CONFIG_64BIT) && defined(CONFIG_CPU_MIPSR6) && (__GNUC__ < 8)
+#if defined(CONFIG_64BIT) && defined(CONFIG_CPU_MIPSR6) && (__GNUC__ < 10)
 
 /* multiply 64-bit values, low 64-bits returned */
 static inline long long notrace dmulu(long long a, long long b)
@@ -51,4 +51,4 @@ ti_type notrace __multi3(ti_type a, ti_t
 }
 EXPORT_SYMBOL(__multi3);
 
-#endif /* 64BIT && CPU_MIPSR6 && GCC7 */
+#endif /* 64BIT && CPU_MIPSR6 && GCC9 */

