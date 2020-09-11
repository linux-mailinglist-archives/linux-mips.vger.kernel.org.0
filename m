Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1138226598F
	for <lists+linux-mips@lfdr.de>; Fri, 11 Sep 2020 08:48:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725554AbgIKGsc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 11 Sep 2020 02:48:32 -0400
Received: from mga03.intel.com ([134.134.136.65]:4588 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725468AbgIKGsV (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 11 Sep 2020 02:48:21 -0400
IronPort-SDR: sTvoZAg4KRFt9GsEt8kRjGUA+YC1iTOCebAfe6urklT9yn/ZW9Cr1H5oMaYecnIPTvpp+SGBei
 8y9TssW8Fxyw==
X-IronPort-AV: E=McAfee;i="6000,8403,9740"; a="158740011"
X-IronPort-AV: E=Sophos;i="5.76,414,1592895600"; 
   d="scan'208";a="158740011"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2020 23:48:20 -0700
IronPort-SDR: mCIJoz7ugalP3NcKLLaGgM+lMqf7ELnTC9MYH9PYX/K4fA75W9yof3gT2m/k4iyCW3UW5fNxm1
 jMoQlOa7BX+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,414,1592895600"; 
   d="scan'208";a="506109212"
Received: from linux.intel.com ([10.54.29.200])
  by fmsmga005.fm.intel.com with ESMTP; 10 Sep 2020 23:48:20 -0700
Received: from [10.213.131.98] (vramuthx-MOBL1.gar.corp.intel.com [10.213.131.98])
        by linux.intel.com (Postfix) with ESMTP id 25709580224;
        Thu, 10 Sep 2020 23:48:14 -0700 (PDT)
Reply-To: vadivel.muruganx.ramuthevar@linux.intel.com
Subject: Re: [RESEND PATCH v12 2/2] mtd: rawnand: Add NAND controller support
 on Intel LGM SoC
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, richard@nod.at, vigneshr@ti.com,
        arnd@arndb.de, brendanhiggins@google.com, tglx@linutronix.de,
        boris.brezillon@collabora.com, anders.roxell@linaro.org,
        masonccyang@mxic.com.tw, robh+dt@kernel.org,
        linux-mips@vger.kernel.org, hauke.mehrtens@intel.com,
        andriy.shevchenko@intel.com, cheol.yong.kim@intel.com,
        qi-ming.wu@intel.com
References: <20200817052709.47035-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200817052709.47035-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200907152025.66c18f5e@xps13>
From:   "Ramuthevar, Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <b0841600-86a6-95fd-8c6d-9d047fd1fc1e@linux.intel.com>
Date:   Fri, 11 Sep 2020 14:48:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200907152025.66c18f5e@xps13>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Miquel,

Thank you for your review comments...

On 7/9/2020 9:20 pm, Miquel Raynal wrote:
> Hi Murugan,
> 
> A few more comments below, but I guess the driver looks better now.
> 
>> +struct ebu_nand_controller {
>> +	struct nand_controller controller;
>> +	struct nand_chip chip;
>> +	struct device *dev;
>> +	void __iomem *ebu;
>> +	void __iomem *hsnand;
>> +	struct dma_chan *dma_tx;
>> +	struct dma_chan *dma_rx;
>> +	struct completion dma_access_complete;
>> +	unsigned long clk_rate;
>> +	struct clk *clk;
>> +	u32 nd_para0;
>> +	u8 cs_num;
>> +	struct ebu_nand_cs cs[MAX_CS];
>> +};
>> +
>> +static inline struct ebu_nand_controller *nand_to_ebu(struct nand_chip *chip)
>> +{
>> +	return container_of(chip, struct ebu_nand_controller, chip);
>> +}
>> +
>> +static u8 ebu_nand_readb(struct nand_chip *chip)
> 
> Can't you prefix with intel_ instead of ebu_ ?
> 
>> +{
>> +	struct ebu_nand_controller *ebu_host = nand_get_controller_data(chip);
>> +	void __iomem *nand_wait = ebu_host->ebu + EBU_WAIT;
>> +	u8 cs_num = ebu_host->cs_num;
>> +	u32 stat;
>> +	int ret;
>> +	u8 val;
>> +
>> +	val = readb(ebu_host->cs[cs_num].chipaddr + HSNAND_CS_OFFS);
>> +
>> +	ret = readl_poll_timeout(nand_wait, stat, stat & EBU_WAIT_WR_C,
>> +				 20, 1000);
> 
> If you do this operation each time a byte is read/written, you probable
> want to shrink the polling delay a little bit, to 1 or even 0.
Ok, Noted.
> 
>> +	if (ret)
>> +		dev_warn(ebu_host->dev,
>> +			 "ebu nand write timeout. nand_wait(0x%p)=0x%x\n",
>> +			 nand_wait, readl(nand_wait));
>> +
>> +	return val;
> 
> You should not return val if ret is !0 I guess
Yes, You're correct.
> 
>> +}
>> +
>> +static void ebu_nand_writeb(struct nand_chip *chip, u32 offset, u8 value)
>> +{
>> +	struct ebu_nand_controller *ebu_host = nand_get_controller_data(chip);
>> +	void __iomem *nand_wait = ebu_host->ebu + EBU_WAIT;
>> +	u8 cs_num = ebu_host->cs_num;
>> +	u32 stat;
>> +	int ret;
>> +
>> +	writeb(value, ebu_host->cs[cs_num].chipaddr + offset);
>> +
>> +	ret = readl_poll_timeout(nand_wait, stat, stat & EBU_WAIT_WR_C,
>> +				 20, 1000);
> 
> Here as well
Noted.
> 
>> +	if (ret)
>> +		dev_warn(ebu_host->dev,
>> +			 "ebu nand write timeout. nand_wait(0x%p)=0x%x\n",
>> +			 nand_wait, readl(nand_wait));
> 
> If this can fail, then the helper should return an error and be treated.
Noted, will update.
> 
>> +}
>> +
>> +static void ebu_read_buf(struct nand_chip *chip, u_char *buf, unsigned int len)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < len; i++)
>> +		buf[i] = ebu_nand_readb(chip);
>> +}
>> +
>> +static void ebu_write_buf(struct nand_chip *chip, const u_char *buf, int len)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < len; i++)
>> +		ebu_nand_writeb(chip, HSNAND_CS_OFFS, buf[i]);
>> +}
>> +
>> +static void ebu_nand_disable(struct nand_chip *chip)
>> +{
>> +	struct ebu_nand_controller *ebu_host = nand_get_controller_data(chip);
>> +
>> +	writel(0, ebu_host->ebu + EBU_CON);
>> +}
>> +
>> +static void ebu_select_chip(struct nand_chip *chip)
>> +{
>> +	struct ebu_nand_controller *ebu_host = nand_get_controller_data(chip);
>> +	void __iomem *nand_con = ebu_host->ebu + EBU_CON;
>> +	u32 cs = ebu_host->cs_num;
>> +
>> +	writel(EBU_CON_NANDM_EN | EBU_CON_CSMUX_E_EN | EBU_CON_CS_P_LOW |
>> +	       EBU_CON_SE_P_LOW | EBU_CON_WP_P_LOW | EBU_CON_PRE_P_LOW |
>> +	       EBU_CON_IN_CS_S(cs) | EBU_CON_OUT_CS_S(cs) |
>> +	       EBU_CON_LAT_EN_CS_P, nand_con);
>> +}
>> +
>> +static void ebu_nand_setup_timing(struct ebu_nand_controller *ctrl,
>> +				  const struct nand_sdr_timings *timings)
>> +{
>> +	unsigned int rate = clk_get_rate(ctrl->clk) / 1000000;
>> +	unsigned int period = DIV_ROUND_UP(1000000, rate);
>> +	u32 trecov, thold, twrwait, trdwait;
>> +	u32 reg = 0;
>> +
>> +	trecov = DIV_ROUND_UP(max(timings->tREA_max, timings->tREH_min),
>> +			      period);
>> +	reg |= EBU_BUSCON_RECOVC(trecov);
>> +
>> +	thold = DIV_ROUND_UP(max(timings->tDH_min, timings->tDS_min), period);
>> +	reg |= EBU_BUSCON_HOLDC(thold);
>> +
>> +	trdwait = DIV_ROUND_UP(max(timings->tRC_min, timings->tREH_min),
>> +			       period);
>> +	reg |= EBU_BUSCON_WAITRDC(trdwait);
>> +
>> +	twrwait = DIV_ROUND_UP(max(timings->tWC_min, timings->tWH_min), period);
>> +	reg |= EBU_BUSCON_WAITWRC(twrwait);
>> +
>> +	reg |= EBU_BUSCON_CMULT_V4 | EBU_BUSCON_BCGEN_CS | EBU_BUSCON_ALEC |
>> +		EBU_BUSCON_SETUP_EN;
>> +
>> +	writel(reg, ctrl->ebu + EBU_BUSCON(ctrl->cs_num));
>> +}
>> +
>> +static int ebu_nand_setup_data_interface(struct nand_chip *chip, int csline,
>> +					 const struct nand_data_interface *conf)
> 
> I recently changed the naming around the data interface, please
> have a look at the recent commits and update the namings here as
> well.
Sure, will go through update accordingly.
> 
>> +{
>> +	struct ebu_nand_controller *ctrl = nand_to_ebu(chip);
>> +	const struct nand_sdr_timings *timings;
>> +
>> +	timings = nand_get_sdr_timings(conf);
>> +	if (IS_ERR(timings))
>> +		return PTR_ERR(timings);
>> +
>> +	if (csline == NAND_DATA_IFACE_CHECK_ONLY)
>> +		return 0;
>> +
>> +	ebu_nand_setup_timing(ctrl, timings);
>> +
>> +	return 0;
>> +}
>> +
>> +static int ebu_nand_ooblayout_ecc(struct mtd_info *mtd, int section,
>> +				  struct mtd_oob_region *oobregion)
>> +{
>> +	struct nand_chip *chip = mtd_to_nand(mtd);
>> +
>> +	if (section)
>> +		return -ERANGE;
>> +
>> +	oobregion->offset = HSNAND_ECC_OFFSET;
>> +	oobregion->length = chip->ecc.total;
>> +
>> +	return 0;
>> +}
>> +
>> +static int ebu_nand_ooblayout_free(struct mtd_info *mtd, int section,
>> +				   struct mtd_oob_region *oobregion)
>> +{
>> +	struct nand_chip *chip = mtd_to_nand(mtd);
>> +
>> +	if (section)
>> +		return -ERANGE;
>> +
>> +	oobregion->offset = chip->ecc.total + HSNAND_ECC_OFFSET;
>> +	oobregion->length = mtd->oobsize - oobregion->offset;
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct mtd_ooblayout_ops ebu_nand_ooblayout_ops = {
>> +	.ecc = ebu_nand_ooblayout_ecc,
>> +	.free = ebu_nand_ooblayout_free,
>> +};
>> +
>> +static void ebu_dma_rx_callback(void *cookie)
>> +{
>> +	struct ebu_nand_controller *ebu_host = cookie;
>> +
>> +	dmaengine_terminate_async(ebu_host->dma_rx);
>> +
>> +	complete(&ebu_host->dma_access_complete);
>> +}
>> +
>> +static void ebu_dma_tx_callback(void *cookie)
>> +{
>> +	struct ebu_nand_controller *ebu_host = cookie;
>> +
>> +	dmaengine_terminate_async(ebu_host->dma_tx);
>> +
>> +	complete(&ebu_host->dma_access_complete);
>> +}
>> +
>> +static int ebu_dma_start(struct ebu_nand_controller *ebu_host, u32 dir,
>> +			 const u8 *buf, u32 len)
>> +{
>> +	struct dma_async_tx_descriptor *tx;
>> +	struct completion *dma_completion;
>> +	dma_async_tx_callback callback;
>> +	struct dma_chan *chan;
>> +	dma_cookie_t cookie;
>> +	unsigned long flags = DMA_CTRL_ACK | DMA_PREP_INTERRUPT;
>> +	dma_addr_t buf_dma;
>> +	int ret;
>> +	u32 timeout;
>> +
>> +	if (dir == DMA_DEV_TO_MEM) {
>> +		chan = ebu_host->dma_rx;
>> +		dma_completion = &ebu_host->dma_access_complete;
>> +		callback = ebu_dma_rx_callback;
>> +	} else {
>> +		chan = ebu_host->dma_tx;
>> +		dma_completion = &ebu_host->dma_access_complete;
>> +		callback = ebu_dma_tx_callback;
>> +	}
>> +
>> +	buf_dma = dma_map_single(chan->device->dev, (void *)buf, len, dir);
>> +	if (dma_mapping_error(chan->device->dev, buf_dma)) {
>> +		dev_err(ebu_host->dev, "Failed to map DMA buffer\n");
>> +		ret = -EIO;
>> +		goto err_unmap;
>> +	}
>> +
>> +	tx = dmaengine_prep_slave_single(chan, buf_dma, len, dir, flags);
>> +	if (!tx)
>> +		return -ENXIO;
>> +
>> +	tx->callback = callback;
>> +	tx->callback_param = ebu_host;
>> +	cookie = tx->tx_submit(tx);
>> +
>> +	ret = dma_submit_error(cookie);
>> +	if (ret) {
>> +		dev_err(ebu_host->dev, "dma_submit_error %d\n", cookie);
>> +		ret = -EIO;
>> +		goto err_unmap;
>> +	}
>> +
>> +	init_completion(dma_completion);
>> +	dma_async_issue_pending(chan);
>> +
>> +	/* Wait DMA to finish the data transfer.*/
>> +	timeout =
> 
> Don't break the line here
Okay, Noted.
> 
>> +	wait_for_completion_timeout(dma_completion, msecs_to_jiffies(1000));
>> +	if (!timeout) {
>> +		dev_err(ebu_host->dev, "I/O Error in DMA RX (status %d)\n",
>> +			dmaengine_tx_status(chan, cookie, NULL));
>> +		dmaengine_terminate_sync(chan);
>> +		ret = -ETIMEDOUT;
>> +		goto err_unmap;
>> +	}
>> +
>> +	return 0;
>> +
>> +err_unmap:
>> +	dma_unmap_single(ebu_host->dev, buf_dma, len, dir);
>> +
>> +	return ret;
>> +}
>> +
>> +static void ebu_nand_trigger(struct ebu_nand_controller *ebu_host,
>> +			     int page, u32 cmd)
>> +{
>> +	unsigned int val;
>> +
>> +	val = cmd | (page & 0xFF) << HSNAND_CTL1_ADDR_SHIFT;
>> +	writel(val, ebu_host->hsnand + HSNAND_CTL1);
>> +	val = (page & 0xFFFF00) >> 8 | HSNAND_CTL2_CYC_N_V5;
>> +	writel(val, ebu_host->hsnand + HSNAND_CTL2);
>> +
>> +	writel(ebu_host->nd_para0, ebu_host->hsnand + HSNAND_PARA0);
>> +
>> +	/* clear first, will update later */
>> +	writel(0xFFFFFFFF, ebu_host->hsnand + HSNAND_CMSG_0);
>> +	writel(0xFFFFFFFF, ebu_host->hsnand + HSNAND_CMSG_1);
>> +
>> +	writel(HSNAND_INT_MSK_CTL_WR_C,
>> +	       ebu_host->hsnand + HSNAND_INT_MSK_CTL);
>> +
>> +	val = cmd == NAND_CMD_READ0 ? HSNAND_CTL_RW_READ : HSNAND_CTL_RW_WRITE;
> 
> I don't like this, prefer having a "read/write" boolean as a parameter.
Noted, will update.
> 
>> +
>> +	writel(HSNAND_CTL_MSG_EN | HSNAND_CTL_CKFF_EN |
>> +	       HSNAND_CTL_ECC_OFF_V8TH | HSNAND_CTL_CE_SEL_CS(ebu_host->cs_num) |
>> +	       HSNAND_CTL_ENABLE_ECC | HSNAND_CTL_GO | val,
>> +	       ebu_host->hsnand + HSNAND_CTL);
>> +}
>> +
>> +static int ebu_nand_read_page_hwecc(struct nand_chip *chip, u8 *buf,
>> +				    int oob_required, int page)
>> +{
>> +	struct mtd_info *mtd = nand_to_mtd(chip);
>> +	struct ebu_nand_controller *ebu_host = nand_get_controller_data(chip);
>> +	int ret, x;
>> +
>> +	ebu_nand_trigger(ebu_host, page, NAND_CMD_READ0);
>> +
>> +	ret = ebu_dma_start(ebu_host, DMA_DEV_TO_MEM, buf, mtd->writesize);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (oob_required)
>> +		chip->ecc.read_oob(chip, page);
>> +
>> +	x = readl(ebu_host->hsnand + HSNAND_CTL);
>> +	x &= ~HSNAND_CTL_GO;
>> +	writel(x, ebu_host->hsnand + HSNAND_CTL);
>> +
>> +	return 0;
>> +}
>> +
>> +static int ebu_nand_write_page_hwecc(struct nand_chip *chip, const u8 *buf,
>> +				     int oob_required, int page)
>> +{
>> +	struct mtd_info *mtd = nand_to_mtd(chip);
>> +	struct ebu_nand_controller *ebu_host = nand_get_controller_data(chip);
>> +	void __iomem *int_sta = ebu_host->hsnand + HSNAND_INT_STA;
>> +	int ret, val, x;
>> +	u32 reg;
>> +
>> +	ebu_nand_trigger(ebu_host, page, NAND_CMD_SEQIN);
>> +
>> +	ret = ebu_dma_start(ebu_host, DMA_MEM_TO_DEV, buf, mtd->writesize);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (oob_required) {
>> +		reg = (chip->oob_poi[3] << 24) | (chip->oob_poi[2] << 16) |
>> +			(chip->oob_poi[1] << 8) | chip->oob_poi[0];
>> +
>> +		writel(reg, ebu_host->hsnand + HSNAND_CMSG_0);
>> +
>> +		reg = (chip->oob_poi[7] << 24) | (chip->oob_poi[6] << 16) |
>> +			(chip->oob_poi[5] << 8) | chip->oob_poi[4];
>> +
>> +		writel(reg, ebu_host->hsnand + HSNAND_CMSG_1);
>> +	}
>> +
>> +	ret = readl_poll_timeout_atomic(int_sta, val,
>> +					!(val & HSNAND_INT_STA_WR_C), 10, 1000);
>> +	if (ret)
>> +		return -EIO;
> 
> return ret ?
Yes, ret will come.
> 
>> +
>> +	x = readl(ebu_host->hsnand + HSNAND_CTL);
>> +	x &= ~HSNAND_CTL_GO;
>> +	writel(x, ebu_host->hsnand + HSNAND_CTL);
> 
> What is this? Looks like it deserves a helper with a nice name.
Register High Speed NAND control, it is exceeding the 80 characters to 
avoid that, short it, will update.
> 
>> +
>> +	return 0;
>> +}
>> +
>> +static const u8 ecc_strength[] = { 1, 1, 4, 8, 24, 32, 40, 60, };
> 
>                                           ^ is this normal?
> 
>> +
>> +static int ebu_nand_attach_chip(struct nand_chip *chip)
>> +{
>> +	struct mtd_info *mtd = nand_to_mtd(chip);
>> +	struct ebu_nand_controller *ebu_host = nand_get_controller_data(chip);
>> +	u32 ecc_steps, ecc_bytes, ecc_total, pagesize, pg_per_blk;
>> +	u32 ecc_strength_ds = chip->ecc.strength;
>> +	u32 ecc_size = chip->ecc.size;
>> +	u32 writesize = mtd->writesize;
>> +	u32 blocksize = mtd->erasesize;
>> +	int bch_algo, start, val;
>> +
>> +	if (chip->ecc.mode != NAND_ECC_HW)
>> +		return 0;
>> +
>> +	/* Default to an ECC size of 512 */
>> +	if (!chip->ecc.size)
>> +		chip->ecc.size = 512;
>> +
>> +	switch (ecc_size) {
>> +	case 512:
>> +		start = 1;
>> +		if (!ecc_strength_ds)
>> +			ecc_strength_ds = 4;
>> +		break;
>> +	case 1024:
>> +		start = 4;
>> +		if (!ecc_strength_ds)
>> +			ecc_strength_ds = 32;
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	/* BCH ECC algorithm Settings for number of bits per 512B/1024B */
>> +	bch_algo = round_up(start + 1, 4);
>> +	for (val = start; val < bch_algo; val++) {
>> +		if (ecc_strength_ds == ecc_strength[val])
>> +			break;
>> +	}
>> +	if (val == bch_algo)
>> +		return -EINVAL;
>> +
>> +	if (ecc_strength_ds == 8)
>> +		ecc_bytes = 14;
>> +	else
>> +		ecc_bytes = DIV_ROUND_UP(ecc_strength_ds * fls(8 * ecc_size), 8);
>> +
>> +	ecc_steps = writesize / ecc_size;
>> +	ecc_total = ecc_steps * ecc_bytes;
>> +	if ((ecc_total + 8) > mtd->oobsize)
>> +		return -ERANGE;
>> +
>> +	chip->ecc.total = ecc_total;
>> +	pagesize = fls(writesize >> 11);
>> +	if (pagesize > HSNAND_PARA0_PAGE_V8192)
>> +		return -ERANGE;
>> +
>> +	pg_per_blk = fls((blocksize / writesize) >> 6) << 4;
> 
> If << 4 is here to mean / 8, then I don't want a shift operation
> because it is highly unreadable and compilers know how to optimize
> this.
Thanks!, will update.
> 
>> +	if (pg_per_blk > HSNAND_PARA0_PIB_V256)
>> +		return -ERANGE;
>> +
>> +	ebu_host->nd_para0 = pagesize | pg_per_blk | HSNAND_PARA0_BYP_EN_NP |
>> +			     HSNAND_PARA0_BYP_DEC_NP | HSNAND_PARA0_ADEP_EN |
>> +			     HSNAND_PARA0_TYPE_ONFI | (val << 29);
>> +
>> +	mtd_set_ooblayout(mtd, &ebu_nand_ooblayout_ops);
>> +	chip->ecc.read_page = ebu_nand_read_page_hwecc;
>> +	chip->ecc.write_page = ebu_nand_write_page_hwecc;
>> +
>> +	return 0;
>> +}
>> +
>> +static int ebu_nand_exec_op(struct nand_chip *chip,
>> +			    const struct nand_operation *op, bool check_only)
>> +{
>> +	struct ebu_nand_controller *ctrl = nand_to_ebu(chip);
>> +	const struct nand_op_instr *instr = NULL;
>> +	unsigned int op_id;
>> +	int i, time_out, ret = 0;
>> +	u32 stat;
>> +
>> +	if (check_only)
>> +		ebu_select_chip(chip);
> 
> What is the point of selecting the chip if check_only is true?
while converting to exec_op() based data structure, added like other 
drivers, let me check and update accordingly, Thanks!.

Regards
Vadivel
> 
>> +
>> +	for (op_id = 0; op_id < op->ninstrs; op_id++) {
>> +		instr = &op->instrs[op_id];
>> +
>> +		switch (instr->type) {
>> +		case NAND_OP_CMD_INSTR:
>> +			ebu_nand_writeb(chip, HSNAND_CLE_OFFS | HSNAND_CS_OFFS,
>> +					instr->ctx.cmd.opcode);
>> +			break;
>> +
>> +		case NAND_OP_ADDR_INSTR:
>> +			for (i = 0; i < instr->ctx.addr.naddrs; i++)
>> +				ebu_nand_writeb(chip,
>> +						HSNAND_ALE_OFFS | HSNAND_CS_OFFS,
>> +						instr->ctx.addr.addrs[i]);
>> +			break;
>> +
>> +		case NAND_OP_DATA_IN_INSTR:
>> +			ebu_read_buf(chip, instr->ctx.data.buf.in,
>> +				     instr->ctx.data.len);
>> +			break;
>> +
>> +		case NAND_OP_DATA_OUT_INSTR:
>> +			ebu_write_buf(chip, instr->ctx.data.buf.out,
>> +				      instr->ctx.data.len);
>> +			break;
>> +
>> +		case NAND_OP_WAITRDY_INSTR:
>> +			time_out = instr->ctx.waitrdy.timeout_ms * 1000;
>> +			ret = readl_poll_timeout(ctrl->ebu + EBU_WAIT,
>> +						 stat, stat & EBU_WAIT_RDBY,
>> +						 20, time_out);
>> +			break;
>> +		}
>> +	}
>> +
>> +	return ret;
>> +}
> 
> 
> Thanks,
> Miquèl
> 
