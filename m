Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F86B39BD29
	for <lists+linux-mips@lfdr.de>; Fri,  4 Jun 2021 18:32:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230130AbhFDQdu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 4 Jun 2021 12:33:50 -0400
Received: from out28-125.mail.aliyun.com ([115.124.28.125]:45623 "EHLO
        out28-125.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229675AbhFDQdt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 4 Jun 2021 12:33:49 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07497662|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0350521-0.000294154-0.964654;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047190;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=11;RT=11;SR=0;TI=SMTPD_---.KNfnAp8_1622824309;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.KNfnAp8_1622824309)
          by smtp.aliyun-inc.com(10.147.41.138);
          Sat, 05 Jun 2021 00:31:57 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     daniel.lezcano@linaro.org, tglx@linutronix.de
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sihui.liu@ingenic.com,
        jun.jiang@ingenic.com, sernia.zhou@foxmail.com,
        paul@crapouillou.net
Subject: [PATCH v2 1/2] clocksource: Ingenic: Rename unreasonable array names.
Date:   Sat,  5 Jun 2021 00:31:45 +0800
Message-Id: <1622824306-30987-2-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622824306-30987-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1622824306-30987-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

1.Rename the "ingenic_ost_clk_info[]" to "x1000_ost_clk_info[]"
  to facilitate the addition of OST support for X2000 SoC in a
  later commit.
2.When the OST support for X2000 SoC is added, there will be two
  compatible strings, so renaming "ingenic_ost_of_match[]" to
  "ingenic_ost_of_matches[]" is more reasonable.
3.Remove the unnecessary comma in "ingenic_ost_of_matches[]" to
  reduce code size as much as possible.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---

Notes:
    v2:
    New patch.

 drivers/clocksource/ingenic-sysost.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clocksource/ingenic-sysost.c b/drivers/clocksource/ingenic-sysost.c
index e77d584..a129840 100644
--- a/drivers/clocksource/ingenic-sysost.c
+++ b/drivers/clocksource/ingenic-sysost.c
@@ -186,7 +186,7 @@ static const struct clk_ops ingenic_ost_global_timer_ops = {
 
 static const char * const ingenic_ost_clk_parents[] = { "ext" };
 
-static const struct ingenic_ost_clk_info ingenic_ost_clk_info[] = {
+static const struct ingenic_ost_clk_info x1000_ost_clk_info[] = {
 	[OST_CLK_PERCPU_TIMER] = {
 		.init_data = {
 			.name = "percpu timer",
@@ -414,14 +414,14 @@ static const struct ingenic_soc_info x1000_soc_info = {
 	.num_channels = 2,
 };
 
-static const struct of_device_id __maybe_unused ingenic_ost_of_match[] __initconst = {
-	{ .compatible = "ingenic,x1000-ost", .data = &x1000_soc_info, },
+static const struct of_device_id __maybe_unused ingenic_ost_of_matches[] __initconst = {
+	{ .compatible = "ingenic,x1000-ost", .data = &x1000_soc_info },
 	{ /* sentinel */ }
 };
 
 static int __init ingenic_ost_probe(struct device_node *np)
 {
-	const struct of_device_id *id = of_match_node(ingenic_ost_of_match, np);
+	const struct of_device_id *id = of_match_node(ingenic_ost_of_matches, np);
 	struct ingenic_ost *ost;
 	unsigned int i;
 	int ret;
@@ -462,7 +462,7 @@ static int __init ingenic_ost_probe(struct device_node *np)
 	ost->clocks->num = ost->soc_info->num_channels;
 
 	for (i = 0; i < ost->clocks->num; i++) {
-		ret = ingenic_ost_register_clock(ost, i, &ingenic_ost_clk_info[i], ost->clocks);
+		ret = ingenic_ost_register_clock(ost, i, &x1000_ost_clk_info[i], ost->clocks);
 		if (ret) {
 			pr_crit("%s: Cannot register clock %d\n", __func__, i);
 			goto err_unregister_ost_clocks;
-- 
2.7.4

