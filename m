Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5515E30304E
	for <lists+linux-mips@lfdr.de>; Tue, 26 Jan 2021 00:37:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732386AbhAYXgq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 25 Jan 2021 18:36:46 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:5731 "EHLO
        esa6.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732824AbhAYXgi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 25 Jan 2021 18:36:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1611617798; x=1643153798;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u3nLlME8qfr7Z4mJ4z3Lc1197XAsZU5OOL/6R2Ttjyk=;
  b=X7Rj5omlZ/SWNOa7Onr/nV4y7+p2lOmnBDQIqi7gJ4Wa4DT+XFsQafZ3
   LfrWjONR+FphYID/uvFwv/NXpVE2v6a8nyx3J4fMnw/kaGNSHr8biYd88
   vTVy1Bx8EkOlS7kfZ/9wfI6bLmrA3ZndSzvzZBjaK7YcT/2Jab3DQgwn5
   yBAJz01eAEyXe2RDzllNOGNC/7/MKzKP20LiYOc07/gNTHjZgYRItW1Dl
   UKOdNS3lGsdf39pXb4ySX0+rf/J1mz7vH7FIx453ocZh6rKeiMv2g2CFo
   R3dua+cb6OsjxLiRp/5d5OBT42GysFgjs8g64M2RP0fRaMQr+WBY15kKY
   w==;
IronPort-SDR: G3eVZmJux4XdIkxQqcD8w1tcmim/uZZix4CVfaOBgfWlAhFJdQlYdC7ZFMuChqTSOIllwitfO4
 lKFbnDGK7XOiYaRGAec0uKskM6f/DH8/uYCXxFo8cm7wF8CgjqQlV40asX4ct2DV7iSVF6WS19
 OxXhmwp7v/c+dAQiStRFvUT6nULBkl3kN7QXQLAzsyh5WP/zZqOxCChdRPYquS9LQis+kfHjMf
 dF17DK7LJCqLU1dLltA3moN2KsdPfvNsWtoLf6SY30NsSmlY8IsmhUK6hX/R0/CFRhsIMT+PgY
 X3g=
X-IronPort-AV: E=Sophos;i="5.79,374,1602518400"; 
   d="scan'208";a="159472155"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 26 Jan 2021 07:33:06 +0800
IronPort-SDR: 8k3RVkrEbbHaE1VcVctrg8MAVOLmN30wdZ1+qPKhzZxtNMcKlgTTBJ+2AaSDbBn+sgz/CMVwZZ
 3gBaCRYuyOXAtTa9BoqVPy6VxC2ay5KZ8XbEYtKfDZhev6d/24pec7GKd/XBNhnEU5RhtbpppK
 Vpcy5OKObgR2J4Mcwary4wgOCVnf/A/Z6/MSqxlyX55t5fA7c7yEpbEXEMLRBAp5P+cmU5Vnv9
 ND57BEGSEqwP5NdU0JwHo5Gc1gwBHAMTyhzbi1bH0zgRD2q41Ojg1WUc6taSZyQnaioyl33CIy
 05LQTIWfZwKAlOX65PFCxYr0
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2021 15:17:33 -0800
IronPort-SDR: yo7oXNN2lrYZFpZD6I7RWNcFGKdhwIDE/Ub299+V8sHqICebm5BaoOfVMdyZP0oCbPg6db68+C
 kWYNyzwxMk6oI4r9a06x8VjqEZOjp5hhw49Y5huLZ9X7w8EejhN5BylbrWBnjhie/Tp7TCnou/
 ROVmBsyP0LS7zgMYNoFQZQkivYH5xajdyE5hebEnSh5SvFcjRFzxWL6GuHDbuBx2jsZDMjlXaU
 1tTK6QqhSYPM3/AHUYXWEvivcQ1wZpk4EEzDKOXbXClospMEirLuxyFdbuYgOO0Nvyy/dhrRAT
 8ds=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
  by uls-op-cesaip02.wdc.com with ESMTP; 25 Jan 2021 15:33:06 -0800
From:   Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, axboe@kernel.dk,
        linux-block@vger.kernel.org, cand@gmx.com,
        Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
Subject: [PATCH 4/9] n64: use enums for reg
Date:   Mon, 25 Jan 2021 15:32:38 -0800
Message-Id: <20210125233243.5982-5-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210125233243.5982-1-chaitanya.kulkarni@wdc.com>
References: <20210125233243.5982-1-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Macros tend to be not type-safe. Use enum for register definitions.

Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
Reviewed-by: Lauri Kasanen <cand@gmx.com>
---
 drivers/block/n64cart.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/block/n64cart.c b/drivers/block/n64cart.c
index b18f034ee1ad..620f9e080d5d 100644
--- a/drivers/block/n64cart.c
+++ b/drivers/block/n64cart.c
@@ -13,11 +13,13 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 
-#define PI_DRAM_REG		0
-#define PI_CART_REG		1
-#define PI_READ_REG		2
-#define PI_WRITE_REG		3
-#define PI_STATUS_REG		4
+enum {
+	PI_DRAM_REG = 0,
+	PI_CART_REG,
+	PI_READ_REG,
+	PI_WRITE_REG,
+	PI_STATUS_REG,
+};
 
 #define PI_STATUS_DMA_BUSY	(1 << 0)
 #define PI_STATUS_IO_BUSY	(1 << 1)
-- 
2.22.1

