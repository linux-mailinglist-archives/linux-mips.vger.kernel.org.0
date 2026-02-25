Return-Path: <linux-mips+bounces-13234-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBRMCYOLn2nYcgQAu9opvQ
	(envelope-from <linux-mips+bounces-13234-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 26 Feb 2026 00:53:39 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FDB19F259
	for <lists+linux-mips@lfdr.de>; Thu, 26 Feb 2026 00:53:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C1404300CC01
	for <lists+linux-mips@lfdr.de>; Wed, 25 Feb 2026 23:53:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1578A330327;
	Wed, 25 Feb 2026 23:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=openadk.org header.i=@openadk.org header.b="BBbvoHDt"
X-Original-To: linux-mips@vger.kernel.org
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A96F3806D0
	for <linux-mips@vger.kernel.org>; Wed, 25 Feb 2026 23:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.238.66.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772063616; cv=none; b=E52CgjUZmID9j9y4l2dnwPAXAA0zHr1n6Jfo6Z13A7H1EXTHceoBi1ywzDnV115E1WsgV1JBnimomFfyZ+9kfrzp1xV6AdxUX6HHDDs8FQsx5Uu81knu5/D/EsNSZYe0M/LGspYYBuyCAEJYzwj9XE99FmkQmVn1fOTRRxjOh7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772063616; c=relaxed/simple;
	bh=aE7cqxD/TYZ1qZMTCi4bVMh5sJJtOg8vew6Koh3y8aY=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ov4UisVF3rt/gT29Nu0amwkADLjFEoSC3XLFoIheoBbY83F7BjdzVpSYsHzADu6qRoKuei4/Edjjivf11EKhcxG7WzrQQWmsKIVbSYYGzXMDphZ3DGYJP6+5BXwcBaFmnsznQFPtuf6WqNtITnf3DfdwWM+92kgftu9NsUA8RWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openadk.org; spf=pass smtp.mailfrom=openadk.org; dkim=fail (0-bit key) header.d=openadk.org header.i=@openadk.org header.b=BBbvoHDt reason="key not found in DNS"; arc=none smtp.client-ip=89.238.66.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openadk.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openadk.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
	t=1772063607; bh=aE7cqxD/TYZ1qZMTCi4bVMh5sJJtOg8vew6Koh3y8aY=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=BBbvoHDtN8xF0banuHxF6Pyw1PCuj5tDZUvZxz46EswJKOGVXRr7Hf4b84V3RKRRx
	 hgUw3ki8lK9YgZt3E6CVSwe6WTu5C03xG3KKJh1sSlWymHo47zg+uFrhUUsbz2GZYH
	 yJb4zJZ/ZSUlIKjVKu8ZskLv77IwjkraPaoOb5LOKTSdiWE9TmN6hPezT9M3W7LYbJ
	 uN5zSGEaTBrkw8SEzMKDoSSPjJdBcka70mTtEX+yo+2ZmjGScfhJxe3Wjws9kZdCCv
	 YBLXCTBEe6vaeHhop+u6sFg5CkiRE79BL7tl6UWH6c9oPbV6LmnBX4fZxndAp8NgHi
	 vMaNzFq/J489w==
Received: by helium.openadk.org (Postfix, from userid 1000)
	id 051F731E0C66; Thu, 26 Feb 2026 00:53:26 +0100 (CET)
Date: Thu, 26 Feb 2026 00:53:26 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: linux-mips@vger.kernel.org
Subject: Re: Asus WL500g Premium (BCM47XX) problem
Message-ID: <aZ-Ldi2U-51z3tF5@waldemar-brodkorb.de>
Mail-Followup-To: linux-mips@vger.kernel.org
References: <aZ3NVrKLKgsflL1H@waldemar-brodkorb.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aZ3NVrKLKgsflL1H@waldemar-brodkorb.de>
X-Operating-System: Linux 6.12.63+deb13-amd64 x86_64
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[openadk.org];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	R_DKIM_PERMFAIL(0.00)[openadk.org:s=2022];
	TAGGED_FROM(0.00)[bounces-13234-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[openadk.org:~];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wbx@openadk.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-0.956];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,openadk.org:email]
X-Rspamd-Queue-Id: 60FDB19F259
X-Rspamd-Action: no action

Hi,

Waldemar Brodkorb wrote,

> Hi MIPS hackers,
> 
> attached is the bootup log of Linux 6.18.13 (vanilla) on a Asus WL500g Premium
> WLAN router. See here for details:
> https://openwrt.org/toh/asus/wl-500gp
> 
> It is v1 version of the hardware. The CPU BCM3300 is correctly
> recognized, but it seems some of the cpu features might be
> misconfigured? What could be the problem?
> 
> Could this be the problem:
> https://dev.archive.openwrt.org/ticket/1485

It seems this old patch is good to make the userland more stable.
I now can login via SSH to the device. WHat you think about
something like that? It was made for 6.18.13 ATM.

From 9663df570daaa57f412eacb66fdd28d438073102 Mon Sep 17 00:00:00 2001
From: Waldemar Brodkorb <wbx@openadk.org>
Date: Tue, 24 Feb 2026 22:02:00 +0100
Subject: [PATCH] bcm47xx: fix for oops in copy_page() on BCM3300 CPU

On a Asus WL500gP WLAn router, see here for hardware details:
https://openwrt.org/toh/asus/wl-500gp
You get a kernel oops like this:
Data bus error, epc == 80015750, ra == 80013de8
Oops[#1]:
CPU: 0 UID: 0 PID: 1 Comm: preinit Not tainted 6.18.13 #1 NONE
Hardware name: Unknown Board
$ 0   : 00000000 10008800 fffd1000 00000000
$ 4   : 8102e000 fffd1000 8102ef00 805af1e0
$ 8   : 00000034 803b9808 77e3afff 77e39000
$12   : 80534164 00000001 00000801 00001533
$16   : 8102e000 805af1e0 00000001 00000255
$20   : 80bb6700 77e39000 80bb6700 80bb5000
$24   : 00000000 00000003
$28   : 8082e000 8082fe38 00000000 80013de8
Hi    : 00000000
Lo    : 00000000
epc   : 80015750 copy_page+0x48/0x548
ra    : 80013de8 copy_user_highpage+0x94/0xf8
Status: 10008803        KERNEL EXL IE
Cause : 0080001c (ExcCode 07)
PrId  : 00029006 (Broadcom BMIPS3300)
Modules linked in:
Process preinit (pid: 1, threadinfo=(ptrval), task=(ptrval), tls=00000000)
Stack : 77e39000 00000249 80561000 00000000 805c39e0 800c2404 77e39000 77e3afff
        809a150c 00000000 8082feb4 00000000 00000000 00000000 00000a55 804b0000
        00000000 e09c7372 80bbc000 80bb6700 00100cca 0000000f 77e39000 77e39ff8
        00000a55 80ae977c 80ae977c 005ee689 00000000 805af1e0 80bbc8e4 80bb502c
        00000000 e09c7372 8082ff28 77e39ff8 80830000 00000001 00000255 00000001
        ...
Call Trace:
[<80015750>] copy_page+0x48/0x548
[<80013de8>] copy_user_highpage+0x94/0xf8
[<800c2404>] handle_mm_fault+0xbac/0xfec
[<80013528>] do_page_fault+0x118/0x470
[<80017098>] tlb_do_page_fault_1+0x118/0x120

Code: cc9e0060  cc9e0070  cca40100 <8ca80000> 8ca90004  8caa0008  8cab000c  cc9e0080  ac880000

---[ end trace 0000000000000000 ]---
Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---

Fix is from old OpenWrt svn archive:
https://git.openwrt.org/?p=openwrt/svn-archive/openwrt.git;a=blob;f=target/linux/brcm47xx/patches-3.18/160-kmap_coherent.patch;h=924138690d54757fbfb24569b8730cf2576cc5af;hb=refs/heads/chaos_calmer

See here for details:
https://dev.archive.openwrt.org/ticket/1485

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 arch/mips/include/asm/cpu-features.h                       | 3 +++
 arch/mips/include/asm/mach-bcm47xx/cpu-feature-overrides.h | 1 +
 arch/mips/mm/c-r4k.c                                       | 4 ++--
 arch/mips/mm/init.c                                        | 6 +++---
 4 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/mips/include/asm/cpu-features.h b/arch/mips/include/asm/cpu-features.h
index 404390bb87ea..9f1b2c2f3739 100644
--- a/arch/mips/include/asm/cpu-features.h
+++ b/arch/mips/include/asm/cpu-features.h
@@ -257,6 +257,9 @@
 #ifndef cpu_has_pindexed_dcache
 #define cpu_has_pindexed_dcache	(cpu_data[0].dcache.flags & MIPS_CACHE_PINDEX)
 #endif
+#ifndef cpu_use_kmap_coherent
+#define cpu_use_kmap_coherent	1
+#endif
 
 /*
  * I-Cache snoops remote store.	 This only matters on SMP.  Some multiprocessors
diff --git a/arch/mips/include/asm/mach-bcm47xx/cpu-feature-overrides.h b/arch/mips/include/asm/mach-bcm47xx/cpu-feature-overrides.h
index 69899c1e122d..47314a7048a1 100644
--- a/arch/mips/include/asm/mach-bcm47xx/cpu-feature-overrides.h
+++ b/arch/mips/include/asm/mach-bcm47xx/cpu-feature-overrides.h
@@ -22,6 +22,7 @@
 #define cpu_has_mcheck			1
 #define cpu_has_ejtag			1
 #define cpu_has_llsc			1
+#define cpu_use_kmap_coherent   	0
 
 /* cpu_has_mips16 */
 #define cpu_has_mdmx			0
diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
index 10413b6f6662..558b780b4d72 100644
--- a/arch/mips/mm/c-r4k.c
+++ b/arch/mips/mm/c-r4k.c
@@ -576,7 +576,7 @@ static inline void local_r4k_flush_cache_page(void *args)
 		map_coherent = (cpu_has_dc_aliases &&
 				folio_mapped(folio) &&
 				!folio_test_dcache_dirty(folio));
-		if (map_coherent)
+		if (map_coherent && cpu_use_kmap_coherent)
 			vaddr = kmap_coherent(page, addr);
 		else
 			vaddr = kmap_atomic(page);
@@ -598,7 +598,7 @@ static inline void local_r4k_flush_cache_page(void *args)
 	}
 
 	if (vaddr) {
-		if (map_coherent)
+		if (map_coherent && cpu_use_kmap_coherent)
 			kunmap_coherent();
 		else
 			kunmap_atomic(vaddr);
diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
index a673d3d68254..ab394299d5eb 100644
--- a/arch/mips/mm/init.c
+++ b/arch/mips/mm/init.c
@@ -167,7 +167,7 @@ void copy_user_highpage(struct page *to, struct page *from,
 	void *vfrom, *vto;
 
 	vto = kmap_atomic(to);
-	if (cpu_has_dc_aliases &&
+	if (cpu_has_dc_aliases && cpu_use_kmap_coherent &&
 	    folio_mapped(src) && !folio_test_dcache_dirty(src)) {
 		vfrom = kmap_coherent(from, vaddr);
 		copy_page(vto, vfrom);
@@ -191,7 +191,7 @@ void copy_to_user_page(struct vm_area_struct *vma,
 {
 	struct folio *folio = page_folio(page);
 
-	if (cpu_has_dc_aliases &&
+	if (cpu_has_dc_aliases && cpu_use_kmap_coherent &&
 	    folio_mapped(folio) && !folio_test_dcache_dirty(folio)) {
 		void *vto = kmap_coherent(page, vaddr) + (vaddr & ~PAGE_MASK);
 		memcpy(vto, src, len);
@@ -211,7 +211,7 @@ void copy_from_user_page(struct vm_area_struct *vma,
 {
 	struct folio *folio = page_folio(page);
 
-	if (cpu_has_dc_aliases &&
+	if (cpu_has_dc_aliases && cpu_use_kmap_coherent &&
 	    folio_mapped(folio) && !folio_test_dcache_dirty(folio)) {
 		void *vfrom = kmap_coherent(page, vaddr) + (vaddr & ~PAGE_MASK);
 		memcpy(dst, vfrom, len);
-- 
2.47.3


