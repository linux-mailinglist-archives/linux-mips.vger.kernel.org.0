Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D7C03301FB
	for <lists+linux-mips@lfdr.de>; Sun,  7 Mar 2021 15:19:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232195AbhCGOS7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 7 Mar 2021 09:18:59 -0500
Received: from aposti.net ([89.234.176.197]:51724 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232169AbhCGOSt (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 7 Mar 2021 09:18:49 -0500
From:   Paul Cercueil <paul@crapouillou.net>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Zhou Yanjie <zhouyanjie@wanyeetech.com>
Cc:     od@zcrc.me, linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 5/6] clk: ingenic: Support overriding PLLs M/N/OD calc algorithm
Date:   Sun,  7 Mar 2021 14:17:58 +0000
Message-Id: <20210307141759.30426-6-paul@crapouillou.net>
In-Reply-To: <20210307141759.30426-1-paul@crapouillou.net>
References: <20210307141759.30426-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

SoC-specific code can now provide a callback if they need to compute the
M/N/OD values in a specific way.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
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
2.30.1

