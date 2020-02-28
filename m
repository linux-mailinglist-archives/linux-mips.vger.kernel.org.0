Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A307717392A
	for <lists+linux-mips@lfdr.de>; Fri, 28 Feb 2020 15:01:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726758AbgB1N6b (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 28 Feb 2020 08:58:31 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.80]:14830 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726642AbgB1N6b (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 28 Feb 2020 08:58:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1582898308;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=Lg2vjJyPeK3SdOkL22G/V755a2Cx89sCodyhANXZ7FE=;
        b=ZaecqM0nrZ1pntXILB9tp0ZDdg9DJ6VndQrMNVCos3hB36cEL8Y7AJ6Pc9FOYBCZeF
        1V8d573NglW9+mViklC+GrYS8tfO8lj6SViiFDyqIXIU3ZwvJfVlbJm0Jr30t0rvbvyl
        2UDHRpcLjxFM/DUe8rHd4wAWdtIZ809rUODs5tRa0v+tuPM5nhK5MlffFouMMUjj1NO0
        5+y7NvX2PB3wwy2Cy0WmjX83P+9cVlhS2jy18SIKUrwJk6fWA7NajqcOTOKIpYRZEsDq
        7ANTgDcVnklV34gHecoTTP4M7RdBl1uYJv2O8wrTEu4IY3s6gqqW0dTVrX+DT1IUZp3v
        j7vw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH6G1+ULkA="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.2.0 DYNA|AUTH)
        with ESMTPSA id y0a02cw1SDwP1A5
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Fri, 28 Feb 2020 14:58:25 +0100 (CET)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Paul Cercueil <paul@crapouillou.net>,
        Mathieu Malaterre <malat@debian.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Andi Kleen <ak@linux.intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com
Subject: [PATCH v7 1/7] memory: jz4780_nemc: Only request IO memory the driver will use
Date:   Fri, 28 Feb 2020 14:58:17 +0100
Message-Id: <551a8560261543c1decb1d4d1671ec4b7fa52fdb.1582898302.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1582898302.git.hns@goldelico.com>
References: <cover.1582898302.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Paul Cercueil <paul@crapouillou.net>

The driver only uses the registers up to offset 0x54. Since the EFUSE
registers are in the middle of the NEMC registers, we only request
the registers we will use for now - that way the EFUSE driver can
probe too.

Tested-by: H. Nikolaus Schaller <hns@goldelico.com>
Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/memory/jz4780-nemc.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/memory/jz4780-nemc.c b/drivers/memory/jz4780-nemc.c
index b232ed279fc3..647267ea8c63 100644
--- a/drivers/memory/jz4780-nemc.c
+++ b/drivers/memory/jz4780-nemc.c
@@ -8,6 +8,7 @@
 
 #include <linux/clk.h>
 #include <linux/init.h>
+#include <linux/io.h>
 #include <linux/math64.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -288,7 +289,19 @@ static int jz4780_nemc_probe(struct platform_device *pdev)
 	nemc->dev = dev;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	nemc->base = devm_ioremap_resource(dev, res);
+
+	/*
+	 * The driver only uses the registers up to offset 0x54. Since the EFUSE
+	 * registers are in the middle of the NEMC registers, we only request
+	 * the registers we will use for now - that way the EFUSE driver can
+	 * probe too.
+	 */
+	if (!devm_request_mem_region(dev, res->start, 0x54, dev_name(dev))) {
+		dev_err(dev, "unable to request I/O memory region\n");
+		return -EBUSY;
+	}
+
+	nemc->base = devm_ioremap(dev, res->start, resource_size(res));
 	if (IS_ERR(nemc->base)) {
 		dev_err(dev, "failed to get I/O memory\n");
 		return PTR_ERR(nemc->base);
-- 
2.23.0

