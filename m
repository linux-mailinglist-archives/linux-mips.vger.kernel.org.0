Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 408AC303048
	for <lists+linux-mips@lfdr.de>; Tue, 26 Jan 2021 00:36:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732769AbhAYXgZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 25 Jan 2021 18:36:25 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:5580 "EHLO
        esa6.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732870AbhAYXgO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 25 Jan 2021 18:36:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1611617774; x=1643153774;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=J5Nh6XbO+rv4ltyfrH9y2HGfS5ss18cJZZOYPR3E7YU=;
  b=fL/R7KqAJ2veK1oC7BCkgNP5Hl8ub1k0YRMfep10ZmC8unQ5PUeQMf3r
   BcxZ2mpy4o90SXkqLS/5boVj9rQ2Ak8yBDOzWqqXLN5+p3F8mq6qhjPiG
   U51AZaSvDSHiUmpKarV+XQkDJ7dv3w9QDgGLvzM0owzYPFRU28loRUCVu
   5e8xPgWi/+UJQPH5KZlvnCa6gXAiT60Ngmtux4jZsj40h4a5XRmeKIyru
   qXpYjorWuJufTRL+nVu/AGrlWDM8PU0oAcl1KTv+etQ1jt99ljIPAkJIy
   H476P98jg6FtP8sujs78R6sGRZ6DCV+EfoTWLaT2wVkqbyc84zsAJC8Pi
   g==;
IronPort-SDR: 5PNXT20qukbG9wcG7aGuSfzOn6BHrxpWJiypHHHtxrzsY6VAjweypbfOjFkbH0Txp4TgYDEeOv
 7otFgR5487W0Zg/gct48fMCi7/PYzzt3D8Ma6qqBIkNtKsbivMXbOrU0nMFahVjS0rVZr+Rk1K
 wFYDkioOsUV4EsScpNhEGfIZmQ2/NGxb1s5zDkWGPKJVgbOzCV3U0jXMzSHSPZGM0CX0UWO2g9
 Xny79NWyyimm01pf62cq1pg+JWa4YjrbuaXhvXcTtejlaSB1CdLp2D9sFrTHKww98hO3Rh2mut
 Tn0=
X-IronPort-AV: E=Sophos;i="5.79,374,1602518400"; 
   d="scan'208";a="159472148"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 26 Jan 2021 07:32:56 +0800
IronPort-SDR: jQsH750BBmg8dnxTkUOFQYIeO2bYvnHUPLQI7PdF2kJiDDYSKAsNwzAqWVhYkFWz3cO2YWfjvB
 z+tUD/eWpvJEAVy6kMwJZHtscntb1OWstDX++J6Tykqj0vHfhFQdnogmJ6Mdl+u+MgevMBTLwC
 VuLsJE5Vr+YCCpn5BAhbgoPFkmPDgLH0JnoADQt27KTRmjrQPMn2iLNb9F7XWRGAQnRddPyzCS
 bg564qkcbMfxNKdoi/TF6hf5XC0iehnecyEDCkj07VrZDLHLUZQi0KcImoHZrOMdo2P2uRl2E8
 pHfdXwq5jm6AakgAVenrHSbL
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2021 15:15:22 -0800
IronPort-SDR: Bg7P0DPkHkgl64EdlwfbKutdxVwqv61t0M+bcK5sGmfBSQYOuZDOXDNXwyFItyZrTjAWfUZq4y
 WI4cjbXBkyjhKq/fyJQHOLLWws+uvLdwyJ+OMATEDEN/ldsM/b47TTrcCfEirSrYBJF3Y+mcz8
 D4E1P3XTHbQsR2jVZ4/9gK/HgcYM09JiVbicH956GDLqjbVMpUxxQ/kY7ZehzcbIJzUQFgzd9g
 KkAe1W7oWSDYs6OmKCXUUO5CRb4/MfkFD/3Dvr+Mzxe0KQP8njmbdyG6kIEhNyMvFB986+CmOP
 78g=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
  by uls-op-cesaip02.wdc.com with ESMTP; 25 Jan 2021 15:32:55 -0800
From:   Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, axboe@kernel.dk,
        linux-block@vger.kernel.org, cand@gmx.com,
        Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
Subject: [PATCH 2/9] n64: move module info at the end
Date:   Mon, 25 Jan 2021 15:32:36 -0800
Message-Id: <20210125233243.5982-3-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210125233243.5982-1-chaitanya.kulkarni@wdc.com>
References: <20210125233243.5982-1-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Move the module auth, description, and license at the end of the file
just like what we have for the other modules.

Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
Reviewed-by: Lauri Kasanen <cand@gmx.com>
---
 drivers/block/n64cart.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/block/n64cart.c b/drivers/block/n64cart.c
index 8c7c9249071b..63090030ed2b 100644
--- a/drivers/block/n64cart.c
+++ b/drivers/block/n64cart.c
@@ -13,10 +13,6 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 
-MODULE_AUTHOR("Lauri Kasanen <cand@gmx.com>");
-MODULE_DESCRIPTION("Driver for the N64 cart");
-MODULE_LICENSE("GPL");
-
 static unsigned int start, size;
 static u32 __iomem *reg_base;
 static struct device *dev;
@@ -188,3 +184,7 @@ module_param(size, uint, 0);
 MODULE_PARM_DESC(size, "Size of the cart block data, in bytes");
 
 module_init(n64cart_init);
+
+MODULE_AUTHOR("Lauri Kasanen <cand@gmx.com>");
+MODULE_DESCRIPTION("Driver for the N64 cart");
+MODULE_LICENSE("GPL");
-- 
2.22.1

