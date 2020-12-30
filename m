Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C38382E75CB
	for <lists+linux-mips@lfdr.de>; Wed, 30 Dec 2020 04:25:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726190AbgL3DZA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 29 Dec 2020 22:25:00 -0500
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:57799 "EHLO
        wnew2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726138AbgL3DZA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 29 Dec 2020 22:25:00 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.west.internal (Postfix) with ESMTP id 0F2E69E0;
        Tue, 29 Dec 2020 22:24:13 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Tue, 29 Dec 2020 22:24:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=AdOmgShaqlunG
        J48VMFBnxSV7/YMKb8EbiuyvXg0/VM=; b=rnk7CxhO0XzXQ67eUM2W0tosmdC/W
        OWjDXnT3ihOUbv00SlIyafct7DPxb1JQ7/FuWbYLu3V5MtQf86zYp6Xxw+Syr7CE
        EHlqsjhK5Qt84Oa7iQXb3SeDxnzbF27Sg6k8aZN9WXqyWXxcBdS5YA32+WJCCnZP
        ys04T2yFUnj/fT+oVqgstLphTEn7nyJI5OuV9AgU0/d8IxyZMyDGa4opJifH3nOY
        5F2UYqDNs9ai+76+/ND2x2W73FVEMt81NiPCSMyY39wlobyoBU82CRAtodyOtMXB
        puLEfZKcm1xqqgIAU19p4kU9u1HB1K+0ujtEVScKSsUVVEchjNK8Yxuqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=AdOmgShaqlunGJ48VMFBnxSV7/YMKb8EbiuyvXg0/VM=; b=NbmE9TJi
        USeAc/YdqNAMcGax4YZiJ8xnK14nbafKiIDPK/CnJrbjMma5/WF0B4kJQtxzLzzu
        X26r7hwzUnaRTK1IEQUnkXH3GzlOjG3z4y4sU639azTmJRA84qEWBOOyUqiMySim
        j3qLOrD3qpIfkEhUec39tWhAXPyw8A/9R8ugWgA+vKyypUVWSG0+eRMVJ0qEZust
        mJY1j3DxszkQQaBwA65o2FGWQm9ALefRO8ZeU5/MMqQfabxFpJbBS3hVl8EZRHA6
        jC3im1HpOBMC5U0XiCn8CNv8QOokSKdyleUfIx2EqnU+I8CGzBqqns5CD0DWQ9Ss
        i/KARfkvQaSCDw==
X-ME-Sender: <xms:3fLrX7gzxP9mycyaSRm9UzdOklNtSVtOJnyoKbsoMbySn3lO1kENmQ>
    <xme:3fLrX4Bxl7JZ9sirnVNfgCRZytNKcLSdHlnVrtAjLN9aQdbDXzrTxTIkBA0wC0Flj
    pV9HacBD_XgBGlKxV8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddvvddgheelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeflihgrgihu
    nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
    ftrfgrthhtvghrnhepjeegtedvvdefhfdtfffgheffledvfefggeehkeetgfevheeludeu
    heeuuefgfedvnecuffhomhgrihhnpehmihhpshdrtghomhenucfkphepiedtrddujeejrd
    dukeelrddujedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:3fLrX7Gr1LNqqGA8Yhys-e5IgQPPVmgpy4QB_fYQ62EXuWqqcKZQoA>
    <xmx:3fLrX4SM3a1aYz8KzWrf8dgZW-0IU2tfH-dACfEIL3UwIuybAF_ccg>
    <xmx:3fLrX4wwh1ExsjWfyH_VT9xqeIanOJ6J_KwxYrTWXSpandBgk8DxGQ>
    <xmx:3fLrX9r9itHT_iDqVo3KAPtGShX7bCMSV6G_KxONAXrY6X-v320kmdlynNkolWRt>
Received: from strike.202.net.flygoat.com (unknown [60.177.189.171])
        by mail.messagingengine.com (Postfix) with ESMTPA id 2F014108005C;
        Tue, 29 Dec 2020 22:24:07 -0500 (EST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        WANG Xuerui <git@xen0n.name>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>, Tiezhu Yang <yangtiezhu@loongson.cn>,
        Paul Cercueil <paul@crapouillou.net>,
        Huacai Chen <chenhc@lemote.com>, YunQiang Su <syq@debian.org>,
        Liangliang Huang <huanglllzu@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] MIPS: cpu-probe: Vulnerabilities for MIPS cores
Date:   Wed, 30 Dec 2020 11:23:08 +0800
Message-Id: <20201230032314.10042-2-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20201230032314.10042-1-jiaxun.yang@flygoat.com>
References: <20201230032314.10042-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Accorading to MIPS's announcement[1], only P5600 and P6600 is
affected by spectre v1 and v2, other cores are not affected.

So we mark vulnerabilities states for MIPS cores as known and
set P5600 and P6600 as vulnerable.

[1]: https://www.mips.com/blog/mips-response-on-speculative-execution-and-side-channel-vulnerabilities/

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/kernel/cpu-probe.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index 03adeed58efb..2460783dbdb1 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -1688,6 +1688,9 @@ static inline void cpu_probe_legacy(struct cpuinfo_mips *c, unsigned int cpu)
 static inline void cpu_probe_mips(struct cpuinfo_mips *c, unsigned int cpu)
 {
 	c->writecombine = _CACHE_UNCACHED_ACCELERATED;
+	c->vulnerabilities |= MIPS_VULNBL_MELTDOWN |
+			      MIPS_VULNBL_SPECTRE_V1 | MIPS_VULNBL_SPECTRE_V2;
+
 	switch (c->processor_id & PRID_IMP_MASK) {
 	case PRID_IMP_QEMU_GENERIC:
 		c->writecombine = _CACHE_UNCACHED;
@@ -1794,10 +1797,12 @@ static inline void cpu_probe_mips(struct cpuinfo_mips *c, unsigned int cpu)
 	case PRID_IMP_P5600:
 		c->cputype = CPU_P5600;
 		__cpu_name[cpu] = "MIPS P5600";
+		c->vulnerable |= MIPS_VULNBL_SPECTRE_V1 | MIPS_VULNBL_SPECTRE_V2;
 		break;
 	case PRID_IMP_P6600:
 		c->cputype = CPU_P6600;
 		__cpu_name[cpu] = "MIPS P6600";
+		c->vulnerable |= MIPS_VULNBL_SPECTRE_V1 | MIPS_VULNBL_SPECTRE_V2;
 		break;
 	case PRID_IMP_I6400:
 		c->cputype = CPU_I6400;
-- 
2.30.0

