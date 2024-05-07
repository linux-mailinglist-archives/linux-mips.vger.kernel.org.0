Return-Path: <linux-mips+bounces-3119-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CCB8BDDA5
	for <lists+linux-mips@lfdr.de>; Tue,  7 May 2024 11:02:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C51891F2564C
	for <lists+linux-mips@lfdr.de>; Tue,  7 May 2024 09:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69C1114D702;
	Tue,  7 May 2024 09:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="Z8voWQ7E";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hHxaTtul"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout8-smtp.messagingengine.com (fout8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B0014D458;
	Tue,  7 May 2024 09:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715072517; cv=none; b=da+pLxKcY63MtA+f1VF/RKZ1IVG9NYG0Ut9z44GiYYRexd7AJvyy3iIIKtsxzgyvTpD+97GVbhdZ4daMD0nCiW3I9GxuDKsxPrkSNSn2cFXm8aEZKPOBqlMU8ySs1iKcULAPun2U4BaF/kKyG5yD4fHSWoQ55UksTRLvhw1yIn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715072517; c=relaxed/simple;
	bh=SLgeVPAUIVYffojO40aOD2FkVjz1kvjwA4zqDsv9YXo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=msbslvQrLo0kwlJAvIa1BGU3ArgzIbppHcRlBjRr04vryxjlxGbb6GRiF12kVZcJbmaDQAfQLnSZhWFbYSC/dbgT+Tuy6S7pq+zxqSM07CaAjCQgnYaMzgV+dSn/C7RwcF1FfKZn84Bud/Fu8sS0V1Q1sTQ1eVuI9nPMSbLRraA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=Z8voWQ7E; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hHxaTtul; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfout.nyi.internal (Postfix) with ESMTP id B5CF91380283;
	Tue,  7 May 2024 05:01:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 07 May 2024 05:01:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1715072514;
	 x=1715158914; bh=APx6dCBrTJqezVBXHJ/h9FJ/vWqO9ascL5/qldxUb9s=; b=
	Z8voWQ7ETaOMAsoDvVabsUQevXrG6ih9v/3o8lHv/KzxbTvKMtZtZ3+1PTc4pXnq
	kI3Hw5dvwDSfaaGB6r3UO2Cy1A8NvwAwhlqS5qXCgZUjH6HWzwQv+zs1KNA5KKlR
	snm21G10KXbCmzdd/c42afUJ7ObsmvFNaIxnAnQoTEPtWZFpbryr4plovMuuuamM
	TwQEyfakqyegUBkRKepCJAIpP+OEddS5egzyZxWt1VGeXu9F2KBm8YIk9OqPrtgm
	w1sHxYBIEOvIDp3zAxB9WV3ZdLmYzuteiu3FpuVDFdJBPMp0tdjQ3yhcI/4JEPvq
	Myu2oY8N08Ai893mitCdEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715072514; x=
	1715158914; bh=APx6dCBrTJqezVBXHJ/h9FJ/vWqO9ascL5/qldxUb9s=; b=h
	HxaTtulfTegmMQf1UL46YadT1ThNFZ+0z6McFH3cZklEh/tPnzdebM6rkbsYa7l0
	2WsbJsdNQ8WcYJy0eOjjb1y9EVVglabhljelShZhc9DlkfP5H+k43EbFMHSJviKP
	ydA6neirGrKwZIhLBj/F1HL3pxhcYu3q2i+iClKGh3MnVQ5b+tZ6IBjTkUGNgAcC
	+jMIupt3/NJelWq5kHwBC6QCqwPqldqmO86mjfF5zRN4WZt1AH0VtzJhCBmZOIhq
	bMvPjNIT2QWkcVRe+u3nV2A1XGMEpTfsivZT+PbAZh7Ts5X6KDbQeObjkCGpraOj
	JfrDnUm/v8YFAIXG7kKPQ==
X-ME-Sender: <xms:Au45ZmrjV19Rkw1v97qIxPqXW22VbP_lutOfKYdgsGJ5FNM_EUgbRw>
    <xme:Au45Zkosa2gSOZ5K5BEdGjETLVzZr70xCcrM05Crrtt4hNY63-KPBUGqFdF9gWqwj
    Wo2UbPxZ_y-lXcZKj4>
X-ME-Received: <xmr:Au45ZrOvBLeZN65gmrFihVrjQic7HXgrR9sI-ywGYngBRjnhbboc8Oc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddvkedgtdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffekgedugefhtdduudeghfeu
    veegffegudekjeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:Au45Zl4NwZrwJ4lUSeQCegppxcPWocnI-neOvNjMX5B1I_KWqWzzQw>
    <xmx:Au45Zl7pIGnoOomWmcB1EdVTwxUv_Lk6bnsP3Sh_T4JdZ_7VBwjY4Q>
    <xmx:Au45ZlhtPHxQOsfYGOVjeYFhcnxlKAhuJ8AhOfgsJ2xo3VXCGji0tA>
    <xmx:Au45Zv4vtb8AMIzk4tEKWvzPSMsgobHv0m6DeHnYgL_-UE2p7F0hxg>
    <xmx:Au45ZqFBzDilzV1UG8SiHDTzfbwqY41REsByqE8IHzw8Vk5kjrjnzHzv>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 May 2024 05:01:53 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Tue, 07 May 2024 10:01:50 +0100
Subject: [PATCH 2/5] MIPS: cm: Prefix probe functions with __init
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240507-cm_probe-v1-2-11dbfd598f3c@flygoat.com>
References: <20240507-cm_probe-v1-0-11dbfd598f3c@flygoat.com>
In-Reply-To: <20240507-cm_probe-v1-0-11dbfd598f3c@flygoat.com>
To: Paul Burton <paulburton@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2498;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=SLgeVPAUIVYffojO40aOD2FkVjz1kvjwA4zqDsv9YXo=;
 b=owGbwMvMwCHmXMhTe71c8zDjabUkhjTLt/879SpaDhjy57Cr8bNKrrRfcsLQzVh4Tde5wOZ/9
 zXPuFt2lLIwiHEwyIopsoQIKPVtaLy44PqDrD8wc1iZQIYwcHEKwEQ2LWJk2Nt6utjdSyU+ZtX3
 FPWrzwLKneclqbxxvvXvgKST4AGvewy/WY2VJixl5Jp9xfBty882MdXy1INV9R2r+99GnbcNFTT
 iAwA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Those functions are only used at boot time.
Prefix them with __init so they can be discarded after boot.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/asm/mips-cm.h | 4 ++--
 arch/mips/kernel/mips-cm.c      | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/mips/include/asm/mips-cm.h b/arch/mips/include/asm/mips-cm.h
index c2930a75b7e4..5292b516d60b 100644
--- a/arch/mips/include/asm/mips-cm.h
+++ b/arch/mips/include/asm/mips-cm.h
@@ -30,7 +30,7 @@ extern void __iomem *mips_cm_l2sync_base;
  * and may be overridden by platforms which determine this address in a
  * different way by defining a function with the same prototype.
  */
-extern phys_addr_t mips_cm_phys_base(void);
+extern phys_addr_t __init mips_cm_phys_base(void);
 
 /**
  * mips_cm_l2sync_phys_base - retrieve the physical base address of the CM
@@ -43,7 +43,7 @@ extern phys_addr_t mips_cm_phys_base(void);
  * determine this address in a different way by defining a function with the
  * same prototype.
  */
-extern phys_addr_t mips_cm_l2sync_phys_base(void);
+extern phys_addr_t  __init mips_cm_l2sync_phys_base(void);
 
 /*
  * mips_cm_is64 - determine CM register width
diff --git a/arch/mips/kernel/mips-cm.c b/arch/mips/kernel/mips-cm.c
index 3a115fab5573..dddc9428fe58 100644
--- a/arch/mips/kernel/mips-cm.c
+++ b/arch/mips/kernel/mips-cm.c
@@ -179,7 +179,7 @@ static char *cm3_causes[32] = {
 static DEFINE_PER_CPU_ALIGNED(spinlock_t, cm_core_lock);
 static DEFINE_PER_CPU_ALIGNED(unsigned long, cm_core_lock_flags);
 
-phys_addr_t __weak mips_cm_phys_base(void)
+phys_addr_t __init __weak mips_cm_phys_base(void)
 {
 	unsigned long cmgcr;
 
@@ -198,7 +198,7 @@ phys_addr_t __weak mips_cm_phys_base(void)
 	return (cmgcr & MIPS_CMGCRF_BASE) << (36 - 32);
 }
 
-phys_addr_t __weak mips_cm_l2sync_phys_base(void)
+phys_addr_t __init __weak mips_cm_l2sync_phys_base(void)
 {
 	u32 base_reg;
 
@@ -214,7 +214,7 @@ phys_addr_t __weak mips_cm_l2sync_phys_base(void)
 	return mips_cm_phys_base() + MIPS_CM_GCR_SIZE;
 }
 
-static void mips_cm_probe_l2sync(void)
+static void __init mips_cm_probe_l2sync(void)
 {
 	unsigned major_rev;
 	phys_addr_t addr;
@@ -237,7 +237,7 @@ static void mips_cm_probe_l2sync(void)
 	mips_cm_l2sync_base = ioremap(addr, MIPS_CM_L2SYNC_SIZE);
 }
 
-int mips_cm_probe(void)
+int __init mips_cm_probe(void)
 {
 	phys_addr_t addr;
 	u32 base_reg;

-- 
2.34.1


