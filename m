Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 374462E75CF
	for <lists+linux-mips@lfdr.de>; Wed, 30 Dec 2020 04:26:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726300AbgL3DZb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 29 Dec 2020 22:25:31 -0500
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:41083 "EHLO
        wnew2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726138AbgL3DZb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 29 Dec 2020 22:25:31 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.west.internal (Postfix) with ESMTP id BBC4C9FE;
        Tue, 29 Dec 2020 22:24:24 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Tue, 29 Dec 2020 22:24:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=4MYdTmaPFbfIp
        2JehjVAudmUNN+0za867mNhsvApiQo=; b=w0m+HLjDLPTjyhXGsS7hqGaucbE1s
        qQZw61LaFryTPgXU7puFZTrW/FkQUUxO6zHErQEHSDaMW/ETQzuePdI4idJ6Voje
        pLDIDTu2aWThVfqwwf0eheBurVklUJhVin+0ju6uNWAs7Vb8AJaHIXbDrYYDsuv4
        Ys7G91saQDfTDQgoemzAFjRjhuQDhlPOLlh0qye2yBQvpVISn1KqruapYuOsLcaS
        DKXAFV0ESk/vY7hIwUzwz5W73rBvXfEHwDUzNmReske5PXbySyf5At9+p3qfSGRf
        CKgGzcf7PjOV3NggZQy9AWDgeq+KUuWIVwXfkWEu5X6Hej24cHMyerq4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=4MYdTmaPFbfIp2JehjVAudmUNN+0za867mNhsvApiQo=; b=iwsh/Tpg
        /SuEtceUNp2bcq4TNUILvg5J69abZ+iTwRUCe0qmwsdQI3AfYXbItxmuwxBgQPdU
        RPuC301cva2beqTEuBybTHzKuCszknI0rDYsIGk+mX/m7ExV3QxhA5+i4kk0HvV5
        4hkuaRNCchTRL0F3kdL9fxs3m6Miuu/yVmUV+obeI214+vydxVF+NuC2Nvn75PLF
        km10szXIbujhH65oxjuDp/cEmrK6jSPcBbxbIQajevt5f+FuSWe2vgppyxQoYojG
        3CvANJeYVs/LFwDKrxqqdlzN+9zG8ax/h9noUIRgQacVsdYvGZIn+lKP96AxXGbn
        2In3wuHOrqEy2w==
X-ME-Sender: <xms:5_LrX0Ex5Hp_IzgWuSrw_gqZERrS68By1hQN4NYYGDN88tmFhIBe2Q>
    <xme:5_LrX9V6S2Wq7Q_1zO_kPlE145D7_c8NVroVN6iJF-ZVZP7S6stL2JsbZdG8JeG2V
    J4XSeWMbShGmsd0SYs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddvvddgheelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeflihgrgihu
    nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
    ftrfgrthhtvghrnhepjeeihffgteelkeelffdukedtheevudejvdegkeekjeefhffhhfet
    udetgfdtffeunecukfhppeeitddrudejjedrudekledrudejudenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehf
    lhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:5_LrX-ICO9u_vZzQ0Plzv8HittLmmwaoG19zEycCrdvktM-6udO29A>
    <xmx:5_LrX2Gy8kU8R0ZgF1css16jwOqBjnLXE_ne13Etc9Qnt5U0yjwIzA>
    <xmx:5_LrX6XdSKDzNG7js8abXSdTaT9R6U0Qyf9JN0d_-QSIFqE9b1dDxA>
    <xmx:6PLrX2QtDfn392Mvm449QHXXTYJAhn2YdojcctIrY7wmRe9bdl4NE9b98dneHzPo>
Received: from strike.202.net.flygoat.com (unknown [60.177.189.171])
        by mail.messagingengine.com (Postfix) with ESMTPA id B50581080057;
        Tue, 29 Dec 2020 22:24:18 -0500 (EST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        WANG Xuerui <git@xen0n.name>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>, Paul Cercueil <paul@crapouillou.net>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        Huacai Chen <chenhc@lemote.com>, YunQiang Su <syq@debian.org>,
        Liangliang Huang <huanglllzu@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] MIPS: cpu-probe: Vulnerabilities for Loongson cores
Date:   Wed, 30 Dec 2020 11:23:09 +0800
Message-Id: <20201230032314.10042-3-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20201230032314.10042-1-jiaxun.yang@flygoat.com>
References: <20201230032314.10042-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Loongson64C is known to be vulnerable to meltdown according to
PoC from Rui Wang <r@hev.cc>.

Loongson64G defended these side-channel attack by silicon.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/kernel/cpu-probe.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index 2460783dbdb1..24b21f51353c 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -2092,6 +2092,8 @@ static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
 		c->ases |= (MIPS_ASE_LOONGSON_MMI | MIPS_ASE_LOONGSON_CAM |
 			MIPS_ASE_LOONGSON_EXT | MIPS_ASE_LOONGSON_EXT2);
 		c->ases &= ~MIPS_ASE_VZ; /* VZ of Loongson-3A2000/3000 is incomplete */
+		c->vulnerabilities |= MIPS_VULNBL_MELTDOWN;
+		c->vulnerable |= MIPS_VULNBL_MELTDOWN;
 		break;
 	case PRID_IMP_LOONGSON_64G:
 		c->cputype = CPU_LOONGSON64;
@@ -2100,6 +2102,8 @@ static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
 		set_isa(c, MIPS_CPU_ISA_M64R2);
 		decode_cpucfg(c);
 		c->writecombine = _CACHE_UNCACHED_ACCELERATED;
+		c->vulnerabilities |= MIPS_VULNBL_MELTDOWN |
+			      MIPS_VULNBL_SPECTRE_V1 | MIPS_VULNBL_SPECTRE_V2;
 		break;
 	default:
 		panic("Unknown Loongson Processor ID!");
-- 
2.30.0

