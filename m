Return-Path: <linux-mips+bounces-5404-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D123F970204
	for <lists+linux-mips@lfdr.de>; Sat,  7 Sep 2024 13:49:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CE081F21560
	for <lists+linux-mips@lfdr.de>; Sat,  7 Sep 2024 11:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7807D15C144;
	Sat,  7 Sep 2024 11:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="YmcjgUmj";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="DHLNQ2cO"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA5415957E;
	Sat,  7 Sep 2024 11:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725709708; cv=none; b=qv0CjMmHw0QbvhqKVr030Oeb5/4+dM5zAA/CnnOQ0es6uFnTxid936mQhga89QUpRu+Su3uPgeVeyvrolyrpCqR+pHScFZe5ih9DAahhM65Toqymzc70XakCPm25niXD9IPx7tzaixiu3Wcve8ihRv7/L3NPlIDvmGfTIJdoHRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725709708; c=relaxed/simple;
	bh=ErvuYehZlH7OfBsYVUKd73rir6ScJ5aBTq7g7ZdVsaE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GxHOgbZ0PWDPD5Z2v5S2RNT16K6LMcfuiEOiSDGIzMxbMwddMfmfXUlt6SeRaAd6Io0YgzRqH9PG7/NZs7nRc08QQEtMX+SDJRpBWwga8HMVOSWrzry4XWV7X8lLB1M/G6I+aYDH+6jlzbyhqzvbE5Z/knim/i1AmLDqnnUzC1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=YmcjgUmj; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=DHLNQ2cO; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 3852711403A8;
	Sat,  7 Sep 2024 07:48:26 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Sat, 07 Sep 2024 07:48:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1725709706;
	 x=1725796106; bh=TLhrQlpte+h4C4JBu2pe373WSb7OWOLjGh/btfBRXrQ=; b=
	YmcjgUmjhLARICCAzJ6FF9MlKNKhaYkkVCgSgXAJjE500bcd2k5fYpK09jC93WEL
	vB5ZBPwXJSKEXmf0aIKmwzgccd9YXA87P2Ny7GMbhN4DTvlJh6/Bmpdh6wpDQTdd
	BW+2+zzFlYPuY4nbwp7AyROENXYqyN/nWz9dWcOpqPNRIon9WAYwIecWPgcZeaC2
	jsXp5wy38Kxl/EaqcamIKQ1Zvv2DlaVaO54MhxfbhWncBqSKcp+T6WDH33KbPqFl
	6w839rhjpP4MP9XmGwhptEFVlL3vzO04hwDpTHFlLHlYFoz8snSGtpoRtU2g9vdA
	qgatRj471Jcc26OMNjKPYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725709706; x=
	1725796106; bh=TLhrQlpte+h4C4JBu2pe373WSb7OWOLjGh/btfBRXrQ=; b=D
	HLNQ2cOk2VinqVLuRcywaz1xB/3Yp0V9fuU+SqmDJ0ht0SK5f5bw96zXsyDmWkir
	OvBsKB30izMOwkV5jHx+z0CchHu8k9L0VOmImHWV/sxbGj6DHjPCU/+Hdrum4Jp0
	2b2bsD5D44sfaEx4/feSL55MTJ8PDdgbWO7uvjPz9oBB+jxZpNQLNyuGAf6qoQaM
	TxMFqm36+yb6HOmUw3yLLVDG+z/ZR56uc2QYOM7wPcETEGqtFCbmNI3y+BTYrWC0
	MepfviB7J9SgnKP1+fXkTSuGl7baMIMXs0KdPKTfnl8S9OSGAPMROmwwGezDDNBd
	AlHKn1/fDblvA+ydaNbKg==
X-ME-Sender: <xms:ij3cZipt5TF2yfSIPeNpq3N06LNZOCNb1fjxYs0MCIZG2-VpbUuR7w>
    <xme:ij3cZgpTcbVhkFbSFFBY4s9BxIqMdZ_C-yOqv85SjOpXna5hSH7kDMF7C1MxxmObg
    3UURJzn3DjNTQC7ctA>
X-ME-Received: <xmr:ij3cZnOvc0IBUM5Y5ORmmiP_b2jrmCEgTa4J8HVj4Lw5qs2E3niU9iQHNhWChLxuDn8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeifedggeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdej
    necuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffek
    gedugefhtdduudeghfeuveegffegudekjeelnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdr
    tghomhdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhuthdprhgtphhtth
    hopegstghmqdhkvghrnhgvlhdqfhgvvggusggrtghkqdhlihhsthessghrohgruggtohhm
    rdgtohhmpdhrtghpthhtohepthhglhigsehlihhnuhhtrhhonhhigidruggvpdhrtghpth
    htohepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdprhgtphhtthhopegt
    hhgvnhhhuhgrtggriheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmh
    hiphhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgruhhlsghurhht
    ohhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehflhhorhhirghnrdhfrghinhgvlh
    hlihessghrohgruggtohhmrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghl
    sehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfhgrnhgtvghrrdhlrghntg
    gvrhesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:ij3cZh5yyvcm8m1zQlOEVb44bqDPXSVfimXKu-P8J7NN4STMpqp90w>
    <xmx:ij3cZh5PpdcsDDKR0I8Ve1qVoHBqY3TRbQ4uDNGuImzcEEviV9V-6w>
    <xmx:ij3cZhhABstnWKkG92wXP9mRo1HpVaZgRa4la6RwrXm4CF0DM6Nd1A>
    <xmx:ij3cZr5r_Gfrnu4T3l4idabMqNn1u8fKfiJ1zV2OlrWj-Jhaom9mHg>
    <xmx:ij3cZuzklbVWrHz2dRv38R2jcHxe9eTHq0hXwNFNVjtNkNYcsCy0G7es>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 7 Sep 2024 07:48:24 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sat, 07 Sep 2024 12:48:11 +0100
Subject: [PATCH v4 05/10] MIPS: smp: Implement IPI stats
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240907-b4-mips-ipi-improvements-v4-5-ac288f9aff0b@flygoat.com>
References: <20240907-b4-mips-ipi-improvements-v4-0-ac288f9aff0b@flygoat.com>
In-Reply-To: <20240907-b4-mips-ipi-improvements-v4-0-ac288f9aff0b@flygoat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Huacai Chen <chenhuacai@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Serge Semin <fancer.lancer@gmail.com>, Paul Burton <paulburton@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2722;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=ErvuYehZlH7OfBsYVUKd73rir6ScJ5aBTq7g7ZdVsaE=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrQ7tnXCP/rsmm77V26ad31q9O+s1bFLtBYvWi5zwL3kA
 etZZ5cnHaUsDGJcDLJiiiwhAkp9GxovLrj+IOsPzBxWJpAhDFycAjARp4OMDPf1732ySI11+7d+
 l7uTlOR/r4AfT6ouxbe51bHoFiROO8TwV956gWyPruyVhd2BImqaD0N3fPphx8UkGegbbn773/3
 /3AA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Show IPI statistics in arch_show_interrupts to help users
analysis IPI performance.

Tested-by: Serge Semin <fancer.lancer@gmail.com>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/asm/ipi.h |  9 +++++++++
 arch/mips/kernel/irq.c      |  4 ++++
 arch/mips/kernel/smp.c      | 13 +++++++++++++
 3 files changed, 26 insertions(+)

diff --git a/arch/mips/include/asm/ipi.h b/arch/mips/include/asm/ipi.h
index 7cac0f4ccf37..7d310012962f 100644
--- a/arch/mips/include/asm/ipi.h
+++ b/arch/mips/include/asm/ipi.h
@@ -36,6 +36,7 @@ void mips_smp_ipi_disable(void);
 extern bool mips_smp_ipi_have_virq_range(void);
 void mips_smp_ipi_set_irqdomain(struct irq_domain *d);
 extern void mips_smp_ipi_set_virq_range(int virq, int nr);
+extern void mips_smp_show_ipi_stats(struct seq_file *p, int prec);
 #else
 static inline void mips_smp_ipi_enable(void)
 {
@@ -44,6 +45,10 @@ static inline void mips_smp_ipi_enable(void)
 static inline void mips_smp_ipi_disable(void)
 {
 }
+
+static inline void mips_smp_show_ipi_stats(struct seq_file *p, int prec)
+{
+}
 #endif /* CONFIG_GENERIC_IRQ_IPI */
 #else
 static inline void mips_smp_ipi_set_virq_range(int virq, int nr)
@@ -58,5 +63,9 @@ static inline bool mips_smp_ipi_have_virq_range(void)
 {
 	return false;
 }
+
+static inline void mips_smp_show_ipi_stats(struct seq_file *p, int prec)
+{
+}
 #endif /* CONFIG_SMP */
 #endif
diff --git a/arch/mips/kernel/irq.c b/arch/mips/kernel/irq.c
index 5e11582fe308..c3ea8d80e0cb 100644
--- a/arch/mips/kernel/irq.c
+++ b/arch/mips/kernel/irq.c
@@ -26,6 +26,8 @@
 #include <linux/atomic.h>
 #include <linux/uaccess.h>
 
+#include <asm/ipi.h>
+
 void *irq_stack[NR_CPUS];
 
 /*
@@ -42,6 +44,8 @@ atomic_t irq_err_count;
 int arch_show_interrupts(struct seq_file *p, int prec)
 {
 	seq_printf(p, "%*s: %10u\n", prec, "ERR", atomic_read(&irq_err_count));
+	mips_smp_show_ipi_stats(p, prec);
+
 	return 0;
 }
 
diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
index 81ae65f21f73..aa02ca2e0fcf 100644
--- a/arch/mips/kernel/smp.c
+++ b/arch/mips/kernel/smp.c
@@ -243,6 +243,19 @@ void mips_smp_ipi_disable(void)
 		disable_percpu_irq(ipi_virqs[i]);
 }
 
+void mips_smp_show_ipi_stats(struct seq_file *p, int prec)
+{
+	unsigned int cpu, i;
+
+	for (i = 0; i < IPI_MAX; i++) {
+		seq_printf(p, "%*s%u:%s", prec - 1, "IPI", i,
+			   prec >= 4 ? " " : "");
+		for_each_online_cpu(cpu)
+			seq_printf(p, "%10u ", irq_desc_kstat_cpu(ipi_desc[i], cpu));
+		seq_printf(p, " %s\n", ipi_names[i]);
+	}
+}
+
 static void smp_ipi_init_one(unsigned int virq, const char *name,
 			     irq_handler_t handler)
 {

-- 
2.46.0


