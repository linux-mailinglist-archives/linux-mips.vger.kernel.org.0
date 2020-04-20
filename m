Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CF341B004F
	for <lists+linux-mips@lfdr.de>; Mon, 20 Apr 2020 05:49:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725994AbgDTDtS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 19 Apr 2020 23:49:18 -0400
Received: from mga03.intel.com ([134.134.136.65]:24243 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725865AbgDTDtS (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 19 Apr 2020 23:49:18 -0400
IronPort-SDR: AYYnb+JpxBDsAolqsiVEuc7vRYVZSTk/np8BTmkL0TMZCXPIhOWCnbibEcQUu2LStq9UJcW2U8
 nR5izweqp7TQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2020 20:49:17 -0700
IronPort-SDR: 4UrEBGeaG8cV+J8iDtXegv6cO0gUSC0Sro0oybKE9nidysZMuV2xlK7GnOfe+sxGDZj5TASIVK
 JyLWN20GySjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,405,1580803200"; 
   d="scan'208";a="258208618"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga006.jf.intel.com with ESMTP; 19 Apr 2020 20:49:17 -0700
Received: from [10.249.68.96] (vramuthx-mobl1.gar.corp.intel.com [10.249.68.96])
        by linux.intel.com (Postfix) with ESMTP id 7137F580479;
        Sun, 19 Apr 2020 20:49:11 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] mtd: rawnand: Add NAND controller support on Intel
 LGM SoC
To:     Hauke Mehrtens <hauke@hauke-m.de>, linux-kernel@vger.kernel.org,
        linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
Cc:     cheol.yong.kim@intel.com, hauke.mehrtens@intel.com,
        andriy.shevchenko@intel.com, anders.roxell@linaro.org,
        vigneshr@ti.com, arnd@arndb.de, richard@nod.at,
        qi-ming.wu@intel.com, brendanhiggins@google.com,
        linux-mips@vger.kernel.org, robh+dt@kernel.org,
        boris.brezillon@collabora.com, miquel.raynal@bootlin.com,
        tglx@linutronix.de, masonccyang@mxic.com.tw, piotrs@cadence.com,
        John Crispin <john@phrozen.org>
References: <20200417082147.43384-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200417082147.43384-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <daee329a-b4ae-fae3-8d59-6bcf7377df22@hauke-m.de>
From:   "Ramuthevar, Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <fce11099-234f-5f5a-c877-095932d28975@linux.intel.com>
Date:   Mon, 20 Apr 2020 11:49:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <daee329a-b4ae-fae3-8d59-6bcf7377df22@hauke-m.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Hauke,

   Thank you very much for the review comments and your time...

On 18/4/2020 1:05 am, Hauke Mehrtens wrote:
> On 4/17/20 10:21 AM, Ramuthevar, Vadivel MuruganX wrote:
>> From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> Thanks for adding me in CC, I am using my private mail it took me too
> long to configure Outlook.
>
> I compared the register description of the LGM with the VRX200, the EBU
> and NAND block are looking very similar. I think the VRX200 also
> supports HW ECC and DMA, nobody implimented it in the upstream driver.
>
> I think replacing the old XWAY dirver with this one is a good approach.
Thank you for confirmation to replace the xway_nand.c since you are the 
owner for that driver.
> Then we can add feature flags to activate the extra features only on the
> SoCs which support them.
>
> On older SoCs the EBU (NAND) and the PCI (not express) IP core are
> sharing some parts like an endianess switch, this is causeing some more
> problems.
>
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
> .....
>
>> +config MTD_NAND_INTEL_LGM
>> +	tristate "Support for NAND controller on Intel LGM SoC"
>> +	depends on X86
> Compile test should also work for other archs
Noted, will add it.
>> +	help
>> +	  Enables support for NAND Flash chips on Intel's LGM SoC.
>> +          NAND flash interfaced through the External Bus Unit.
>> +
>>   comment "Misc"
> .....
>
>> +
>> +#define LGM_CLC			0x000
>> +#define LGM_CLC_RST		0x00000000u
>> +
>> +#define LGM_NAND_ECC_OFFSET	0x008
> It is confusing that this is not a register but a different definition.
> Please move it somewheer else.
Noted, will move it.
>> +#define LGM_ADDR_SEL(n)		(0x20 + (n) * 4)
>> +#define LGM_ADDR_MASK		(5 << 4)
>> +#define LGM_ADDR_SEL_REGEN	0x1
>> +
>> +#define LGM_BUSCON(n)		(0x60 + (n) * 4)
>> +#define LGM_BUSCON_CMULT_V4	0x1
>> +#define LGM_BUSCON_RECOVC(n)	((n) << 2)
>> +#define LGM_BUSCON_HOLDC(n)	((n) << 4)
>> +#define LGM_BUSCON_WAITRDC(n)	((n) << 6)
>> +#define LGM_BUSCON_WAITWRC(n)	((n) << 8)
>> +#define LGM_BUSCON_BCGEN_CS	0x0
>> +#define LGM_BUSCON_SETUP_EN	BIT(22)
>> +#define LGM_BUSCON_ALEC		0xC000
>> +
>> +#define NAND_CON		0x0B0
>> +#define NAND_CON_NANDM_EN	BIT(0)
>> +#define NAND_CON_NANDM_DIS	0x0
>> +#define NAND_CON_CSMUX_E_EN	BIT(1)
>> +#define NAND_CON_ALE_P_LOW	BIT(2)
>> +#define NAND_CON_CLE_P_LOW	BIT(3)
>> +#define NAND_CON_CS_P_LOW	BIT(4)
>> +#define NAND_CON_SE_P_LOW	BIT(5)
>> +#define NAND_CON_WP_P_LOW	BIT(6)
>> +#define NAND_CON_PRE_P_LOW	BIT(7)
>> +#define NAND_CON_IN_CS_S(n)	((n) << 8)
>> +#define NAND_CON_OUT_CS_S(n)	((n) << 10)
>> +#define NAND_CON_LAT_EN_CS_P	((0x3D) << 18)
>> +
>> +#define NAND_WAIT		0x0B4
>> +#define NAND_WAIT_RDBY		BIT(0)
>> +#define NAND_WAIT_WR_C		BIT(3)
> The registers with the LGM_ prefix, NAND_CON and NAND_WAIT are from the
> EBU (EBU_N) register block. I would prefer if the have the same prefix.
> You should use a different prefix for the register definitions below
> this comment, which are from the NAND Controller (HSNAND).
Sure, will use as you have suggested
>> +#define NAND_CTL1		0x110
>> +#define NAND_CTL1_ADDR_3_SHIFT	24
>> +
>> +#define NAND_CTL2		0x114
>> +#define NAND_CTL2_ADDR_5_SHIFT	8
>> +#define NAND_CTL2_CYC_N_V5	(0x2 << 16)
>> +
>> +#define NAND_INT_MSK_CTL	0x124
>> +#define NAND_INT_MSK_CTL_WR_C	BIT(4)
>> +
>> +#define NAND_INT_STA		0x128
>> +#define NAND_INT_STA_WR_C	BIT(4)
>> +
>> +#define NAND_CTL		0x130
>> +#define NAND_CTL_MODE_ECC	0x1
>> +#define NAND_CTL_GO		BIT(2)
>> +#define NAND_CTL_CE_SEL_CS(n)	BIT(3 + (n))
>> +#define NAND_CTL_RW_READ	0x0
>> +#define NAND_CTL_RW_WRITE	BIT(10)
>> +#define NAND_CTL_ECC_OFF_V8TH	BIT(11)
>> +#define NAND_CTL_CKFF_EN	0x0
>> +#define NAND_CTL_MSG_EN		BIT(17)
> Till here I find the same registers you use also in the VRX200
> description. I haven't checked all the bits. Danube only has the
> registers from the EBU, I haven't checked the SoCs in between.
Okay, I don't have other SoC's datasheet to check, otherwise would have 
checked it.
>> +#define NAND_PARA0		0x13c
>> +#define NAND_PARA0_PAGE_V8192	0x3
>> +#define NAND_PARA0_PIB_V256	(0x3 << 4)
>> +#define NAND_PARA0_BYP_EN_NP	0x0
>> +#define NAND_PARA0_BYP_DEC_NP	0x0
>> +#define NAND_PARA0_TYPE_ONFI	BIT(18)
>> +#define NAND_PARA0_ADEP_EN	BIT(21)
>> +
>> +#define NAND_CMSG_0		0x150
>> +#define NAND_CMSG_1		0x154
>> +
>> +#define NAND_WRITE_CMD		(NAND_CON_CS_P_LOW | NAND_CON_CLE_P_LOW)
>> +#define NAND_WRITE_ADDR		(NAND_CON_CS_P_LOW | NAND_CON_ALE_P_LOW)
>> +#define NAND_WRITE_DATA		NAND_CON_CS_P_LOW
>> +#define NAND_READ_DATA		NAND_CON_CS_P_LOW
>> +
>> +#define NAND_CHIP_NO_SELECTION	-1
>> +#define NAND_CHIP_SELECTION	0x0
>> +
> ....
>> +static int lgm_nand_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct lgm_nand_host *lgm_host;
>> +	struct nand_chip *nand;
>> +	phys_addr_t nandaddr_pa;
>> +	struct mtd_info *mtd;
>> +	struct resource *res;
>> +	int ret;
>> +	u32 cs;
>> +
>> +	lgm_host = devm_kzalloc(dev, sizeof(*lgm_host), GFP_KERNEL);
>> +	if (!lgm_host)
>> +		return -ENOMEM;
>> +
>> +	lgm_host->dev = dev;
>> +	nand_controller_init(&lgm_host->controller);
>> +
>> +	lgm_host->lgm_va =
>> +	devm_platform_ioremap_resource_byname(pdev, "lgmnand");
>> +	if (IS_ERR(lgm_host->lgm_va))
>> +		return PTR_ERR(lgm_host->lgm_va);
> lgm_va is named ebu_n in the register description. Could you rename this
> variable to ebu. I think the _va postfix is not needed as it should be
> clear that this is a virtual addresss.
Noted, will rename it.
>
>> +	lgm_host->hsnand_va =
>> +	devm_platform_ioremap_resource_byname(pdev, "hsnand");
>> +	if (IS_ERR(lgm_host->hsnand_va))
>> +		return PTR_ERR(lgm_host->hsnand_va);
>> +
>> +	ret = device_property_read_u32(dev, "nand,cs", &cs);
>> +	if (ret) {
>> +		dev_err(dev, "failed to get chip select: %d\n", ret);
>> +		return ret;
>> +	}
> The cs should be validated, ifsome uses cs == 4 there will be a problem.
> LGM supports CS 0 to 3 like the VRX200, danube for example only 0 and 1.
Even LGM also supports 0 or 1
>
>> +	lgm_host->cs = cs;
>> +
>> +	lgm_host->cs_name = devm_kasprintf(dev, GFP_KERNEL, "nand_cs%d", cs);
> cs_name is only used locally in this function you can also use some
> memory on the stack to generate the name.
>
>> +	if (IS_ERR(lgm_host->cs_name)) {
>> +		ret = PTR_ERR(lgm_host->cs_name);
>> +		dev_err(dev, "failed to get chip select name: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	res = devm_platform_ioremap_resource_byname(pdev, lgm_host->cs_name);
> This will only support one chip select at a time on the SoC. It is not
> possible to configure the DTS in a way to talk to two NAND chips on
> different chip selects. I think this is an uncommon scenario and I do
> not know if other NAND drivers in Linux support this feature.

Yes, you are Right, LGM supports only one nand chip at a time.

>> +	lgm_host->nandaddr_va = res;
>> +	nandaddr_pa = res->start;
>> +	if (IS_ERR(lgm_host->nandaddr_va))
>> +		return PTR_ERR(lgm_host->nandaddr_va);
>> +
>> +	lgm_host->clk = devm_clk_get(dev, NULL);
>> +	if (IS_ERR(lgm_host->clk)) {
>> +		ret = PTR_ERR(lgm_host->clk);
>> +		dev_err(dev, "failed to get clock: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = clk_prepare_enable(lgm_host->clk);
>> +	if (ret) {
>> +		dev_err(dev, "failed to enable clock: %d\n", ret);
>> +		return ret;
>> +	}
>> +	lgm_host->clk_rate = clk_get_rate(lgm_host->clk);
>> +
>> +	ret = lgm_dma_init(dev, lgm_host);
>> +	if (ret)
>> +		goto disable_clk;
>> +
>> +	writel(lower_32_bits(nandaddr_pa) | LGM_ADDR_SEL_REGEN | LGM_ADDR_MASK,
>> +	       lgm_host->lgm_va + LGM_ADDR_SEL(cs));
>> +
>> +	writel(LGM_BUSCON_CMULT_V4 | LGM_BUSCON_RECOVC(1) |
>> +	       LGM_BUSCON_HOLDC(1) | LGM_BUSCON_WAITRDC(2) |
>> +	       LGM_BUSCON_WAITWRC(2) | LGM_BUSCON_BCGEN_CS | LGM_BUSCON_ALEC |
>> +	       LGM_BUSCON_SETUP_EN, lgm_host->lgm_va + LGM_BUSCON(cs));
>> +
>> +	/*
>> +	 * NAND physical address selection is based on the chip select
>> +	 * and written to ADDR_SEL register to get Memory Region Base address.
>> +	 * FPI Bus addresses are compared to this base address in conjunction
>> +	 * with the mask control. Driver need to program this field!
>> +	 * Address: 0x17400 if chip select is CS_0
>> +	 * Address: 0x17C00 if chip select is CS_1
>> +	 * Refer the Intel LGM SoC datasheet.
> Could you please name the section name in the document, to make it
> easier to find it, the number will probably change over time.

okay, Noted

Regards
Vadivel
>> +	 */
>> +	writel(0x17400051, lgm_host->lgm_va + LGM_ADDR_SEL(0));
>> +	writel(0x17C00051, lgm_host->lgm_va + LGM_ADDR_SEL(cs));
> Please do not use magic values here. For example you set here the
> LGM_ADDR_SEL_REGEN bit a mask and a base.
Noted, will update with MACRO
>> +	nand_set_flash_node(&lgm_host->chip, dev->of_node);
>> +	mtd = nand_to_mtd(&lgm_host->chip);
>> +	mtd->dev.parent = dev;
>> +	lgm_host->dev = dev;
>> +
>> +	platform_set_drvdata(pdev, lgm_host);
>> +	nand_set_controller_data(&lgm_host->chip, lgm_host);
>> +
>> +	nand = &lgm_host->chip;
>> +	nand->controller = &lgm_host->controller;
>> +	nand->controller->ops = &lgm_nand_controller_ops;
>> +
>> +	/* Scan to find existence of the device */
>> +	ret = nand_scan(&lgm_host->chip, 1);
>> +	if (ret)
>> +		goto exit_dma;
>> +
>> +	ret = mtd_device_register(mtd, NULL, 0);
>> +	if (ret)
>> +		goto clean_nand;
>> +
>> +	return 0;
>> +
>> +clean_nand:
>> +	nand_cleanup(&lgm_host->chip);
>> +exit_dma:
>> +	lgm_dma_exit(lgm_host);
>> +disable_clk:
>> +	clk_disable_unprepare(lgm_host->clk);
>> +
>> +	return ret;
>> +}
> Hauke
>
