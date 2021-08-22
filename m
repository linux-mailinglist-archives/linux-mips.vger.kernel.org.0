Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F20A23F3D4F
	for <lists+linux-mips@lfdr.de>; Sun, 22 Aug 2021 05:37:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232207AbhHVDhs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 21 Aug 2021 23:37:48 -0400
Received: from cmccmta2.chinamobile.com ([221.176.66.80]:7995 "EHLO
        cmccmta2.chinamobile.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232276AbhHVDhs (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 21 Aug 2021 23:37:48 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.5]) by rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee56121c433c33-f2661; Sun, 22 Aug 2021 11:27:48 +0800 (CST)
X-RM-TRANSID: 2ee56121c433c33-f2661
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.22.250.151])
        by rmsmtp-syy-appsvr03-12003 (RichMail) with SMTP id 2ee36121c429ec8-65220;
        Sun, 22 Aug 2021 11:27:48 +0800 (CST)
X-RM-TRANSID: 2ee36121c429ec8-65220
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
Subject: [PATCH 3/3] serial: vt8500: Use of_device_get_match_data
Date:   Sun, 22 Aug 2021 11:28:06 +0800
Message-Id: <20210822032806.3256-4-tangbin@cmss.chinamobile.com>
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
 drivers/tty/serial/vt8500_serial.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/tty/serial/vt8500_serial.c b/drivers/tty/serial/vt8500_serial.c
index c5edd56ff..e15b2bf69 100644
--- a/drivers/tty/serial/vt8500_serial.c
+++ b/drivers/tty/serial/vt8500_serial.c
@@ -623,17 +623,14 @@ static int vt8500_serial_probe(struct platform_device *pdev)
 	struct vt8500_port *vt8500_port;
 	struct resource *mmres, *irqres;
 	struct device_node *np = pdev->dev.of_node;
-	const struct of_device_id *match;
 	const unsigned int *flags;
 	int ret;
 	int port;
 
-	match = of_match_device(wmt_dt_ids, &pdev->dev);
-	if (!match)
+	flags = of_device_get_match_data(&pdev->dev);
+	if (!flags)
 		return -EINVAL;
 
-	flags = match->data;
-
 	mmres = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	irqres = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
 	if (!mmres || !irqres)
-- 
2.20.1.windows.1



