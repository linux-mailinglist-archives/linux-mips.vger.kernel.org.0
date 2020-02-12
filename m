Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7224815A5F4
	for <lists+linux-mips@lfdr.de>; Wed, 12 Feb 2020 11:16:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727566AbgBLKPv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 12 Feb 2020 05:15:51 -0500
Received: from andre.telenet-ops.be ([195.130.132.53]:42970 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727567AbgBLKPu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 12 Feb 2020 05:15:50 -0500
Received: from ramsan ([84.195.182.253])
        by andre.telenet-ops.be with bizsmtp
        id 1mFn2200L5USYZQ01mFnZQ; Wed, 12 Feb 2020 11:15:48 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1p3b-0001ND-E6; Wed, 12 Feb 2020 11:15:47 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1p3b-0002Iu-Bu; Wed, 12 Feb 2020 11:15:47 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        James Hartley <james.hartley@sondrel.com>,
        John Crispin <john@phrozen.org>
Cc:     linux-mips@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 5/7] MIPS: pic32mzda: Replace <linux/clk-provider.h> by <linux/of_clk.h>
Date:   Wed, 12 Feb 2020 11:15:42 +0100
Message-Id: <20200212101544.8793-6-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200212101544.8793-1-geert+renesas@glider.be>
References: <20200212101544.8793-1-geert+renesas@glider.be>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The Microchip PIC32MZDA platform code is not a clock provider, and just
needs to call of_clk_init().

Hence it can include <linux/of_clk.h> instead of <linux/clk-provider.h>.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/mips/pic32/pic32mzda/time.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/pic32/pic32mzda/time.c b/arch/mips/pic32/pic32mzda/time.c
index 905ec1d8692873a1..754924f260891b0e 100644
--- a/arch/mips/pic32/pic32mzda/time.c
+++ b/arch/mips/pic32/pic32mzda/time.c
@@ -3,11 +3,11 @@
  * Joshua Henderson <joshua.henderson@microchip.com>
  * Copyright (C) 2015 Microchip Technology Inc.  All rights reserved.
  */
-#include <linux/clk-provider.h>
 #include <linux/clocksource.h>
 #include <linux/init.h>
 #include <linux/irqdomain.h>
 #include <linux/of.h>
+#include <linux/of_clk.h>
 #include <linux/of_irq.h>
 
 #include <asm/time.h>
-- 
2.17.1

