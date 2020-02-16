Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3F54160467
	for <lists+linux-mips@lfdr.de>; Sun, 16 Feb 2020 15:53:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728272AbgBPOxq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 16 Feb 2020 09:53:46 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:44850 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727691AbgBPOxq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 16 Feb 2020 09:53:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1581864822; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+hj+o5+flz0t0gYGOFX8vBGM9CELfzQub72n6jMJ6Sw=;
        b=n5f5IWfZcbO+LPv5c9/TZ8UUA6i6eKGleH5VhoFXGwXKSmgQA2yYm89Rm+9I4DQUQnSmte
        AHMP7hh/0gvffDb0Lk7YnHvRALT+O52iSkBM1Z/sn2aHWkDip9KFvrPD74L/3mPHekWn7q
        51kUqqD9kLAgL/nj56sOB9MLa3v2J5g=
Date:   Sun, 16 Feb 2020 11:53:16 -0300
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 1/7] clk: JZ4780: Add function for enable the second
 core.
To:     =?UTF-8?b?5ZGo55Cw5p2w?= "(Zhou Yanjie)" 
        <zhouyanjie@wanyeetech.com>
Cc:     linux-mips@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, ralf@linux-mips.org, paulburton@kernel.org,
        jiaxun.yang@flygoat.com, chenhc@lemote.com, allison@lohutok.net,
        tglx@linutronix.de, daniel.lezcano@linaro.org,
        geert+renesas@glider.be, krzk@kernel.org, keescook@chromium.org,
        ebiederm@xmission.com, miquel.raynal@bootlin.com,
        paul@boddie.org.uk, hns@goldelico.com,
        mips-creator-ci20-dev@googlegroups.com
Message-Id: <1581864796.3.2@crapouillou.net>
In-Reply-To: <1581792932-108032-3-git-send-email-zhouyanjie@wanyeetech.com>
References: <1581792932-108032-1-git-send-email-zhouyanjie@wanyeetech.com>
        <1581792932-108032-3-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Zhou,

Le dim., f=C3=A9vr. 16, 2020 at 02:55, =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Ya=
njie)=20
<zhouyanjie@wanyeetech.com> a =C3=A9crit :
> Add "jz4780_core1_enable()" for enable the second core of JZ4780,
> prepare for later commits.
>=20
> Tested-by: H. Nikolaus Schaller <hns@goldelico.com>
> Tested-by: Paul Boddie <paul@boddie.org.uk>
> Signed-off-by: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) <zhouyanjie@wany=
eetech.com>
> Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>=20
> Notes:
>     v5:
>     New patch, split from [1/6] in v4.
>=20
>  drivers/clk/ingenic/jz4780-cgu.c | 58=20
> ++++++++++++++++++++++++++++++++++++----
>  1 file changed, 53 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/clk/ingenic/jz4780-cgu.c=20
> b/drivers/clk/ingenic/jz4780-cgu.c
> index d07fff1..4f81819 100644
> --- a/drivers/clk/ingenic/jz4780-cgu.c
> +++ b/drivers/clk/ingenic/jz4780-cgu.c
> @@ -16,7 +16,7 @@
>=20
>  /* CGU register offsets */
>  #define CGU_REG_CLOCKCONTROL	0x00
> -#define CGU_REG_PLLCONTROL	0x0c
> +#define CGU_REG_LCR			0x04
>  #define CGU_REG_APLL		0x10
>  #define CGU_REG_MPLL		0x14
>  #define CGU_REG_EPLL		0x18
> @@ -46,8 +46,8 @@
>  #define CGU_REG_CLOCKSTATUS	0xd4
>=20
>  /* bits within the OPCR register */
> -#define OPCR_SPENDN0		(1 << 7)
> -#define OPCR_SPENDN1		(1 << 6)
> +#define OPCR_SPENDN0		BIT(7)
> +#define OPCR_SPENDN1		BIT(6)
>=20
>  /* bits within the USBPCR register */
>  #define USBPCR_USB_MODE		BIT(31)
> @@ -88,6 +88,13 @@
>  #define USBVBFIL_IDDIGFIL_MASK	(0xffff << USBVBFIL_IDDIGFIL_SHIFT)
>  #define USBVBFIL_USBVBFIL_MASK	(0xffff)
>=20
> +/* bits within the LCR register */
> +#define LCR_PD_SCPU			BIT(31)
> +#define LCR_SCPUS			BIT(27)
> +
> +/* bits within the CLKGR1 register */
> +#define CLKGR1_CORE1		BIT(15)
> +
>  static struct ingenic_cgu *cgu;
>=20
>  static u8 jz4780_otg_phy_get_parent(struct clk_hw *hw)
> @@ -205,6 +212,47 @@ static const struct clk_ops jz4780_otg_phy_ops =3D=20
> {
>  	.set_rate =3D jz4780_otg_phy_set_rate,
>  };
>=20
> +static int jz4780_core1_enable(struct clk_hw *hw)
> +{
> +	struct ingenic_clk *ingenic_clk =3D to_ingenic_clk(hw);
> +	struct ingenic_cgu *cgu =3D ingenic_clk->cgu;
> +	const unsigned int timeout =3D 100;
> +	unsigned long flags;
> +	unsigned int i;
> +	u32 lcr, clkgr1;
> +
> +	spin_lock_irqsave(&cgu->lock, flags);
> +
> +	lcr =3D readl(cgu->base + CGU_REG_LCR);
> +	lcr &=3D ~LCR_PD_SCPU;
> +	writel(lcr, cgu->base + CGU_REG_LCR);
> +
> +	clkgr1 =3D readl(cgu->base + CGU_REG_CLKGR1);
> +	clkgr1 &=3D ~CLKGR1_CORE1;
> +	writel(clkgr1, cgu->base + CGU_REG_CLKGR1);
> +
> +	spin_unlock_irqrestore(&cgu->lock, flags);
> +
> +	/* wait for the CPU to be powered up */
> +	for (i =3D 0; i < timeout; i++) {
> +		lcr =3D readl(cgu->base + CGU_REG_LCR);
> +		if (!(lcr & LCR_SCPUS))
> +			break;
> +		mdelay(1);
> +	}

You can use readl_poll_timeout() from <linux/iopoll.h>.

> +
> +	if (i =3D=3D timeout) {
> +		pr_err("%s: Wait for power up core1 timeout\n", __func__);
> +		return -EBUSY;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct clk_ops jz4780_core1_ops =3D {
> +	.enable =3D jz4780_core1_enable,
> +};
> +
>  static const s8 pll_od_encoding[16] =3D {
>  	0x0, 0x1, 0x2, 0x3, 0x4, 0x5, 0x6, 0x7,
>  	0x8, 0x9, 0xa, 0xb, 0xc, 0xd, 0xe, 0xf,
> @@ -701,9 +749,9 @@ static const struct ingenic_cgu_clk_info=20
> jz4780_cgu_clocks[] =3D {
>  	},
>=20
>  	[JZ4780_CLK_CORE1] =3D {
> -		"core1", CGU_CLK_GATE,
> +		"core1", CGU_CLK_CUSTOM,
>  		.parents =3D { JZ4780_CLK_CPU, -1, -1, -1 },
> -		.gate =3D { CGU_REG_CLKGR1, 15 },
> +		.custom =3D { &jz4780_core1_ops },
>  	},
>=20
>  };
> --
> 2.7.4
>=20

=

