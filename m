Return-Path: <linux-mips+bounces-13971-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IKMAqDWxmkCPQUAu9opvQ
	(envelope-from <linux-mips+bounces-13971-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 27 Mar 2026 20:12:32 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7172A349F53
	for <lists+linux-mips@lfdr.de>; Fri, 27 Mar 2026 20:12:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 23EA931CED15
	for <lists+linux-mips@lfdr.de>; Fri, 27 Mar 2026 19:00:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56C78379EE2;
	Fri, 27 Mar 2026 18:57:33 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D1C237C0FA;
	Fri, 27 Mar 2026 18:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774637853; cv=none; b=oZQDzlIGWZ5qnvGd2N1/q1FI+2VqLzu7OxhYUiVnWJumJf6aBschEe8c3UsdjI2CB6vyt1jK2rQiF723dCN5T3zyazI/LriTq/Qajx9pI7TgAX57O/cXoGp+3Ni5l6yfhOcuawNbu31lxPgtoCrv1U7gr7a/lS3XFtn/84qpuRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774637853; c=relaxed/simple;
	bh=W621bP2LBfNGgIV8/H74wW4ghtsOlWPp+V3zbtpuWss=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=aDI/jbSxwe//TXgAkB6zGif4IfG29o7+SUgtRjbpCbMrstsA2kOYqtbnPEWCN5g3t+ttdT0lsFRcwJPZ3NRLAJiU9Ic1J2yB0P11ijQ8ocWQAxCK2oJp6pA0QCCtsJ2jm8lVCg/V/5tef0A50vdJDgG6kdeWbXeo0wQ8HrGgemo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id DDA999200BC; Fri, 27 Mar 2026 19:57:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id D6D1992009B;
	Fri, 27 Mar 2026 18:57:30 +0000 (GMT)
Date: Fri, 27 Mar 2026 18:57:30 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Gregory CLEMENT <gregory.clement@bootlin.com>, 
    Thomas Huth <thuth@redhat.com>, 
    =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
    Keguang Zhang <keguang.zhang@gmail.com>, 
    Jiaxun Yang <jiaxun.yang@flygoat.com>
cc: Waldemar Brodkorb <wbx@openadk.org>, linux-mips@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] MIPS: mm: Rewrite TLB uniquification for the hidden bit
 feature
In-Reply-To: <alpine.DEB.2.21.2603271406020.60268@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2603271754310.60268@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2603271406020.60268@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13971-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[orcam.me.uk];
	FREEMAIL_TO(0.00)[alpha.franken.de,bootlin.com,redhat.com,linaro.org,gmail.com,flygoat.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[macro@orcam.me.uk,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.791];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,angie.orcam.me.uk:mid,orcam.me.uk:email,eb.global:url,ea.global:url]
X-Rspamd-Queue-Id: 7172A349F53
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Before the introduction of the EHINV feature, which lets software mark 
TLB entries invalid, certain older implementations of the MIPS ISA were 
equipped with an analogous bit, as a vendor extension, which however is 
hidden from software and only ever set at reset, and then any software 
write clears it, making the intended TLB entry valid.

This feature makes it unsafe to read a TLB entry with TLBR, modify the 
page mask, and write the entry back with TLBWI, because this operation 
will implicitly clear the hidden bit and this may create a duplicate 
entry, as with the presence of the hidden bit there is no guarantee all
the entries across the TLB are unique each.

Usually the firmware has already uniquified TLB entries before handing 
control over, in which case we only need to guarantee at bootstrap no 
clash will happen with the VPN2 values chosen in local_flush_tlb_all().  

However with systems such as Mikrotik RB532 we get handed the TLB as at 
reset, with the hidden bit set across the entries and possibly duplicate 
entries present.  This then causes a machine check exception when page 
sizes are reset in r4k_tlb_uniquify() and prevents the system from 
booting.

Rewrite the algorithm used in r4k_tlb_uniquify() then such as to avoid 
the reuse of ASID/VPN values across the TLB.  Get rid of global entries 
first as they may be blocking the entire address space, e.g. 16 256MiB 
pages will exhaust the whole address space of a 32-bit CPU and a single 
big page can exhaust the 32-bit compatibility space on a 64-bit CPU.

Details of the algorithm chosen are given across the code itself.

Fixes: 9f048fa48740 ("MIPS: mm: Prevent a TLB shutdown on initial uniquification")
Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
Cc: stable@vger.kernel.org # v6.18+
---
Hi,

 I realise this is a little large for backporting, but I think reverting 
the original fix isn't a good idea, and neither is going further back, 
beyond commit 35ad7e181541 ("MIPS: mm: tlb-r4k: Uniquify TLB entries on 
init"), as that'd be fixing one set of systems at the expense of other 
systems, and then bringing back random crashes at boot due to clashing TLB 
entries.

  Maciej
---
 arch/mips/mm/tlb-r4k.c |  278 +++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 226 insertions(+), 52 deletions(-)

linux-mips-tlb-r4k-uniquify-hidden.diff
Index: linux-macro/arch/mips/mm/tlb-r4k.c
===================================================================
--- linux-macro.orig/arch/mips/mm/tlb-r4k.c
+++ linux-macro/arch/mips/mm/tlb-r4k.c
@@ -13,6 +13,7 @@
 #include <linux/sched.h>
 #include <linux/smp.h>
 #include <linux/memblock.h>
+#include <linux/minmax.h>
 #include <linux/mm.h>
 #include <linux/hugetlb.h>
 #include <linux/export.h>
@@ -24,6 +25,7 @@
 #include <asm/hazards.h>
 #include <asm/mmu_context.h>
 #include <asm/tlb.h>
+#include <asm/tlbdebug.h>
 #include <asm/tlbex.h>
 #include <asm/tlbmisc.h>
 #include <asm/setup.h>
@@ -511,87 +513,259 @@ static int __init set_ntlb(char *str)
 __setup("ntlb=", set_ntlb);
 
 
-/* Comparison function for EntryHi VPN fields.  */
-static int r4k_vpn_cmp(const void *a, const void *b)
+/* The start bit position of VPN2 and Mask in EntryHi/PageMask registers.  */
+#define VPN2_SHIFT 13
+
+/* Read full EntryHi even with CONFIG_32BIT.  */
+static inline unsigned long long read_c0_entryhi_native(void)
 {
-	long v = *(unsigned long *)a - *(unsigned long *)b;
-	int s = sizeof(long) > sizeof(int) ? sizeof(long) * 8 - 1: 0;
-	return s ? (v != 0) | v >> s : v;
+	return cpu_has_64bits ? read_c0_entryhi_64() : read_c0_entryhi();
 }
 
+/* Write full EntryHi even with CONFIG_32BIT.  */
+static inline void write_c0_entryhi_native(unsigned long long v)
+{
+	if (cpu_has_64bits)
+		write_c0_entryhi_64(v);
+	else
+		write_c0_entryhi(v);
+}
+
+/* TLB entry state for uniquification.  */
+struct tlbent {
+	unsigned long long wired:1;
+	unsigned long long global:1;
+	unsigned long long asid:10;
+	unsigned long long vpn:51;
+	unsigned long long pagesz:5;
+	unsigned long long index:14;
+};
+
 /*
- * Initialise all TLB entries with unique values that do not clash with
- * what we have been handed over and what we'll be using ourselves.
+ * Comparison function for TLB entry sorting.  Place wired entries first,
+ * then global entries, then order by the increasing VPN/ASID and the
+ * decreasing page size.  This lets us avoid clashes with wired entries
+ * easily and get entries for larger pages out of the way first.
+ *
+ * We could group bits so as to reduce the number of comparisons, but this
+ * is seldom executed and not performance-critical, so prefer legibility.
  */
-static void __ref r4k_tlb_uniquify(void)
+static int r4k_entry_cmp(const void *a, const void *b)
 {
-	int tlbsize = current_cpu_data.tlbsize;
-	bool use_slab = slab_is_available();
-	int start = num_wired_entries();
-	phys_addr_t tlb_vpn_size;
-	unsigned long *tlb_vpns;
-	unsigned long vpn_mask;
-	int cnt, ent, idx, i;
+	struct tlbent ea = *(struct tlbent *)a, eb = *(struct tlbent *)b;
 
-	vpn_mask = GENMASK(cpu_vmbits - 1, 13);
-	vpn_mask |= IS_ENABLED(CONFIG_64BIT) ? 3ULL << 62 : 1 << 31;
+	if (ea.wired > eb.wired)
+		return -1;
+	else if (ea.wired < eb.wired)
+		return 1;
+	else if (ea.global > eb.global)
+		return -1;
+	else if (ea.global < eb.global)
+		return 1;
+	else if (ea.vpn < eb.vpn)
+		return -1;
+	else if (ea.vpn > eb.vpn)
+		return 1;
+	else if (ea.asid < eb.asid)
+		return -1;
+	else if (ea.asid > eb.asid)
+		return 1;
+	else if (ea.pagesz > eb.pagesz)
+		return -1;
+	else if (ea.pagesz < eb.pagesz)
+		return 1;
+	else
+		return 0;
+}
 
-	tlb_vpn_size = tlbsize * sizeof(*tlb_vpns);
-	tlb_vpns = (use_slab ?
-		    kmalloc(tlb_vpn_size, GFP_KERNEL) :
-		    memblock_alloc_raw(tlb_vpn_size, sizeof(*tlb_vpns)));
-	if (WARN_ON(!tlb_vpns))
-		return; /* Pray local_flush_tlb_all() is good enough. */
+/*
+ * Fetch all the TLB entries.  Mask individual VPN values retrieved with
+ * the corresponding page mask and ignoring any 1KiB extension as we'll
+ * be using 4KiB pages for uniquification.
+ */
+static void __ref r4k_tlb_uniquify_read(struct tlbent *tlb_vpns, int tlbsize)
+{
+	int start = num_wired_entries();
+	unsigned long long vpn_mask;
+	bool global;
+	int i;
 
-	htw_stop();
+	vpn_mask = GENMASK(current_cpu_data.vmbits - 1, VPN2_SHIFT);
+	vpn_mask |= cpu_has_64bits ? 3ULL << 62 : 1 << 31;
 
-	for (i = start, cnt = 0; i < tlbsize; i++, cnt++) {
-		unsigned long vpn;
+	for (i = 0; i < tlbsize; i++) {
+		unsigned long long entryhi, vpn, mask, asid;
+		unsigned int pagesz;
 
 		write_c0_index(i);
 		mtc0_tlbr_hazard();
 		tlb_read();
 		tlb_read_hazard();
-		vpn = read_c0_entryhi();
-		vpn &= vpn_mask & PAGE_MASK;
-		tlb_vpns[cnt] = vpn;
 
-		/* Prevent any large pages from overlapping regular ones.  */
-		write_c0_pagemask(read_c0_pagemask() & PM_DEFAULT_MASK);
-		mtc0_tlbw_hazard();
-		tlb_write_indexed();
-		tlbw_use_hazard();
+		global = !!(read_c0_entrylo0() & ENTRYLO_G);
+		entryhi = read_c0_entryhi_native();
+		mask = read_c0_pagemask();
+
+		asid = entryhi & cpu_asid_mask(&current_cpu_data);
+		vpn = (entryhi & vpn_mask & ~mask) >> VPN2_SHIFT;
+		pagesz = ilog2((mask >> VPN2_SHIFT) + 1);
+
+		tlb_vpns[i].global = global;
+		tlb_vpns[i].asid = global ? 0 : asid;
+		tlb_vpns[i].vpn = vpn;
+		tlb_vpns[i].pagesz = pagesz;
+		tlb_vpns[i].wired = i < start;
+		tlb_vpns[i].index = i;
 	}
+}
 
-	sort(tlb_vpns, cnt, sizeof(tlb_vpns[0]), r4k_vpn_cmp, NULL);
+/*
+ * Write unique values to all but the wired TLB entries each, using
+ * the 4KiB page size.  This size might not be supported with R6, but
+ * EHINV is mandatory for R6, so we won't ever be called in that case.
+ *
+ * A sorted table is supplied with any wired entries at the beginning,
+ * followed by any global entries, and then finally regular entries.
+ * We start at the VPN and ASID values of zero and only assign user
+ * addresses, therefore guaranteeing no clash with addresses produced
+ * by UNIQUE_ENTRYHI.  We avoid any VPN values used by wired or global
+ * entries, by increasing the VPN value beyond the span of such entry.
+ *
+ * When a VPN/ASID clash is found with a regular entry we increment the
+ * ASID instead until no VPN/ASID clash has been found or the ASID space
+ * has been exhausted, in which case we increase the VPN value beyond
+ * the span of the largest clashing entry.
+ *
+ * We do not need to be concerned about FTLB or MMID configurations as
+ * those are required to implement the EHINV feature.
+ */
+static void __ref r4k_tlb_uniquify_write(struct tlbent *tlb_vpns, int tlbsize)
+{
+	unsigned long long asid, vpn, vpn_size, pagesz;
+	int widx, gidx, idx, sidx, lidx, i;
 
-	write_c0_pagemask(PM_DEFAULT_MASK);
+	vpn_size = 1ULL << (current_cpu_data.vmbits - VPN2_SHIFT);
+	pagesz = ilog2((PM_4K >> VPN2_SHIFT) + 1);
+
+	write_c0_pagemask(PM_4K);
 	write_c0_entrylo0(0);
 	write_c0_entrylo1(0);
 
-	idx = 0;
-	ent = tlbsize;
-	for (i = start; i < tlbsize; i++)
+	asid = 0;
+	vpn = 0;
+	widx = 0;
+	gidx = 0;
+	for (sidx = 0; sidx < tlbsize && tlb_vpns[sidx].wired; sidx++)
+		;
+	for (lidx = sidx; lidx < tlbsize && tlb_vpns[lidx].global; lidx++)
+		;
+	idx = gidx = sidx + 1;
+	for (i = sidx; i < tlbsize; i++) {
+		unsigned long long entryhi, vpn_pagesz = 0;
+
 		while (1) {
-			unsigned long entryhi, vpn;
+			if (WARN_ON(vpn >= vpn_size)) {
+				dump_tlb_all();
+				/* Pray local_flush_tlb_all() will cope.  */
+				return;
+			}
 
-			entryhi = UNIQUE_ENTRYHI(ent);
-			vpn = entryhi & vpn_mask & PAGE_MASK;
+			/* VPN must be below the next wired entry.  */
+			if (widx < sidx && vpn >= tlb_vpns[widx].vpn) {
+				vpn = max(vpn,
+					  (tlb_vpns[widx].vpn +
+					   (1ULL << tlb_vpns[widx].pagesz)));
+				asid = 0;
+				widx++;
+				continue;
+			}
+			/* VPN must be below the next global entry.  */
+			if (gidx < lidx && vpn >= tlb_vpns[gidx].vpn) {
+				vpn = max(vpn,
+					  (tlb_vpns[gidx].vpn +
+					   (1ULL << tlb_vpns[gidx].pagesz)));
+				asid = 0;
+				gidx++;
+				continue;
+			}
+			/* Try to find a free ASID so as to conserve VPNs.  */
+			if (idx < tlbsize && vpn == tlb_vpns[idx].vpn &&
+			    asid == tlb_vpns[idx].asid) {
+				unsigned long long idx_pagesz;
 
-			if (idx >= cnt || vpn < tlb_vpns[idx]) {
-				write_c0_entryhi(entryhi);
-				write_c0_index(i);
-				mtc0_tlbw_hazard();
-				tlb_write_indexed();
-				ent++;
-				break;
-			} else if (vpn == tlb_vpns[idx]) {
-				ent++;
-			} else {
+				idx_pagesz = tlb_vpns[idx].pagesz;
+				vpn_pagesz = max(vpn_pagesz, idx_pagesz);
+				do
+					idx++;
+				while (idx < tlbsize &&
+				       vpn == tlb_vpns[idx].vpn &&
+				       asid == tlb_vpns[idx].asid);
+				asid++;
+				if (asid > cpu_asid_mask(&current_cpu_data)) {
+					vpn += vpn_pagesz;
+					asid = 0;
+					vpn_pagesz = 0;
+				}
+				continue;
+			}
+			/* VPN mustn't be above the next regular entry.  */
+			if (idx < tlbsize && vpn > tlb_vpns[idx].vpn) {
+				vpn = max(vpn,
+					  (tlb_vpns[idx].vpn +
+					   (1ULL << tlb_vpns[idx].pagesz)));
+				asid = 0;
 				idx++;
+				continue;
 			}
+			break;
 		}
 
+		entryhi = (vpn << VPN2_SHIFT) | asid;
+		write_c0_entryhi_native(entryhi);
+		write_c0_index(tlb_vpns[i].index);
+		mtc0_tlbw_hazard();
+		tlb_write_indexed();
+
+		tlb_vpns[i].asid = asid;
+		tlb_vpns[i].vpn = vpn;
+		tlb_vpns[i].pagesz = pagesz;
+
+		asid++;
+		if (asid > cpu_asid_mask(&current_cpu_data)) {
+			vpn += 1ULL << pagesz;
+			asid = 0;
+		}
+	}
+}
+
+/*
+ * Initialise all TLB entries with unique values that do not clash with
+ * what we have been handed over and what we'll be using ourselves.
+ */
+static void __ref r4k_tlb_uniquify(void)
+{
+	int tlbsize = current_cpu_data.tlbsize;
+	bool use_slab = slab_is_available();
+	phys_addr_t tlb_vpn_size;
+	struct tlbent *tlb_vpns;
+
+	tlb_vpn_size = tlbsize * sizeof(*tlb_vpns);
+	tlb_vpns = (use_slab ?
+		    kmalloc(tlb_vpn_size, GFP_KERNEL) :
+		    memblock_alloc_raw(tlb_vpn_size, sizeof(*tlb_vpns)));
+	if (WARN_ON(!tlb_vpns))
+		return; /* Pray local_flush_tlb_all() is good enough. */
+
+	htw_stop();
+
+	r4k_tlb_uniquify_read(tlb_vpns, tlbsize);
+
+	sort(tlb_vpns, tlbsize, sizeof(*tlb_vpns), r4k_entry_cmp, NULL);
+
+	r4k_tlb_uniquify_write(tlb_vpns, tlbsize);
+
+	write_c0_pagemask(PM_DEFAULT_MASK);
+
 	tlbw_use_hazard();
 	htw_start();
 	flush_micro_tlb();

