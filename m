Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27164778DE5
	for <lists+linux-mips@lfdr.de>; Fri, 11 Aug 2023 13:39:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbjHKLju (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 11 Aug 2023 07:39:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234271AbjHKLju (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 11 Aug 2023 07:39:50 -0400
Received: from h2.cmg1.smtp.forpsi.com (h2.cmg1.smtp.forpsi.com [81.2.195.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB6052706
        for <linux-mips@vger.kernel.org>; Fri, 11 Aug 2023 04:39:46 -0700 (PDT)
Received: from lenoch ([91.218.190.200])
        by cmgsmtp with ESMTPSA
        id UQUZqsWOTPm6CUQUaqHcFO; Fri, 11 Aug 2023 13:39:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1691753984; bh=iisKLuRYwG5jF0wfR+KUYvtqsNRa1Q/VtKp4V9EDHz4=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=NyC9b1EdJ16Rwqk2UsBUJ3WbXazTyAj7ngpgKV3LizK27wjJf5W2R644USBRUTMf+
         QeAaDpmP5ipJegwMc3UtMe45U7wTpNZflntf1Yunt9vENv0mNSonG/M23ghrUNlLD/
         VQtGTbBNC11oee8pahq2Jaidhlcpihajf8gDTaMcAZeXT9/Zsr4KVOBIfAnEsRCw8f
         CQpkw+qY2/zmpEi+w+rX0bZrBgxL3TsWyyBOjvmlaxZQuQxW+GEUOAmRPMFXwkb8mF
         hCbD83RMjQhSiIwi5o2zbGYo9QuQQjK75yJcAqqn13I7Rb86GQACP2xTppd7IW7nRE
         O78en8abqK1ZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1691753984; bh=iisKLuRYwG5jF0wfR+KUYvtqsNRa1Q/VtKp4V9EDHz4=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=NyC9b1EdJ16Rwqk2UsBUJ3WbXazTyAj7ngpgKV3LizK27wjJf5W2R644USBRUTMf+
         QeAaDpmP5ipJegwMc3UtMe45U7wTpNZflntf1Yunt9vENv0mNSonG/M23ghrUNlLD/
         VQtGTbBNC11oee8pahq2Jaidhlcpihajf8gDTaMcAZeXT9/Zsr4KVOBIfAnEsRCw8f
         CQpkw+qY2/zmpEi+w+rX0bZrBgxL3TsWyyBOjvmlaxZQuQxW+GEUOAmRPMFXwkb8mF
         hCbD83RMjQhSiIwi5o2zbGYo9QuQQjK75yJcAqqn13I7Rb86GQACP2xTppd7IW7nRE
         O78en8abqK1ZA==
Date:   Fri, 11 Aug 2023 13:39:42 +0200
From:   Ladislav Michl <oss-lists@triops.cz>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Robert Richter <rric@kernel.org>, linux-mmc@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: Re: (Octeon) MMC performance degradation due to too many requests
Message-ID: <ZNYd/mNGROq22MPH@lenoch>
References: <ZM+IlctTTQLs7Qg9@lenoch>
 <CACRpkdZmd-nb21Cx-jp-CDRjW4VQRV=c4MekHxS3h2p3HsDwZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZmd-nb21Cx-jp-CDRjW4VQRV=c4MekHxS3h2p3HsDwZQ@mail.gmail.com>
X-CMAE-Envelope: MS4wfJbRPQSTR/mFiCBUjgc/yhHObOB6YJhwSOxr4N0OVb/J5TsxJlGZgLUL4P1lBd1+EjMwn1Cr3W9owK5XS6Vwn8/ymWhpP3sLrZrq6xKdS2BJ93onSbIh
 rFsxr9jbaZ5qjAB7H+NKo0SMJTaTfHUE1EAewpcUKNpZhjvB3YUsk+zlXUliEPlQkeZAWkCssXJs4lEmqOnXOdpvX7SIX4aaF63o4PoEgWNSIo0I1lCry2Pd
 PdapejNrS/nxUREL58WBGEfWSsbB1PE1SFIs00NagZo=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Linus,

On Sun, Aug 06, 2023 at 10:44:21PM +0200, Linus Walleij wrote:
[snip]
> So you are talking about something along the lines of:
> 
> commit bd9b902798ab14d19ca116b10bde581ddff8f905
> Author: Linus Walleij <linus.walleij@linaro.org>
> Date:   Mon Jan 29 00:44:53 2018 +0100
> 
>     mmc: sdhci: Implement an SDHCI-specific bounce buffer
> 
> ?
> 
> Yeah I guess that if this is needed by more than one driver it
> should be made into a library, or say a piece of code turned on by
> a config option that the dependent drivers select.
> 
> Interested in the job? :D

Just for the reference, implementation based on your above mentioned patch
which restores 4.9 vendor kernel performance can be found below.

It still needs some love, generalization and so on, but as I have already
started work on fixing Octeon's USB and ethernet, this is far beyond my
time limit.

I hope to return to this in the near future and convert it into proper
patch series.

Btw, we really need to invent some other name than 'bounce buffer'...

---
 drivers/mmc/host/cavium.c | 124 +++++++++++++++++++++++++++++++++++++-
 drivers/mmc/host/cavium.h |   4 ++
 2 files changed, 127 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/cavium.c b/drivers/mmc/host/cavium.c
index cd8f2233ea34..75e2fab58268 100644
--- a/drivers/mmc/host/cavium.c
+++ b/drivers/mmc/host/cavium.c
@@ -370,6 +370,32 @@ static int get_dma_dir(struct mmc_data *data)
 	return (data->flags & MMC_DATA_WRITE) ? DMA_TO_DEVICE : DMA_FROM_DEVICE;
 }
 
+static int finish_dma_bounce(struct cvm_mmc_host *host, struct mmc_data *data)
+{
+	data->bytes_xfered = data->blocks * data->blksz;
+	data->error = 0;
+
+	dma_sync_single_for_cpu(host->dev, host->bounce_addr,
+				host->bounce_buffer_size,
+				mmc_get_dma_dir(data));
+
+	/* On reads, copy the bounced data into the sglist */
+	if (mmc_get_dma_dir(data) == DMA_FROM_DEVICE) {
+		unsigned int length = data->bytes_xfered;
+
+		if (length > host->bounce_buffer_size) {
+			pr_err("bounce buffer is %u bytes but DMA claims to have transferred %u bytes\n",
+			       host->bounce_buffer_size,
+			       data->bytes_xfered);
+			/* Cap it down and continue */
+			length = host->bounce_buffer_size;
+		}
+		sg_copy_from_buffer(data->sg, data->sg_len, host->bounce_buffer,
+				    length);
+	}
+	return 1;
+}
+
 static int finish_dma_single(struct cvm_mmc_host *host, struct mmc_data *data)
 {
 	data->bytes_xfered = data->blocks * data->blksz;
@@ -400,7 +426,9 @@ static int finish_dma_sg(struct cvm_mmc_host *host, struct mmc_data *data)
 
 static int finish_dma(struct cvm_mmc_host *host, struct mmc_data *data)
 {
-	if (host->use_sg && data->sg_len > 1)
+	if (host->bounce_buffer)
+		return finish_dma_bounce(host, data);
+	else if (host->use_sg && data->sg_len > 1)
 		return finish_dma_sg(host, data);
 	else
 		return finish_dma_single(host, data);
@@ -509,6 +537,45 @@ irqreturn_t cvm_mmc_interrupt(int irq, void *dev_id)
 	return IRQ_RETVAL(emm_int != 0);
 }
 
+static u64 prepare_dma_bounce(struct cvm_mmc_host *host, struct mmc_data *data)
+{
+	u64 dma_cfg, addr;
+	int rw = 0;
+	unsigned int length = data->blksz * data->blocks;
+
+	if (length > host->bounce_buffer_size) {
+		pr_err("asked for transfer of %u bytes exceeds bounce buffer %u bytes\n",
+		       length, host->bounce_buffer_size);
+		return 0;
+	}
+	if (mmc_get_dma_dir(data) == DMA_TO_DEVICE) {
+		/* Copy the data to the bounce buffer */
+		sg_copy_to_buffer(data->sg, data->sg_len,
+				  host->bounce_buffer, length);
+		rw = 1;
+	}
+	/* Switch ownership to the DMA */
+	dma_sync_single_for_device(host->dev, host->bounce_addr,
+				   host->bounce_buffer_size,
+				   mmc_get_dma_dir(data));
+
+	dma_cfg = FIELD_PREP(MIO_EMM_DMA_CFG_EN, 1) |
+		  FIELD_PREP(MIO_EMM_DMA_CFG_RW, rw);
+#ifdef __LITTLE_ENDIAN
+	dma_cfg |= FIELD_PREP(MIO_EMM_DMA_CFG_ENDIAN, 1);
+#endif
+	dma_cfg |= FIELD_PREP(MIO_EMM_DMA_CFG_SIZE, length / 8 - 1);
+
+	addr = host->bounce_addr;
+	if (!host->big_dma_addr)
+		dma_cfg |= FIELD_PREP(MIO_EMM_DMA_CFG_ADR, addr);
+	writeq(dma_cfg, host->dma_base + MIO_EMM_DMA_CFG(host));
+
+	if (host->big_dma_addr)
+		writeq(addr, host->dma_base + MIO_EMM_DMA_ADR(host));
+	return addr;
+}
+
 /*
  * Program DMA_CFG and if needed DMA_ADR.
  * Returns 0 on error, DMA address otherwise.
@@ -616,6 +683,8 @@ static u64 prepare_dma_sg(struct cvm_mmc_host *host, struct mmc_data *data)
 
 static u64 prepare_dma(struct cvm_mmc_host *host, struct mmc_data *data)
 {
+	if (host->bounce_buffer)
+		return prepare_dma_bounce(host, data);
 	if (host->use_sg && data->sg_len > 1)
 		return prepare_dma_sg(host, data);
 	else
@@ -1006,6 +1075,53 @@ static int cvm_mmc_of_parse(struct device *dev, struct cvm_mmc_slot *slot)
 	return id;
 }
 
+static void cvm_allocate_bounce_buffer(struct mmc_host *mmc, struct cvm_mmc_host *host)
+{
+	unsigned int max_blocks;
+	unsigned int size;
+
+	/*
+	 * Cap the bounce buffer at 64KB. Using a bigger bounce buffer
+	 * has diminishing returns, this is probably because SD/MMC
+	 * cards are usually optimized to handle this size of requests.
+	 */
+	size = SZ_64K;
+	/*
+	 * Adjust downwards to maximum request size if this is less
+	 * than our segment size, else hammer down the maximum
+	 * request size to the maximum buffer size.
+	 */
+	if (mmc->max_req_size < size)
+		size = mmc->max_req_size;
+	max_blocks = size / 512;
+
+	/*
+	 * When we just support one segment, we can get significant
+	 * speedups by the help of a bounce buffer to group scattered
+	 * reads/writes together.
+	 */
+	host->bounce_buffer = devm_kmalloc(mmc->parent, size, GFP_KERNEL);
+	if (!host->bounce_buffer) {
+		pr_err("failed to allocate %u bytes for bounce buffer, falling back to single segments\n",
+		       size);
+		return;
+	}
+
+	host->bounce_addr = dma_map_single(mmc->parent, host->bounce_buffer,
+					   size, DMA_BIDIRECTIONAL);
+	if (dma_mapping_error(mmc->parent, host->bounce_addr))
+		return;
+	host->bounce_buffer_size = size;
+
+	/* Lie about this since we're bouncing */
+	mmc->max_segs = max_blocks;
+	mmc->max_seg_size = size;
+	mmc->max_req_size = size;
+
+	pr_info("bounce up to %u segments into one, max segment size %u bytes\n",
+		max_blocks, size);
+}
+
 int cvm_mmc_of_slot_probe(struct device *dev, struct cvm_mmc_host *host)
 {
 	struct cvm_mmc_slot *slot;
@@ -1050,6 +1166,10 @@ int cvm_mmc_of_slot_probe(struct device *dev, struct cvm_mmc_host *host)
 	/* DMA block count field is 15 bits */
 	mmc->max_blk_count = 32767;
 
+	/* This may alter mmc->*_blk_* parameters */
+	if (mmc->max_segs == 1)
+		cvm_allocate_bounce_buffer(mmc, host);
+
 	slot->clock = mmc->f_min;
 	slot->bus_id = id;
 	slot->cached_rca = 1;
@@ -1064,6 +1184,7 @@ int cvm_mmc_of_slot_probe(struct device *dev, struct cvm_mmc_host *host)
 	if (ret) {
 		dev_err(dev, "mmc_add_host() returned %d\n", ret);
 		slot->host->slot[id] = NULL;
+		kfree(host->bounce_buffer);
 		goto error;
 	}
 	return 0;
@@ -1078,5 +1199,6 @@ int cvm_mmc_of_slot_remove(struct cvm_mmc_slot *slot)
 	mmc_remove_host(slot->mmc);
 	slot->host->slot[slot->bus_id] = NULL;
 	mmc_free_host(slot->mmc);
+	kfree(slot->host->bounce_buffer);
 	return 0;
 }
diff --git a/drivers/mmc/host/cavium.h b/drivers/mmc/host/cavium.h
index f3eea5eaa678..4fcddb76768d 100644
--- a/drivers/mmc/host/cavium.h
+++ b/drivers/mmc/host/cavium.h
@@ -64,6 +64,10 @@ struct cvm_mmc_host {
 	struct clk *clk;
 	int sys_freq;
 
+	char *bounce_buffer;	/* For packing DMA reads/writes */
+	dma_addr_t bounce_addr;
+	unsigned int bounce_buffer_size;
+
 	struct mmc_request *current_req;
 	struct sg_mapping_iter smi;
 	bool dma_active;
-- 
2.39.2

