Return-Path: <linux-mips+bounces-11782-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D16BEEFB4
	for <lists+linux-mips@lfdr.de>; Mon, 20 Oct 2025 03:12:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D907B4E10B6
	for <lists+linux-mips@lfdr.de>; Mon, 20 Oct 2025 01:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA2611A7264;
	Mon, 20 Oct 2025 01:11:59 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72DC028371;
	Mon, 20 Oct 2025 01:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760922719; cv=none; b=MBhF4upM9/IjnXE7bciOg98qxkZKDLO0FEjygzPZUeNS+b1nfo8cFC45B8nM7kBVedw0a5tJ/z5HBZrEUyBU58obLH/qF+hClSEkDGwv9ThCyQKx0kDgaQ9kIx+NWnmQbmxe2VAh8by7g04s1KEKzQDn+LLqlFqMHN492GNV+UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760922719; c=relaxed/simple;
	bh=In48bcvyi7wE+jp2OdhPbB6uFumf4nZZ9py/ZVJiGrM=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=rb+v67Na/nfl75KfguWgnZWEAws52B4ntjSbe3qvlPBZ17yfMWuOl80aqZU2vmQ/WcXs5S9q+ngLFnVqBtx+j7GIl/+iEydzl3QRLkEwcoMnq9BbZwdcO9Dprcio/x/CLnRRjz9hpGzXOtZzQWGf7URAX//vynEUALuhfe3quEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id AC99692009C; Mon, 20 Oct 2025 03:11:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id A8A6692009B;
	Mon, 20 Oct 2025 02:11:49 +0100 (BST)
Date: Mon, 20 Oct 2025 02:11:49 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc: Paul Burton <paulburton@kernel.org>, linux-mips@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: Malta: Fix !EVA SOC-it PCI MMIO
Message-ID: <alpine.DEB.2.21.2510191251130.39634@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Fix a regression that has caused accesses to the PCI MMIO window to 
complete unclaimed in non-EVA configurations with the SOC-it family of 
system controllers, preventing PCI devices from working that use MMIO.

In the non-EVA case PHYS_OFFSET is set to 0, meaning that PCI_BAR0 is 
set with an empty mask (and PCI_HEAD4 matches addresses starting from 0 
accordingly).  Consequently all addresses are matched for incoming DMA 
accesses from PCI.  This seems to confuse the system controller's logic 
and outgoing bus cycles targeting the PCI MMIO window seem not to make 
it to the intended devices.

This happens as well when a wider mask is used with PCI_BAR0, such as 
0x80000000 or 0xe0000000, that makes addresses match that overlap with 
the PCI MMIO window, which starts at 0x10000000 in our configuration.

Set the mask in PCI_BAR0 to 0xf0000000 for non-EVA then, covering the 
non-EVA maximum 256 MiB of RAM, which is what YAMON does and which used 
to work correctly up to the offending commit.  Set PCI_P2SCMSKL to match 
PCI_BAR0 as required by the system controller's specification, and match 
PCI_P2SCMAPL to PCI_HEAD4 for identity mapping.

Verified with:

Core board type/revision =      0x0d (Core74K) / 0x01
System controller/revision =    MIPS SOC-it 101 OCP / 1.3   SDR-FW-4:1
Processor Company ID/options =  0x01 (MIPS Technologies, Inc.) / 0x1c
Processor ID/revision =         0x97 (MIPS 74Kf) / 0x4c

for non-EVA and with:

Core board type/revision =      0x0c (CoreFPGA-5) / 0x00
System controller/revision =    MIPS ROC-it2 / 0.0   FW-1:1 (CLK_unknown) GIC
Processor Company ID/options =  0x01 (MIPS Technologies, Inc.) / 0x00
Processor ID/revision =         0xa0 (MIPS interAptiv UP) / 0x20

for EVA/non-EVA, fixing:

defxx 0000:00:12.0: assign IRQ: got 10
defxx: v1.12 2021/03/10  Lawrence V. Stefani and others
0000:00:12.0: Could not read adapter factory MAC address!

vs:

defxx 0000:00:12.0: assign IRQ: got 10
defxx: v1.12 2021/03/10  Lawrence V. Stefani and others
0000:00:12.0: DEFPA at MMIO addr = 0x10142000, IRQ = 10, Hardware addr = 00-00-f8-xx-xx-xx
0000:00:12.0: registered as fddi0

for non-EVA and causing no change for EVA.

Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
Fixes: 422dd256642b ("MIPS: Malta: Allow PCI devices DMA to lower 2GB physical")
Cc: stable@vger.kernel.org # v4.9+
---
 arch/mips/mti-malta/malta-init.c |   20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

linux-mips-malta-init-msc01-bar0.diff
Index: linux-macro/arch/mips/mti-malta/malta-init.c
===================================================================
--- linux-macro.orig/arch/mips/mti-malta/malta-init.c
+++ linux-macro/arch/mips/mti-malta/malta-init.c
@@ -241,16 +241,22 @@ void __init prom_init(void)
 #endif
 
 		/*
-		 * Setup the Malta max (2GB) memory for PCI DMA in host bridge
-		 * in transparent addressing mode.
+		 * Set up memory mapping in host bridge for PCI DMA masters,
+		 * in transparent addressing mode.  For EVA use the Malta
+		 * maximum of 2 GiB memory in the alias space at 0x80000000
+		 * as per PHYS_OFFSET.  Otherwise use 256 MiB of memory in
+		 * the regular space, avoiding mapping the PCI MMIO window
+		 * for DMA as it seems to confuse the system controller's
+		 * logic, causing PCI MMIO to stop working.
 		 */
-		mask = PHYS_OFFSET | PCI_BASE_ADDRESS_MEM_PREFETCH;
-		MSC_WRITE(MSC01_PCI_BAR0, mask);
-		MSC_WRITE(MSC01_PCI_HEAD4, mask);
+		mask = PHYS_OFFSET ? PHYS_OFFSET : 0xf0000000;
+		MSC_WRITE(MSC01_PCI_BAR0,
+			  mask | PCI_BASE_ADDRESS_MEM_PREFETCH);
+		MSC_WRITE(MSC01_PCI_HEAD4,
+			  PHYS_OFFSET | PCI_BASE_ADDRESS_MEM_PREFETCH);
 
-		mask &= MSC01_PCI_BAR0_SIZE_MSK;
 		MSC_WRITE(MSC01_PCI_P2SCMSKL, mask);
-		MSC_WRITE(MSC01_PCI_P2SCMAPL, mask);
+		MSC_WRITE(MSC01_PCI_P2SCMAPL, PHYS_OFFSET);
 
 		/* Don't handle target retries indefinitely.  */
 		if ((data & MSC01_PCI_CFG_MAXRTRY_MSK) ==

