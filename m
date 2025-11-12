Return-Path: <linux-mips+bounces-12215-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C202C54D3A
	for <lists+linux-mips@lfdr.de>; Thu, 13 Nov 2025 00:43:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 92F01349DA1
	for <lists+linux-mips@lfdr.de>; Wed, 12 Nov 2025 23:42:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 987B82F39DD;
	Wed, 12 Nov 2025 23:42:17 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19DAD2DC338;
	Wed, 12 Nov 2025 23:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762990937; cv=none; b=CQH/f4cib2NQS4a5/FmhQvxSlzvGIKOvNi8STL0DjjiGFjDrR94ReWGpcZw+sCXWUeb3k83oHVMvxAosxUlcbGbLihNumjWOWiTkKrlK0jK9KjnSE/k/aMduVwp/fX/9JtC8wc5GNVCy5iwo+UNvQBS/v9ano4Z3kC0kdfed3U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762990937; c=relaxed/simple;
	bh=B1jgk7DTVQkzUe6i9nciUfEleukQaO3tQoN7dCJj+VY=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=lHt05jEQo+J7gssvVzZFwWvShaesq6/yjhqvWehzgvG4jIBkUdbS4BPlkV6/5E4fykRtTs5lwC6yogoBK/HC4jtjWHXPfp3+paY9ZFOtDnRx4TW7Ae2NfU9wUCrPNAqYpOEeqkgF9yhitFTSGuldaF9RE0NKOZi6lcWVgGknTlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 0CF1E92009D; Thu, 13 Nov 2025 00:42:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 0740392009C;
	Wed, 12 Nov 2025 23:42:12 +0000 (GMT)
Date: Wed, 12 Nov 2025 23:42:11 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Nick Bowler <nbowler@draconx.ca>, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Jiaxun Yang <jiaxun.yang@flygoat.com>
cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] MIPS: mm: Prevent a TLB shutdown on initial
 uniquification
Message-ID: <alpine.DEB.2.21.2511122032400.25436@angie.orcam.me.uk>
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

Changes from v1 (at 
<https://lore.kernel.org/r/alpine.DEB.2.21.2511110547430.25436@angie.orcam.me.uk/>):

- Also include wired entries while reading original contents of TLB.

- Truncate any large pages in place while reading original TLB entries.

- Reset PageMask to PM_DEFAULT_MASK after reading in TLB entries.

- Fix the 64-bit case for the sort comparator.
---
 arch/mips/mm/tlb-r4k.c |  102 +++++++++++++++++++++++++++++++------------------
 1 file changed, 65 insertions(+), 37 deletions(-)

linux-mips-tlb-r4k-uniquify-fix.diff
Index: linux-macro/arch/mips/mm/tlb-r4k.c
===================================================================
--- linux-macro.orig/arch/mips/mm/tlb-r4k.c
+++ linux-macro/arch/mips/mm/tlb-r4k.c
@@ -15,6 +15,7 @@
 #include <linux/mm.h>
 #include <linux/hugetlb.h>
 #include <linux/export.h>
+#include <linux/sort.h>
 
 #include <asm/cpu.h>
 #include <asm/cpu-type.h>
@@ -508,54 +509,80 @@ static int __init set_ntlb(char *str)
 
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
+	int ent, idx, i;
+
+	vpn_mask = GENMASK(cpu_vmbits - 1, 13);
+	vpn_mask |= IS_ENABLED(CONFIG_64BIT) ? 3ULL << 62 : 1 << 31;
 
 	htw_stop();
+
+	for (i = 0; i < tlbsize; i++) {
+		unsigned long vpn;
+
+		write_c0_index(i);
+		mtc0_tlbr_hazard();
+		tlb_read();
+		tlb_read_hazard();
+		vpn = read_c0_entryhi();
+		vpn &= vpn_mask & PAGE_MASK;
+		tlb_vpns[i] = vpn;
+		if (i < start)
+			continue;
+
+		/* Prevent any large pages from overlapping regular ones.  */
+		write_c0_pagemask(read_c0_pagemask() & PM_DEFAULT_MASK);
+		mtc0_tlbw_hazard();
+		tlb_write_indexed();
+		tlbw_use_hazard();
+	}
+
+	sort(tlb_vpns, tlbsize, sizeof(tlb_vpns[0]), r4k_vpn_cmp, NULL);
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
+			if (idx >= tlbsize || vpn < tlb_vpns[idx]) {
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
@@ -602,6 +629,7 @@ static void r4k_tlb_configure(void)
 
 	/* From this point on the ARC firmware is dead.	 */
 	r4k_tlb_uniquify();
+	local_flush_tlb_all();
 
 	/* Did I tell you that ARC SUCKS?  */
 }

