Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81FE3324CA2
	for <lists+linux-mips@lfdr.de>; Thu, 25 Feb 2021 10:20:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234738AbhBYJT2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 25 Feb 2021 04:19:28 -0500
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132]:57035 "EHLO
        out30-132.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235525AbhBYJQH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 25 Feb 2021 04:16:07 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R211e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04394;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0UPXLIzy_1614244524;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0UPXLIzy_1614244524)
          by smtp.aliyun-inc.com(127.0.0.1);
          Thu, 25 Feb 2021 17:15:24 +0800
From:   Yang Li <yang.lee@linux.alibaba.com>
To:     paul@crapouillou.net
Cc:     linus.walleij@linaro.org, linux-mips@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH] pinctrl: ingenic: add missing call to of_node_put()
Date:   Thu, 25 Feb 2021 17:15:22 +0800
Message-Id: <1614244522-64464-1-git-send-email-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In one of the error paths of the for_each_child_of_node() loop in
ingenic_gpio_probe, add missing call to of_node_put().

Fix the following coccicheck warning:
./drivers/pinctrl/pinctrl-ingenic.c:2485:1-23: WARNING: Function
"for_each_child_of_node" should have of_node_put() before return around
line 2489.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/pinctrl/pinctrl-ingenic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index f274612..b7294a2 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -2486,6 +2486,7 @@ static int __init ingenic_pinctrl_probe(struct platform_device *pdev)
 		if (of_match_node(ingenic_gpio_of_match, node)) {
 			err = ingenic_gpio_probe(jzpc, node);
 			if (err)
+				of_node_put(node);
 				return err;
 		}
 	}
-- 
1.8.3.1

