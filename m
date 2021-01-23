Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E9CB3015D6
	for <lists+linux-mips@lfdr.de>; Sat, 23 Jan 2021 15:28:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726037AbhAWO1p (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 23 Jan 2021 09:27:45 -0500
Received: from aposti.net ([89.234.176.197]:33810 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725972AbhAWO1m (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 23 Jan 2021 09:27:42 -0500
From:   Paul Cercueil <paul@crapouillou.net>
To:     Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Tony Lindgren <tony@atomide.com>, od@zcrc.me,
        linux-mips@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [RE-RESEND PATCH 3/4] usb: musb: dma: Remove unused variable
Date:   Sat, 23 Jan 2021 14:25:01 +0000
Message-Id: <20210123142502.16980-3-paul@crapouillou.net>
In-Reply-To: <20210123142502.16980-1-paul@crapouillou.net>
References: <20210123142502.16980-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Remove unused-but-set devctl variable.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/usb/musb/musbhsdma.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/usb/musb/musbhsdma.c b/drivers/usb/musb/musbhsdma.c
index 0aacfc8be5a1..7acd1635850d 100644
--- a/drivers/usb/musb/musbhsdma.c
+++ b/drivers/usb/musb/musbhsdma.c
@@ -321,8 +321,6 @@ irqreturn_t dma_controller_irq(int irq, void *private_data)
 				musb_channel->channel.status =
 					MUSB_DMA_STATUS_BUS_ABORT;
 			} else {
-				u8 devctl;
-
 				addr = musb_read_hsdma_addr(mbase,
 						bchannel);
 				channel->actual_len = addr
@@ -336,8 +334,6 @@ irqreturn_t dma_controller_irq(int irq, void *private_data)
 						< musb_channel->len) ?
 					"=> reconfig 0" : "=> complete");
 
-				devctl = musb_readb(mbase, MUSB_DEVCTL);
-
 				channel->status = MUSB_DMA_STATUS_FREE;
 
 				/* completed */
-- 
2.29.2

