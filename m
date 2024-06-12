Return-Path: <linux-mips+bounces-3613-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86396905028
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 12:10:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E5CFFB27332
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 10:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E69D16F900;
	Wed, 12 Jun 2024 10:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="RwqP4uio";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Sw6eC1NS"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF88C16F27B;
	Wed, 12 Jun 2024 10:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718186948; cv=none; b=W63RWupehb5BumBfyP57OQQMKYqQ/o918LiNAy5Vl64N0LPwQpTKr45RodKuElCGUpUdqWa60VZHsNDKRHooh9Nh8xKgkx9kdB0Hz0bQ78xWrK4YV1pCSqGpUeu6Xdhx+bBvBgYoAa5pAoZVAgcGMOU4IXEvivrsmchInQASlU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718186948; c=relaxed/simple;
	bh=L0sI9SNX8Fl8dWHCmZcs43fJIyWpWY+8oHGPiv/o1WY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HEaC+MkiJZgDwEleSUSDtxqD88ovo0mGsEHQij9ADMNi2bXibOgL9XTZyVQUKDn72ax1k4TjHXCG6Oj9zmNKCEEtpPV7sdl+Xw/HWQ1pfhMpM/1stoW/at811n6+nY/TMQUl0uCtXHIRDKgnJPNeXafJhtYXFa9dg0Rm+Zm2vOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=RwqP4uio; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Sw6eC1NS; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfout.nyi.internal (Postfix) with ESMTP id CAEC91380083;
	Wed, 12 Jun 2024 06:09:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 12 Jun 2024 06:09:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1718186945;
	 x=1718273345; bh=iPbRKS8KTP23XarmKKdaRK6HQu116D/aznYejgpVkTM=; b=
	RwqP4uioREdG08LA9b6XESYE9EIuxp+Ic3pCMPDeZnfG8gkmC3IgdS+E+xxw4ztw
	d1M3Mkxfjy96GpIfw3QjnW8Xy8gns19TssM+5vUsV+osCbZ1KZtktDtaa71i5tEd
	7QB4mePpKeHn9dT4Kbr6FcgppTuevc25LgdVEdIpvRNCF5e9xP0FDUX3GNQ4xumC
	6VAlRtw0HqweGxN9KETrmoos9om9fUHzH8ADSXC/tCoJoZ3hBPsoZgyy9t5KEXEk
	MG+VgNPZ78ILLZ3fgDLyfs1JQoHon69i4fHJT1VunQvoZLcNulPNtqRohfZp543m
	nMmIfqHe1OV7fCFf6vQc5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718186945; x=
	1718273345; bh=iPbRKS8KTP23XarmKKdaRK6HQu116D/aznYejgpVkTM=; b=S
	w6eC1NSnubDJJ2ZGOR729+Q3fXYdkn1bgC6Ui2ftwTjRRdeG7hY7W3M3OT+Ghmhp
	svr2Xu861cHpZYSVANF7SeJPei+nbVwnGpxR61usIk8vP9jOxiGpMFlje987L+qA
	GkzkO2neWbeI4LHmn0zEQtpQ6YukvDyGXEHMbkSf5oC3qAcj51VIRYJRSGdUxn7X
	rZgkLF+AtASS7Q7OLV6oHCyi7cUM0yDz0WYwC832oLCa75QZyLy61zGYHovBT9Yo
	CZy33v5IH2zmPRmywTVOWjDBv+xMdost79599RxSADkhjBZVkSFb0u4fvani/cuo
	bvK6WhvNJBO2wRdZPghJA==
X-ME-Sender: <xms:wXNpZq5jscxXipYlQhg0L7b5izblmXZnD16HEVqamYBdy8S_TTRyuw>
    <xme:wXNpZj7hc5c_ag93goytpqAyVVKUJ3StmWs8zgqG59jEQcaLO0AN8jbxiSw_Wv-T_
    EVGq3z1vHLkwnS7x5E>
X-ME-Received: <xmr:wXNpZpfzPPnQxhAC9kyYauY_mG9-7Q8d-OpzZKIJezxu4xPA3V1ru7w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedugedgvdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffekgedugefhtdduudeghfeu
    veegffegudekjeelnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:wXNpZnLN5Kcoao3oDd-IB2jB0Qz4kCieqxT2xIxRGVwFttLDT8yYTA>
    <xmx:wXNpZuKpW4pLRHm_0OrBRsfbHMaKmP3FHG98sIM7y-oT3Wqd83o5vA>
    <xmx:wXNpZoz95lwrFLlnBViDv4gG0EFsA9GfI39wptIN9H7jKMblQKnLug>
    <xmx:wXNpZiJO062dWsyroOuyCYD-hKpHD0UJtYU_mqdIvRVkehQPgl-wsA>
    <xmx:wXNpZrB4aCOywsjhk0TC23QjIaVM8mwdWxHumcai0clQxoAr71_k88nN>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Jun 2024 06:09:04 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Wed, 12 Jun 2024 11:08:58 +0100
Subject: [PATCH v2 6/6] MIPS: cm: Probe GCR address from DeviceTree
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-cm_probe-v2-6-a5b55440563c@flygoat.com>
References: <20240612-cm_probe-v2-0-a5b55440563c@flygoat.com>
In-Reply-To: <20240612-cm_probe-v2-0-a5b55440563c@flygoat.com>
To: Paul Burton <paulburton@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Serge Semin <fancer.lancer@gmail.com>, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3047;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=L0sI9SNX8Fl8dWHCmZcs43fJIyWpWY+8oHGPiv/o1WY=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrTM4m3tk30Z190JfPNlzmuVmrNfz70x/v/9Rleah8Xmx
 MRvLU0POkpZGMS4GGTFFFlCBJT6NjReXHD9QdYfmDmsTCBDGLg4BWAisQIM/3TCUti9+J5dmVbr
 tGDFdklpwd6V8e2+X4IvKsgu+qjQUcPIcOTo5ZffGWMu7zi1x1Nu0pqr62cfEQ086TFTJGru14X
 vbPgB
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Traditionally, CM GCR address can be probed from CP0_CMGCRBase.

However there are chips in wild that do have CM GCR but CP0_CMGCRBase
is not available from CPU point of view. Thus we need to be able to
probe GCR address from DeviceTree.

It is implemented as:
- If only CP0_CMGCRBase present, trust CP0_CMGCRBase
- If only mti,mips-cm node present, trust mti,mips-cm reg prop
- If both present, remap address space to address specified in dt

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
v2: Fix build warning (test bot)
---
 arch/mips/kernel/mips-cm.c | 61 +++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 55 insertions(+), 6 deletions(-)

diff --git a/arch/mips/kernel/mips-cm.c b/arch/mips/kernel/mips-cm.c
index dddc9428fe58..02afc795ba8a 100644
--- a/arch/mips/kernel/mips-cm.c
+++ b/arch/mips/kernel/mips-cm.c
@@ -5,6 +5,8 @@
  */
 
 #include <linux/errno.h>
+#include <linux/of_address.h>
+#include <linux/of_fdt.h>
 #include <linux/percpu.h>
 #include <linux/spinlock.h>
 
@@ -179,23 +181,70 @@ static char *cm3_causes[32] = {
 static DEFINE_PER_CPU_ALIGNED(spinlock_t, cm_core_lock);
 static DEFINE_PER_CPU_ALIGNED(unsigned long, cm_core_lock_flags);
 
+static int __init mips_cm_fdt_scan(unsigned long node, const char *uname,
+		int depth, void *data)
+{
+	u64 addr;
+	unsigned long *cmgcr = data;
+
+	if (!of_flat_dt_is_compatible(node, "mti,mips-cm"))
+		return 0;
+
+	addr = of_flat_dt_translate_address(node);
+	if (addr == OF_BAD_ADDR || addr >= ULONG_MAX)
+		*cmgcr = 0;
+	else
+		*cmgcr = addr;
+
+	return 0;
+}
+
 phys_addr_t __init __weak mips_cm_phys_base(void)
 {
-	unsigned long cmgcr;
+	unsigned long gcr_reg = 0, gcr_dt = 0;
+
+	if (of_have_populated_dt()) {
+		int err;
+		struct resource res;
+		struct device_node *cm_node;
+
+		cm_node = of_find_compatible_node(of_root, NULL, "mti,mips-cm");
+		if (cm_node) {
+			err = of_address_to_resource(cm_node, 0, &res);
+			of_node_put(cm_node);
+			if (!err)
+				gcr_dt = res.start;
+		}
+	} else {
+		of_scan_flat_dt(mips_cm_fdt_scan, &gcr_dt);
+	}
 
 	/* Check the CMGCRBase register is implemented */
 	if (!(read_c0_config() & MIPS_CONF_M))
-		return 0;
+		return gcr_dt;
 
 	if (!(read_c0_config2() & MIPS_CONF_M))
-		return 0;
+		return gcr_dt;
 
 	if (!(read_c0_config3() & MIPS_CONF3_CMGCR))
-		return 0;
+		return gcr_dt;
 
 	/* Read the address from CMGCRBase */
-	cmgcr = read_c0_cmgcrbase();
-	return (cmgcr & MIPS_CMGCRF_BASE) << (36 - 32);
+	gcr_reg = read_c0_cmgcrbase();
+	gcr_reg = (gcr_reg & MIPS_CMGCRF_BASE) << (36 - 32);
+
+	/* If no of node, return straight away */
+	if (!gcr_dt)
+		return gcr_reg;
+
+	/* If the CMGCRBase mismatches with dt, remap it */
+	if (gcr_reg != gcr_dt) {
+		pr_info("Remapping CMGCRBase from 0x%08lx to 0x%08lx\n",
+			gcr_reg, gcr_dt);
+		change_gcr_base(CM_GCR_BASE_GCRBASE, gcr_dt);
+	}
+
+	return gcr_dt;
 }
 
 phys_addr_t __init __weak mips_cm_l2sync_phys_base(void)

-- 
2.43.0


