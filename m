Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D057395218
	for <lists+linux-mips@lfdr.de>; Sun, 30 May 2021 18:50:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229964AbhE3Qvy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 30 May 2021 12:51:54 -0400
Received: from aposti.net ([89.234.176.197]:33464 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229818AbhE3Qvu (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 30 May 2021 12:51:50 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        list@opendingux.net,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 5/6] clk: ingenic: Support overriding PLLs M/N/OD calc algorithm
Date:   Sun, 30 May 2021 17:49:22 +0100
Message-Id: <20210530164923.18134-6-paul@crapouillou.net>
In-Reply-To: <20210530164923.18134-1-paul@crapouillou.net>
References: <20210530164923.18134-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

SoC-specific code can now provide a callback if they need to compute the
M/N/OD values in a specific way.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Tested-by: 周琰杰 (Zhou Yanjie)<zhouyanjie@wanyeetech.com>   # on CU1000-neo/X1000E
---
 drivers/clk/ingenic/cgu.c | 40 ++++++++++++++++++++++++++-------------
 drivers/clk/ingenic/cgu.h |  3 +++
 2 files changed, 30 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/ingenic/cgu.c b/drivers/clk/ingenic/cgu.c
index 58f7ab5cf0fe..266c7595d330 100644
--- a/drivers/clk/ingenic/cgu.c
+++ b/drivers/clk/ingenic/cgu.c
@@ -119,28 +119,42 @@ ingenic_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 		n * od);
 }
 
-static unsigned long
-ingenic_pll_calc(const struct ingenic_cgu_clk_info *clk_info,
-		 unsigned long rate, unsigned long parent_rate,
-		 unsigned *pm, unsigned *pn, unsigned *pod)
+static void
+ingenic_pll_calc_m_n_od(const struct ingenic_cgu_pll_info *pll_info,
+			unsigned long rate, unsigned long parent_rate,
+			unsigned int *pm, unsigned int *pn, unsigned int *pod)
 {
-	const struct ingenic_cgu_pll_info *pll_info;
-	unsigned m, n, od;
-
-	pll_info = &clk_info->pll;
-	od = 1;
+	unsigned int m, n, od = 1;
 
 	/*
 	 * The frequency after the input divider must be between 10 and 50 MHz.
 	 * The highest divider yields the best resolution.
 	 */
 	n = parent_rate / (10 * MHZ);
-	n = min_t(unsigned, n, 1 << clk_info->pll.n_bits);
-	n = max_t(unsigned, n, pll_info->n_offset);
+	n = min_t(unsigned int, n, 1 << pll_info->n_bits);
+	n = max_t(unsigned int, n, pll_info->n_offset);
 
 	m = (rate / MHZ) * od * n / (parent_rate / MHZ);
-	m = min_t(unsigned, m, 1 << clk_info->pll.m_bits);
-	m = max_t(unsigned, m, pll_info->m_offset);
+	m = min_t(unsigned int, m, 1 << pll_info->m_bits);
+	m = max_t(unsigned int, m, pll_info->m_offset);
+
+	*pm = m;
+	*pn = n;
+	*pod = od;
+}
+
+static unsigned long
+ingenic_pll_calc(const struct ingenic_cgu_clk_info *clk_info,
+		 unsigned long rate, unsigned long parent_rate,
+		 unsigned int *pm, unsigned int *pn, unsigned int *pod)
+{
+	const struct ingenic_cgu_pll_info *pll_info = &clk_info->pll;
+	unsigned int m, n, od;
+
+	if (pll_info->calc_m_n_od)
+		(*pll_info->calc_m_n_od)(pll_info, rate, parent_rate, &m, &n, &od);
+	else
+		ingenic_pll_calc_m_n_od(pll_info, rate, parent_rate, &m, &n, &od);
 
 	if (pm)
 		*pm = m;
diff --git a/drivers/clk/ingenic/cgu.h b/drivers/clk/ingenic/cgu.h
index 10521d1b7b12..bfc2b9c38a41 100644
--- a/drivers/clk/ingenic/cgu.h
+++ b/drivers/clk/ingenic/cgu.h
@@ -55,6 +55,9 @@ struct ingenic_cgu_pll_info {
 	s8 bypass_bit;
 	u8 enable_bit;
 	u8 stable_bit;
+	void (*calc_m_n_od)(const struct ingenic_cgu_pll_info *pll_info,
+			    unsigned long rate, unsigned long parent_rate,
+			    unsigned int *m, unsigned int *n, unsigned int *od);
 };
 
 /**
-- 
2.30.2

