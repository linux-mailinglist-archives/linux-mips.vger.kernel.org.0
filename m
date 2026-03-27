Return-Path: <linux-mips+bounces-13966-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFrPDcBtxmmkJwUAu9opvQ
	(envelope-from <linux-mips+bounces-13966-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 27 Mar 2026 12:45:04 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B38ED343B42
	for <lists+linux-mips@lfdr.de>; Fri, 27 Mar 2026 12:45:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B85A1304740E
	for <lists+linux-mips@lfdr.de>; Fri, 27 Mar 2026 11:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1A0E365A0D;
	Fri, 27 Mar 2026 11:44:50 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 680EB37C90A;
	Fri, 27 Mar 2026 11:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774611890; cv=none; b=Bp8KVH7MkYeQEGTrMYXahIRkUnBoR1blb4rwkleImRDUnn8d96ICm2cewtecCpLusH3H3c0iJkwHPVCFdMB/XadEa47WzHsE51DtP2IH4AK0F7ldAJaWBh3QT6YzJ/YAFTWvyXvHSiyAu0zR7rdwca1KJ7FxBGwyhTp1YY7EpAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774611890; c=relaxed/simple;
	bh=/d+IhIz3PGQzHBnH3ai96GGqg3RiLvX+lpIdYcwvhZ8=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=Ppmq7IV7WfWZJVxOBVlocBYXzh1ykMPSlLutc00syv+/XewNQG7bEdShEW6Ft0z3vt4F042htDkBgd26Bya0kp0zRM9EQeUH69207/qNpyIuNtRk6tqmX+TB3mNvQFQJbf+MemnDPvjWoRxfjhF4Gq3WjgrHR506h5Af1AoeCQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id BAABC92009C; Fri, 27 Mar 2026 12:38:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id B464792009B;
	Fri, 27 Mar 2026 11:38:06 +0000 (GMT)
Date: Fri, 27 Mar 2026 11:38:06 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    David Hildenbrand <david@kernel.org>, 
    Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>
cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: SiByte: Bring back cache initialisation
Message-ID: <alpine.DEB.2.21.2603271117500.60268@angie.orcam.me.uk>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13966-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[orcam.me.uk];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[macro@orcam.me.uk,linux-mips@vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,angie.orcam.me.uk:mid]
X-Rspamd-Queue-Id: B38ED343B42
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Bring back cache initialisation for Broadcom SiByte SB1 cores, which has 
been removed causing the kernel to hang at bootstrap right after:

Dentry cache hash table entries: 524288 (order: 8, 4194304 bytes, linear)
Inode-cache hash table entries: 262144 (order: 7, 2097152 bytes, linear)

The cause of the problem is R4k cache handlers are also used by Broadcom 
SiByte SB1 cores, however with a different cache error exception handler 
and therefore not using CPU_R4K_CACHE_TLB:

obj-$(CONFIG_CPU_R4K_CACHE_TLB) += c-r4k.o cex-gen.o tlb-r4k.o
obj-$(CONFIG_CPU_SB1)           += c-r4k.o cerr-sb1.o cex-sb1.o tlb-r4k.o

(from arch/mips/mm/Makefile).

Fixes: bbe4f634f48c ("mips: fix r3k_cache_init build regression")
Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
Cc: stable@vger.kernel.org # v6.8+
---
 arch/mips/mm/cache.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

linux-mips-sibyte-r4k-cache-init.diff
Index: linux-swarm64/arch/mips/mm/cache.c
===================================================================
--- linux-swarm64.orig/arch/mips/mm/cache.c
+++ linux-swarm64/arch/mips/mm/cache.c
@@ -207,7 +207,8 @@ void cpu_cache_init(void)
 {
 	if (IS_ENABLED(CONFIG_CPU_R3000) && cpu_has_3k_cache)
 		r3k_cache_init();
-	if (IS_ENABLED(CONFIG_CPU_R4K_CACHE_TLB) && cpu_has_4k_cache)
+	if ((IS_ENABLED(CONFIG_CPU_R4K_CACHE_TLB) ||
+	     IS_ENABLED(CONFIG_CPU_SB1)) && cpu_has_4k_cache)
 		r4k_cache_init();
 
 	if (IS_ENABLED(CONFIG_CPU_CAVIUM_OCTEON) && cpu_has_octeon_cache)

