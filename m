Return-Path: <linux-mips+bounces-9166-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A25AD0D76
	for <lists+linux-mips@lfdr.de>; Sat,  7 Jun 2025 14:44:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 703B63B0FD9
	for <lists+linux-mips@lfdr.de>; Sat,  7 Jun 2025 12:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEAC31F5413;
	Sat,  7 Jun 2025 12:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="DQMNnAnO";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ci/wlHB5"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867D91F3BA9;
	Sat,  7 Jun 2025 12:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749300242; cv=none; b=Ru3ip639W37lHu1PGxDHZ555FfLEayc7HXRPqqhEHKoq/1kPXWcIAtRsYtqfrHLybreIqNiA6tYwY5KW2sdpKBp2u9kTWghKXkCPTqSC5ZtP0jNiipZxMebtv1plzmBsJjU6VU4ZvmuOj0xtn52hG8JvUGpZFiemNBY1/2FN69Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749300242; c=relaxed/simple;
	bh=7v35t10rT/x0ifFckUPG4qEzeCS6Bhh0PhcL4WRVQzU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YH2A352xQB0qR5fbJgQuFufA+fT/LDGOKE2XNR0WUYSiHA/RqC6/kYFMqfOqaA+RTniPCcVu0FUS+M0n5NolAx639wzC/QYN+hfq11PRzrBWn5Xs3R0y+idah6Tc116HPsTU0FE6I+K41FhVg6LUCuEUYvkNieBKxlP4Gt2BDuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=DQMNnAnO; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Ci/wlHB5; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 7531911400E1;
	Sat,  7 Jun 2025 08:43:59 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sat, 07 Jun 2025 08:43:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1749300239; x=1749386639; bh=LE
	Tek6F2yQhSW75x3yTlSBCuK2Zv1tv+UzjZpfyMlbE=; b=DQMNnAnO02DxakMxvw
	Vaw6q783f8L96uMiaoYJvwCu2/e8ofpRyawHLwei6OOOZwlWFfXujMAX/nETX9j3
	MiV3Lo5cwac/55h5CPHj2GGKCs/ZlU59zljhM4RbAklvvZaa8HnXocwxISVrpsYg
	Tm00bI0g+58+3uO9awVRna1wVZ4unQuiHcZP1hXdCYPKX3gydW5v/bpsUqjM5qSW
	VCQcu1yo0rQvWDcQlkMTpvbqyWQ6bHkk1lLAE1Uk6Kz0O8xJB+iNOyaN2TSE6kGJ
	pkkLuO/71nJwZvptI3Gq1OxKAH2K8t4seVKhsCorVzZJC0sVZS22RGhARmdCixKD
	Ar7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1749300239; x=1749386639; bh=LETek6F2yQhSW75x3yTlSBCuK2Zv
	1tv+UzjZpfyMlbE=; b=Ci/wlHB5k176kZj8vqmSNFjUxxdZGvKnljF1bNMXWjVI
	XnIf1v5w56YkCyp3qpfAzyxugfPoDEOh6adkTx2HUGyVgil5sm4q2bUbrSJG0nxA
	0O6dHNeYbeUzU277mWc76sh3tGzc5judJg0vpkH1eYx0s75idig39mrVft45DuJS
	goeXijr+wfzXYoK5za34FHjzuIIc2W9iT4nIP6rKJ19gxT9y3O+s7imCBrksLOhf
	rGOo8JjsLcPSpVVZUAWZ1batleh7WyZ7nc7lQsgx3oRL5oBhcy+kP+ZDXrQHGhYP
	v/KCYGJlWz9QbczAJ/PUzdj7Pq8ldUWUMo4wg8nbMQ==
X-ME-Sender: <xms:DjREaPQZIGVjD67s6Rb4RiRRUCCE7XqE7DDsOTmxICxUK3WDR7BGAQ>
    <xme:DjREaAxh4rLZWX-BPmYi01AK5sEFUUhW1ZUmZZzo3REUVcRpMokkDep8q4IJiNw1d
    N0FCsJMoKJ7Gw72xBk>
X-ME-Received: <xmr:DjREaE1yBGRXIdPtG6bM7_-KDdp1_YARhf-XepZ7-2xkzD56byud8t8v1sFkXA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdeiheegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephfffufggtgfgkffvvefosehtjeertdertdejnecu
    hfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgoh
    grthdrtghomheqnecuggftrfgrthhtvghrnhephfffgeejgfejieeugffgudegvdekffev
    geeuteetgeejveeiteeivedvffehlefgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrgh
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgr
    gihunhdrhigrnhhgsehflhihghhorghtrdgtohhmpdhnsggprhgtphhtthhopeeipdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghr
    rdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehsthgrsghlvgeskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtohepmhgrtghrohesohhrtggrmhdrmhgvrdhukhdprhgtphhtthhopeht
    shgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtoheplhhinh
    hugidqmhhiphhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhirgig
    uhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:DjREaPBEdf64GvtKXChu6-Mem2o_h1FxiNXQIH7s7BEAVYCOHK-Trw>
    <xmx:DjREaIi-YZ0M9a3rsMmnD9J8UC7C010a2I40RlcqNBR89_R4VIZ9lA>
    <xmx:DjREaDrsEur5cl5-2q4avuj7-B4aNQrFa6K6n2cArdZPB1Wz0S2RYg>
    <xmx:DjREaDhCYC7KQ106zdfnZEwmNQOjT6yiwCMR28sFQHEdRh0Ajn2FtA>
    <xmx:DzREaMnfb6Zs-287xe6hYlLleZ9ms7D5G9HiEnA3Ot1hT52MjxZW0IDi>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 7 Jun 2025 08:43:58 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sat, 07 Jun 2025 13:43:56 +0100
Subject: [PATCH v2] MIPS: mm: tlb-r4k: Uniquify TLB entries on init
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250607-tlb-fix-v2-1-6751eccd86f1@flygoat.com>
X-B4-Tracking: v=1; b=H4sIAAs0RGgC/2WMSw7CIBQAr9K8tRggfNSV9zBdAD5akloMEGLTc
 HexW5czmcwOGVPADLdhh4Q15BDXDvw0gJvNOiEJz87AKZdUUUnKYokPHyL1xRqnLUqhoNfvhF0
 fp8fYeQ65xLQd48p+9v9RGWFEGC+uyjNtub/7ZZuiKWcXXzC21r4qNXlioAAAAA==
X-Change-ID: 20250605-tlb-fix-578bac7be546
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.2

Hardware or bootloader will initialize TLB entries to any value, which
may collide with kernel's UNIQUE_ENTRYHI value. On MIPS microAptiv/M5150
family of cores this will trigger machine check exception and cause boot
failure. On M5150 simulation this could happen 7 times out of 1000 boots.

Replace local_flush_tlb_all() with r4k_tlb_uniquify() which probes each
TLB ENTRIHI unique value for collisions before it's written, and in case
of collision try a different ASID.

Cc: stable@kernel.org
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
Changes in v2:
- Cycle ASID instead of ENTRYHI index in case of collison.
- Avoid int over flow UB (Maciej)
- Link to v1: https://lore.kernel.org/r/20250605-tlb-fix-v1-1-4af496f17b2f@flygoat.com
---
 arch/mips/mm/tlb-r4k.c | 56 +++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/arch/mips/mm/tlb-r4k.c b/arch/mips/mm/tlb-r4k.c
index 76f3b9c0a9f0ce60c42e4a9ea8025e1283678bd1..347126dc010dd59904820d9d9e34cdeeb011832f 100644
--- a/arch/mips/mm/tlb-r4k.c
+++ b/arch/mips/mm/tlb-r4k.c
@@ -508,6 +508,60 @@ static int __init set_ntlb(char *str)
 
 __setup("ntlb=", set_ntlb);
 
+/* Initialise all TLB entries with unique values */
+static void r4k_tlb_uniquify(void)
+{
+	int entry = num_wired_entries();
+
+	htw_stop();
+	write_c0_entrylo0(0);
+	write_c0_entrylo1(0);
+
+	while (entry < current_cpu_data.tlbsize) {
+		unsigned long asid_mask = cpu_asid_mask(&current_cpu_data);
+		unsigned long asid = 0;
+		int idx;
+
+		/* Skip wired MMID to make ginvt_mmid work */
+		if (cpu_has_mmid)
+			asid = MMID_KERNEL_WIRED + 1;
+
+		/* Check for match before using UNIQUE_ENTRYHI */
+		do {
+			if (cpu_has_mmid) {
+				write_c0_memorymapid(asid);
+				write_c0_entryhi(UNIQUE_ENTRYHI(entry));
+			} else {
+				write_c0_entryhi(UNIQUE_ENTRYHI(entry) | asid);
+			}
+			mtc0_tlbw_hazard();
+			tlb_probe();
+			tlb_probe_hazard();
+			idx = read_c0_index();
+			/* No match or match is on current entry */
+			if (idx < 0 || idx == entry)
+				break;
+			/*
+			 * If we hit a match, we need to try again with
+			 * a different ASID.
+			 */
+			asid++;
+		} while (asid < asid_mask);
+
+		if (idx >= 0 && idx != entry)
+			panic("Unable to uniquify TLB entry %d", idx);
+
+		write_c0_index(entry);
+		mtc0_tlbw_hazard();
+		tlb_write_indexed();
+		entry++;
+	}
+
+	tlbw_use_hazard();
+	htw_start();
+	flush_micro_tlb();
+}
+
 /*
  * Configure TLB (for init or after a CPU has been powered off).
  */
@@ -547,7 +601,7 @@ static void r4k_tlb_configure(void)
 	temp_tlb_entry = current_cpu_data.tlbsize - 1;
 
 	/* From this point on the ARC firmware is dead.	 */
-	local_flush_tlb_all();
+	r4k_tlb_uniquify();
 
 	/* Did I tell you that ARC SUCKS?  */
 }

---
base-commit: 911483b25612c8bc32a706ba940738cc43299496
change-id: 20250605-tlb-fix-578bac7be546

Best regards,
-- 
Jiaxun Yang <jiaxun.yang@flygoat.com>


