Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6930F3F3D4D
	for <lists+linux-mips@lfdr.de>; Sun, 22 Aug 2021 05:37:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232322AbhHVDhr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 21 Aug 2021 23:37:47 -0400
Received: from cmccmta2.chinamobile.com ([221.176.66.80]:25932 "EHLO
        cmccmta2.chinamobile.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232192AbhHVDhq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 21 Aug 2021 23:37:46 -0400
X-Greylist: delayed 560 seconds by postgrey-1.27 at vger.kernel.org; Sat, 21 Aug 2021 23:37:45 EDT
Received: from spf.mail.chinamobile.com (unknown[172.16.121.5]) by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86121c43071f-f215e; Sun, 22 Aug 2021 11:27:45 +0800 (CST)
X-RM-TRANSID: 2ee86121c43071f-f215e
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.22.250.151])
        by rmsmtp-syy-appsvr03-12003 (RichMail) with SMTP id 2ee36121c429ec8-65213;
        Sun, 22 Aug 2021 11:27:44 +0800 (CST)
X-RM-TRANSID: 2ee36121c429ec8-65213
From:   Tang Bin <tangbin@cmss.chinamobile.com>
To:     gregkh@linuxfoundation.org, paul@crapouillou.net,
        jirislaby@kernel.org, ldewangan@nvidia.com,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux@prisktech.co.nz
Cc:     linux-mips@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Tang Bin <tangbin@cmss.chinamobile.com>,
        Zhang Shengju <zhangshengju@cmss.chinamobile.com>
Subject: [PATCH 1/3] serial: 8250_ingenic: Use of_device_get_match_data
Date:   Sun, 22 Aug 2021 11:28:04 +0800
Message-Id: <20210822032806.3256-2-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.20.1.windows.1
In-Reply-To: <20210822032806.3256-1-tangbin@cmss.chinamobile.com>
References: <20210822032806.3256-1-tangbin@cmss.chinamobile.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Retrieve OF match data, it's better and cleaner to use
'of_device_get_match_data' over 'of_match_device'.

Signed-off-by: Zhang Shengju <zhangshengju@cmss.chinamobile.com>
Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 drivers/tty/serial/8250/8250_ingenic.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_ingenic.c b/drivers/tty/serial/8250/8250_ingenic.c
index 988bf6bcc..65402d05e 100644
--- a/drivers/tty/serial/8250/8250_ingenic.c
+++ b/drivers/tty/serial/8250/8250_ingenic.c
@@ -209,16 +209,14 @@ static int ingenic_uart_probe(struct platform_device *pdev)
 	struct uart_8250_port uart = {};
 	struct ingenic_uart_data *data;
 	const struct ingenic_uart_config *cdata;
-	const struct of_device_id *match;
 	struct resource *regs;
 	int irq, err, line;
 
-	match = of_match_device(of_match, &pdev->dev);
-	if (!match) {
+	cdata = of_device_get_match_data(&pdev->dev);
+	if (!cdata) {
 		dev_err(&pdev->dev, "Error: No device match found\n");
 		return -ENODEV;
 	}
-	cdata = match->data;
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
-- 
2.20.1.windows.1



