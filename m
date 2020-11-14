Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A14FD2B2D4A
	for <lists+linux-mips@lfdr.de>; Sat, 14 Nov 2020 14:17:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726861AbgKNNQn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 14 Nov 2020 08:16:43 -0500
Received: from vultr.net.flygoat.com ([149.28.68.211]:49244 "EHLO
        vultr.net.flygoat.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbgKNNQn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 14 Nov 2020 08:16:43 -0500
X-Greylist: delayed 425 seconds by postgrey-1.27 at vger.kernel.org; Sat, 14 Nov 2020 08:16:42 EST
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 87E091F9D6;
        Sat, 14 Nov 2020 13:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1605359378; bh=mMIE2hN/JfHnSDIQ/zpBJ/qacpl8m9Gr7aP3uk2YC9I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=i9mgL68P0U9dlr62Gdcse55woqmp+FtROAJRCJOKKd93m1F4rqUeKZQ0LoD8/4aHI
         hJKVNdqJke7New4w3SVHYegzEc2n4E0nwZNdYC+4C7xXOQY/5a23t+X7X6bXsxGJLL
         OKynERJ7Kw22f1xqUSlOloiNxmjnG9VyfP0WsvWm6u3Z5zmR71sUNa11Ippn10uE1S
         ZCKCYrxYnnXbYzXtBZjl++vS0asaSAnFMMIbTqSt8bfW7MK0Jym7nSeULKT0q1wqaq
         EdMi8lvhTo3WnXK8IViHvYfkGVg8R9kMRV5G3u7bKbeRUa770LEAaGwL1+UcyUYkhK
         4IVEcDb83kRSA==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: [PATCH 1/2] rtc: goldfish: Remove GOLDFISH dependency
Date:   Sat, 14 Nov 2020 21:09:20 +0800
Message-Id: <20201114130921.651882-2-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201114130921.651882-1-jiaxun.yang@flygoat.com>
References: <20201114130921.651882-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Goldfish platform is covered with dust.
However the goldfish-rtc had been used as virtualized RTC
in QEMU for RISC-V virt hw and MIPS loongson3-virt hw, thus
we can drop other parts of goldfish but leave goldfish-rtc here.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 drivers/rtc/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 65ad9d0b47ab..f784b52381b1 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1935,7 +1935,6 @@ config RTC_DRV_HID_SENSOR_TIME
 config RTC_DRV_GOLDFISH
 	tristate "Goldfish Real Time Clock"
 	depends on OF && HAS_IOMEM
-	depends on GOLDFISH || COMPILE_TEST
 	help
 	  Say yes to enable RTC driver for the Goldfish based virtual platform.
 
-- 
2.29.2

