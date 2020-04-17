Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 353841AE31D
	for <lists+linux-mips@lfdr.de>; Fri, 17 Apr 2020 19:06:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728185AbgDQRFg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 17 Apr 2020 13:05:36 -0400
Received: from mout-p-202.mailbox.org ([80.241.56.172]:38280 "EHLO
        mout-p-202.mailbox.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727913AbgDQRFf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 17 Apr 2020 13:05:35 -0400
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mout-p-202.mailbox.org (Postfix) with ESMTPS id 493jCG65XlzQlGx;
        Fri, 17 Apr 2020 19:05:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
        by spamfilter03.heinlein-hosting.de (spamfilter03.heinlein-hosting.de [80.241.56.117]) (amavisd-new, port 10030)
        with ESMTP id oZM1Jj0PUC7U; Fri, 17 Apr 2020 19:05:26 +0200 (CEST)
Subject: Re: [PATCH v2 2/2] mtd: rawnand: Add NAND controller support on Intel
 LGM SoC
To:     "Ramuthevar, Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org
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
From:   Hauke Mehrtens <hauke@hauke-m.de>
Autocrypt: addr=hauke@hauke-m.de; keydata=
 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
Message-ID: <daee329a-b4ae-fae3-8d59-6bcf7377df22@hauke-m.de>
Date:   Fri, 17 Apr 2020 19:05:11 +0200
MIME-Version: 1.0
In-Reply-To: <20200417082147.43384-3-vadivel.muruganx.ramuthevar@linux.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="nhtoByWKRiQDauhiQJsvVlUJUQJLyKE0J"
X-Rspamd-Queue-Id: 28603174A
X-Rspamd-Score: -5.28 / 15.00 / 15.00
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--nhtoByWKRiQDauhiQJsvVlUJUQJLyKE0J
Content-Type: multipart/mixed; boundary="gY4Ewa0HzpZrr8DilqBgRBRVxNujPYaWL"

--gY4Ewa0HzpZrr8DilqBgRBRVxNujPYaWL
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 4/17/20 10:21 AM, Ramuthevar, Vadivel MuruganX wrote:
> From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.int=
el.com>

Thanks for adding me in CC, I am using my private mail it took me too
long to configure Outlook.

I compared the register description of the LGM with the VRX200, the EBU
and NAND block are looking very similar. I think the VRX200 also
supports HW ECC and DMA, nobody implimented it in the upstream driver.

I think replacing the old XWAY dirver with this one is a good approach.
Then we can add feature flags to activate the extra features only on the
SoCs which support them.

On older SoCs the EBU (NAND) and the PCI (not express) IP core are
sharing some parts like an endianess switch, this is causeing some more
problems.

> This patch adds the new IP of Nand Flash Controller(NFC) support
> on Intel's Lightning Mountain(LGM) SoC.
>=20
> DMA is used for burst data transfer operation, also DMA HW supports
> aligned 32bit memory address and aligned data access by default.
> DMA burst of 8 supported. Data register used to support the read/write
> operation from/to device.
>=20
> NAND controller driver implements ->exec_op() to replace legacy hooks,
> these specific call-back method to execute NAND operations.
>=20
> Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@=
linux.intel.com>

=2E....

> +config MTD_NAND_INTEL_LGM
> +	tristate "Support for NAND controller on Intel LGM SoC"
> +	depends on X86

Compile test should also work for other archs

> +	help
> +	  Enables support for NAND Flash chips on Intel's LGM SoC.
> +          NAND flash interfaced through the External Bus Unit.
> +
>  comment "Misc"

=2E....

> +
> +#define LGM_CLC			0x000
> +#define LGM_CLC_RST		0x00000000u
> +
> +#define LGM_NAND_ECC_OFFSET	0x008
It is confusing that this is not a register but a different definition.
Please move it somewheer else.

> +#define LGM_ADDR_SEL(n)		(0x20 + (n) * 4)
> +#define LGM_ADDR_MASK		(5 << 4)
> +#define LGM_ADDR_SEL_REGEN	0x1
> +
> +#define LGM_BUSCON(n)		(0x60 + (n) * 4)
> +#define LGM_BUSCON_CMULT_V4	0x1
> +#define LGM_BUSCON_RECOVC(n)	((n) << 2)
> +#define LGM_BUSCON_HOLDC(n)	((n) << 4)
> +#define LGM_BUSCON_WAITRDC(n)	((n) << 6)
> +#define LGM_BUSCON_WAITWRC(n)	((n) << 8)
> +#define LGM_BUSCON_BCGEN_CS	0x0
> +#define LGM_BUSCON_SETUP_EN	BIT(22)
> +#define LGM_BUSCON_ALEC		0xC000
> +
> +#define NAND_CON		0x0B0
> +#define NAND_CON_NANDM_EN	BIT(0)
> +#define NAND_CON_NANDM_DIS	0x0
> +#define NAND_CON_CSMUX_E_EN	BIT(1)
> +#define NAND_CON_ALE_P_LOW	BIT(2)
> +#define NAND_CON_CLE_P_LOW	BIT(3)
> +#define NAND_CON_CS_P_LOW	BIT(4)
> +#define NAND_CON_SE_P_LOW	BIT(5)
> +#define NAND_CON_WP_P_LOW	BIT(6)
> +#define NAND_CON_PRE_P_LOW	BIT(7)
> +#define NAND_CON_IN_CS_S(n)	((n) << 8)
> +#define NAND_CON_OUT_CS_S(n)	((n) << 10)
> +#define NAND_CON_LAT_EN_CS_P	((0x3D) << 18)
> +
> +#define NAND_WAIT		0x0B4
> +#define NAND_WAIT_RDBY		BIT(0)
> +#define NAND_WAIT_WR_C		BIT(3)

The registers with the LGM_ prefix, NAND_CON and NAND_WAIT are from the
EBU (EBU_N) register block. I would prefer if the have the same prefix.
You should use a different prefix for the register definitions below
this comment, which are from the NAND Controller (HSNAND).

> +#define NAND_CTL1		0x110
> +#define NAND_CTL1_ADDR_3_SHIFT	24
> +
> +#define NAND_CTL2		0x114
> +#define NAND_CTL2_ADDR_5_SHIFT	8
> +#define NAND_CTL2_CYC_N_V5	(0x2 << 16)
> +
> +#define NAND_INT_MSK_CTL	0x124
> +#define NAND_INT_MSK_CTL_WR_C	BIT(4)
> +
> +#define NAND_INT_STA		0x128
> +#define NAND_INT_STA_WR_C	BIT(4)
> +
> +#define NAND_CTL		0x130
> +#define NAND_CTL_MODE_ECC	0x1
> +#define NAND_CTL_GO		BIT(2)
> +#define NAND_CTL_CE_SEL_CS(n)	BIT(3 + (n))
> +#define NAND_CTL_RW_READ	0x0
> +#define NAND_CTL_RW_WRITE	BIT(10)
> +#define NAND_CTL_ECC_OFF_V8TH	BIT(11)
> +#define NAND_CTL_CKFF_EN	0x0
> +#define NAND_CTL_MSG_EN		BIT(17)

Till here I find the same registers you use also in the VRX200
description. I haven't checked all the bits. Danube only has the
registers from the EBU, I haven't checked the SoCs in between.

> +#define NAND_PARA0		0x13c
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
> +#define NAND_WRITE_CMD		(NAND_CON_CS_P_LOW | NAND_CON_CLE_P_LOW)
> +#define NAND_WRITE_ADDR		(NAND_CON_CS_P_LOW | NAND_CON_ALE_P_LOW)
> +#define NAND_WRITE_DATA		NAND_CON_CS_P_LOW
> +#define NAND_READ_DATA		NAND_CON_CS_P_LOW
> +
> +#define NAND_CHIP_NO_SELECTION	-1
> +#define NAND_CHIP_SELECTION	0x0
> +

=2E...
> +static int lgm_nand_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct lgm_nand_host *lgm_host;
> +	struct nand_chip *nand;
> +	phys_addr_t nandaddr_pa;
> +	struct mtd_info *mtd;
> +	struct resource *res;
> +	int ret;
> +	u32 cs;
> +
> +	lgm_host =3D devm_kzalloc(dev, sizeof(*lgm_host), GFP_KERNEL);
> +	if (!lgm_host)
> +		return -ENOMEM;
> +
> +	lgm_host->dev =3D dev;
> +	nand_controller_init(&lgm_host->controller);
> +
> +	lgm_host->lgm_va =3D
> +	devm_platform_ioremap_resource_byname(pdev, "lgmnand");
> +	if (IS_ERR(lgm_host->lgm_va))
> +		return PTR_ERR(lgm_host->lgm_va);
lgm_va is named ebu_n in the register description. Could you rename this
variable to ebu. I think the _va postfix is not needed as it should be
clear that this is a virtual addresss.

> +	lgm_host->hsnand_va =3D
> +	devm_platform_ioremap_resource_byname(pdev, "hsnand");
> +	if (IS_ERR(lgm_host->hsnand_va))
> +		return PTR_ERR(lgm_host->hsnand_va);
> +
> +	ret =3D device_property_read_u32(dev, "nand,cs", &cs);
> +	if (ret) {
> +		dev_err(dev, "failed to get chip select: %d\n", ret);
> +		return ret;
> +	}

The cs should be validated, ifsome uses cs =3D=3D 4 there will be a probl=
em.
LGM supports CS 0 to 3 like the VRX200, danube for example only 0 and 1.

> +	lgm_host->cs =3D cs;
> +
> +	lgm_host->cs_name =3D devm_kasprintf(dev, GFP_KERNEL, "nand_cs%d", cs=
);

cs_name is only used locally in this function you can also use some
memory on the stack to generate the name.

> +	if (IS_ERR(lgm_host->cs_name)) {
> +		ret =3D PTR_ERR(lgm_host->cs_name);
> +		dev_err(dev, "failed to get chip select name: %d\n", ret);
> +		return ret;
> +	}
> +
> +	res =3D devm_platform_ioremap_resource_byname(pdev, lgm_host->cs_name=
);

This will only support one chip select at a time on the SoC. It is not
possible to configure the DTS in a way to talk to two NAND chips on
different chip selects. I think this is an uncommon scenario and I do
not know if other NAND drivers in Linux support this feature.

> +	lgm_host->nandaddr_va =3D res;
> +	nandaddr_pa =3D res->start;
> +	if (IS_ERR(lgm_host->nandaddr_va))
> +		return PTR_ERR(lgm_host->nandaddr_va);
> +
> +	lgm_host->clk =3D devm_clk_get(dev, NULL);
> +	if (IS_ERR(lgm_host->clk)) {
> +		ret =3D PTR_ERR(lgm_host->clk);
> +		dev_err(dev, "failed to get clock: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret =3D clk_prepare_enable(lgm_host->clk);
> +	if (ret) {
> +		dev_err(dev, "failed to enable clock: %d\n", ret);
> +		return ret;
> +	}
> +	lgm_host->clk_rate =3D clk_get_rate(lgm_host->clk);
> +
> +	ret =3D lgm_dma_init(dev, lgm_host);
> +	if (ret)
> +		goto disable_clk;
> +
> +	writel(lower_32_bits(nandaddr_pa) | LGM_ADDR_SEL_REGEN | LGM_ADDR_MAS=
K,
> +	       lgm_host->lgm_va + LGM_ADDR_SEL(cs));
> +
> +	writel(LGM_BUSCON_CMULT_V4 | LGM_BUSCON_RECOVC(1) |
> +	       LGM_BUSCON_HOLDC(1) | LGM_BUSCON_WAITRDC(2) |
> +	       LGM_BUSCON_WAITWRC(2) | LGM_BUSCON_BCGEN_CS | LGM_BUSCON_ALEC =
|
> +	       LGM_BUSCON_SETUP_EN, lgm_host->lgm_va + LGM_BUSCON(cs));
> +
> +	/*
> +	 * NAND physical address selection is based on the chip select
> +	 * and written to ADDR_SEL register to get Memory Region Base address=
=2E
> +	 * FPI Bus addresses are compared to this base address in conjunction=

> +	 * with the mask control. Driver need to program this field!
> +	 * Address: 0x17400 if chip select is CS_0
> +	 * Address: 0x17C00 if chip select is CS_1
> +	 * Refer the Intel LGM SoC datasheet.

Could you please name the section name in the document, to make it
easier to find it, the number will probably change over time.

> +	 */
> +	writel(0x17400051, lgm_host->lgm_va + LGM_ADDR_SEL(0));
> +	writel(0x17C00051, lgm_host->lgm_va + LGM_ADDR_SEL(cs));

Please do not use magic values here. For example you set here the
LGM_ADDR_SEL_REGEN bit a mask and a base.

> +	nand_set_flash_node(&lgm_host->chip, dev->of_node);
> +	mtd =3D nand_to_mtd(&lgm_host->chip);
> +	mtd->dev.parent =3D dev;
> +	lgm_host->dev =3D dev;
> +
> +	platform_set_drvdata(pdev, lgm_host);
> +	nand_set_controller_data(&lgm_host->chip, lgm_host);
> +
> +	nand =3D &lgm_host->chip;
> +	nand->controller =3D &lgm_host->controller;
> +	nand->controller->ops =3D &lgm_nand_controller_ops;
> +
> +	/* Scan to find existence of the device */
> +	ret =3D nand_scan(&lgm_host->chip, 1);
> +	if (ret)
> +		goto exit_dma;
> +
> +	ret =3D mtd_device_register(mtd, NULL, 0);
> +	if (ret)
> +		goto clean_nand;
> +
> +	return 0;
> +
> +clean_nand:
> +	nand_cleanup(&lgm_host->chip);
> +exit_dma:
> +	lgm_dma_exit(lgm_host);
> +disable_clk:
> +	clk_disable_unprepare(lgm_host->clk);
> +
> +	return ret;
> +}

Hauke


--gY4Ewa0HzpZrr8DilqBgRBRVxNujPYaWL--

--nhtoByWKRiQDauhiQJsvVlUJUQJLyKE0J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEyz0/uAcd+JwXmwtD8bdnhZyy68cFAl6Z4ccACgkQ8bdnhZyy
68e4jwgAqeUCBU9kjFmJAbwAxLYc/StxoKsLNvrP6uRMAxUbVfWCcPu4UI6ZyOW4
gdpRhVyZRslePGzP6sF+Rpzmsk674I1jy1HSeFkgBKm3oUk2NJd4T/T7I6wZXtOg
O4plsszB8BI5ufMYGYt2DR60PcJRtgMeDb1Eqfu+PDXvV7a7BUJu3dLv8Dl4TCig
BaPZwgOTDx2dgA8r39NEZT5XHM45OMqnWOw4JKp16krzviknVos9B8gL4XGzFHOP
g8+A5hD/YTYeyJMlmmgTbYilKvXV/SebmHMTD9TJG16XclCuWciSm3sJ4Ya53GPg
h22T+UePe5gce50GY8tBEZWTA1lq1g==
=x9hZ
-----END PGP SIGNATURE-----

--nhtoByWKRiQDauhiQJsvVlUJUQJLyKE0J--
