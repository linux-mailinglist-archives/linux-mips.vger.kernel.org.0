Return-Path: <linux-mips+bounces-3610-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B6990501D
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 12:09:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10B7D1F21AE6
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 10:09:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5356716F0FB;
	Wed, 12 Jun 2024 10:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="p17wLWbU";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VBvGGXK4"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B945C16F0D5;
	Wed, 12 Jun 2024 10:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718186943; cv=none; b=ZkpRsltvlwlWfZDs39kjb4snwhpIZ6QpRw7rMyz+wKijiiwvwVR0Owj0WwhOVdb31u6Neh742YU6F/kZmFI/RObzlfoNk3ZJL/rNPOdNFwNam2Jox5eoOq0KnOZ+yoLnHArIgQV35fQ+kFxpzRLlkv+mIc5KH5PviGcEbHIfgb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718186943; c=relaxed/simple;
	bh=XaML8d7PwntPZwxYpSjOKhtex7IC7jZFHkIAfP9/r/4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fiJ7oUnAcA/zX0bmqAPfqQxRVL0tFnyCu6pWUzQtgN45VeGQrofvTg2ocYuktQ+IesGKHSeI/KvmQV7oeQ7zEmXYAcuP/0EWDNSH4tDlJmF78W6DD3HaRuysqBZyFmc9rEDyTZjU6IdP2kyOxgi1qGgdedNZeSasSAEVxQ+qNB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=p17wLWbU; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VBvGGXK4; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id CA1E711401C1;
	Wed, 12 Jun 2024 06:09:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 12 Jun 2024 06:09:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1718186940;
	 x=1718273340; bh=ME8F+XqC310IYsmGwC1YPl83RIAnc2BQJcZl9+YKsk8=; b=
	p17wLWbUSxHphyr+GfbjuFnfETXKFUSCwA1f7yuMobRUxf7EpqmJ3gzrm06oo6TC
	DqodjnvdE2kx+ti43ZQLoO9IIfITaGDPdb1ThD8/sg89pFe9EasZKnkUmZ5XdZNJ
	rSbV1eAjcDwmQ6limuGc0BPCAaGMTqG+qdAucoMHXgKvyltr2nQWIqR92UKU00bD
	f+IMV+FEKlKhXHQpYdtqJX4ple2yS9/3VS+9NSSn5Qq2BgUR5WzA7YPgCDhk3TJV
	5qAu15n6PHK0aSnIEDeI2muPWRr1LipacpP+YR91sK2HeGWhDkkUfA4tAXe87rXF
	bjHs5HtjzV7dtDfG8oVfKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718186940; x=
	1718273340; bh=ME8F+XqC310IYsmGwC1YPl83RIAnc2BQJcZl9+YKsk8=; b=V
	BvGGXK4biKeRRfeVppLcS9rrnI4Wv3Xe8MYYxTOZzHp9RYXlobR7r+ZUXeJE1p2S
	xvQ68Klr7S80dpIIWzGGCmFuPjQ0Q184gTEmlhvzVam39sYiwEI4sRmqGqWL1stt
	fBsnwNskaEIrqdDIsIITgHRAIJoRiF2Re1sYd62Y0OxoAq6ZRoNV5x7ylq5eFhZ/
	3keqivK/eRpWBgqF2Nu/mdWIQlN2Kt+Mr1UEd5QWEYH2d/DCSz65/N87WmGA4DEC
	x3fARuO1py6T76/axvY5oW+L31bO2YSRZ4XHXcRKnmuKanx1uQAZMCdlunSG7/gf
	kfXBLaeNwQMmL3ixq5X+A==
X-ME-Sender: <xms:vHNpZrXnvTeXFZxwZPu_anh0x7f8vmrzdZZsVZa4NOuy0xHWU6ybKg>
    <xme:vHNpZjli2jLMJR_iWA2lkX-ia-grwR0QSFieoWpyYhXpyVjn7iJAYKDi_vyfU2nZc
    YFoq8B4uAfOwBASV2c>
X-ME-Received: <xmr:vHNpZnZgJ83wVQR9bZ5z8VtGtxEN1rDjph6i9DSei65qOBOj5ZRtyM4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedugedgvdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffekgedugefhtdduudeghfeu
    veegffegudekjeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:vHNpZmWCGUBceSOjq6gBRDWesMDUpQQLflHP0W7ADy2oqWWXM4dsMw>
    <xmx:vHNpZlkHYz1f97d4YH294TyWqn5nw5_UeNOnLfWiYpe6yc2YlJCGWg>
    <xmx:vHNpZjeztpDvSqkiheBZ9I9MthrR3T3oqQ56MNlIechvAqQwM8RprQ>
    <xmx:vHNpZvFJHx7DayVweJbV0kko9ujrfY14pu1MignGttDvZZkJIhaTfg>
    <xmx:vHNpZuch7qAdJezl2aNrRB5rPXxkzk2XehaZW4G8oZc-Ju7-VO1eQi8B>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Jun 2024 06:08:59 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Wed, 12 Jun 2024 11:08:55 +0100
Subject: [PATCH v2 3/6] MIPS: cm: Prefix probe functions with __init
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-cm_probe-v2-3-a5b55440563c@flygoat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2498;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=XaML8d7PwntPZwxYpSjOKhtex7IC7jZFHkIAfP9/r/4=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrTM4m3PAlZftHBpLHROXMixLaTd5WLejL4+nnsSrPPCN
 m6qTX/dUcrCIMbFICumyBIioNS3ofHigusPsv7AzGFlAhnCwMUpABPJnsjwh6Or9OOEme7ym6S3
 Rv7P1dg26ZrH+Ygu9cykBrfEtxd1pjAy/M/8fOdLYqdae/+bvXGTlXd1Gb1I+vXIlO2Og2JIXkw
 +GwA=
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
2.43.0


