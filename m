Return-Path: <linux-mips+bounces-12219-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9C2C55CB6
	for <lists+linux-mips@lfdr.de>; Thu, 13 Nov 2025 06:21:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78C253A59F5
	for <lists+linux-mips@lfdr.de>; Thu, 13 Nov 2025 05:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD1E11C6FEC;
	Thu, 13 Nov 2025 05:21:15 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B2E28248C;
	Thu, 13 Nov 2025 05:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763011275; cv=none; b=LDDuB0zcoCxeA1GfPc6Y55xGM2fSv9g1W+XVhJ7tzKs21L5zVrXxuUO3WP6ZPVFBAq8S5XBXQ9bNANJAHPipoILijUmTaRAVVIRLRq7xB8XnuGQNX+YcoNSZp7uDD3gURbmKP7QeqCC4RhqleCQihjEh6amjIsGW7CAEcSUXn2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763011275; c=relaxed/simple;
	bh=jO8jB74KjHuUDAYmA+SP2Z73Mt+40xwFkVV1azxk90w=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=rJn8sxFN8YciMZ3a9pPvUlfxyzjONeCN6v4wUgefutueMFLt33TDHY1DpJGlf9v1kXUQWLrdeZGxyYOsaHAOSD8/XcNmRUMTsyStWqLFszp0mCAMn7mOVEmKLFF0WU3Pxm57LsDmxz9w6tqe8+nVUBFq3YXxvGbJ5gBIh+oVzuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 8975B92009C; Thu, 13 Nov 2025 06:21:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 7944C92009B;
	Thu, 13 Nov 2025 05:21:10 +0000 (GMT)
Date: Thu, 13 Nov 2025 05:21:10 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Nick Bowler <nbowler@draconx.ca>, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Jiaxun Yang <jiaxun.yang@flygoat.com>
cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] MIPS: mm: Prevent a TLB shutdown on initial
 uniquification
Message-ID: <alpine.DEB.2.21.2511130507110.25436@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Depending on the particular CPU implementation a TLB shutdown may occur 
if multiple matching entries are detected upon the execution of a TLBP 
or the TLBWI/TLBWR instructions.  Given that we don't know what entries 
we have been handed we need to be very careful with the initial TLB 
setup and avoid all these instructions.

Therefore read all the TLB entries one by one with the TLBR instruction, 
bypassing the content addressing logic, and truncate any large pages in 
place so as to avoid a case in the second step where an incoming entry 
for a large page at a lower address overlaps with a replacement entry 
chosen at another index.  Then preinitialize the TLB using addresses 
outside our usual unique range and avoiding clashes with any entries 
received, before making the usual call to local_flush_tlb_all().

This fixes (at least) R4x00 cores if TLBP hits multiple matching TLB 
entries (SGI IP22 PROM for examples sets up all TLBs to the same virtual 
address).

Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
Fixes: 35ad7e181541 ("MIPS: mm: tlb-r4k: Uniquify TLB entries on init")
Cc: stable@vger.kernel.org # v6.17+
---
Hi,

 On second thoughts I decided against including wired entries in our VPN 
matching discovery for clash avoidance.  The reason is as I wrote before 
it makes no sense to have wired entries for KSEG0 addresses, so it should 
be safe to assume we won't ever make one, and then if a wired entry maps a 
large page, which is quite likely, then our clash avoidance logic won't 
handle an overlap where the two VPN values of a clashing pair don't match, 
so it makes no sense to pretend we can handle wired entries with the code 
as proposed.

 Pasting v2 discussion below verbatim as it still applies.

 Verified the same way as before, also with some diagnostics added so as 
to make sure things get set up correctly, with my Malta/74Kf system for a 
32-bit configuration and with my SWARM/BCM1250 system for a 64-bit one.

 In addition to the Wired register setup discussed with v1 I have realised 
the incoming entries may include large pages, possibly exceeding the size 
of KSEG0 even.  Such entries may overlap with our temporary entries added 
in the second step, so truncate any large pages in place as this ensures 
no clash happens with the received contents of the TLB.

 NB this doesn't handle incoming PageGrain.ESP having been set, but it's 
an unrelated preexisting issue that would have to be handled elsewhere.  
Possibly it doesn't matter in reality.

 Additionally PageMask is left set at what has been retrieved from the 
last incoming TLB entry in the first step and has to be reset to our page 
size before proceeding with the second step.

 And last but not least the comparator function returned 0 incorrectly 
when the difference between 64-bit elements was positive but with none of 
the high-order 32 bits set.  Fixed with a branchless sequence of 3 machine 
instructions, which I think is the minimum here (only the sign and zero 
matter here, but this sequence actually produces -1/0/1, because why not).
No change for the 32-bit case, the difference is returned as is.

  Maciej

Changes from v2 (at 
<https://lore.kernel.org/r/alpine.DEB.2.21.2511122032400.25436@angie.orcam.me.uk/>):

- Revert the v2 update to include wired entries while reading original 
  contents of TLB.

Changes from v1 (at 
<https://lore.kernel.org/r/alpine.DEB.2.21.2511110547430.25436@angie.orcam.me.uk/>):

- Also include wired entries while reading original contents of TLB.

- Truncate any large pages in place while reading original TLB entries.

- Reset PageMask to PM_DEFAULT_MASK after reading in TLB entries.

- Fix the 64-bit case for the sort comparator.
---
 arch/mips/mm/tlb-r4k.c |  100 ++++++++++++++++++++++++++++++-------------------
 1 file changed, 63 insertions(+), 37 deletions(-)

linux-mips-tlb-r4k-uniquify-fix.diff
Index: linux-swarm64/arch/mips/mm/tlb-r4k.c
===================================================================
--- linux-swarm64.orig/arch/mips/mm/tlb-r4k.c
+++ linux-swarm64/arch/mips/mm/tlb-r4k.c
@@ -15,6 +15,7 @@
 #include <linux/mm.h>
 #include <linux/hugetlb.h>
 #include <linux/export.h>
+#include <linux/sort.h>
 
 #include <asm/cpu.h>
 #include <asm/cpu-type.h>
@@ -508,54 +509,78 @@ static int __init set_ntlb(char *str)
 
 __setup("ntlb=", set_ntlb);
 
-/* Initialise all TLB entries with unique values */
+
+/* Comparison function for EntryHi VPN fields.  */
+static int r4k_vpn_cmp(const void *a, const void *b)
+{
+	long v = *(unsigned long *)a - *(unsigned long *)b;
+	int s = sizeof(long) > sizeof(int) ? sizeof(long) * 8 - 1: 0;
+	return s ? (v != 0) | v >> s : v;
+}
+
+/*
+ * Initialise all TLB entries with unique values that do not clash with
+ * what we have been handed over and what we'll be using ourselves.
+ */
 static void r4k_tlb_uniquify(void)
 {
-	int entry = num_wired_entries();
+	unsigned long tlb_vpns[1 << MIPS_CONF1_TLBS_SIZE];
+	int tlbsize = current_cpu_data.tlbsize;
+	int start = num_wired_entries();
+	unsigned long vpn_mask;
+	int cnt, ent, idx, i;
+
+	vpn_mask = GENMASK(cpu_vmbits - 1, 13);
+	vpn_mask |= IS_ENABLED(CONFIG_64BIT) ? 3ULL << 62 : 1 << 31;
 
 	htw_stop();
+
+	for (i = start, cnt = 0; i < tlbsize; i++, cnt++) {
+		unsigned long vpn;
+
+		write_c0_index(i);
+		mtc0_tlbr_hazard();
+		tlb_read();
+		tlb_read_hazard();
+		vpn = read_c0_entryhi();
+		vpn &= vpn_mask & PAGE_MASK;
+		tlb_vpns[cnt] = vpn;
+
+		/* Prevent any large pages from overlapping regular ones.  */
+		write_c0_pagemask(read_c0_pagemask() & PM_DEFAULT_MASK);
+		mtc0_tlbw_hazard();
+		tlb_write_indexed();
+		tlbw_use_hazard();
+	}
+
+	sort(tlb_vpns, cnt, sizeof(tlb_vpns[0]), r4k_vpn_cmp, NULL);
+
+	write_c0_pagemask(PM_DEFAULT_MASK);
 	write_c0_entrylo0(0);
 	write_c0_entrylo1(0);
 
-	while (entry < current_cpu_data.tlbsize) {
-		unsigned long asid_mask = cpu_asid_mask(&current_cpu_data);
-		unsigned long asid = 0;
-		int idx;
+	idx = 0;
+	ent = tlbsize;
+	for (i = start; i < tlbsize; i++)
+		while (1) {
+			unsigned long entryhi, vpn;
 
-		/* Skip wired MMID to make ginvt_mmid work */
-		if (cpu_has_mmid)
-			asid = MMID_KERNEL_WIRED + 1;
+			entryhi = UNIQUE_ENTRYHI(ent);
+			vpn = entryhi & vpn_mask & PAGE_MASK;
 
-		/* Check for match before using UNIQUE_ENTRYHI */
-		do {
-			if (cpu_has_mmid) {
-				write_c0_memorymapid(asid);
-				write_c0_entryhi(UNIQUE_ENTRYHI(entry));
+			if (idx >= cnt || vpn < tlb_vpns[idx]) {
+				write_c0_entryhi(entryhi);
+				write_c0_index(i);
+				mtc0_tlbw_hazard();
+				tlb_write_indexed();
+				ent++;
+				break;
+			} else if (vpn == tlb_vpns[idx]) {
+				ent++;
 			} else {
-				write_c0_entryhi(UNIQUE_ENTRYHI(entry) | asid);
+				idx++;
 			}
-			mtc0_tlbw_hazard();
-			tlb_probe();
-			tlb_probe_hazard();
-			idx = read_c0_index();
-			/* No match or match is on current entry */
-			if (idx < 0 || idx == entry)
-				break;
-			/*
-			 * If we hit a match, we need to try again with
-			 * a different ASID.
-			 */
-			asid++;
-		} while (asid < asid_mask);
-
-		if (idx >= 0 && idx != entry)
-			panic("Unable to uniquify TLB entry %d", idx);
-
-		write_c0_index(entry);
-		mtc0_tlbw_hazard();
-		tlb_write_indexed();
-		entry++;
-	}
+		}
 
 	tlbw_use_hazard();
 	htw_start();
@@ -602,6 +627,7 @@ static void r4k_tlb_configure(void)
 
 	/* From this point on the ARC firmware is dead.	 */
 	r4k_tlb_uniquify();
+	local_flush_tlb_all();
 
 	/* Did I tell you that ARC SUCKS?  */
 }

