Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 250F8200CDB
	for <lists+linux-mips@lfdr.de>; Fri, 19 Jun 2020 16:52:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389327AbgFSOuh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 19 Jun 2020 10:50:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:43580 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389311AbgFSOuf (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 19 Jun 2020 10:50:35 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 417B120DD4;
        Fri, 19 Jun 2020 14:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592578235;
        bh=zwlOws2GadoztOB2aiNuInG59VzfDeL+ZhRhdn78KxI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=e0QJxnrTIWGMl+dzxSYQnG1KxK/T6/JhYSl2sb9RZU4Xh0SBLDmXuGrTPdkfOf0JV
         aoKyUrur3P6ZGJg9dbcU3H13HiGXfUgx9v517e6dBDnz0W2Md0hsVXjLuXtE4bhFBS
         MWyQvm6gqLZqDHHJkhkIeQ8dfUJiHux5ahGzTM0U=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-kernel@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        stable@vger.kernel.org,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Georgy Vlasov <Georgy.Vlasov@baikalelectronics.ru>,
        Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Feng Tang <feng.tang@intel.com>,
        Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        Sasha Levin <sashal@kernel.org>
Subject: [PATCH 4.14 136/190] spi: dw: Return any value retrieved from the dma_transfer callback
Date:   Fri, 19 Jun 2020 16:33:01 +0200
Message-Id: <20200619141640.426662883@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200619141633.446429600@linuxfoundation.org>
References: <20200619141633.446429600@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Serge Semin <Sergey.Semin@baikalelectronics.ru>

[ Upstream commit f0410bbf7d0fb80149e3b17d11d31f5b5197873e ]

DW APB SSI DMA-part of the driver may need to perform the requested
SPI-transfer synchronously. In that case the dma_transfer() callback
will return 0 as a marker of the SPI transfer being finished so the
SPI core doesn't need to wait and may proceed with the SPI message
trasnfers pumping procedure. This will be needed to fix the problem
when DMA transactions are finished, but there is still data left in
the SPI Tx/Rx FIFOs being sent/received. But for now make dma_transfer
to return 1 as the normal dw_spi_transfer_one() method.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Georgy Vlasov <Georgy.Vlasov@baikalelectronics.ru>
Cc: Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Feng Tang <feng.tang@intel.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: linux-mips@vger.kernel.org
Cc: devicetree@vger.kernel.org
Link: https://lore.kernel.org/r/20200529131205.31838-3-Sergey.Semin@baikalelectronics.ru
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/spi/spi-dw-mid.c | 2 +-
 drivers/spi/spi-dw.c     | 7 ++-----
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/spi/spi-dw-mid.c b/drivers/spi/spi-dw-mid.c
index c4244d2f1ee3..cb268cc4ba2b 100644
--- a/drivers/spi/spi-dw-mid.c
+++ b/drivers/spi/spi-dw-mid.c
@@ -274,7 +274,7 @@ static int mid_spi_dma_transfer(struct dw_spi *dws, struct spi_transfer *xfer)
 		dma_async_issue_pending(dws->txchan);
 	}
 
-	return 0;
+	return 1;
 }
 
 static void mid_spi_dma_stop(struct dw_spi *dws)
diff --git a/drivers/spi/spi-dw.c b/drivers/spi/spi-dw.c
index 9fcee7273a79..d2428a8809c1 100644
--- a/drivers/spi/spi-dw.c
+++ b/drivers/spi/spi-dw.c
@@ -384,11 +384,8 @@ static int dw_spi_transfer_one(struct spi_master *master,
 
 	spi_enable_chip(dws, 1);
 
-	if (dws->dma_mapped) {
-		ret = dws->dma_ops->dma_transfer(dws, transfer);
-		if (ret < 0)
-			return ret;
-	}
+	if (dws->dma_mapped)
+		return dws->dma_ops->dma_transfer(dws, transfer);
 
 	if (chip->poll_mode)
 		return poll_transfer(dws);
-- 
2.25.1



