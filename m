Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8E4241F2F5
	for <lists+linux-mips@lfdr.de>; Fri,  1 Oct 2021 19:20:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354927AbhJARW0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 1 Oct 2021 13:22:26 -0400
Received: from aposti.net ([89.234.176.197]:38828 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1354507AbhJARW0 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 1 Oct 2021 13:22:26 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-mips@vger.kernel.org, list@opendingux.net,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>,
        Artur Rojek <contact@artur-rojek.eu>
Subject: [PATCH] clk: ingenic: Fix bugs with divided dividers
Date:   Fri,  1 Oct 2021 18:20:33 +0100
Message-Id: <20211001172033.122329-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Two fixes in one:

- In the "impose hardware constraints" block, the "logical" divider
  value (aka. not translated to the hardware) was clamped to fit in the
  register area, but this totally ignored the fact that the divider
  value can itself have a fixed divider.

- The code that made sure that the divider value returned by the
  function was a multiple of its own fixed divider could result in a
  wrong value being calculated, because it was rounded down instead of
  rounded up.

Fixes: 4afe2d1a6ed5 ("clk: ingenic: Allow divider value to be divided")
Co-developed-by: Artur Rojek <contact@artur-rojek.eu>
Signed-off-by: Artur Rojek <contact@artur-rojek.eu>
Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/clk/ingenic/cgu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/ingenic/cgu.c b/drivers/clk/ingenic/cgu.c
index 266c7595d330..af31633a8862 100644
--- a/drivers/clk/ingenic/cgu.c
+++ b/drivers/clk/ingenic/cgu.c
@@ -453,15 +453,15 @@ ingenic_clk_calc_div(struct clk_hw *hw,
 	}
 
 	/* Impose hardware constraints */
-	div = min_t(unsigned, div, 1 << clk_info->div.bits);
-	div = max_t(unsigned, div, 1);
+	div = clamp_t(unsigned int, div, clk_info->div.div,
+		      clk_info->div.div << clk_info->div.bits);
 
 	/*
 	 * If the divider value itself must be divided before being written to
 	 * the divider register, we must ensure we don't have any bits set that
 	 * would be lost as a result of doing so.
 	 */
-	div /= clk_info->div.div;
+	div = DIV_ROUND_UP(div, clk_info->div.div);
 	div *= clk_info->div.div;
 
 	return div;
-- 
2.33.0

