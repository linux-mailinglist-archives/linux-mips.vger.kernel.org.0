Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E55C15EC9C
	for <lists+linux-mips@lfdr.de>; Fri, 14 Feb 2020 18:29:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394652AbgBNR2Z (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 14 Feb 2020 12:28:25 -0500
Received: from out28-221.mail.aliyun.com ([115.124.28.221]:38590 "EHLO
        out28-221.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391144AbgBNR2W (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 14 Feb 2020 12:28:22 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07512346|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.63799-0.012238-0.349772;DS=CONTINUE|ham_system_inform|0.345318-0.00103386-0.653648;FP=0|0|0|0|0|-1|-1|-1;HT=e01l07440;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=9;RT=9;SR=0;TI=SMTPD_---.Go9djQb_1581701284;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.Go9djQb_1581701284)
          by smtp.aliyun-inc.com(10.147.41.231);
          Sat, 15 Feb 2020 01:28:17 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, paul@crapouillou.net,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com
Subject: [PATCH v5 1/6] clk: Ingenic: Remove unnecessary spinlock when reading registers.
Date:   Sat, 15 Feb 2020 01:27:37 +0800
Message-Id: <1581701262-110556-3-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581701262-110556-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1581701262-110556-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

It is not necessary to use spinlock when reading registers,
so remove it from cgu.c.

Suggested-by: Paul Cercueil <paul@crapouillou.net>
Suggested-by: Paul Burton <paulburton@kernel.org>
Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---

Notes:
    v2:
    New patch.
    
    v2->v3:
    Adjust order from [5/5] in v2 to [1/5] in v3.
    
    v3->v4:
    Remove the spinlock around ingenic_cgu_gate_get().
    
    v4->v5:
    Rebase on top of kernel 5.6-rc1.

 drivers/clk/ingenic/cgu.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/clk/ingenic/cgu.c b/drivers/clk/ingenic/cgu.c
index 6e96303..ab1302a 100644
--- a/drivers/clk/ingenic/cgu.c
+++ b/drivers/clk/ingenic/cgu.c
@@ -76,16 +76,13 @@ ingenic_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 	const struct ingenic_cgu_pll_info *pll_info;
 	unsigned m, n, od_enc, od;
 	bool bypass;
-	unsigned long flags;
 	u32 ctl;
 
 	clk_info = &cgu->clock_info[ingenic_clk->idx];
 	BUG_ON(clk_info->type != CGU_CLK_PLL);
 	pll_info = &clk_info->pll;
 
-	spin_lock_irqsave(&cgu->lock, flags);
 	ctl = readl(cgu->base + pll_info->reg);
-	spin_unlock_irqrestore(&cgu->lock, flags);
 
 	m = (ctl >> pll_info->m_shift) & GENMASK(pll_info->m_bits - 1, 0);
 	m += pll_info->m_offset;
@@ -259,12 +256,9 @@ static int ingenic_pll_is_enabled(struct clk_hw *hw)
 	struct ingenic_cgu *cgu = ingenic_clk->cgu;
 	const struct ingenic_cgu_clk_info *clk_info = to_clk_info(ingenic_clk);
 	const struct ingenic_cgu_pll_info *pll_info = &clk_info->pll;
-	unsigned long flags;
 	u32 ctl;
 
-	spin_lock_irqsave(&cgu->lock, flags);
 	ctl = readl(cgu->base + pll_info->reg);
-	spin_unlock_irqrestore(&cgu->lock, flags);
 
 	return !!(ctl & BIT(pll_info->enable_bit));
 }
@@ -562,16 +556,12 @@ static int ingenic_clk_is_enabled(struct clk_hw *hw)
 	struct ingenic_clk *ingenic_clk = to_ingenic_clk(hw);
 	struct ingenic_cgu *cgu = ingenic_clk->cgu;
 	const struct ingenic_cgu_clk_info *clk_info;
-	unsigned long flags;
 	int enabled = 1;
 
 	clk_info = &cgu->clock_info[ingenic_clk->idx];
 
-	if (clk_info->type & CGU_CLK_GATE) {
-		spin_lock_irqsave(&cgu->lock, flags);
+	if (clk_info->type & CGU_CLK_GATE)
 		enabled = !ingenic_cgu_gate_get(cgu, &clk_info->gate);
-		spin_unlock_irqrestore(&cgu->lock, flags);
-	}
 
 	return enabled;
 }
-- 
2.7.4

