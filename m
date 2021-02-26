Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0927325B55
	for <lists+linux-mips@lfdr.de>; Fri, 26 Feb 2021 02:35:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229492AbhBZBfm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 25 Feb 2021 20:35:42 -0500
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133]:42630 "EHLO
        out30-133.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229460AbhBZBfm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 25 Feb 2021 20:35:42 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R711e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04395;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0UPaxE1n_1614303299;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0UPaxE1n_1614303299)
          by smtp.aliyun-inc.com(127.0.0.1);
          Fri, 26 Feb 2021 09:34:59 +0800
From:   Yang Li <yang.lee@linux.alibaba.com>
To:     paul@crapouillou.net
Cc:     linus.walleij@linaro.org, linux-mips@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH v2] pinctrl: ingenic: add missing call to of_node_put()
Date:   Fri, 26 Feb 2021 09:34:57 +0800
Message-Id: <1614303297-24178-1-git-send-email-yang.lee@linux.alibaba.com>
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

Changes in v2:
-add braces for if

 drivers/pinctrl/pinctrl-ingenic.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index f274612..c8ecd01 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -2485,8 +2485,10 @@ static int __init ingenic_pinctrl_probe(struct platform_device *pdev)
 	for_each_child_of_node(dev->of_node, node) {
 		if (of_match_node(ingenic_gpio_of_match, node)) {
 			err = ingenic_gpio_probe(jzpc, node);
-			if (err)
+			if (err) {
+				of_node_put(node);
 				return err;
+			}
 		}
 	}
 
-- 
1.8.3.1

