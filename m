Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C00A1B7BB9
	for <lists+linux-mips@lfdr.de>; Fri, 24 Apr 2020 18:36:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728325AbgDXQgT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 24 Apr 2020 12:36:19 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:41864 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726793AbgDXQgT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 24 Apr 2020 12:36:19 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 521972A2B31;
        Fri, 24 Apr 2020 17:36:15 +0100 (BST)
Date:   Fri, 24 Apr 2020 18:36:12 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     "Ramuthevar, Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, cheol.yong.kim@intel.com,
        hauke.mehrtens@intel.com, qi-ming.wu@intel.com,
        anders.roxell@linaro.org, vigneshr@ti.com, arnd@arndb.de,
        richard@nod.at, brendanhiggins@google.com,
        linux-mips@vger.kernel.org, robh+dt@kernel.org,
        miquel.raynal@bootlin.com, tglx@linutronix.de,
        masonccyang@mxic.com.tw, andriy.shevchenko@intel.com
Subject: Re: [PATCH v3 2/2] mtd: rawnand: Add NAND controller support on
 Intel LGM SoC
Message-ID: <20200424183612.4cfdbb6a@collabora.com>
In-Reply-To: <20200423162113.38055-3-vadivel.muruganx.ramuthevar@linux.intel.com>
References: <20200423162113.38055-1-vadivel.muruganx.ramuthevar@linux.intel.com>
        <20200423162113.38055-3-vadivel.muruganx.ramuthevar@linux.intel.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 24 Apr 2020 00:21:13 +0800
"Ramuthevar, Vadivel MuruganX"
<vadivel.muruganx.ramuthevar@linux.intel.com> wrote:

> +
> +#define EBU_CLC			0x000
> +#define EBU_CLC_RST		0x00000000u
> +
> +#define	EBU_ADDR_SEL(n)		(0x20 + (n) * 4)

	   ^ Please replace those tabs by a single space.

> +#define	EBU_ADDR_MASK		(5 << 4)
> +#define	EBU_ADDR_SEL_REGEN	0x1
> +
> +#define EBU_BUSCON(n)		(0x60 + (n) * 4)
> +#define EBU_BUSCON_CMULT_V4	0x1
> +#define EBU_BUSCON_RECOVC(n)	((n) << 2)
> +#define EBU_BUSCON_HOLDC(n)	((n) << 4)
> +#define EBU_BUSCON_WAITRDC(n)	((n) << 6)
> +#define EBU_BUSCON_WAITWRC(n)	((n) << 8)
> +#define EBU_BUSCON_BCGEN_CS	0x0
> +#define EBU_BUSCON_SETUP_EN	BIT(22)
> +#define EBU_BUSCON_ALEC		0xC000
> +
> +#define EBU_CON			0x0B0
> +#define EBU_CON_NANDM_EN	BIT(0)
> +#define EBU_CON_NANDM_DIS	0x0
> +#define EBU_CON_CSMUX_E_EN	BIT(1)
> +#define EBU_CON_ALE_P_LOW	BIT(2)
> +#define EBU_CON_CLE_P_LOW	BIT(3)
> +#define EBU_CON_CS_P_LOW	BIT(4)
> +#define EBU_CON_SE_P_LOW	BIT(5)
> +#define EBU_CON_WP_P_LOW	BIT(6)
> +#define EBU_CON_PRE_P_LOW	BIT(7)
> +#define EBU_CON_IN_CS_S(n)	((n) << 8)
> +#define EBU_CON_OUT_CS_S(n)	((n) << 10)
> +#define EBU_CON_LAT_EN_CS_P	((0x3D) << 18)
> +
> +#define EBU_WAIT		0x0B4
> +#define EBU_WAIT_RDBY		BIT(0)
> +#define EBU_WAIT_WR_C		BIT(3)
> +
> +#define	EBU_MEM_BASE_CS_0	0x17400
> +#define	EBU_MEM_BASE_CS_1	0x17C00

If I refer to v2, that's actually 0x17400000 and 0x17C00000.
And I suspect those addresses come from the physical addresses of the
EBU range attached to those CS lines, which can be extracted
from the resource passed to the driver. But maybe I'm wrong.

> +#define	EBU_MEM_OFFSET		0x051

Sorry but that's too vague. What is this mask/offset encoding?

> +
> +#define HSNAND_CTL1		0x110
> +#define HSNAND_CTL1_ADDR_SHIFT	24
> +
> +#define HSNAND_CTL2		0x114
> +#define HSNAND_CTL2_ADDR_SHIFT	8
> +#define HSNAND_CTL2_CYC_N_V5	(0x2 << 16)
> +
> +#define HSNAND_INT_MSK_CTL	0x124
> +#define HSNAND_INT_MSK_CTL_WR_C	BIT(4)
> +
> +#define HSNAND_INT_STA		0x128
> +#define HSNAND_INT_STA_WR_C	BIT(4)
> +
> +#define HSNAND_CTL		0x130
> +#define HSNAND_CTL_MODE_ECC	0x1

#define HSNAND_CTL_ENABLE_ECC	BIT(0)

> +#define HSNAND_CTL_GO		BIT(2)
> +#define HSNAND_CTL_CE_SEL_CS(n)	BIT(3 + (n))
> +#define HSNAND_CTL_RW_READ	0x0
> +#define HSNAND_CTL_RW_WRITE	BIT(10)
> +#define HSNAND_CTL_ECC_OFF_V8TH	BIT(11)
> +#define HSNAND_CTL_CKFF_EN	0x0
> +#define HSNAND_CTL_MSG_EN	BIT(17)
> +
> +#define NAND_PARA0		0x13c

Why are some of those registers prefixed NAND and others HSNAND? I
guess HS stands for High-Speed.

> +#define NAND_PARA0_PAGE_V8192	0x3
> +#define NAND_PARA0_PIB_V256	(0x3 << 4)
> +#define NAND_PARA0_BYP_EN_NP	0x0
> +#define NAND_PARA0_BYP_DEC_NP	0x0
> +#define NAND_PARA0_TYPE_ONFI	BIT(18)
> +#define NAND_PARA0_ADEP_EN	BIT(21)
> +
> +#define NAND_CMSG_0		0x150
> +#define NAND_CMSG_1		0x154
> +
> +#define NAND_ALE_OFFS		BIT(2)
> +#define NAND_CLE_OFFS		BIT(3)
> +#define NAND_CS_OFFS		BIT(4)
> +
> +#define NAND_WRITE_CMD		(NAND_CS_OFFS | NAND_CLE_OFFS)
> +#define NAND_WRITE_ADDR		(NAND_CS_OFFS | NAND_ALE_OFFS)

Those macros are no longer used, you can drop them.

> +#define NAND_WRITE_DATA		EBU_CON_CS_P_LOW
> +#define NAND_READ_DATA		EBU_CON_CS_P_LOW

And those should not be used, please use NAND_CS_OFFS instead.

> +
> +#define NAND_ECC_OFFSET		0x008
> +
> +struct ebu_nand_controller {
> +	struct nand_controller	controller;

Can you drop the tabs and use one space between the type and field name?

> +	struct nand_chip	chip;

Can you add a comment explaining that this should be reworked if
someone needs to support more than one chip.

> +	void __iomem		*ebu_addr;
> +	void __iomem		*nand_addr;

Can we get rid of those _addr and rename those fields so they describe
more precisely what the MMIO range is about:

	void __iomem *ebu;
	void __iomem *hsnand;


> +	void __iomem		*chip_addr;

This field should be part of a specialized nand_chip object (see what's
done here [1]). More generally, you should move anything that's
chip-specific to this driver-specific nand_chip object. 

> +	struct clk		*clk;
> +	unsigned long		clk_rate;
> +	u32			cs;
> +	u32			nd_para0;

The cs and nd_para0 fields should be attached to the ebu_nand_chip
object too (see [1]). While you move that, please add a comment saying
that you currently only support single-CE chips.

> +	struct device		*dev;
> +	struct dma_chan		*dma_tx;
> +	struct dma_chan		*dma_rx;
> +	struct completion	dma_access_complete;

Maybe

	struct {
		struct dma_chan *tx;
		struct dma_chan *rx;
		struct completion complete;
	} dma;

> +	const char *cs_name;

You no longer use this field.

> +};
> +
> +static inline struct ebu_nand_controller *nand_to_ebu(struct nand_chip *chip)
> +{
> +	return container_of(chip, struct ebu_nand_controller, chip);
> +}
> +
> +static u8 ebu_nand_readb(struct nand_chip *chip, unsigned int op)
> +{
> +	struct ebu_nand_controller *ebu_host = nand_get_controller_data(chip);
> +	void __iomem *nand_wait = ebu_host->ebu_addr + EBU_WAIT;
> +	u32 stat;
> +	int ret;
> +	u8 val;
> +
> +	val = readb(ebu_host->chip_addr + op);

No need for op here, just pass NAND_CS_OFFS directly, and you can drop
the op argument.

> +
> +	ret = readl_poll_timeout(nand_wait, stat, stat & EBU_WAIT_WR_C,
> +				 20, 1000);
> +	if (ret)
> +		dev_warn(ebu_host->dev,
> +			 "ebu nand write timeout. nand_wait(0x%p)=0x%x\n",
> +			 nand_wait, readl(nand_wait));

Maybe dev_warn_ratelimited().

> +
> +	return val;
> +}
> +
> +static void ebu_nand_writeb(struct nand_chip *chip, int op, u8 value)

							^u32 offset,

> +{
> +	struct ebu_nand_controller *ebu_host = nand_get_controller_data(chip);
> +	void __iomem *nand_wait = ebu_host->ebu_addr + EBU_WAIT;
> +	u32 stat;
> +	int ret;
> +
> +	writeb(value, ebu_host->chip_addr + op);
> +
> +	ret = readl_poll_timeout(nand_wait, stat, stat & EBU_WAIT_WR_C,
> +				 20, 1000);
> +	if (ret)
> +		dev_warn(ebu_host->dev,
> +			 "ebu nand write timeout. nand_wait(0x%p)=0x%x\n",
> +			 nand_wait, readl(nand_wait));
> +}
> +
> +static void ebu_read_buf(struct nand_chip *chip, u_char *buf, int len)

						      ^void *	   ^unsigned int

Please update all of those.

> +{
> +	int i;
> +
> +	for (i = 0; i < len; i++)
> +		buf[i] = ebu_nand_readb(chip, NAND_READ_DATA);
> +}
> +
> +static void ebu_write_buf(struct nand_chip *chip, const u_char *buf, int len)
> +{
> +	int i;
> +
> +	for (i = 0; i < len; i++)
> +		ebu_nand_writeb(chip, NAND_WRITE_DATA, buf[i]);

				      ^NAND_CS_OFFS

> +}
> +
> +static void ebu_unselect_chip(struct nand_chip *chip)
> +{
> +	struct ebu_nand_controller *ebu_host = nand_get_controller_data(chip);
> +	void __iomem *nand_con = ebu_host->ebu_addr + EBU_CON;
> +	int val;

	^u32

> +
> +	val = readl(nand_con);
> +	writel(val & ~EBU_CON_NANDM_EN, nand_con);

And I suspect you could just do:

	writel(0, ebu_host->ebu + EBU_CON);

here.

BTW, maybe we don't have to unselect the chip and can instead do this
'disable NAND module' in a runtime PM hook when the NAND has been
unused for some time, but let's keep that for later.

> +}

...

> +static int ebu_nand_exec_op(struct nand_chip *chip,
> +			    const struct nand_operation *op, bool check_only)
> +{
> +	struct ebu_nand_controller *ctrl = nand_to_ebu(chip);
> +	const struct nand_op_instr *instr = NULL;
> +	unsigned int op_id;
> +	int i, time_out, ret = 0;
> +	u32 stat;
> +
> +	ebu_select_chip(chip);
> +
> +	for (op_id = 0; op_id < op->ninstrs; op_id++) {
> +		instr = &op->instrs[op_id];
> +
> +		switch (instr->type) {
> +		case NAND_OP_CMD_INSTR:
> +			ebu_nand_writeb(chip, NAND_CLE_OFFS,

Hm, are you sure you shouldn't add NAND_CS_OFFS here? I'd expect
the CS to be asserted when the CLE/ALE pin is. Or maybe NAND_CS_OFFS
is not about CS pin assertion/de-assertion, in which case this should
be documented (and the name should be changed accordingly).

> +					instr->ctx.cmd.opcode);
> +			break;
> +
> +		case NAND_OP_ADDR_INSTR:
> +			for (i = 0; i < instr->ctx.addr.naddrs; i++)
> +				ebu_nand_writeb(chip, NAND_ALE_OFFS,
> +						instr->ctx.addr.addrs[i]);
> +			break;
> +
> +		case NAND_OP_DATA_IN_INSTR:
> +			ebu_read_buf(chip, instr->ctx.data.buf.in,
> +				     instr->ctx.data.len);
> +			break;
> +
> +		case NAND_OP_DATA_OUT_INSTR:
> +			ebu_write_buf(chip, instr->ctx.data.buf.out,
> +				      instr->ctx.data.len);
> +			break;
> +
> +		case NAND_OP_WAITRDY_INSTR:
> +			time_out = instr->ctx.waitrdy.timeout_ms * 1000;
> +			ret = readl_poll_timeout(ctrl->ebu_addr + EBU_WAIT,
> +						 stat, stat & EBU_WAIT_RDBY,
> +						 20, time_out);
> +			break;
> +		}
> +	}

Yay! I really like this new version of exec_op().

> +
> +	ebu_unselect_chip(chip);
> +
> +	return ret;
> +}
> +
> +static const struct nand_controller_ops ebu_nand_controller_ops = {
> +	.attach_chip = ebu_nand_attach_chip,
> +	.exec_op = ebu_nand_exec_op,
> +};
> +
> +static void ebu_dma_cleanup(struct ebu_nand_controller *ebu_host)
> +{
> +	if (ebu_host->dma_rx) {
> +		dma_release_channel(ebu_host->dma_rx);
> +		ebu_host->dma_rx = NULL;

You don't need to reset the value here.

> +	}
> +
> +	if (ebu_host->dma_tx) {
> +		dma_release_channel(ebu_host->dma_tx);
> +		ebu_host->dma_tx = NULL;
> +	}
> +}
> +
> +static int ebu_nand_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct ebu_nand_controller *ebu_host;
> +	struct nand_chip *nand;
> +	phys_addr_t nandaddr_pa;
> +	struct mtd_info *mtd;
> +	struct resource *res;
> +	int ret;
> +	u32 cs;
> +
> +	ebu_host = devm_kzalloc(dev, sizeof(*ebu_host), GFP_KERNEL);
> +	if (!ebu_host)
> +		return -ENOMEM;
> +
> +	ebu_host->dev = dev;
> +	nand_controller_init(&ebu_host->controller);
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ebunand");
> +	ebu_host->ebu_addr = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(ebu_host->ebu_addr))
> +		return PTR_ERR(ebu_host->ebu_addr);
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "hsnand");
> +	ebu_host->nand_addr = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(ebu_host->nand_addr))
> +		return PTR_ERR(ebu_host->nand_addr);
> +
> +	ret = device_property_read_u32(dev, "nand,cs", &cs);

CS ids should be encoded in the reg property (see [1]).

> +	if (ret) {
> +		dev_err(dev, "failed to get chip select: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ebu_host->cs = cs;
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "nand_cs0");

	resname = devm_kasprintf("nand-cs%d", cs);
	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, resname);

> +	ebu_host->chip_addr = devm_ioremap_resource(&pdev->dev, res);
> +	nandaddr_pa = res->start;
> +	if (IS_ERR(ebu_host->chip_addr))
> +		return PTR_ERR(ebu_host->chip_addr);
> +
> +	ebu_host->clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(ebu_host->clk)) {
> +		ret = PTR_ERR(ebu_host->clk);
> +		dev_err(dev, "failed to get clock: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(ebu_host->clk);
> +	if (ret) {
> +		dev_err(dev, "failed to enable clock: %d\n", ret);
> +		return ret;
> +	}
> +	ebu_host->clk_rate = clk_get_rate(ebu_host->clk);
> +
> +	ebu_host->dma_tx = dma_request_chan(dev, "tx");
> +	if (IS_ERR(ebu_host->dma_tx)) {
> +		ret = PTR_ERR(ebu_host->dma_tx);
> +		dev_err(dev, "DMA tx channel request fail!.\n");
> +		goto exit_dma;
> +	}
> +
> +	ebu_host->dma_rx = dma_request_chan(dev, "rx");
> +	if (IS_ERR(ebu_host->dma_rx)) {
> +		ret = PTR_ERR(ebu_host->dma_rx);
> +		dev_err(dev, "DMA tx channel request fail!.\n");
> +		goto exit_dma;
> +	}
> +
> +	writel(lower_32_bits(nandaddr_pa) | EBU_ADDR_SEL_REGEN | EBU_ADDR_MASK,
> +	       ebu_host->ebu_addr + EBU_ADDR_SEL(cs));
> +
> +	writel(EBU_BUSCON_CMULT_V4 | EBU_BUSCON_RECOVC(1) |
> +	       EBU_BUSCON_HOLDC(1) | EBU_BUSCON_WAITRDC(2) |
> +	       EBU_BUSCON_WAITWRC(2) | EBU_BUSCON_BCGEN_CS | EBU_BUSCON_ALEC |
> +	       EBU_BUSCON_SETUP_EN, ebu_host->ebu_addr + EBU_BUSCON(cs));

Again, can you try to implement ->setup_data_interface()?

> +
> +	/*
> +	 * NAND physical address selection is based on the chip select
> +	 * and written to ADDR_SEL register to get Memory Region Base address.
> +	 * FPI Bus addresses are compared to this base address in conjunction
> +	 * with the mask control. Driver need to program this field!
> +	 * Address: 0x17400 if chip select is CS_0
> +	 * Address: 0x17C00 if chip select is CS_1
> +	 */
> +	writel(EBU_MEM_BASE_CS_0 + EBU_MEM_OFFSET,
> +	       ebu_host->ebu_addr + EBU_ADDR_SEL(0));
> +	writel(EBU_MEM_BASE_CS_1 + EBU_MEM_OFFSET,
> +	       ebu_host->ebu_addr + EBU_ADDR_SEL(cs));

See my comments on those values. I feel like the mapping should be
created based on information we gather from somewhere else.

> +	nand_set_flash_node(&ebu_host->chip, dev->of_node);
> +	mtd = nand_to_mtd(&ebu_host->chip);
> +	mtd->dev.parent = dev;
> +	ebu_host->dev = dev;
> +
> +	platform_set_drvdata(pdev, ebu_host);
> +	nand_set_controller_data(&ebu_host->chip, ebu_host);
> +
> +	nand = &ebu_host->chip;
> +	nand->controller = &ebu_host->controller;
> +	nand->controller->ops = &ebu_nand_controller_ops;
> +
> +	/* Scan to find existence of the device */
> +	ret = nand_scan(&ebu_host->chip, 1);
> +	if (ret)
> +		goto exit_dma;
> +
> +	ret = mtd_device_register(mtd, NULL, 0);
> +	if (ret)
> +		goto clean_nand;
> +
> +	return 0;
> +
> +clean_nand:

err_cleanup_nand:

> +	nand_cleanup(&ebu_host->chip);
> +exit_dma:

err_cleanup_dma:

> +	ebu_dma_cleanup(ebu_host);
> +	clk_disable_unprepare(ebu_host->clk);
> +
> +	return ret;
> +}
> +
> +static int ebu_nand_remove(struct platform_device *pdev)
> +{
> +	struct ebu_nand_controller *ebu_host = platform_get_drvdata(pdev);
> +
> +	mtd_device_unregister(nand_to_mtd(&ebu_host->chip));

Check the return value of this function please.


[1]https://elixir.bootlin.com/linux/v5.6/source/drivers/mtd/nand/raw/atmel/nand-controller.c#L148
