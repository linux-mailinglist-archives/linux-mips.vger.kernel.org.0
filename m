Return-Path: <linux-mips+bounces-5554-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AED3977320
	for <lists+linux-mips@lfdr.de>; Thu, 12 Sep 2024 22:57:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1878B1F24EB8
	for <lists+linux-mips@lfdr.de>; Thu, 12 Sep 2024 20:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A0C01C2DCE;
	Thu, 12 Sep 2024 20:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="2MfDGMHn";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="pyjWPUIi"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D361C245D;
	Thu, 12 Sep 2024 20:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726174590; cv=none; b=P7Buanr/+UhmIHd5VatlLXVQIEywRt7d2t8j9ZZySbUEEKZIIwKpS16xg2UsuBkUNyWhXUJpLePwv6GlDeTHq4R7fOPYp3E6OR4vl731nwH3SHkIiOGlGW7ZHzcTH9NtcB6e1jgh71xIwwG+nVFOG4aHOrPWfIL/B5z9mJQthrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726174590; c=relaxed/simple;
	bh=iYnKOBTfb6berLnKbvxKfH/UmsRbcZ0F+rtGXZ9rlEQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W96ZtMC9WzPzGVof4/OPRdNVGk+v6YCBa4QxICptPw0OA4EGpZ8q+MYAmZy2NXI42ipAHvvlWj7b1pfr8yjJ4Md+Ypy0ADtpFBdIN8h2b9Z7c7c6/0eAcxjvVImyjUuR+dj4MCzkormBrAuK9/1ZHWKW9blimKLiNwAchuetBfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=2MfDGMHn; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=pyjWPUIi; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 06FE51140467;
	Thu, 12 Sep 2024 16:56:28 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Thu, 12 Sep 2024 16:56:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1726174588;
	 x=1726260988; bh=zkFVLlmu9bscZ898n3aoUWbynIBhYXM3DcaMTL3oK1Y=; b=
	2MfDGMHn9FetA4tsUqITs+zXnvq/sKD8N656vB7cxB94GS7j6caQa4l+rb7+HLSJ
	EEdn80yMhFodMwId7eOXHRM7BCpRPmt81qoWw81WesHSE4CKQniRu12U7c1u4WP8
	6gwxYeWnX5WyuV82ynqHQr3kU0JQ86qOoavxOP4QuaBbpeprvMgFfaBVw7gS5M0N
	08J2thhvSjWBdaHg3iF+yAVkDpVj6pr7Ea+JU2prgdXPS830tScsQfDKkfLM/Si1
	RslF9M2NnikE6L3vpw0hyvABUYI+9dUGhG3Kd2lkMUT+4VnsmKXV2owKDFr8oVld
	SXsHZDVzPnNcgh1YJ7Tqxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1726174588; x=
	1726260988; bh=zkFVLlmu9bscZ898n3aoUWbynIBhYXM3DcaMTL3oK1Y=; b=p
	yjWPUIiTXTbkDgiAIlpSf09mdIlWXq4f8us7cvYmdWAATnJS6bcsgz3xgjEAxrrm
	0dU/n6ZgPIQjzYAsGj1kELpXoqJc89sv3nG0guf73EAcFbYFFU3A4nBm9lpB/WnS
	KFfe6iXg9EmX1ez+PgvJHRk0mjBWLh6So/X6IEsoN7i0sfSJAtklXi3I6Lrh7Y8x
	5s9R26miCGbPDRR4wVj87Zyzm6qdL87ZET3BZf8nYfNgsi++M/i4qf4LOhz31am9
	22wfPHWZ/jLBjO1ez7v4MPd8VkVOnjo7xOignlEOlEbLzuAgr9+1QdRHl+0V2wiv
	8AdHgFdQbLvIvf2cOaRoA==
X-ME-Sender: <xms:e1XjZvQR1_Rp_mBZoM42lyjFX-GbNVteQvI31cMnBoEjhJ71LRElcQ>
    <xme:e1XjZgz5meZFfVcnYdl10cy3wmztijFv0f837Tx7lkUR9BQ_2buZ3nGzfNZADONy8
    2O4xfJCANdZEONIkXE>
X-ME-Received: <xmr:e1XjZk0qwHutb-uOHY_ydlDGQyFQiXZs1oA5Qc7yCCB1FR246J6RiMFLiVTDLkBaxQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejfedgudehiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredt
    jeenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflh
    ihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpefgueefueevffefudefueffffeg
    ieevveeuhfejjefghffhgeetvddtteejgeffkeenucffohhmrghinheprhgvlhhotggrth
    gvpghkvghrnhgvlhdrshgsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
    rghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdpnhgspg
    hrtghpthhtohepuddvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhig
    qdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehtghhlgi
    eslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopehlohhonhhgrghrtghhsehlihhs
    thhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidqphhmsehvghgvrhdrkh
    gvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhvmhesvhhgvghrrdhkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpd
    hrtghpthhtohepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdprhgtphht
    thhopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghhvghnhhhurg
    gtrghisehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:e1XjZvCcsmB7suoWni6lHrDEbd2LtLBK0d1eqTonFkhkVSVemjtJFg>
    <xmx:e1XjZog2kK5UPU8fBWMJ6rhEOqFvuwfiC4UHbYxi9RHHeJESAtW_FA>
    <xmx:e1XjZjoErJqCG_xbdBvN8-SKvmJdpClO2HHMsiP-CgbAgPsjXrTO7A>
    <xmx:e1XjZjh6HwsAvFuEeBefQkhRluzVerMpvrKJI2IVxl_XtU7KvDVe-g>
    <xmx:e1XjZpZ4_hm5jtDpQwPkX6HednAG1SlRqn3K6QTTTfHhUziXnxH7HXOb>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Sep 2024 16:56:26 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Thu, 12 Sep 2024 21:55:56 +0100
Subject: [PATCH v2 3/4] LoongArch: Extract IOCSR definitions to standalone
 header
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240912-iocsr-v2-3-e88f75b37da4@flygoat.com>
References: <20240912-iocsr-v2-0-e88f75b37da4@flygoat.com>
In-Reply-To: <20240912-iocsr-v2-0-e88f75b37da4@flygoat.com>
To: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=18000;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=iYnKOBTfb6berLnKbvxKfH/UmsRbcZ0F+rtGXZ9rlEQ=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrTHocWNIsG5V6/PzPzw9Q97W3Be79XddoIrxFMFFIoXx
 b/KEJnQUcrCIMbFICumyBIioNS3ofHigusPsv7AzGFlAhnCwMUpABO58I6R4amy4rSL3hImTAdZ
 rjzY93GzZnf1NAvzS3lTHZscxOf/S2T4Z7vo/eO8X+z7zm/iDFPz4JZOWuK0wT2B8+vsiDrX2ed
 dOAA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

As IOCSR is not a part of architecture specification, it is not
really appropriate to define those stuff in loongarch.h.

Extract those definitions to include/linux/loongson/iocsr.h, so
that they can be shared with MIPS based Loongson systems as well.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 MAINTAINERS                             |   1 +
 arch/loongarch/include/asm/loongarch.h  |  90 --------------------------
 arch/loongarch/kernel/cpu-probe.c       |   7 +-
 arch/loongarch/kernel/relocate_kernel.S |   5 +-
 arch/loongarch/kernel/smp.c             |  23 +++----
 drivers/cpufreq/loongson3_cpufreq.c     |  11 ++--
 drivers/irqchip/irq-loongarch-avec.c    |   5 +-
 drivers/irqchip/irq-loongson-eiointc.c  |   5 +-
 include/linux/loongson/iocsr.h          | 110 ++++++++++++++++++++++++++++++++
 9 files changed, 142 insertions(+), 115 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0a3d9e17295a..f0f4c427e9a3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13305,6 +13305,7 @@ F:	Documentation/translations/zh_CN/arch/loongarch/
 F:	arch/loongarch/
 F:	drivers/*/*loongarch*
 F:	drivers/cpufreq/loongson3_cpufreq.c
+F:	include/linux/loongson
 
 LOONGSON GPIO DRIVER
 M:	Yinbo Zhu <zhuyinbo@loongson.cn>
diff --git a/arch/loongarch/include/asm/loongarch.h b/arch/loongarch/include/asm/loongarch.h
index 23af28f00c3c..4ac228230720 100644
--- a/arch/loongarch/include/asm/loongarch.h
+++ b/arch/loongarch/include/asm/loongarch.h
@@ -1048,84 +1048,6 @@
 
 #define ESTATF_IP		0x00003fff
 
-#define LOONGARCH_IOCSR_FEATURES	0x8
-#define  IOCSRF_TEMP			BIT_ULL(0)
-#define  IOCSRF_NODECNT			BIT_ULL(1)
-#define  IOCSRF_MSI			BIT_ULL(2)
-#define  IOCSRF_EXTIOI			BIT_ULL(3)
-#define  IOCSRF_CSRIPI			BIT_ULL(4)
-#define  IOCSRF_FREQCSR			BIT_ULL(5)
-#define  IOCSRF_FREQSCALE		BIT_ULL(6)
-#define  IOCSRF_DVFSV1			BIT_ULL(7)
-#define  IOCSRF_EIODECODE		BIT_ULL(9)
-#define  IOCSRF_FLATMODE		BIT_ULL(10)
-#define  IOCSRF_VM			BIT_ULL(11)
-#define  IOCSRF_AVEC			BIT_ULL(15)
-
-#define LOONGARCH_IOCSR_VENDOR		0x10
-
-#define LOONGARCH_IOCSR_CPUNAME		0x20
-
-#define LOONGARCH_IOCSR_NODECNT		0x408
-
-#define LOONGARCH_IOCSR_MISC_FUNC	0x420
-#define  IOCSR_MISC_FUNC_SOFT_INT	BIT_ULL(10)
-#define  IOCSR_MISC_FUNC_TIMER_RESET	BIT_ULL(21)
-#define  IOCSR_MISC_FUNC_EXT_IOI_EN	BIT_ULL(48)
-#define  IOCSR_MISC_FUNC_AVEC_EN	BIT_ULL(51)
-
-#define LOONGARCH_IOCSR_CPUTEMP		0x428
-
-#define LOONGARCH_IOCSR_SMCMBX		0x51c
-
-/* PerCore CSR, only accessible by local cores */
-#define LOONGARCH_IOCSR_IPI_STATUS	0x1000
-#define LOONGARCH_IOCSR_IPI_EN		0x1004
-#define LOONGARCH_IOCSR_IPI_SET		0x1008
-#define LOONGARCH_IOCSR_IPI_CLEAR	0x100c
-#define LOONGARCH_IOCSR_MBUF0		0x1020
-#define LOONGARCH_IOCSR_MBUF1		0x1028
-#define LOONGARCH_IOCSR_MBUF2		0x1030
-#define LOONGARCH_IOCSR_MBUF3		0x1038
-
-#define LOONGARCH_IOCSR_IPI_SEND	0x1040
-#define  IOCSR_IPI_SEND_IP_SHIFT	0
-#define  IOCSR_IPI_SEND_CPU_SHIFT	16
-#define  IOCSR_IPI_SEND_BLOCKING	BIT(31)
-
-#define LOONGARCH_IOCSR_MBUF_SEND	0x1048
-#define  IOCSR_MBUF_SEND_BLOCKING	BIT_ULL(31)
-#define  IOCSR_MBUF_SEND_BOX_SHIFT	2
-#define  IOCSR_MBUF_SEND_BOX_LO(box)	(box << 1)
-#define  IOCSR_MBUF_SEND_BOX_HI(box)	((box << 1) + 1)
-#define  IOCSR_MBUF_SEND_CPU_SHIFT	16
-#define  IOCSR_MBUF_SEND_BUF_SHIFT	32
-#define  IOCSR_MBUF_SEND_H32_MASK	0xFFFFFFFF00000000ULL
-
-#define LOONGARCH_IOCSR_ANY_SEND	0x1158
-#define  IOCSR_ANY_SEND_BLOCKING	BIT_ULL(31)
-#define  IOCSR_ANY_SEND_CPU_SHIFT	16
-#define  IOCSR_ANY_SEND_MASK_SHIFT	27
-#define  IOCSR_ANY_SEND_BUF_SHIFT	32
-#define  IOCSR_ANY_SEND_H32_MASK	0xFFFFFFFF00000000ULL
-
-/* Register offset and bit definition for CSR access */
-#define LOONGARCH_IOCSR_TIMER_CFG       0x1060
-#define LOONGARCH_IOCSR_TIMER_TICK      0x1070
-#define  IOCSR_TIMER_CFG_RESERVED       (_ULCAST_(1) << 63)
-#define  IOCSR_TIMER_CFG_PERIODIC       (_ULCAST_(1) << 62)
-#define  IOCSR_TIMER_CFG_EN             (_ULCAST_(1) << 61)
-#define  IOCSR_TIMER_MASK		0x0ffffffffffffULL
-#define  IOCSR_TIMER_INITVAL_RST        (_ULCAST_(0xffff) << 48)
-
-#define LOONGARCH_IOCSR_EXTIOI_NODEMAP_BASE	0x14a0
-#define LOONGARCH_IOCSR_EXTIOI_IPMAP_BASE	0x14c0
-#define LOONGARCH_IOCSR_EXTIOI_EN_BASE		0x1600
-#define LOONGARCH_IOCSR_EXTIOI_BOUNCE_BASE	0x1680
-#define LOONGARCH_IOCSR_EXTIOI_ISR_BASE		0x1800
-#define LOONGARCH_IOCSR_EXTIOI_ROUTE_BASE	0x1c00
-#define IOCSR_EXTIOI_VECTOR_NUM			256
-
 #ifndef __ASSEMBLY__
 
 static __always_inline u64 drdtime(void)
@@ -1145,18 +1067,6 @@ static inline unsigned int get_csr_cpuid(void)
 	return csr_read32(LOONGARCH_CSR_CPUID);
 }
 
-static inline void csr_any_send(unsigned int addr, unsigned int data,
-				unsigned int data_mask, unsigned int cpu)
-{
-	uint64_t val = 0;
-
-	val = IOCSR_ANY_SEND_BLOCKING | addr;
-	val |= (cpu << IOCSR_ANY_SEND_CPU_SHIFT);
-	val |= (data_mask << IOCSR_ANY_SEND_MASK_SHIFT);
-	val |= ((uint64_t)data << IOCSR_ANY_SEND_BUF_SHIFT);
-	iocsr_write64(val, LOONGARCH_IOCSR_ANY_SEND);
-}
-
 static inline unsigned int read_csr_excode(void)
 {
 	return (csr_read32(LOONGARCH_CSR_ESTAT) & CSR_ESTAT_EXC) >> CSR_ESTAT_EXC_SHIFT;
diff --git a/arch/loongarch/kernel/cpu-probe.c b/arch/loongarch/kernel/cpu-probe.c
index d1a9bb77145f..ecf2b2d2fae5 100644
--- a/arch/loongarch/kernel/cpu-probe.c
+++ b/arch/loongarch/kernel/cpu-probe.c
@@ -6,6 +6,7 @@
  */
 #include <linux/init.h>
 #include <linux/kernel.h>
+#include <linux/loongson/iocsr.h>
 #include <linux/ptrace.h>
 #include <linux/smp.h>
 #include <linux/stddef.h>
@@ -273,13 +274,13 @@ static inline void cpu_probe_loongson(struct cpuinfo_loongarch *c, unsigned int
 	if (c->options & LOONGARCH_CPU_IOCSR)
 		return;
 
-	*vendor = iocsr_read64(LOONGARCH_IOCSR_VENDOR);
-	*cpuname = iocsr_read64(LOONGARCH_IOCSR_CPUNAME);
+	*vendor = iocsr_read64(LOONGSON_IOCSR_VENDOR);
+	*cpuname = iocsr_read64(LOONGSON_IOCSR_CPUNAME);
 
 	if (!__cpu_full_name[cpu])
 		__cpu_full_name[cpu] = cpu_full_name;
 
-	config = iocsr_read32(LOONGARCH_IOCSR_FEATURES);
+	config = iocsr_read32(LOONGSON_IOCSR_FEATURES);
 	if (config & IOCSRF_CSRIPI)
 		c->options |= LOONGARCH_CPU_CSRIPI;
 	if (config & IOCSRF_EXTIOI)
diff --git a/arch/loongarch/kernel/relocate_kernel.S b/arch/loongarch/kernel/relocate_kernel.S
index 84e6de2fd973..ce40ba6b5975 100644
--- a/arch/loongarch/kernel/relocate_kernel.S
+++ b/arch/loongarch/kernel/relocate_kernel.S
@@ -5,6 +5,7 @@
  * Copyright (C) 2022 Loongson Technology Corporation Limited
  */
 
+#include <linux/loongson/iocsr.h>
 #include <linux/kexec.h>
 
 #include <asm/asm.h>
@@ -88,14 +89,14 @@ SYM_CODE_END(relocate_new_kernel)
 #ifdef CONFIG_SMP
 /*
  * Other CPUs should wait until code is relocated and
- * then start at the entry point from LOONGARCH_IOCSR_MBUF0.
+ * then start at the entry point from LOONGSON_IOCSR_MBUF0.
  */
 SYM_CODE_START(kexec_smp_wait)
 	UNWIND_HINT_UNDEFINED
 1:	li.w		t0, 0x100			/* wait for init loop */
 2:	addi.w		t0, t0, -1			/* limit mailbox access */
 	bnez		t0, 2b
-	li.w		t1, LOONGARCH_IOCSR_MBUF0
+	li.w		t1, LOONGSON_IOCSR_MBUF0
 	iocsrrd.w	s0, t1				/* check PC as an indicator */
 	beqz		s0, 1b
 	iocsrrd.d	s0, t1				/* get PC via mailbox */
diff --git a/arch/loongarch/kernel/smp.c b/arch/loongarch/kernel/smp.c
index 4adbbef3450a..120865985376 100644
--- a/arch/loongarch/kernel/smp.c
+++ b/arch/loongarch/kernel/smp.c
@@ -14,6 +14,7 @@
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/irq_work.h>
+#include <linux/loongson/iocsr.h>
 #include <linux/profile.h>
 #include <linux/seq_file.h>
 #include <linux/smp.h>
@@ -164,14 +165,14 @@ static void csr_mail_send(uint64_t data, int cpu, int mailbox)
 	val |= (IOCSR_MBUF_SEND_BOX_HI(mailbox) << IOCSR_MBUF_SEND_BOX_SHIFT);
 	val |= (cpu << IOCSR_MBUF_SEND_CPU_SHIFT);
 	val |= (data & IOCSR_MBUF_SEND_H32_MASK);
-	iocsr_write64(val, LOONGARCH_IOCSR_MBUF_SEND);
+	iocsr_write64(val, LOONGSON_IOCSR_MBUF_SEND);
 
 	/* Send low 32 bits */
 	val = IOCSR_MBUF_SEND_BLOCKING;
 	val |= (IOCSR_MBUF_SEND_BOX_LO(mailbox) << IOCSR_MBUF_SEND_BOX_SHIFT);
 	val |= (cpu << IOCSR_MBUF_SEND_CPU_SHIFT);
 	val |= (data << IOCSR_MBUF_SEND_BUF_SHIFT);
-	iocsr_write64(val, LOONGARCH_IOCSR_MBUF_SEND);
+	iocsr_write64(val, LOONGSON_IOCSR_MBUF_SEND);
 };
 
 static u32 ipi_read_clear(int cpu)
@@ -179,9 +180,9 @@ static u32 ipi_read_clear(int cpu)
 	u32 action;
 
 	/* Load the ipi register to figure out what we're supposed to do */
-	action = iocsr_read32(LOONGARCH_IOCSR_IPI_STATUS);
+	action = iocsr_read32(LOONGSON_IOCSR_IPI_STATUS);
 	/* Clear the ipi register to clear the interrupt */
-	iocsr_write32(action, LOONGARCH_IOCSR_IPI_CLEAR);
+	iocsr_write32(action, LOONGSON_IOCSR_IPI_CLEAR);
 	wbflush();
 
 	return action;
@@ -193,7 +194,7 @@ static void ipi_write_action(int cpu, u32 action)
 
 	val = IOCSR_IPI_SEND_BLOCKING | action;
 	val |= (cpu << IOCSR_IPI_SEND_CPU_SHIFT);
-	iocsr_write32(val, LOONGARCH_IOCSR_IPI_SEND);
+	iocsr_write32(val, LOONGSON_IOCSR_IPI_SEND);
 }
 
 static void loongson_send_ipi_single(int cpu, unsigned int action)
@@ -322,7 +323,7 @@ void __init loongson_smp_setup(void)
 	cpu_data[0].package = cpu_logical_map(0) / loongson_sysconf.cores_per_package;
 
 	pv_ipi_init();
-	iocsr_write32(0xffffffff, LOONGARCH_IOCSR_IPI_EN);
+	iocsr_write32(0xffffffff, LOONGSON_IOCSR_IPI_EN);
 	pr_info("Detected %i available CPU(s)\n", loongson_sysconf.nr_cpus);
 }
 
@@ -370,7 +371,7 @@ void loongson_init_secondary(void)
 
 	change_csr_ecfg(ECFG0_IM, imask);
 
-	iocsr_write32(0xffffffff, LOONGARCH_IOCSR_IPI_EN);
+	iocsr_write32(0xffffffff, LOONGSON_IOCSR_IPI_EN);
 
 #ifdef CONFIG_NUMA
 	numa_add_cpu(cpu);
@@ -385,7 +386,7 @@ void loongson_init_secondary(void)
 void loongson_smp_finish(void)
 {
 	local_irq_enable();
-	iocsr_write64(0, LOONGARCH_IOCSR_MBUF0);
+	iocsr_write64(0, LOONGSON_IOCSR_MBUF0);
 	pr_info("CPU#%d finished\n", smp_processor_id());
 }
 
@@ -435,12 +436,12 @@ void __noreturn arch_cpu_idle_dead(void)
 	__smp_mb();
 	do {
 		__asm__ __volatile__("idle 0\n\t");
-		addr = iocsr_read64(LOONGARCH_IOCSR_MBUF0);
+		addr = iocsr_read64(LOONGSON_IOCSR_MBUF0);
 	} while (addr == 0);
 
 	local_irq_disable();
 	init_fn = (void *)TO_CACHE(addr);
-	iocsr_write32(0xffffffff, LOONGARCH_IOCSR_IPI_CLEAR);
+	iocsr_write32(0xffffffff, LOONGSON_IOCSR_IPI_CLEAR);
 
 	init_fn();
 	BUG();
@@ -460,7 +461,7 @@ static int loongson_ipi_suspend(void)
 
 static void loongson_ipi_resume(void)
 {
-	iocsr_write32(0xffffffff, LOONGARCH_IOCSR_IPI_EN);
+	iocsr_write32(0xffffffff, LOONGSON_IOCSR_IPI_EN);
 }
 
 static struct syscore_ops loongson_ipi_syscore_ops = {
diff --git a/drivers/cpufreq/loongson3_cpufreq.c b/drivers/cpufreq/loongson3_cpufreq.c
index 6b5e6798d9a2..11d5f1ba3040 100644
--- a/drivers/cpufreq/loongson3_cpufreq.c
+++ b/drivers/cpufreq/loongson3_cpufreq.c
@@ -10,6 +10,7 @@
 #include <linux/cpufreq.h>
 #include <linux/delay.h>
 #include <linux/module.h>
+#include <linux/loongson/iocsr.h>
 #include <linux/platform_device.h>
 #include <linux/units.h>
 
@@ -182,7 +183,7 @@ static inline int do_service_request(u32 id, u32 info, u32 cmd, u32 val, u32 ext
 
 	mutex_lock(&cpufreq_mutex[package]);
 
-	last.value = iocsr_read32(LOONGARCH_IOCSR_SMCMBX);
+	last.value = iocsr_read32(LOONGSON_IOCSR_SMCMBX);
 	if (!last.complete) {
 		mutex_unlock(&cpufreq_mutex[package]);
 		return -EPERM;
@@ -195,12 +196,12 @@ static inline int do_service_request(u32 id, u32 info, u32 cmd, u32 val, u32 ext
 	msg.extra	= extra;
 	msg.complete	= 0;
 
-	iocsr_write32(msg.value, LOONGARCH_IOCSR_SMCMBX);
-	iocsr_write32(iocsr_read32(LOONGARCH_IOCSR_MISC_FUNC) | IOCSR_MISC_FUNC_SOFT_INT,
-		      LOONGARCH_IOCSR_MISC_FUNC);
+	iocsr_write32(msg.value, LOONGSON_IOCSR_SMCMBX);
+	iocsr_write32(iocsr_read32(LOONGSON_IOCSR_MISC_FUNC) | IOCSR_MISC_FUNC_SOFT_INT,
+		      LOONGSON_IOCSR_MISC_FUNC);
 
 	for (retries = 0; retries < 10000; retries++) {
-		msg.value = iocsr_read32(LOONGARCH_IOCSR_SMCMBX);
+		msg.value = iocsr_read32(LOONGSON_IOCSR_SMCMBX);
 		if (msg.complete)
 			break;
 
diff --git a/drivers/irqchip/irq-loongarch-avec.c b/drivers/irqchip/irq-loongarch-avec.c
index 0f6e465dd309..2452c6cc0aa1 100644
--- a/drivers/irqchip/irq-loongarch-avec.c
+++ b/drivers/irqchip/irq-loongarch-avec.c
@@ -10,6 +10,7 @@
 #include <linux/irqchip.h>
 #include <linux/irqchip/chained_irq.h>
 #include <linux/irqdomain.h>
+#include <linux/loongson/iocsr.h>
 #include <linux/kernel.h>
 #include <linux/msi.h>
 #include <linux/radix-tree.h>
@@ -378,9 +379,9 @@ static int __init avecintc_init(struct irq_domain *parent)
 				  "irqchip/loongarch/avecintc:starting",
 				  avecintc_cpu_online, avecintc_cpu_offline);
 #endif
-	value = iocsr_read64(LOONGARCH_IOCSR_MISC_FUNC);
+	value = iocsr_read64(LOONGSON_IOCSR_MISC_FUNC);
 	value |= IOCSR_MISC_FUNC_AVEC_EN;
-	iocsr_write64(value, LOONGARCH_IOCSR_MISC_FUNC);
+	iocsr_write64(value, LOONGSON_IOCSR_MISC_FUNC);
 
 	return ret;
 
diff --git a/drivers/irqchip/irq-loongson-eiointc.c b/drivers/irqchip/irq-loongson-eiointc.c
index e24db71a8783..6e81bf27914f 100644
--- a/drivers/irqchip/irq-loongson-eiointc.c
+++ b/drivers/irqchip/irq-loongson-eiointc.c
@@ -13,6 +13,7 @@
 #include <linux/irqchip.h>
 #include <linux/irqdomain.h>
 #include <linux/irqchip/chained_irq.h>
+#include <linux/loongson/iocsr.h>
 #include <linux/kernel.h>
 #include <linux/syscore_ops.h>
 #include <asm/numa.h>
@@ -52,9 +53,9 @@ static void eiointc_enable(void)
 {
 	uint64_t misc;
 
-	misc = iocsr_read64(LOONGARCH_IOCSR_MISC_FUNC);
+	misc = iocsr_read64(LOONGSON_IOCSR_MISC_FUNC);
 	misc |= IOCSR_MISC_FUNC_EXT_IOI_EN;
-	iocsr_write64(misc, LOONGARCH_IOCSR_MISC_FUNC);
+	iocsr_write64(misc, LOONGSON_IOCSR_MISC_FUNC);
 }
 
 static int cpu_to_eio_node(int cpu)
diff --git a/include/linux/loongson/iocsr.h b/include/linux/loongson/iocsr.h
new file mode 100644
index 000000000000..6654a904bcbe
--- /dev/null
+++ b/include/linux/loongson/iocsr.h
@@ -0,0 +1,110 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2020-2022 Loongson Technology Corporation Limited
+ * Copyright (C) 2024, Jiaxun Yang <jiaxun.yang@flygoat.com>
+ */
+
+#ifndef _LOONGSON_IOCSR_H
+#define _LOONGSON_IOCSR_H
+
+#include <linux/bits.h>
+#include <linux/types.h>
+
+#ifdef CONFIG_LOONGARCH
+#include <asm/loongarch.h>
+#endif
+
+#define LOONGSON_IOCSR_FEATURES	0x8
+#define  IOCSRF_TEMP			BIT_ULL(0)
+#define  IOCSRF_NODECNT			BIT_ULL(1)
+#define  IOCSRF_MSI			BIT_ULL(2)
+#define  IOCSRF_EXTIOI			BIT_ULL(3)
+#define  IOCSRF_CSRIPI			BIT_ULL(4)
+#define  IOCSRF_FREQCSR			BIT_ULL(5)
+#define  IOCSRF_FREQSCALE		BIT_ULL(6)
+#define  IOCSRF_DVFSV1			BIT_ULL(7)
+#define  IOCSRF_EIODECODE		BIT_ULL(9)
+#define  IOCSRF_FLATMODE		BIT_ULL(10)
+#define  IOCSRF_VM			BIT_ULL(11)
+#define  IOCSRF_AVEC			BIT_ULL(15)
+
+#define LOONGSON_IOCSR_VENDOR		0x10
+
+#define LOONGSON_IOCSR_CPUNAME		0x20
+
+#define LOONGSON_IOCSR_NODECNT		0x408
+
+#define LOONGSON_IOCSR_MISC_FUNC	0x420
+#define  IOCSR_MISC_FUNC_SOFT_INT	BIT_ULL(10)
+#define  IOCSR_MISC_FUNC_TIMER_RESET	BIT_ULL(21)
+#define  IOCSR_MISC_FUNC_EXT_IOI_EN	BIT_ULL(48)
+#define  IOCSR_MISC_FUNC_AVEC_EN	BIT_ULL(51)
+
+#define LOONGSON_IOCSR_CPUTEMP		0x428
+
+#define LOONGSON_IOCSR_SMCMBX		0x51c
+
+/* PerCore CSR, only accessible by local cores */
+#define LOONGSON_IOCSR_IPI_STATUS	0x1000
+#define LOONGSON_IOCSR_IPI_EN		0x1004
+#define LOONGSON_IOCSR_IPI_SET		0x1008
+#define LOONGSON_IOCSR_IPI_CLEAR	0x100c
+#define LOONGSON_IOCSR_MBUF0		0x1020
+#define LOONGSON_IOCSR_MBUF1		0x1028
+#define LOONGSON_IOCSR_MBUF2		0x1030
+#define LOONGSON_IOCSR_MBUF3		0x1038
+
+#define LOONGSON_IOCSR_IPI_SEND	0x1040
+#define  IOCSR_IPI_SEND_IP_SHIFT	0
+#define  IOCSR_IPI_SEND_CPU_SHIFT	16
+#define  IOCSR_IPI_SEND_BLOCKING	BIT(31)
+
+#define LOONGSON_IOCSR_MBUF_SEND	0x1048
+#define  IOCSR_MBUF_SEND_BLOCKING	BIT_ULL(31)
+#define  IOCSR_MBUF_SEND_BOX_SHIFT	2
+#define  IOCSR_MBUF_SEND_BOX_LO(box)	(box << 1)
+#define  IOCSR_MBUF_SEND_BOX_HI(box)	((box << 1) + 1)
+#define  IOCSR_MBUF_SEND_CPU_SHIFT	16
+#define  IOCSR_MBUF_SEND_BUF_SHIFT	32
+#define  IOCSR_MBUF_SEND_H32_MASK	0xFFFFFFFF00000000ULL
+
+#define LOONGSON_IOCSR_ANY_SEND	0x1158
+#define  IOCSR_ANY_SEND_BLOCKING	BIT_ULL(31)
+#define  IOCSR_ANY_SEND_CPU_SHIFT	16
+#define  IOCSR_ANY_SEND_MASK_SHIFT	27
+#define  IOCSR_ANY_SEND_BUF_SHIFT	32
+#define  IOCSR_ANY_SEND_H32_MASK	0xFFFFFFFF00000000ULL
+
+/* Register offset and bit definition for CSR access */
+#define LOONGSON_IOCSR_TIMER_CFG       0x1060
+#define LOONGSON_IOCSR_TIMER_TICK      0x1070
+#define  IOCSR_TIMER_CFG_RESERVED       (_ULCAST_(1) << 63)
+#define  IOCSR_TIMER_CFG_PERIODIC       (_ULCAST_(1) << 62)
+#define  IOCSR_TIMER_CFG_EN             (_ULCAST_(1) << 61)
+#define  IOCSR_TIMER_MASK		0x0ffffffffffffULL
+#define  IOCSR_TIMER_INITVAL_RST        (_ULCAST_(0xffff) << 48)
+
+#define LOONGSON_IOCSR_EXTIOI_NODEMAP_BASE	0x14a0
+#define LOONGSON_IOCSR_EXTIOI_IPMAP_BASE	0x14c0
+#define LOONGSON_IOCSR_EXTIOI_EN_BASE		0x1600
+#define LOONGSON_IOCSR_EXTIOI_BOUNCE_BASE	0x1680
+#define LOONGSON_IOCSR_EXTIOI_ISR_BASE		0x1800
+#define LOONGSON_IOCSR_EXTIOI_ROUTE_BASE	0x1c00
+#define IOCSR_EXTIOI_VECTOR_NUM			256
+
+#ifndef __ASSEMBLY__
+static inline void csr_any_send(unsigned int addr, unsigned int data,
+				unsigned int data_mask, unsigned int cpu)
+{
+	uint64_t val = 0;
+
+	val = IOCSR_ANY_SEND_BLOCKING | addr;
+	val |= (cpu << IOCSR_ANY_SEND_CPU_SHIFT);
+	val |= (data_mask << IOCSR_ANY_SEND_MASK_SHIFT);
+	val |= ((uint64_t)data << IOCSR_ANY_SEND_BUF_SHIFT);
+	iocsr_write64(val, LOONGSON_IOCSR_ANY_SEND);
+}
+#endif
+
+#endif
+

-- 
2.46.0


