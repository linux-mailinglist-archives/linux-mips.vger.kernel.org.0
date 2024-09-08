Return-Path: <linux-mips+bounces-5424-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1F197067A
	for <lists+linux-mips@lfdr.de>; Sun,  8 Sep 2024 12:21:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7801E1C20EB1
	for <lists+linux-mips@lfdr.de>; Sun,  8 Sep 2024 10:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA2E4156668;
	Sun,  8 Sep 2024 10:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="V/heohLR";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="irVLNjke"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0AC1537DD;
	Sun,  8 Sep 2024 10:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725790831; cv=none; b=ZpRYRzUYy+pzKqkkvpGb5xXluVFS+LdJHUk8HK6uksZamfQ5p91NOfaZWMPDpSsRGmpcsawKcS8xPu9wdJBNq+lULkq/Ewo18MLu+m2Wr3pQrkeStdwQDJUmppmorjGWTnhd04FhSe4Z2po6GQ2DhDDZpnyInwt0IZ4do4x7aEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725790831; c=relaxed/simple;
	bh=6W7V7EEEomFvzx7zP87p4zVKfdbX/dpvLnCVn/vqrn4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EikhkWRUuPPF56ZHleqzdCHSp2SaM0XmoXS7+S/iCwgSNaQ8gXBPU5fDBSeNrLHxtw7VbRkoKkd+NXreq7WNaWmP3M7hCp0b7pdCqBB5XaZrXiEMQ5FzLGcrzwM+F49Xz3ZMhT8Xo8ci6aMZzg8Jabz+tKKdv/wwiLmYkMiTSJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=V/heohLR; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=irVLNjke; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 89DD813802F0;
	Sun,  8 Sep 2024 06:20:29 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Sun, 08 Sep 2024 06:20:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1725790829;
	 x=1725877229; bh=E2c5mVns5PcirEWPdUpAMQUUGnSXml2150Qh3uYfD1M=; b=
	V/heohLRtrGIRROqKpTrXxXBBezlaycunjd/5tsu4THdffQd6e+r8N8/O+y8XAJD
	XJdzIj1pdU98nhDK0+ZatKGlvDOH7ECl3aTrojv/LIHb2q1eij2rB5LqBzNDLUfn
	nnW7deriGQ9HtlAjRttVJRqWt+C+t8O9SdrY2ZLyj4fGFlubmQyB+IaWV1YJGPUt
	KJVZBJfTRueZR6Tsy7X6RbuRVGbWsHiNbs/Z9ZwbIHeDWj63KKtP6A2WbKHIewhY
	bXU8nAx0KzwKQUU/R37YCoV+1y7VeQvlLIwjAssswzXk8pX5lWSgev/lBr1YYAaH
	OPgKNUM6G3uVPYIoX6R8fA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725790829; x=
	1725877229; bh=E2c5mVns5PcirEWPdUpAMQUUGnSXml2150Qh3uYfD1M=; b=i
	rVLNjke5VOSagr0hgPJ/uy50G/RqRa/+boZqvE0HUzsuYJtgnCd26p8/kOtof39z
	w0G1HAMgiKXgTy7/xrW2IcGnRWBZdI1rydEgL4WX8dFFvPt4R0pvzXrxc7GfKdh/
	3rApPwZr9UyFeJ/y/MtLj/kFIVubllqFMA+VYiUbLOtlUnvqYrlFb3Vyw38c0coY
	uPxgpsyFovPSO9G2jvhpkG6yGzruWg7V3PFcnfcLdrHi7eWUNDIMfOxGBFZKkGSB
	B+fRt4IhjSwIavV71ClPw7a9CuxIe09htNHCQxLhbbK/R4TaHHxV4rTgtYn1MaD4
	DsAGlt3VIAGdRGox/G7BQ==
X-ME-Sender: <xms:bXrdZoYGP4GDwnJKH49SyXr9dZO_lHspumGKkWNKkj8YX3foMG1aNQ>
    <xme:bXrdZjZHMCekv3M9Tww7PbDg0xVRzmOCQAiKTcBkEjaaBogV_1r6ekkpH_vO9lw1Q
    1-mWiLI9m704mns27w>
X-ME-Received: <xmr:bXrdZi8usYBVdH4qy_tCwST6wyh1KnMKsHCJ1U4mGz_hKxAYo6PTEvq_Bia0YhG1Xh8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeihedgvdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdej
    necuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffek
    gedugefhtdduudeghfeuveegffegudekjeelnecuvehluhhsthgvrhfuihiivgepudenuc
    frrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdr
    tghomhdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhuthdprhgtphhtth
    hopehfrghntggvrhdrlhgrnhgtvghrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepjhhi
    rgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdprhgtphhtthhopehlihhnuhigqd
    hkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehflhhorhhi
    rghnrdhfrghinhgvlhhlihessghrohgruggtohhmrdgtohhmpdhrtghpthhtohepphgruh
    hlsghurhhtohhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmihhp
    shesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehtshgsohhgvghnugesrg
    hlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtohepsggtmhdqkhgvrhhnvghlqdhf
    vggvuggsrggtkhdqlhhishhtsegsrhhorggutghomhdrtghomhdprhgtphhtthhopegthh
    gvnhhhuhgrtggriheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:bXrdZipQJpVEvzDaBIwcd6Q-ek_1aPf5KbZ1O9SZQiMJCkDLOJykqw>
    <xmx:bXrdZjqiUXxun3wXhW-fOrXLwTu4TU2tOqUk5hjdMJpJhBtm0JD-PQ>
    <xmx:bXrdZgTL4KD17o9GfrtpMoMwtm9CB87tarsive7uQL6AaQTWHVyK5Q>
    <xmx:bXrdZjqaaYitJsaPuwhth8aVhxsjqG0_o2DwGH4w9p5D8DyT3hw8gQ>
    <xmx:bXrdZgg3rQY_fWJllGJ1hdZVmdKSYafjkJP7MKfGtxQCe7p0RZeCAsfg>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 Sep 2024 06:20:28 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sun, 08 Sep 2024 11:20:19 +0100
Subject: [PATCH v5 08/10] MIPS: GIC: Implement get_sw_int hook
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240908-b4-mips-ipi-improvements-v5-8-be8617dd2e53@flygoat.com>
References: <20240908-b4-mips-ipi-improvements-v5-0-be8617dd2e53@flygoat.com>
In-Reply-To: <20240908-b4-mips-ipi-improvements-v5-0-be8617dd2e53@flygoat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Huacai Chen <chenhuacai@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Serge Semin <fancer.lancer@gmail.com>, Paul Burton <paulburton@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2526;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=6W7V7EEEomFvzx7zP87p4zVKfdbX/dpvLnCVn/vqrn4=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrS7VQnX5rIHP/HczHez01DC89VRP+t/L7r1HlcnB5RYh
 CVEpDh1lLIwiHExyIopsoQIKPVtaLy44PqDrD8wc1iZQIYwcHEKwET4TjH8j9kuxrzN70YzS8vT
 zRIeS9fEBc2seHokwuqOSsHBWw//VzIyvFJjOLH57cFVTeaFZZOlRF6ZcyrH9N1dulB1zTeuZHN
 WFgA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

SW0 and SW1 interrupts are routed through GIC in EIC
mode, implement get_sw_int hook for GIC and generic platform
to create IRQ mapping for SW0 and SW1 in such mode.

Tested-by: Serge Semin <fancer.lancer@gmail.com>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/generic/irq.c          | 15 +++++++++++++++
 arch/mips/include/asm/mips-gic.h | 10 ++++++++++
 drivers/irqchip/irq-mips-gic.c   | 15 +++++++++++++++
 3 files changed, 40 insertions(+)

diff --git a/arch/mips/generic/irq.c b/arch/mips/generic/irq.c
index 933119262943..bc3599a76014 100644
--- a/arch/mips/generic/irq.c
+++ b/arch/mips/generic/irq.c
@@ -11,6 +11,7 @@
 #include <linux/types.h>
 
 #include <asm/irq.h>
+#include <asm/irq_cpu.h>
 #include <asm/mips-cps.h>
 #include <asm/time.h>
 
@@ -59,3 +60,17 @@ unsigned int get_c0_compare_int(void)
 
 	return mips_cpu_timer_irq;
 }
+
+int get_mips_sw_int(int hwint)
+{
+	int mips_sw_int_irq;
+
+	if (mips_gic_present())
+		mips_sw_int_irq = gic_get_sw_int(hwint);
+	else if (cpu_has_veic)
+		panic("Unimplemented!");
+	else
+		mips_sw_int_irq = mips_cpu_get_sw_int(hwint);
+
+	return mips_sw_int_irq;
+}
diff --git a/arch/mips/include/asm/mips-gic.h b/arch/mips/include/asm/mips-gic.h
index fd9da5e3beaa..3e9d1b252500 100644
--- a/arch/mips/include/asm/mips-gic.h
+++ b/arch/mips/include/asm/mips-gic.h
@@ -388,4 +388,14 @@ extern int gic_get_c0_perfcount_int(void);
  */
 extern int gic_get_c0_fdc_int(void);
 
+/**
+ * gic_get_sw_int() - Return software interrupt virq
+ *
+ * Determine the virq number to use for SWINT0 or SWINT1 interrupts,
+ * which may be routed via the GIC.
+ *
+ * Returns the virq number or a negative error number.
+ */
+extern int gic_get_sw_int(int hwirq);
+
 #endif /* __MIPS_ASM_MIPS_CPS_H__ */
diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index 4c36e10ee2d3..7fa567677c00 100644
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -152,6 +152,21 @@ int gic_get_c0_fdc_int(void)
 				  GIC_LOCAL_TO_HWIRQ(GIC_LOCAL_INT_FDC));
 }
 
+int gic_get_sw_int(int hwint)
+{
+	int local_irq;
+
+	WARN_ON(hwint > 1);
+
+	local_irq = GIC_LOCAL_INT_SWINT0 + hwint;
+
+	if (!gic_local_irq_is_routable(local_irq))
+		return MIPS_CPU_IRQ_BASE + hwint;
+
+	return irq_create_mapping(gic_irq_domain,
+				  GIC_LOCAL_TO_HWIRQ(local_irq));
+}
+
 static void gic_handle_shared_int(bool chained)
 {
 	unsigned int intr;

-- 
2.46.0


