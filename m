Return-Path: <linux-mips+bounces-12174-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EB20EC4BAB8
	for <lists+linux-mips@lfdr.de>; Tue, 11 Nov 2025 07:25:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4A9524F00EB
	for <lists+linux-mips@lfdr.de>; Tue, 11 Nov 2025 06:23:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B55422D24BA;
	Tue, 11 Nov 2025 06:21:51 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 997E02D23B6;
	Tue, 11 Nov 2025 06:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762842111; cv=none; b=G6KxomcGnaU4NfKktPjTM2WItC4wTrCsGe6vM8aY0DL5mR73ncSARM5S4Bjc7mypqy3I3x9L8vO2LmCGqKfI5FPcN+LH4J+NgzMvzrv6je8A6EUrx1JopvdGcTMlp7bIVglVXFX+AFKpp+e3JpOlaYj5rWLALPPflCzS4iuKkoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762842111; c=relaxed/simple;
	bh=c1aJqt6FfpbxVOTByKKHFtOH9kKk/8N2iMfGH0+oDzg=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=HXyQNTa583qqBJEM5VOFx3mNAdJ5HsXz4WPxfb3ECE5Q9bg8HvkoWcLR+aGtD2cQGxM0W9cspiNxH8T37xruZUo7kJ7SWgDu5xIh6AnWbIcqpda2x/tAp0QRhDIuK9qK8W0jFFY+G5+i+g7cnJqcvKuJ32KXEakqLlrQvW61wdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 5CBF992009C; Tue, 11 Nov 2025 07:21:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 5567992009B;
	Tue, 11 Nov 2025 06:21:46 +0000 (GMT)
Date: Tue, 11 Nov 2025 06:21:46 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Nick Bowler <nbowler@draconx.ca>, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Jiaxun Yang <jiaxun.yang@flygoat.com>
cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: mm: Prevent a TLB shutdown on initial uniquification
Message-ID: <alpine.DEB.2.21.2511110547430.25436@angie.orcam.me.uk>
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
bypassing the content addressing logic, and preinitialize the TLB using 
addresses outside our usual unique range and avoiding clashes with any 
incoming contents before making the usual call to local_flush_tlb_all().

This fixes (at least) R4x00 cores if TLBP hits multiple matching TLB 
entries (SGI IP22 PROM for examples sets up all TLBs to the same virtual 
address).

Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
Fixes: 35ad7e181541 ("MIPS: mm: tlb-r4k: Uniquify TLB entries on init")
Cc: stable@vger.kernel.org # v6.17+
---
Hi,

 I have verified this lightly, also with some diagnostics added so as to 
make sure things get set up correctly, with my Malta/74Kf system for a 
32-bit configuration and with my SWARM/BCM1250 system for a 64-bit one.  
Sadly the latter box does not finish booting either way, but it's to be 
bisected separately.

 Can you please give it a try with your systems?

  Maciej
---
 arch/mips/mm/tlb-r4k.c |   92 +++++++++++++++++++++++++++++--------------------
 1 file changed, 55 insertions(+), 37 deletions(-)

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
@@ -508,54 +509,70 @@ static int __init set_ntlb(char *str)
 
 __setup("ntlb=", set_ntlb);
 
-/* Initialise all TLB entries with unique values */
+
+/* Comparison function for EntryHi VPN fields.  */
+static int r4k_vpn_cmp(const void *a, const void *b)
+{
+	return ((*(unsigned long *)a - *(unsigned long *)b) >>
+		(sizeof(unsigned long) - sizeof(int)) * 8);
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
+	}
+
+	sort(tlb_vpns, cnt, sizeof(tlb_vpns[0]), r4k_vpn_cmp, NULL);
+
 	write_c0_entrylo0(0);
 	write_c0_entrylo1(0);
 
-	while (entry < current_cpu_data.tlbsize) {
-		unsigned long asid_mask = cpu_asid_mask(&current_cpu_data);
-		unsigned long asid = 0;
-		int idx;
+	idx = 0;
+	ent = cnt;
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
@@ -602,6 +619,7 @@ static void r4k_tlb_configure(void)
 
 	/* From this point on the ARC firmware is dead.	 */
 	r4k_tlb_uniquify();
+	local_flush_tlb_all();
 
 	/* Did I tell you that ARC SUCKS?  */
 }

