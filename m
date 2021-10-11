Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74D24429249
	for <lists+linux-mips@lfdr.de>; Mon, 11 Oct 2021 16:41:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241977AbhJKOnn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 11 Oct 2021 10:43:43 -0400
Received: from aposti.net ([89.234.176.197]:46952 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243617AbhJKOmu (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 11 Oct 2021 10:42:50 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     list@opendingux.net, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 5/5] dmaengine: jz4780: Support bidirectional I/O on one channel
Date:   Mon, 11 Oct 2021 16:36:52 +0200
Message-Id: <20211011143652.51976-6-paul@crapouillou.net>
In-Reply-To: <20211011143652.51976-1-paul@crapouillou.net>
References: <20211011143652.51976-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

For some devices with only half-duplex capabilities, it doesn't make
much sense to use one DMA channel per direction, as both channels will
never be active at the same time.

Add support for bidirectional I/O on DMA channels. The client drivers
can then request a "tx-rx" DMA channel which will be used for both
directions.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/dma/dma-jz4780.c | 48 ++++++++++++++++++++++++++--------------
 1 file changed, 32 insertions(+), 16 deletions(-)

diff --git a/drivers/dma/dma-jz4780.c b/drivers/dma/dma-jz4780.c
index 4d62e24ebff9..ee1d50792c32 100644
--- a/drivers/dma/dma-jz4780.c
+++ b/drivers/dma/dma-jz4780.c
@@ -122,6 +122,7 @@ struct jz4780_dma_desc {
 	dma_addr_t desc_phys;
 	unsigned int count;
 	enum dma_transaction_type type;
+	uint32_t transfer_type;
 	uint32_t status;
 };
 
@@ -130,7 +131,7 @@ struct jz4780_dma_chan {
 	unsigned int id;
 	struct dma_pool *desc_pool;
 
-	uint32_t transfer_type;
+	uint32_t transfer_type_tx, transfer_type_rx;
 	uint32_t transfer_shift;
 	struct dma_slave_config	config;
 
@@ -157,7 +158,7 @@ struct jz4780_dma_dev {
 };
 
 struct jz4780_dma_filter_data {
-	uint32_t transfer_type;
+	uint32_t transfer_type_tx, transfer_type_rx;
 	int channel;
 };
 
@@ -226,9 +227,10 @@ static inline void jz4780_dma_chan_disable(struct jz4780_dma_dev *jzdma,
 		jz4780_dma_ctrl_writel(jzdma, JZ_DMA_REG_DCKEC, BIT(chn));
 }
 
-static struct jz4780_dma_desc *jz4780_dma_desc_alloc(
-	struct jz4780_dma_chan *jzchan, unsigned int count,
-	enum dma_transaction_type type)
+static struct jz4780_dma_desc *
+jz4780_dma_desc_alloc(struct jz4780_dma_chan *jzchan, unsigned int count,
+		      enum dma_transaction_type type,
+		      enum dma_transfer_direction direction)
 {
 	struct jz4780_dma_desc *desc;
 
@@ -248,6 +250,12 @@ static struct jz4780_dma_desc *jz4780_dma_desc_alloc(
 
 	desc->count = count;
 	desc->type = type;
+
+	if (direction == DMA_DEV_TO_MEM)
+		desc->transfer_type = jzchan->transfer_type_rx;
+	else
+		desc->transfer_type = jzchan->transfer_type_tx;
+
 	return desc;
 }
 
@@ -361,7 +369,7 @@ static struct dma_async_tx_descriptor *jz4780_dma_prep_slave_sg(
 	unsigned int i;
 	int err;
 
-	desc = jz4780_dma_desc_alloc(jzchan, sg_len, DMA_SLAVE);
+	desc = jz4780_dma_desc_alloc(jzchan, sg_len, DMA_SLAVE, direction);
 	if (!desc)
 		return NULL;
 
@@ -410,7 +418,7 @@ static struct dma_async_tx_descriptor *jz4780_dma_prep_dma_cyclic(
 
 	periods = buf_len / period_len;
 
-	desc = jz4780_dma_desc_alloc(jzchan, periods, DMA_CYCLIC);
+	desc = jz4780_dma_desc_alloc(jzchan, periods, DMA_CYCLIC, direction);
 	if (!desc)
 		return NULL;
 
@@ -455,14 +463,14 @@ static struct dma_async_tx_descriptor *jz4780_dma_prep_dma_memcpy(
 	struct jz4780_dma_desc *desc;
 	uint32_t tsz;
 
-	desc = jz4780_dma_desc_alloc(jzchan, 1, DMA_MEMCPY);
+	desc = jz4780_dma_desc_alloc(jzchan, 1, DMA_MEMCPY, 0);
 	if (!desc)
 		return NULL;
 
 	tsz = jz4780_dma_transfer_size(jzchan, dest | src | len,
 				       &jzchan->transfer_shift);
 
-	jzchan->transfer_type = JZ_DMA_DRT_AUTO;
+	desc->transfer_type = JZ_DMA_DRT_AUTO;
 
 	desc->desc[0].dsa = src;
 	desc->desc[0].dta = dest;
@@ -528,7 +536,7 @@ static void jz4780_dma_begin(struct jz4780_dma_chan *jzchan)
 
 	/* Set transfer type. */
 	jz4780_dma_chn_writel(jzdma, jzchan->id, JZ_DMA_REG_DRT,
-			      jzchan->transfer_type);
+			      jzchan->desc->transfer_type);
 
 	/*
 	 * Set the transfer count. This is redundant for a descriptor-driven
@@ -788,7 +796,8 @@ static bool jz4780_dma_filter_fn(struct dma_chan *chan, void *param)
 		return false;
 	}
 
-	jzchan->transfer_type = data->transfer_type;
+	jzchan->transfer_type_tx = data->transfer_type_tx;
+	jzchan->transfer_type_rx = data->transfer_type_rx;
 
 	return true;
 }
@@ -800,11 +809,17 @@ static struct dma_chan *jz4780_of_dma_xlate(struct of_phandle_args *dma_spec,
 	dma_cap_mask_t mask = jzdma->dma_device.cap_mask;
 	struct jz4780_dma_filter_data data;
 
-	if (dma_spec->args_count != 2)
+	if (dma_spec->args_count == 2) {
+		data.transfer_type_tx = dma_spec->args[0];
+		data.transfer_type_rx = dma_spec->args[0];
+		data.channel = dma_spec->args[1];
+	} else if (dma_spec->args_count == 3) {
+		data.transfer_type_tx = dma_spec->args[0];
+		data.transfer_type_rx = dma_spec->args[1];
+		data.channel = dma_spec->args[2];
+	} else {
 		return NULL;
-
-	data.transfer_type = dma_spec->args[0];
-	data.channel = dma_spec->args[1];
+	}
 
 	if (data.channel > -1) {
 		if (data.channel >= jzdma->soc_data->nb_channels) {
@@ -822,7 +837,8 @@ static struct dma_chan *jz4780_of_dma_xlate(struct of_phandle_args *dma_spec,
 			return NULL;
 		}
 
-		jzdma->chan[data.channel].transfer_type = data.transfer_type;
+		jzdma->chan[data.channel].transfer_type_tx = data.transfer_type_tx;
+		jzdma->chan[data.channel].transfer_type_rx = data.transfer_type_rx;
 
 		return dma_get_slave_channel(
 			&jzdma->chan[data.channel].vchan.chan);
-- 
2.33.0

