Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6910025870F
	for <lists+linux-mips@lfdr.de>; Tue,  1 Sep 2020 06:55:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726020AbgIAEzm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Sep 2020 00:55:42 -0400
Received: from zg8tmja5ljk3lje4mi4ymjia.icoremail.net ([209.97.182.222]:40465
        "HELO zg8tmja5ljk3lje4mi4ymjia.icoremail.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with SMTP id S1725930AbgIAEzl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 1 Sep 2020 00:55:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=whu.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
        Message-Id:MIME-Version:Content-Transfer-Encoding; bh=Y2iMIh38YX
        l0OjQcjskcFkG9csDpwgIRbym6QZwh6go=; b=cWeYUvoecaqN2IWdZVMCGx7oWE
        MNxakxqj5QO0uyjUBB16vCAZzKIUMyUoRnxF0lNRIcMgKIhm7s5uu5pN9Psd94WS
        qPOLDRKY/BvDF+AmIdn2X4crTVojCl17IT07ky3T9+FKaS8DUqTcpPxaZIIWqH5I
        h5fMW5mYWpgVYvUzY=
Received: from zbook.lan (unknown [223.214.144.166])
        by email1 (Coremail) with SMTP id AQBjCgAnL_ND1E1fny9PAA--.27134S4;
        Tue, 01 Sep 2020 12:55:33 +0800 (CST)
From:   Tong Chen <tongchen@whu.edu.cn>
To:     tongchen126@gmail.com
Cc:     john@phrozen.org, tsbogend@alpha.franken.de,
        linux-mips@vger.kernel.org, Tong Chen <tongchen@whu.edu.cn>
Subject: [PATCH] MIPS: Fixup for Pontential NULL pointer dereference
Date:   Tue,  1 Sep 2020 12:55:30 +0800
Message-Id: <20200901045530.12969-1-tongchen@whu.edu.cn>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQBjCgAnL_ND1E1fny9PAA--.27134S4
X-Coremail-Antispam: 1UD129KBjvJXoW7ZrW7ur48WF15ZFWrCFy7GFg_yoW8KF17pa
        1vyFs3tw43AF1UAFyUJFZ7Ww1DZr4UKa4UA34DKas7u3sIqrykJa95GFyUAayrZrWkKF4f
        Gr1jqFWFvF4UCr7anT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBq14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
        0DM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAq
        x4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6x
        CaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY
        1x0262kKe7AKxVWUAVWUtwCY02Avz4vE14v_Gryl42xK82IYc2Ij64vIr41l4I8I3I0E4I
        kC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
        0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMI
        IF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF
        0xvE42xK8VAvwI8IcIk0rVW3JVWrJr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z2
        80aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUUItC7UUUUU==
X-CM-SenderInfo: ysqrljaqrviiqrtvq4lkxovvfxof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This is a fixup In-Reply-To Bug 200577,
where pontential null pointer dereference may occur.
Signed-off-by: Tong Chen <tongchen@whu.edu.cn>
---
 arch/mips/lantiq/xway/gptu.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/arch/mips/lantiq/xway/gptu.c b/arch/mips/lantiq/xway/gptu.c
index 3d5683e75cf1..3c4253e64541 100644
--- a/arch/mips/lantiq/xway/gptu.c
+++ b/arch/mips/lantiq/xway/gptu.c
@@ -117,11 +117,12 @@ static void gptu_disable(struct clk *clk)
 	free_irq(irqres[clk->bits].start, NULL);
 }
 
-static inline void clkdev_add_gptu(struct device *dev, const char *con,
+static inline int clkdev_add_gptu(struct device *dev, const char *con,
 							unsigned int timer)
 {
 	struct clk *clk = kzalloc(sizeof(struct clk), GFP_KERNEL);
-
+	if (!clk)
+		return 0;
 	clk->cl.dev_id = dev_name(dev);
 	clk->cl.con_id = con;
 	clk->cl.clk = clk;
@@ -129,12 +130,14 @@ static inline void clkdev_add_gptu(struct device *dev, const char *con,
 	clk->disable = gptu_disable;
 	clk->bits = timer;
 	clkdev_add(&clk->cl);
+	return 1;
 }
 
 static int gptu_probe(struct platform_device *pdev)
 {
 	struct clk *clk;
 	struct resource *res;
+	int clk_num = 0;
 
 	if (of_irq_to_resource_table(pdev->dev.of_node, irqres, 6) != 6) {
 		dev_err(&pdev->dev, "Failed to get IRQ list\n");
@@ -169,14 +172,14 @@ static int gptu_probe(struct platform_device *pdev)
 	}
 
 	/* register the clocks */
-	clkdev_add_gptu(&pdev->dev, "timer1a", TIMER1A);
-	clkdev_add_gptu(&pdev->dev, "timer1b", TIMER1B);
-	clkdev_add_gptu(&pdev->dev, "timer2a", TIMER2A);
-	clkdev_add_gptu(&pdev->dev, "timer2b", TIMER2B);
-	clkdev_add_gptu(&pdev->dev, "timer3a", TIMER3A);
-	clkdev_add_gptu(&pdev->dev, "timer3b", TIMER3B);
-
-	dev_info(&pdev->dev, "gptu: 6 timers loaded\n");
+	clk_num += clkdev_add_gptu(&pdev->dev, "timer1a", TIMER1A);
+	clk_num += clkdev_add_gptu(&pdev->dev, "timer1b", TIMER1B);
+	clk_num += clkdev_add_gptu(&pdev->dev, "timer2a", TIMER2A);
+	clk_num += clkdev_add_gptu(&pdev->dev, "timer2b", TIMER2B);
+	clk_num += clkdev_add_gptu(&pdev->dev, "timer3a", TIMER3A);
+	clk_num += clkdev_add_gptu(&pdev->dev, "timer3b", TIMER3B);
+
+	dev_info(&pdev->dev, "gptu: %d timers loaded\n", clk_num);
 
 	return 0;
 }
-- 
2.28.0

