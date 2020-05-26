Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EEF11E2395
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2020 16:03:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731993AbgEZODT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 May 2020 10:03:19 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:57990 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731857AbgEZODD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 26 May 2020 10:03:03 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id EC7298030869;
        Tue, 26 May 2020 14:03:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id qzvqWvySs0VA; Tue, 26 May 2020 17:03:00 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Serge Semin <fancer.lancer@gmail.com>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paul.burton@imgtec.com>,
        Rob Herring <robh+dt@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        James Hogan <jhogan@kernel.org>, <linux-mips@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 4/6] mips: cdmm: Add mti,mips-cdmm dtb node support
Date:   Tue, 26 May 2020 17:02:41 +0300
Message-ID: <20200526140243.21946-5-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200526140243.21946-1-Sergey.Semin@baikalelectronics.ru>
References: <20200526140243.21946-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Since having and mapping the CDMM block is platform specific, then
instead of just returning a zero-address, lets make the default CDMM
base address search method (mips_cdmm_phys_base()) to do something
useful. For instance to find the address in a dedicated dtb-node in
order to support of-based platforms by default.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>

---

Changelog prev:
- Use alphabetical order for the include pre-processor operator.
---
 drivers/bus/mips_cdmm.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/bus/mips_cdmm.c b/drivers/bus/mips_cdmm.c
index 1b14256376d2..9f7ed1fcd428 100644
--- a/drivers/bus/mips_cdmm.c
+++ b/drivers/bus/mips_cdmm.c
@@ -13,6 +13,8 @@
 #include <linux/cpu.h>
 #include <linux/cpumask.h>
 #include <linux/io.h>
+#include <linux/of_address.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/smp.h>
@@ -337,9 +339,22 @@ static phys_addr_t mips_cdmm_cur_base(void)
  * Picking a suitable physical address at which to map the CDMM region is
  * platform specific, so this weak function can be overridden by platform
  * code to pick a suitable value if none is configured by the bootloader.
+ * By default this method tries to find a CDMM-specific node in the system
+ * dtb. Note that this won't work for early serial console.
  */
 phys_addr_t __weak mips_cdmm_phys_base(void)
 {
+	struct device_node *np;
+	struct resource res;
+	int err;
+
+	np = of_find_compatible_node(NULL, NULL, "mti,mips-cdmm");
+	if (np) {
+		err = of_address_to_resource(np, 0, &res);
+		if (!err)
+			return res.start;
+	}
+
 	return 0;
 }
 
-- 
2.26.2

