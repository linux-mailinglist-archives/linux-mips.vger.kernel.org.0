Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E1E230303D
	for <lists+linux-mips@lfdr.de>; Tue, 26 Jan 2021 00:35:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732441AbhAYXeu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 25 Jan 2021 18:34:50 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:19917 "EHLO
        esa4.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732923AbhAYXej (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 25 Jan 2021 18:34:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1611617678; x=1643153678;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5m9gUeokQN0sy90fPToB0a5giSO64cwa9Bxli7WeYwc=;
  b=EtV7DVtts7UEloCnOblpfyxv+Ci/68HyeeLKqvoFk4JOLt43eEzIQF3G
   t7LBUWoXAQzIqUENSWHbUp/tLQfMG5KcBO/EFMXWIDCQbapAEQbnSeSqH
   rjOHiNo4caGkFoGB2irU4gZGs62aLt8IbElyK7rHhVxaBmekV3p5STy1W
   56ax6JKWNXqFgWwF5Mqej/apkk1mCmRHwQ7W2zRouM+lelLOewjyRA+nK
   O7OBH1O4tW1T9wHCMoch3bqYBC8+uaFtycNzXZNt+PE94tYMKO7m419Dv
   pF8N3HRG7G/gKZVQwCRh2q43zJQXsCd9reKero2zopXd0kvodhUkoJGMk
   w==;
IronPort-SDR: 2wMObJ2QjSHImr75N6JJHXwqbI0oX1UTdsmxr2ZWF1RvaMbEEAxmmJWA5/iVHlExMROmd7DgBZ
 6MWuwetb/hpQpeFpWoCO+2nMXbF+LxYt73X6srjnEdaL782Ed8i1RHKAKYJrWiUIcltRHLOSy3
 S/vnTMMGuNyf1cZzMnEmdgHmF2a5FKgP8IJUaQpA7Oj+20Zf5+Onr614LkIngKdU3qkl6txLHQ
 SsBBocAx9nd8bM3/1k8pE7fnZhGb9gdUvNOdmm8RsUpl/YkI+YTrL9uqczaNiF0EwPHoktp07x
 L/Y=
X-IronPort-AV: E=Sophos;i="5.79,374,1602518400"; 
   d="scan'208";a="158296159"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 26 Jan 2021 07:33:00 +0800
IronPort-SDR: aztBhC5gHG0ZQpObWF56ODASP2B6OmH/eoRcYeYTsDInYC3Z9saNuvL2qqkRxUt3oo9uI7V5p/
 h2dwwZfGY59rPo308kNvhO054/A06H18MWknp1jmXbK2XgB/QrNs/oUZt9/t/9+0yl3iqGAkem
 8XrD9nkleG6z4i+EfClBXAMp3OIR3XwV9m68F2c6x52YkU/gopnZA3wHwG4ykG9GdfsWDjrZbT
 aQwwyMOEHq3mll9J973F/Y0BYO++8nYrYDRPq59l7Dtu4pY/tMAlp/UyrWb2HMG2Mgt9+1kSW6
 P45WUx1OMCSJB1ms3a1uaZuc
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2021 15:15:27 -0800
IronPort-SDR: tx6bo1E7gstAcB8yskVCrUkZDUZlx+a/G5jMGhk7gchHRsQ4SryEqx4VzqO3m2u2UYIO5IlCKg
 M22LSJ3viGNCmqN1A8fjke5LrbsE5/kafCgfnXyQaI47Z1fmc8ViT94nbNXsZZI2Tyh21OzFtk
 09J2D7iz0hJNM2PSI6U7TzZwHtpTpRh7hQNUoZK3TDBFO+Aq5QPzUORZZ4oGBBqWkI2hZrQc2P
 26yXgP/bp+csRArNPxk3NYo0FxIGIH56VeJ6gHeBEDcNNa/4BUJ54mUa5lSt/3LlrbW+ByBpA5
 Rfo=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
  by uls-op-cesaip02.wdc.com with ESMTP; 25 Jan 2021 15:33:00 -0800
From:   Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, axboe@kernel.dk,
        linux-block@vger.kernel.org, cand@gmx.com,
        Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
Subject: [PATCH 3/9] n64: move module param at the top
Date:   Mon, 25 Jan 2021 15:32:37 -0800
Message-Id: <20210125233243.5982-4-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210125233243.5982-1-chaitanya.kulkarni@wdc.com>
References: <20210125233243.5982-1-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Move module parameters at the top of the file after macro definition &
global variables below macro definitions just like we have for other
modules.

Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
Reviewed-by: Lauri Kasanen <cand@gmx.com>
---
 drivers/block/n64cart.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/block/n64cart.c b/drivers/block/n64cart.c
index 63090030ed2b..b18f034ee1ad 100644
--- a/drivers/block/n64cart.c
+++ b/drivers/block/n64cart.c
@@ -13,10 +13,6 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 
-static unsigned int start, size;
-static u32 __iomem *reg_base;
-static struct device *dev;
-
 #define PI_DRAM_REG		0
 #define PI_CART_REG		1
 #define PI_READ_REG		2
@@ -31,6 +27,17 @@ static struct device *dev;
 
 #define MIN_ALIGNMENT		8
 
+static u32 __iomem *reg_base;
+static struct device *dev;
+
+static unsigned int start;
+module_param(start, uint, 0);
+MODULE_PARM_DESC(start, "Start address of the cart block data");
+
+static unsigned int size;
+module_param(size, uint, 0);
+MODULE_PARM_DESC(size, "Size of the cart block data, in bytes");
+
 static void n64cart_write_reg(const u8 reg, const u32 value)
 {
 	writel(value, reg_base + reg);
@@ -177,12 +184,6 @@ static int __init n64cart_init(void)
 	return platform_driver_probe(&n64cart_driver, n64cart_probe);
 }
 
-module_param(start, uint, 0);
-MODULE_PARM_DESC(start, "Start address of the cart block data");
-
-module_param(size, uint, 0);
-MODULE_PARM_DESC(size, "Size of the cart block data, in bytes");
-
 module_init(n64cart_init);
 
 MODULE_AUTHOR("Lauri Kasanen <cand@gmx.com>");
-- 
2.22.1

