Return-Path: <linux-mips+bounces-9159-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F1978ACED41
	for <lists+linux-mips@lfdr.de>; Thu,  5 Jun 2025 12:02:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DFBF3ABFAB
	for <lists+linux-mips@lfdr.de>; Thu,  5 Jun 2025 10:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4DFD1B9831;
	Thu,  5 Jun 2025 10:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="kMVAs/hi";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="njNKq3Xe"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC4D1FAC4D;
	Thu,  5 Jun 2025 10:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749117756; cv=none; b=Mk7L3IqKL08dK7JAoh/IWbFm4c/c3N1rUfsPi/nM3ehJe/a/Vn+WO9L6XrBg+GMwL2e5+kqRpRMSh0xkWf7lySwfJ0qzLphgJhwPIWQeWSZf90FUhmX3XvIIFoAfeTZ/uBoUJRYcMaPg9LT/hfNkExRZ7THJQivhJ3dM0Sjudd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749117756; c=relaxed/simple;
	bh=74r0HmVlWVXDmuzOZHupYV2ZI8xHFRWhMC5v6BeMrLw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=cuA/2eV4pZE+mIyKUZ7SpvjF/HkebXatzDMjCxKYaYBvf2zpomtX6yhUhxgvyULxHUd90LBOzw8seq8pwd6kbZbTS5NQMYCuIivGCvE4GJ6rvQtDNIUc1koCF12PSitpNL3bumBjCREtnGxANyazIUPJsXBAXoEQdCTrKURSZbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=kMVAs/hi; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=njNKq3Xe; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 69D09138033A;
	Thu,  5 Jun 2025 06:02:33 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Thu, 05 Jun 2025 06:02:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1749117753; x=1749204153; bh=2Q
	S3N2IlJsd2ScMAzCr4NN3lNuijFKCMGsZLhT+gYiU=; b=kMVAs/hi4jpgHz02Mr
	iU9WMI/IhL5lI00FGukJsPduaPjA9hsyYDCt3x6mhgdMJofjrT/tLpAntvewG7IT
	Z9pZGwgjK4cEilvvSveRtqmFnJDevO2kPuCLvkCBmQWPj+kWSpumfOw1ZZMaWFMD
	YVgbYb6vpBgkKelc214AIGRrNyvvZbljJDSUTTXn1XoEI58v99I8XwsSjR/v7sHs
	Rem+cSpNzWA2iSCn4xMzic3hBGKrcw1sZGwot+VMkBGieqMLo/DvthQokHH/l9lX
	THmBLPbpTguaF3UwJzuMh+gexzBYmiL+HPBUZ1NahE+myll1I1WmaDcKPfY9z3di
	VGDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1749117753; x=1749204153; bh=2QS3N2IlJsd2ScMAzCr4NN3lNuij
	FKCMGsZLhT+gYiU=; b=njNKq3XeiRQeLr1fdV099IoXd4TiPtav0remmDPUz8We
	Clo6GNHF/s11dTdBSSR4DdE3TNWKp2mCqREjWELFD5AOYuTIBgeUJLyQ985P1WsD
	cBat0b0loRS9yq+Li0uziiF1IZtsX/rNtb8WSwtIJZb80qo28Fne5iDizto+29yU
	fSmVOKE+Yu/ieBIG2CZU9gxKk0OXIL19UaBjYvL/euNaovfN3ykU6vQjd2DoGIV7
	kcGtKqm4gyS7FBMOrPoKuRgI8r27uo2NUReJz4p1D9UdUOJePa/JX872c3xIrJIg
	wtIjh185UPTt1WeuuX8EkQoYQM5MFiGdiHw9eORgIg==
X-ME-Sender: <xms:OGtBaMZYvrCyabB2obIIYcfGQZ656svSLDOsZEnTkybdaTxnzOnsvA>
    <xme:OGtBaHbMSxcDRwqptQnGlmhONcgRP9gTu-ZcDq9G1Zc9iEqQUnDbO6N75URSpCYh9
    bvnZYTbmQlMr_sRZPc>
X-ME-Received: <xmr:OGtBaG9qIM1RXaEac9jvVTzNP7Ui0bMIrwtqoD_3KphtK9DE9NbFHIDOLMAldw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdefgeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephfffufggtgfgkffvvefosehtjeertdertdejnecu
    hfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgoh
    grthdrtghomheqnecuggftrfgrthhtvghrnhepffetueegkedtgfejveeuvdfghfegtddv
    gfehudeghfegheetueduheduveejtefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtgho
    mhdpnhgspghrtghpthhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepsh
    htrggslhgvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmihhpshes
    vhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlh
    esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehtshgsohhgvghnugesrghl
    phhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtohepjhhirgiguhhnrdihrghnghesfh
    hlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:OGtBaGp3pBtUCGSYajp-9RwO00G78vP-hE3VMv-UYX8Br-KwCtexCA>
    <xmx:OGtBaHrYS8Zs1uw_FN05qvDpcAjhBlJGd4z6xm902BbtCTWNzWFzYg>
    <xmx:OGtBaERkJ3CWbH1j7YCRkQO4-muhPJHsc7HmdZ8rVWzq42FQX8jW3Q>
    <xmx:OGtBaHpaKP4gmjFBBY0HyMLBpbtbJC1BwDd9VWiSfj9GTLfMy2PHlw>
    <xmx:OWtBaI4dFB9-cb6gl75q32FKPMny7zyxmAIrRz-1cddug9o_Xxqw-oDk>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Jun 2025 06:02:31 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Thu, 05 Jun 2025 11:02:30 +0100
Subject: [PATCH] MIPS: mm: tlb-r4k: Uniquify TLB entries on init
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-tlb-fix-v1-1-4af496f17b2f@flygoat.com>
X-B4-Tracking: v=1; b=H4sIADZrQWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMwNT3ZKcJN20zApdU3OLpMRk86RUUxMzJaDqgqJUoDDYpOjY2loA78W
 0d1kAAAA=
X-Change-ID: 20250605-tlb-fix-578bac7be546
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.2

Hardware or bootloader will initialize TLB entries to any value, which
may collide with kernel's UNIQUE_ENTRYHI value. On MIPS microAptiv/M5150
family of cores this will trigger machine check exception and cause boot
failure. On M5150 simulation this could happen 7 times out of 1000 boots.

Replace local_flush_tlb_all() with r4k_tlb_uniquify() which probes each
TLB ENTRIHI unique value for collisions before it's written and overwrites
any conflicting entries with safe values before initializing the kernel's
UNIQUE_ENTRYHI pattern.

Cc: stable@kernel.org
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/mm/tlb-r4k.c | 78 +++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 77 insertions(+), 1 deletion(-)

diff --git a/arch/mips/mm/tlb-r4k.c b/arch/mips/mm/tlb-r4k.c
index 76f3b9c0a9f0ce60c42e4a9ea8025e1283678bd1..6467d74d2949e98bcc35ab7c368b3c2ea342a6d3 100644
--- a/arch/mips/mm/tlb-r4k.c
+++ b/arch/mips/mm/tlb-r4k.c
@@ -508,6 +508,82 @@ static int __init set_ntlb(char *str)
 
 __setup("ntlb=", set_ntlb);
 
+/*
+ * This is used to set an absolutely safe entryhi value that will not
+ * collide with any existing TLB entries as well as other UNIQUE_ENTRYHI
+ * values.
+ */
+static unsigned long r4k_safe_entryhi(void)
+{
+	int entry = current_cpu_data.tlbsize;
+	int old_index;
+
+	old_index = read_c0_index();
+	while (entry >= 0) {
+		int idx;
+		unsigned long entryhi = UNIQUE_ENTRYHI(entry);
+
+		write_c0_entryhi(entryhi);
+		mtc0_tlbw_hazard();
+		tlb_probe();
+		tlb_probe_hazard();
+		idx = read_c0_index();
+		if (idx < 0) {
+			/* Unused value found */
+			write_c0_index(old_index);
+			mtc0_tlbw_hazard();
+			return entryhi;
+		}
+		entry++;
+	}
+
+	panic("No safe TLB EntryHi value found");
+	return 0;
+}
+
+/*
+ * Initialize all TLB entries with unique values.
+ */
+static void r4k_tlb_uniquify(void)
+{
+	int entry;
+
+	entry = num_wired_entries();
+
+	htw_stop();
+	write_c0_entrylo0(0);
+	write_c0_entrylo1(0);
+	while (entry < current_cpu_data.tlbsize) {
+		unsigned long entryhi;
+		int collision_idx;
+
+		entryhi = UNIQUE_ENTRYHI(entry);
+		write_c0_entryhi(entryhi);
+		mtc0_tlbw_hazard();
+		tlb_probe();
+		tlb_probe_hazard();
+
+		/* Check for possible collision */
+		collision_idx = read_c0_index();
+		if (collision_idx >= 0 && collision_idx != entry) {
+			/* Override collision entry with a safe value */
+			r4k_safe_entryhi();
+			mtc0_tlbw_hazard();
+			tlb_write_indexed();
+			tlbw_use_hazard();
+			/* Recover correputed entryhi */
+			write_c0_entryhi(entryhi);
+		}
+
+		write_c0_index(entry);
+		mtc0_tlbw_hazard();
+		tlb_write_indexed();
+		entry++;
+	}
+	tlbw_use_hazard();
+	htw_start();
+}
+
 /*
  * Configure TLB (for init or after a CPU has been powered off).
  */
@@ -547,7 +623,7 @@ static void r4k_tlb_configure(void)
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


