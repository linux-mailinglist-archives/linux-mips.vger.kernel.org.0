Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9729C191F23
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2020 03:33:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727394AbgCYCdn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 24 Mar 2020 22:33:43 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17843 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727395AbgCYCdm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 24 Mar 2020 22:33:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1585103479;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type;
        bh=yyST9a4xds2OxHP7d839ZExH6zCAlPz7AHq/7HnkO+0=;
        b=MGBDxLNRcnw+6qJTvx05eGMOstYRHvSbOhuEdL7taDXptxvfLF8rxsPHnav4P5/Q
        SBBaP5Qom4Rj2JDEN/p7/3X20BPAT9msWTkvCAPl981eGaAwf4QKTXyCMyiHxBw0Znr
        fHKyc1f+uskxwMln9lWHOMzalLTXvL57vAlH9D2s=
Received: from localhost.localdomain (39.155.141.144 [39.155.141.144]) by mx.zoho.com.cn
        with SMTPS id 1585103477959328.4875849949635; Wed, 25 Mar 2020 10:31:17 +0800 (CST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Paul Cercueil <paul@crapouillou.net>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        John Crispin <john@phrozen.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        "David S. Miller" <davem@davemloft.net>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Andi Kleen <ak@linux.intel.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Yinglu Yang <yangyinglu@loongson.cn>,
        Allison Randal <allison@lohutok.net>,
        Manuel Lauss <manuel.lauss@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Paul Burton <paulburton@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Matt Redfearn <matt.redfearn@mips.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-ide@vger.kernel.org
Message-ID: <20200325022916.106641-3-jiaxun.yang@flygoat.com>
Subject: [PATCH v7 01/12] MIPS: Loongson: Do not initialise statics to 0
Date:   Wed, 25 Mar 2020 10:28:18 +0800
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200325022916.106641-1-jiaxun.yang@flygoat.com>
References: <20200325022916.106641-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Content-Type: text/plain; charset=utf8
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Tiezhu Yang <yangtiezhu@loongson.cn>

Fix the following checkpatch error:

ERROR: do not initialise statics to 0
#125: FILE: loongson64/numa.c:125:
+=09static unsigned long num_physpages =3D 0;

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/loongson64/numa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/loongson64/numa.c b/arch/mips/loongson64/numa.c
index e5b40c5e3296..1ae072df4831 100644
--- a/arch/mips/loongson64/numa.c
+++ b/arch/mips/loongson64/numa.c
@@ -122,7 +122,7 @@ static unsigned long nid_to_addroffset(unsigned int nid=
)
 static void __init szmem(unsigned int node)
 {
 =09u32 i, mem_type;
-=09static unsigned long num_physpages =3D 0;
+=09static unsigned long num_physpages;
 =09u64 node_id, node_psize, start_pfn, end_pfn, mem_start, mem_size;
=20
 =09/* Parse memory information and activate */
--=20
2.26.0.rc2


