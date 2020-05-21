Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFA431DC3A7
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2020 02:35:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727072AbgEUAf2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 20 May 2020 20:35:28 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:33108 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727039AbgEUAf1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 20 May 2020 20:35:27 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 88C41803078F;
        Thu, 21 May 2020 00:35:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id TcHXOPbgaFoj; Thu, 21 May 2020 03:35:23 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        Zhou Yanjie <zhouyanjie@zoho.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 08/14] mips: MAAR: Use more precise address mask
Date:   Thu, 21 May 2020 03:34:37 +0300
Message-ID: <20200521003443.11385-9-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200521003443.11385-1-Sergey.Semin@baikalelectronics.ru>
References: <20200521003443.11385-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Indeed according to the MIPS32 Privileged Resource Architecgture the MAAR
pair register address field either takes [12:31] bits for non-XPA systems
and [12:55] otherwise. In any case the current address mask is just
wrong for 64-bit and 32-bits XPA chips. So lets extend it to 59-bits
of physical address value. This shall cover the 64-bits architecture and
systems with XPA enabled, and won't cause any problem for non-XPA 32-bit
systems, since address values exceeding the architecture specific MAAR
mask will be just truncated with setting zeros in the unsupported upper
bits.

Co-developed-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Signed-off-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org

---

Changelog v3:
- In accordance with MIPS32/64 Privileged Resource Architecture Extend
  the MAAR Addr mask to value [12:55] instead of P5600-specific [12:35].
---
 arch/mips/include/asm/mipsregs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
index 039ebd913f00..30d9e28d01b0 100644
--- a/arch/mips/include/asm/mipsregs.h
+++ b/arch/mips/include/asm/mipsregs.h
@@ -775,7 +775,7 @@
 
 /* MAAR bit definitions */
 #define MIPS_MAAR_VH		(_U64CAST_(1) << 63)
-#define MIPS_MAAR_ADDR		((BIT_ULL(BITS_PER_LONG - 12) - 1) << 12)
+#define MIPS_MAAR_ADDR		GENMASK_ULL(55, 12)
 #define MIPS_MAAR_ADDR_SHIFT	12
 #define MIPS_MAAR_S		(_ULCAST_(1) << 1)
 #define MIPS_MAAR_VL		(_ULCAST_(1) << 0)
-- 
2.25.1

