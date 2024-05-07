Return-Path: <linux-mips+bounces-3122-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E4F8BDDAE
	for <lists+linux-mips@lfdr.de>; Tue,  7 May 2024 11:02:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B35C51C233CF
	for <lists+linux-mips@lfdr.de>; Tue,  7 May 2024 09:02:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5330914EC53;
	Tue,  7 May 2024 09:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="waj/86R2";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RqqymNPp"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F75714E2EA;
	Tue,  7 May 2024 09:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715072522; cv=none; b=YIlJLH4bvQEdmcMzv3bKTvJqfRsinQ2gDLRZhNR26BVFUzwl+QUNLteWXtHc6ePwioy7EHgxmxLVGdjXUbFz6kpmILyVfl8Dgzm9gTqs7t+YKZIzrPydJk5z3c2v6QP5Y2sfBmTPpL8QtPkBDTi5hHcS2Q2weBHzC0S/A4Nv1t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715072522; c=relaxed/simple;
	bh=4EfRyQXq3a/gP4GGGVwHML+S7nX0DpMKT8K0KyhTHVI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YdgolIW/wwtImdQeIL8vyJyl0Q7IkUO5MECtYlWoWVJjTNXbgyKMfOyYesECSLR0D9uI2nyZPSiXetRJCfup34vleAYY4nTXHKdlf4AWmVVhPi+nrxZ5Ye1xGvr1+bwgQVygAPmui4jJo0vtobHJiIfGDA6dViFR2EpTjT7vTl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=waj/86R2; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RqqymNPp; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 5383511400E4;
	Tue,  7 May 2024 05:01:59 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Tue, 07 May 2024 05:01:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1715072519;
	 x=1715158919; bh=IOB9Bc5dOldBOjUiG0Lh6BMLHiA0VIj5Z8gZUA8h7kY=; b=
	waj/86R2GH7+nQ+1XzswG3hBr+MbcDeEAOD/d0ENurxtE6WnkFuoq5og3GMrz2Zz
	nOmSRvZjJS0bVoy8TV9wDcOD9bLiH1dfahF3AlDF9LLSTi6FUNFls1YI/e/bQuGj
	3nRU2c8qKRPkTrUUla28xUXZkntFZE+F0GKI5aocyfBnC9I0IKRQUsP25dFtHjfy
	BhLrNAcfLUT7Tn6oiH/MOj8ujRaId/AuRcM278uEpjWmPWZSX/HljPVM36ZT/mGd
	15bLETw7aVNM2c3nXGpnViXGHoeEpCfFq7B8Yp86vbTYxpDppqqsoSxfn2s/bDer
	RIWdCe95ZDxBztfzuPjCJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715072519; x=
	1715158919; bh=IOB9Bc5dOldBOjUiG0Lh6BMLHiA0VIj5Z8gZUA8h7kY=; b=R
	qqymNPpj0dQ2Cz+GF68x3STu3r9Jj4bDfI78Tdqu28mErDlbaC0c8KwIqsK7lcyG
	n+H0pn6g+m1jiNjfrBJcAlBeWV14Iwoms5/CjsWHJRrw4ps+fRw9aqVx6P3uKtuC
	Nz1hiLeDdT3SNwClN79yxxu5nGzJVUY8T5dd5EyIg9Bk2HlEQUqmxkXtVQzxSu0A
	ZAAGJcpb0RbZKO/OpBwJXzc8MORW3m/x5A5kxOp7+TFc9CP3Fip3BcxeFS5X0f+1
	H6+dkNQ436QdnLmlG2uSlRLOT9R0DdBjJXuZJ1ioYil6V4TgASiRpEaljD60I8kY
	03IK6kvPRorcLxwHOKbbg==
X-ME-Sender: <xms:B-45ZtvVwqk8kW6aXp-n20gP-VmQO-vq64c_0tHep2cpi_HDFUlECQ>
    <xme:B-45Zmfs8avFSuqN_huyEmng3kV7D82hiONfoFt3_7vhfBqICZvGJZ9CVs3ypho60
    DhzdQANrnwGj9bXNzQ>
X-ME-Received: <xmr:B-45ZgyKusiQGW5wBDOzPJTDXQITPOJuCRzy53qdOwmPUqnvVOQF9Gs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddvkedgtdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffekgedugefhtdduudeghfeu
    veegffegudekjeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:B-45ZkP7Zv8xHPLury3btf4t3XGB53PSdyyeKiy_EOifjfIQQZ8Tgw>
    <xmx:B-45Zt_xnjyR-wjGcxWCi4Ax1HnuC_mECuPlMuFncjRaQAaatHq_Bg>
    <xmx:B-45ZkXydXkcN6YaTvYrynUSYfhMosLGGA0HbUOs9UTFSGlKIBzXPA>
    <xmx:B-45Zue2G096-VpKuizKnOmif0fRs3AcXsb2FpfBQm9fVFu3jjq1_Q>
    <xmx:B-45ZsZyjb7Lt9mI1_CY9PA0YrZkck4QjHb79vGgzxWZOtneKDtRpmFJ>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 May 2024 05:01:57 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Tue, 07 May 2024 10:01:53 +0100
Subject: [PATCH 5/5] MIPS: cm: Probe GCR address from DeviceTree
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240507-cm_probe-v1-5-11dbfd598f3c@flygoat.com>
References: <20240507-cm_probe-v1-0-11dbfd598f3c@flygoat.com>
In-Reply-To: <20240507-cm_probe-v1-0-11dbfd598f3c@flygoat.com>
To: Paul Burton <paulburton@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2951;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=4EfRyQXq3a/gP4GGGVwHML+S7nX0DpMKT8K0KyhTHVI=;
 b=owGbwMvMwCHmXMhTe71c8zDjabUkhjTLt/85r9+dvsBAqmGKLJf55oiN83aKbbS4wBW6y150l
 dkSQz3XjlIWBjEOBlkxRZYQAaW+DY0XF1x/kPUHZg4rE8gQBi5OAZiIqB7DX/n0b0HvE9bv/bSn
 Nevs+3fiSnJlU3a+9YifzX39bFSAjyfDf+eyZ8u4u72iw8ULViYVyO4WuWwyZ54qq1zX4rbYe7O
 ucAIA
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
 arch/mips/kernel/mips-cm.c | 58 +++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 52 insertions(+), 6 deletions(-)

diff --git a/arch/mips/kernel/mips-cm.c b/arch/mips/kernel/mips-cm.c
index dddc9428fe58..9563fc1ad438 100644
--- a/arch/mips/kernel/mips-cm.c
+++ b/arch/mips/kernel/mips-cm.c
@@ -5,6 +5,8 @@
  */
 
 #include <linux/errno.h>
+#include <linux/of_address.h>
+#include <linux/of_fdt.h>
 #include <linux/percpu.h>
 #include <linux/spinlock.h>
 
@@ -179,23 +181,67 @@ static char *cm3_causes[32] = {
 static DEFINE_PER_CPU_ALIGNED(spinlock_t, cm_core_lock);
 static DEFINE_PER_CPU_ALIGNED(unsigned long, cm_core_lock_flags);
 
+static int __init mips_cm_fdt_scan(unsigned long node, const char *uname,
+		int depth, void *data)
+{
+	unsigned long *cmgcr = data;
+
+	if (!of_flat_dt_is_compatible(node, "mti,mips-cm"))
+		return 0;
+
+	*cmgcr = of_flat_dt_translate_address(node);
+	if (*cmgcr == OF_BAD_ADDR)
+		*cmgcr = 0;
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
2.34.1


