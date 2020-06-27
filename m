Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FD9020BE13
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jun 2020 06:08:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725840AbgF0EIa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 27 Jun 2020 00:08:30 -0400
Received: from mga04.intel.com ([192.55.52.120]:24646 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725772AbgF0EIa (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 27 Jun 2020 00:08:30 -0400
IronPort-SDR: ydXxz/7mHlCsN4aOnI5fVS4iB1ZAATVVb2QweOePRlG4xZS2yegnVEATM03ifs0XWVJh/OtWcr
 an+ljAhBy2+w==
X-IronPort-AV: E=McAfee;i="6000,8403,9664"; a="143070484"
X-IronPort-AV: E=Sophos;i="5.75,286,1589266800"; 
   d="scan'208";a="143070484"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2020 21:06:27 -0700
IronPort-SDR: w1ZJFkVvk9R2HCifKgzL4v9EbZXvSlbA2IYEJne9iebMY3ivAyIWoliJdZmbzgy/9M9bUF8Swo
 fcRSHKHkdKQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,286,1589266800"; 
   d="scan'208";a="453577327"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga005.jf.intel.com with ESMTP; 26 Jun 2020 21:06:26 -0700
Received: from [10.215.241.131] (vramuthx-MOBL1.gar.corp.intel.com [10.215.241.131])
        by linux.intel.com (Postfix) with ESMTP id E9E6A58027C;
        Fri, 26 Jun 2020 21:06:21 -0700 (PDT)
Reply-To: vadivel.muruganx.ramuthevar@linux.intel.com
Subject: Re: [RESEND, v11 2/2] mtd: rawnand: Add NAND controller support on
 Intel LGM SoC
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, richard@nod.at, vigneshr@ti.com,
        arnd@arndb.de, brendanhiggins@google.com, tglx@linutronix.de,
        boris.brezillon@collabora.com, anders.roxell@linaro.org,
        masonccyang@mxic.com.tw, robh+dt@kernel.org,
        linux-mips@vger.kernel.org, hauke.mehrtens@intel.com,
        andriy.shevchenko@intel.com, qi-ming.wu@intel.com,
        cheol.yong.kim@intel.com
References: <20200616093332.53927-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200616093332.53927-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200626090940.4d55bf9d@xps13>
From:   "Ramuthevar, Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <8e2551f5-b69d-ce51-8cbd-3a44ae63ea42@linux.intel.com>
Date:   Sat, 27 Jun 2020 12:06:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200626090940.4d55bf9d@xps13>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Miquel,

Thank you very much for the review comments and your time...

On 26/6/2020 3:09 pm, Miquel Raynal wrote:
> Hello,
> 
> "Ramuthevar,Vadivel MuruganX"
> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote on Tue, 16 Jun 2020
> 17:33:32 +0800:
> 
>> From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
>>
>> This patch adds the new IP of Nand Flash Controller(NFC) support
>> on Intel's Lightning Mountain(LGM) SoC.
>>
>> DMA is used for burst data transfer operation, also DMA HW supports
>> aligned 32bit memory address and aligned data access by default.
>> DMA burst of 8 supported. Data register used to support the read/write
>> operation from/to device.
>>
>> NAND controller driver implements ->exec_op() to replace legacy hooks,
>> these specific call-back method to execute NAND operations.
>>
>> Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
>> ---
> 
> [...]
> 
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
>> +
>> +	x = readl(ebu_host->hsnand + HSNAND_CTL);
>> +	x &= ~HSNAND_CTL_GO;
>> +	writel(x, ebu_host->hsnand + HSNAND_CTL);
>> +
>> +	return 0;
>> +}
>> +
>> +static const u8 ecc_strength[] = { 1, 1, 4, 8, 24, 32, 40, 60, };
>> +
>> +static int ebu_nand_attach_chip(struct nand_chip *chip)
>> +{
>> +	struct mtd_info *mtd = nand_to_mtd(chip);
>> +	struct ebu_nand_controller *ebu_host = nand_get_controller_data(chip);
>> +	u32 eccsize, eccsteps, eccbytes, ecctotal, pagesize, pg_per_blk;
>> +	u32 eccstrength = chip->ecc.strength;
>> +	u32 writesize = mtd->writesize;
>> +	u32 blocksize = mtd->erasesize;
>> +	int start, val, i;
>> +
>> +	if (chip->ecc.mode != NAND_ECC_HW)
>> +		return 0;
>> +
>> +	/* Check whether eccsize is 0x0 or wrong. assign eccsize = 512 if YES */
> 
> 	/* Default to an ECC size of 512 */
> 
>> +	if (!chip->ecc.size)
>> +		chip->ecc.size = 512;
>> +	eccsize = chip->ecc.size;
>> +
>> +	switch (eccsize) {
>> +	case 512:
>> +		start = 1;
>> +		if (!eccstrength)
>> +			eccstrength = 4;
>> +		break;
>> +	case 1024:
>> +		start = 4;
>> +		if (!eccstrength)
> 
> You might want to look at other drivers and check the ecc_strength_ds
> property.

Sure, I will look and update accordingly.

> 
>> +			eccstrength = 32;
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	i = round_up(start + 1, 4);
>> +	for (val = start; val < i; val++) {
>> +		if (eccstrength == ecc_strength[val])
>> +			break;
>> +	}
> 
> A comment to explain what is this would be nice.
> 
> Also "i" is not meaningful at all.

Well, Noted.

> 
>> +	if (val == i)
>> +		return -EINVAL;
>> +
>> +	if (eccstrength == 8)
>> +		eccbytes = 14;
>> +	else
>> +		eccbytes = DIV_ROUND_UP(eccstrength * fls(8 * eccsize), 8);
> 
> Does this formula works for eccstrength == 8 too?

Yes, it is working.

> 
>> +
>> +	eccsteps = writesize / eccsize;
>> +	ecctotal = eccsteps * eccbytes;
>> +	if ((ecctotal + 8) > mtd->oobsize)
>> +		return -ERANGE;
>> +
>> +	chip->ecc.total = ecctotal;
>> +	pagesize = fls(writesize >> 11);
>> +	if (pagesize > HSNAND_PARA0_PAGE_V8192)
>> +		return -ERANGE;
>> +
>> +	pg_per_blk = fls((blocksize / writesize) >> 6) << 4;
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
> 
> You don't handle the check_only parameter. This will fail with recent
> versions of the core.

Thanks for the latest information, will update.

> 
>> +{
>> +	struct ebu_nand_controller *ctrl = nand_to_ebu(chip);
>> +	const struct nand_op_instr *instr = NULL;
>> +	unsigned int op_id;
>> +	int i, time_out, ret = 0;
>> +	u32 stat;
>> +
>> +	ebu_select_chip(chip);
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
>> +
>> +static const struct nand_controller_ops ebu_nand_controller_ops = {
>> +	.attach_chip = ebu_nand_attach_chip,
>> +	.exec_op = ebu_nand_exec_op,
>> +	.setup_data_interface = ebu_nand_setup_data_interface,
>> +};
>> +
>> +static void ebu_dma_cleanup(struct ebu_nand_controller *ebu_host)
>> +{
>> +	if (ebu_host->dma_rx)
>> +		dma_release_channel(ebu_host->dma_rx);
>> +
>> +	if (ebu_host->dma_tx)
>> +		dma_release_channel(ebu_host->dma_tx);
>> +}
>> +
>> +static int ebu_nand_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct ebu_nand_controller *ebu_host;
>> +	struct nand_chip *nand;
>> +	struct mtd_info *mtd;
>> +	struct resource *res;
>> +	char *resname;
>> +	int ret, i;
>> +	u32 reg;
>> +
>> +	ebu_host = devm_kzalloc(dev, sizeof(*ebu_host), GFP_KERNEL);
>> +	if (!ebu_host)
>> +		return -ENOMEM;
>> +
>> +	ebu_host->dev = dev;
>> +	nand_controller_init(&ebu_host->controller);
>> +
>> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ebunand");
>> +	ebu_host->ebu = devm_ioremap_resource(&pdev->dev, res);
>> +	if (IS_ERR(ebu_host->ebu))
>> +		return PTR_ERR(ebu_host->ebu);
>> +
>> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "hsnand");
>> +	ebu_host->hsnand = devm_ioremap_resource(&pdev->dev, res);
>> +	if (IS_ERR(ebu_host->hsnand))
>> +		return PTR_ERR(ebu_host->hsnand);
>> +
>> +	ret = device_property_read_u32(dev, "nand,cs", &reg);
>> +	if (ret) {
>> +		dev_err(dev, "failed to get chip select: %d\n", ret);
>> +		return ret;
>> +	}
>> +	ebu_host->cs_num = reg;
>> +
>> +	for (i = 0; i < MAX_CS; i++) {
>> +		resname = devm_kasprintf(dev, GFP_KERNEL, "nand_cs%d", i);
>> +		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
>> +						   resname);
>> +		if (!res)
>> +			return -EINVAL;
>> +		ebu_host->cs[i].chipaddr = devm_ioremap_resource(dev, res);
>> +		ebu_host->cs[i].nand_pa = res->start;
>> +		if (IS_ERR(ebu_host->cs[i].chipaddr))
>> +			return PTR_ERR(ebu_host->cs[i].chipaddr);
>> +	}
>> +
>> +	ebu_host->clk = devm_clk_get(dev, NULL);
>> +	if (IS_ERR(ebu_host->clk)) {
>> +		ret = PTR_ERR(ebu_host->clk);
>> +		dev_err(dev, "failed to get clock: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = clk_prepare_enable(ebu_host->clk);
>> +	if (ret) {
>> +		dev_err(dev, "failed to enable clock: %d\n", ret);
>> +		return ret;
>> +	}
>> +	ebu_host->clk_rate = clk_get_rate(ebu_host->clk);
>> +
>> +	ebu_host->dma_tx = dma_request_chan(dev, "tx");
>> +	if (IS_ERR(ebu_host->dma_tx)) {
>> +		ret = PTR_ERR(ebu_host->dma_tx);
>> +		dev_err(dev, "DMA tx channel request fail!.\n");
>> +		goto err_cleanup_dma;
>> +	}
>> +
>> +	ebu_host->dma_rx = dma_request_chan(dev, "rx");
>> +	if (IS_ERR(ebu_host->dma_rx)) {
>> +		ret = PTR_ERR(ebu_host->dma_rx);
>> +		dev_err(dev, "DMA rx channel request fail!.\n");
>> +		goto err_cleanup_dma;
>> +	}
>> +
>> +	for (i = 0; i < MAX_CS; i++) {
>> +		resname = devm_kasprintf(dev, GFP_KERNEL, "addr_sel%d", i);
>> +		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
>> +						   resname);
>> +		if (!res)
>> +			return -EINVAL;
> 
> New line
Noted.
> 
>> +		ebu_host->cs[i].addr_sel = res->start;
>> +		writel(ebu_host->cs[i].addr_sel | EBU_ADDR_MASK(5) |
>> +		       EBU_ADDR_SEL_REGEN, ebu_host->ebu + EBU_ADDR_SEL(i));
>> +	}
>> +
>> +	nand_set_flash_node(&ebu_host->chip, dev->of_node);
> 
> You probably want to verify that mtd->name is set after
> nand_set_flash_node, to validate the presence of the mandatory 'label'
> DT property.

Sure, Noted

> 
>> +	mtd = nand_to_mtd(&ebu_host->chip);
>> +	mtd->dev.parent = dev;
>> +	ebu_host->dev = dev;
>> +
>> +	platform_set_drvdata(pdev, ebu_host);
>> +	nand_set_controller_data(&ebu_host->chip, ebu_host);
>> +
>> +	nand = &ebu_host->chip;
>> +	nand->controller = &ebu_host->controller;
>> +	nand->controller->ops = &ebu_nand_controller_ops;
>> +
>> +	/* Scan to find existence of the device */
>> +	ret = nand_scan(&ebu_host->chip, 1);
>> +	if (ret)
>> +		goto err_cleanup_dma;
>> +
>> +	ret = mtd_device_register(mtd, NULL, 0);
>> +	if (ret)
>> +		goto err_clean_nand;
>> +
>> +	return 0;
>> +
>> +err_clean_nand:
>> +	nand_cleanup(&ebu_host->chip);
>> +err_cleanup_dma:
>> +	ebu_dma_cleanup(ebu_host);
>> +	clk_disable_unprepare(ebu_host->clk);
>> +
>> +	return ret;
>> +}
>> +
>> +static int ebu_nand_remove(struct platform_device *pdev)
>> +{
>> +	struct ebu_nand_controller *ebu_host = platform_get_drvdata(pdev);
>> +
>> +	mtd_device_unregister(nand_to_mtd(&ebu_host->chip));
> 
> ret = mtd_device...
> WARN_ON(ret);

Well, Noted.

> 
>> +	nand_cleanup(&ebu_host->chip);
>> +	ebu_nand_disable(&ebu_host->chip);
>> +	ebu_dma_cleanup(ebu_host);
>> +	clk_disable_unprepare(ebu_host->clk);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct of_device_id ebu_nand_match[] = {
>> +	{ .compatible = "intel,nand-controller", },
> 
> Any version to append to the compatible?

.compatible = "lantiq,nand-xway" may be appended in the future.

Regards
Vadivel
> 
>> +	{}
>> +};
>> +MODULE_DEVICE_TABLE(of, ebu_nand_match);
>> +
>> +static struct platform_driver ebu_nand_driver = {
>> +	.probe = ebu_nand_probe,
>> +	.remove = ebu_nand_remove,
>> +	.driver = {
>> +		.name = "intel-nand-controller",
>> +		.of_match_table = ebu_nand_match,
>> +	},
>> +
>> +};
>> +module_platform_driver(ebu_nand_driver);
>> +
>> +MODULE_LICENSE("GPL v2");
>> +MODULE_AUTHOR("Vadivel Murugan R <vadivel.muruganx.ramuthevar@intel.com>");
>> +MODULE_DESCRIPTION("Intel's LGM External Bus NAND Controller driver");
> 
> 
> Thanks,
> Miquèl
> 
