Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FDB715F61A
	for <lists+linux-mips@lfdr.de>; Fri, 14 Feb 2020 19:49:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389588AbgBNStf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 14 Feb 2020 13:49:35 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:39266 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729075AbgBNStf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 14 Feb 2020 13:49:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1581706173; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6amC/OVIFlLHub5F785fAjlFzpLld0TV8qvqmAgMxjk=;
        b=droexYZM9oNFSDvNGEeHVepQvs8y7Wl96aLWHqnmqgBxwaampEiLy7nop2M6V2IcDZNs/M
        OGhJz+GR1GveT9b6aLoUF/XFO8wDVPXNTiktESx3hA0LA/hN3B6ggpYE739JDpuOd3Uoz8
        TNqUPKjEJFzDrcP/VXFh+yxY2pLOLU4=
Date:   Fri, 14 Feb 2020 15:49:18 -0300
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 2/6] clk: Ingenic: Adjust cgu code to make it
 compatible with X1830.
To:     =?UTF-8?b?5ZGo55Cw5p2w?= "(Zhou Yanjie)" 
        <zhouyanjie@wanyeetech.com>
Cc:     linux-mips@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com
Message-Id: <1581706158.3.4@crapouillou.net>
In-Reply-To: <1581701262-110556-4-git-send-email-zhouyanjie@wanyeetech.com>
References: <1581701262-110556-1-git-send-email-zhouyanjie@wanyeetech.com>
        <1581701262-110556-4-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Zhou,


Le sam., f=C3=A9vr. 15, 2020 at 01:27, =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Ya=
njie)=20
<zhouyanjie@wanyeetech.com> a =C3=A9crit :
> The PLL of X1830 Soc from Ingenic has been greatly changed,
> the bypass control is placed in another register, so now two
> registers may needed to control the PLL. To this end, the
> original "reg" was changed to "pll_reg", and a new "bypass_reg"
> was introduced. In addition, when calculating rate, the PLL of
> X1830 introduced an extra 2x multiplier, so a new "rate_multiplier"
> was introduced. And adjust the code in jz47xx-cgu.c and x1000-cgu.c,
> make it to be compatible with the new cgu code.
>=20
> Signed-off-by: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) <zhouyanjie@wany=
eetech.com>
> ---
>=20
> Notes:
>     v1->v2:
>     1.Use two fields (pll_reg & bypass_reg) instead of the 2-values
>       array (reg[2]).
>     2.Remove the "pll_info->version" and add a=20
> "pll_info->rate_multiplier".
>     3.Fix the coding style and add more detailed commit message.
>     4.Change my Signed-off-by from "Zhou Yanjie <zhouyanjie@zoho.com>"
>       to "=E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) <zhouyanjie@wanyeetec=
h.com>" because
>       the old mailbox is in an unstable state.
>=20
>     v2->v3:
>     Adjust order from [1/5] in v2 to [2/5] in v3.
>=20
>     v3->v4:
>     Merge [3/5] in v3 into this patch.
>=20
>     v4->v5:
>     Rebase on top of kernel 5.6-rc1.
>=20
>  drivers/clk/ingenic/cgu.c         | 32=20
> +++++++++++++++++++++-----------
>  drivers/clk/ingenic/cgu.h         |  8 ++++++--
>  drivers/clk/ingenic/jz4725b-cgu.c |  4 +++-
>  drivers/clk/ingenic/jz4740-cgu.c  |  4 +++-
>  drivers/clk/ingenic/jz4770-cgu.c  |  8 ++++++--
>  drivers/clk/ingenic/jz4780-cgu.c  |  4 +++-
>  drivers/clk/ingenic/x1000-cgu.c   |  8 ++++++--
>  7 files changed, 48 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/clk/ingenic/cgu.c b/drivers/clk/ingenic/cgu.c
> index ab1302a..7d859e4 100644
> --- a/drivers/clk/ingenic/cgu.c
> +++ b/drivers/clk/ingenic/cgu.c
> @@ -82,7 +82,7 @@ ingenic_pll_recalc_rate(struct clk_hw *hw, unsigned=20
> long parent_rate)
>  	BUG_ON(clk_info->type !=3D CGU_CLK_PLL);
>  	pll_info =3D &clk_info->pll;
>=20
> -	ctl =3D readl(cgu->base + pll_info->reg);
> +	ctl =3D readl(cgu->base + pll_info->pll_reg);
>=20
>  	m =3D (ctl >> pll_info->m_shift) & GENMASK(pll_info->m_bits - 1, 0);
>  	m +=3D pll_info->m_offset;
> @@ -90,6 +90,9 @@ ingenic_pll_recalc_rate(struct clk_hw *hw, unsigned=20
> long parent_rate)
>  	n +=3D pll_info->n_offset;
>  	od_enc =3D ctl >> pll_info->od_shift;
>  	od_enc &=3D GENMASK(pll_info->od_bits - 1, 0);
> +
> +	ctl =3D readl(cgu->base + pll_info->bypass_reg);
> +
>  	bypass =3D !pll_info->no_bypass_bit &&
>  		 !!(ctl & BIT(pll_info->bypass_bit));
>=20
> @@ -103,7 +106,8 @@ ingenic_pll_recalc_rate(struct clk_hw *hw,=20
> unsigned long parent_rate)
>  	BUG_ON(od =3D=3D pll_info->od_max);
>  	od++;
>=20
> -	return div_u64((u64)parent_rate * m, n * od);
> +	return div_u64((u64)parent_rate * m * pll_info->rate_multiplier,
> +		n * od);
>  }
>=20
>  static unsigned long
> @@ -136,7 +140,8 @@ ingenic_pll_calc(const struct=20
> ingenic_cgu_clk_info *clk_info,
>  	if (pod)
>  		*pod =3D od;
>=20
> -	return div_u64((u64)parent_rate * m, n * od);
> +	return div_u64((u64)parent_rate * m * pll_info->rate_multiplier,
> +		n * od);
>  }
>=20
>  static inline const struct ingenic_cgu_clk_info *to_clk_info(
> @@ -180,7 +185,7 @@ ingenic_pll_set_rate(struct clk_hw *hw, unsigned=20
> long req_rate,
>  			clk_info->name, req_rate, rate);
>=20
>  	spin_lock_irqsave(&cgu->lock, flags);
> -	ctl =3D readl(cgu->base + pll_info->reg);
> +	ctl =3D readl(cgu->base + pll_info->pll_reg);
>=20
>  	ctl &=3D ~(GENMASK(pll_info->m_bits - 1, 0) << pll_info->m_shift);
>  	ctl |=3D (m - pll_info->m_offset) << pll_info->m_shift;
> @@ -191,7 +196,7 @@ ingenic_pll_set_rate(struct clk_hw *hw, unsigned=20
> long req_rate,
>  	ctl &=3D ~(GENMASK(pll_info->od_bits - 1, 0) << pll_info->od_shift);
>  	ctl |=3D pll_info->od_encoding[od - 1] << pll_info->od_shift;
>=20
> -	writel(ctl, cgu->base + pll_info->reg);
> +	writel(ctl, cgu->base + pll_info->pll_reg);
>  	spin_unlock_irqrestore(&cgu->lock, flags);
>=20
>  	return 0;
> @@ -209,16 +214,21 @@ static int ingenic_pll_enable(struct clk_hw *hw)
>  	u32 ctl;
>=20
>  	spin_lock_irqsave(&cgu->lock, flags);
> -	ctl =3D readl(cgu->base + pll_info->reg);
> +	ctl =3D readl(cgu->base + pll_info->bypass_reg);
>=20
>  	ctl &=3D ~BIT(pll_info->bypass_bit);
> +
> +	writel(ctl, cgu->base + pll_info->bypass_reg);
> +
> +	ctl =3D readl(cgu->base + pll_info->pll_reg);
> +
>  	ctl |=3D BIT(pll_info->enable_bit);
>=20
> -	writel(ctl, cgu->base + pll_info->reg);
> +	writel(ctl, cgu->base + pll_info->pll_reg);
>=20
>  	/* wait for the PLL to stabilise */
>  	for (i =3D 0; i < timeout; i++) {
> -		ctl =3D readl(cgu->base + pll_info->reg);
> +		ctl =3D readl(cgu->base + pll_info->pll_reg);
>  		if (ctl & BIT(pll_info->stable_bit))
>  			break;
>  		mdelay(1);
> @@ -242,11 +252,11 @@ static void ingenic_pll_disable(struct clk_hw=20
> *hw)
>  	u32 ctl;
>=20
>  	spin_lock_irqsave(&cgu->lock, flags);
> -	ctl =3D readl(cgu->base + pll_info->reg);
> +	ctl =3D readl(cgu->base + pll_info->pll_reg);
>=20
>  	ctl &=3D ~BIT(pll_info->enable_bit);
>=20
> -	writel(ctl, cgu->base + pll_info->reg);
> +	writel(ctl, cgu->base + pll_info->pll_reg);
>  	spin_unlock_irqrestore(&cgu->lock, flags);
>  }
>=20
> @@ -258,7 +268,7 @@ static int ingenic_pll_is_enabled(struct clk_hw=20
> *hw)
>  	const struct ingenic_cgu_pll_info *pll_info =3D &clk_info->pll;
>  	u32 ctl;
>=20
> -	ctl =3D readl(cgu->base + pll_info->reg);
> +	ctl =3D readl(cgu->base + pll_info->pll_reg);
>=20
>  	return !!(ctl & BIT(pll_info->enable_bit));
>  }
> diff --git a/drivers/clk/ingenic/cgu.h b/drivers/clk/ingenic/cgu.h
> index 0dc8004..f7b6908 100644
> --- a/drivers/clk/ingenic/cgu.h
> +++ b/drivers/clk/ingenic/cgu.h
> @@ -16,7 +16,9 @@
>=20
>  /**
>   * struct ingenic_cgu_pll_info - information about a PLL
> - * @reg: the offset of the PLL's control register within the CGU
> + * @pll_reg: the offset of the PLL's control register within the CGU
> + * @bypass_reg: the offset of the bypass control register within the=20
> CGU
> + * @rate_multiplier: the multiplier needed by pll rate calculation
>   * @m_shift: the number of bits to shift the multiplier value by=20
> (ie. the
>   *           index of the lowest bit of the multiplier value in the=20
> PLL's
>   *           control register)
> @@ -43,7 +45,9 @@
>   * @no_bypass_bit: if set, the PLL has no bypass functionality
>   */
>  struct ingenic_cgu_pll_info {
> -	unsigned reg;
> +	unsigned pll_reg;

I'd prefer that you don't rename 'reg' to 'pll_reg', this patch would=20
be ten times smaller if you don't.

-Paul

> +	unsigned bypass_reg;
> +	unsigned rate_multiplier;
>  	const s8 *od_encoding;
>  	u8 m_shift, m_bits, m_offset;
>  	u8 n_shift, n_bits, n_offset;
> diff --git a/drivers/clk/ingenic/jz4725b-cgu.c=20
> b/drivers/clk/ingenic/jz4725b-cgu.c
> index a3b4635..0b05167 100644
> --- a/drivers/clk/ingenic/jz4725b-cgu.c
> +++ b/drivers/clk/ingenic/jz4725b-cgu.c
> @@ -53,7 +53,9 @@ static const struct ingenic_cgu_clk_info=20
> jz4725b_cgu_clocks[] =3D {
>  		"pll", CGU_CLK_PLL,
>  		.parents =3D { JZ4725B_CLK_EXT, -1, -1, -1 },
>  		.pll =3D {
> -			.reg =3D CGU_REG_CPPCR,
> +			.pll_reg =3D CGU_REG_CPPCR,
> +			.bypass_reg =3D CGU_REG_CPPCR,
> +			.rate_multiplier =3D 1,
>  			.m_shift =3D 23,
>  			.m_bits =3D 9,
>  			.m_offset =3D 2,
> diff --git a/drivers/clk/ingenic/jz4740-cgu.c=20
> b/drivers/clk/ingenic/jz4740-cgu.c
> index 4f0e92c..78f31df 100644
> --- a/drivers/clk/ingenic/jz4740-cgu.c
> +++ b/drivers/clk/ingenic/jz4740-cgu.c
> @@ -68,7 +68,9 @@ static const struct ingenic_cgu_clk_info=20
> jz4740_cgu_clocks[] =3D {
>  		"pll", CGU_CLK_PLL,
>  		.parents =3D { JZ4740_CLK_EXT, -1, -1, -1 },
>  		.pll =3D {
> -			.reg =3D CGU_REG_CPPCR,
> +			.pll_reg =3D CGU_REG_CPPCR,
> +			.bypass_reg =3D CGU_REG_CPPCR,
> +			.rate_multiplier =3D 1,
>  			.m_shift =3D 23,
>  			.m_bits =3D 9,
>  			.m_offset =3D 2,
> diff --git a/drivers/clk/ingenic/jz4770-cgu.c=20
> b/drivers/clk/ingenic/jz4770-cgu.c
> index 956dd65..32e476d 100644
> --- a/drivers/clk/ingenic/jz4770-cgu.c
> +++ b/drivers/clk/ingenic/jz4770-cgu.c
> @@ -101,7 +101,9 @@ static const struct ingenic_cgu_clk_info=20
> jz4770_cgu_clocks[] =3D {
>  		"pll0", CGU_CLK_PLL,
>  		.parents =3D { JZ4770_CLK_EXT },
>  		.pll =3D {
> -			.reg =3D CGU_REG_CPPCR0,
> +			.pll_reg =3D CGU_REG_CPPCR0,
> +			.bypass_reg =3D CGU_REG_CPPCR0,
> +			.rate_multiplier =3D 1,
>  			.m_shift =3D 24,
>  			.m_bits =3D 7,
>  			.m_offset =3D 1,
> @@ -123,7 +125,9 @@ static const struct ingenic_cgu_clk_info=20
> jz4770_cgu_clocks[] =3D {
>  		"pll1", CGU_CLK_PLL,
>  		.parents =3D { JZ4770_CLK_EXT },
>  		.pll =3D {
> -			.reg =3D CGU_REG_CPPCR1,
> +			.pll_reg =3D CGU_REG_CPPCR1,
> +			.bypass_reg =3D CGU_REG_CPPCR1,
> +			.rate_multiplier =3D 1,
>  			.m_shift =3D 24,
>  			.m_bits =3D 7,
>  			.m_offset =3D 1,
> diff --git a/drivers/clk/ingenic/jz4780-cgu.c=20
> b/drivers/clk/ingenic/jz4780-cgu.c
> index ea905ff..d07fff1 100644
> --- a/drivers/clk/ingenic/jz4780-cgu.c
> +++ b/drivers/clk/ingenic/jz4780-cgu.c
> @@ -220,7 +220,9 @@ static const struct ingenic_cgu_clk_info=20
> jz4780_cgu_clocks[] =3D {
>  	/* PLLs */
>=20
>  #define DEF_PLL(name) { \
> -	.reg =3D CGU_REG_ ## name, \
> +	.pll_reg =3D CGU_REG_ ## name, \
> +	.bypass_reg =3D CGU_REG_ ## name, \
> +	.rate_multiplier =3D 1, \
>  	.m_shift =3D 19, \
>  	.m_bits =3D 13, \
>  	.m_offset =3D 1, \
> diff --git a/drivers/clk/ingenic/x1000-cgu.c=20
> b/drivers/clk/ingenic/x1000-cgu.c
> index b22d87b..d6fe28f 100644
> --- a/drivers/clk/ingenic/x1000-cgu.c
> +++ b/drivers/clk/ingenic/x1000-cgu.c
> @@ -57,7 +57,9 @@ static const struct ingenic_cgu_clk_info=20
> x1000_cgu_clocks[] =3D {
>  		"apll", CGU_CLK_PLL,
>  		.parents =3D { X1000_CLK_EXCLK, -1, -1, -1 },
>  		.pll =3D {
> -			.reg =3D CGU_REG_APLL,
> +			.pll_reg =3D CGU_REG_APLL,
> +			.bypass_reg =3D CGU_REG_APLL,
> +			.rate_multiplier =3D 1,
>  			.m_shift =3D 24,
>  			.m_bits =3D 7,
>  			.m_offset =3D 1,
> @@ -78,7 +80,9 @@ static const struct ingenic_cgu_clk_info=20
> x1000_cgu_clocks[] =3D {
>  		"mpll", CGU_CLK_PLL,
>  		.parents =3D { X1000_CLK_EXCLK, -1, -1, -1 },
>  		.pll =3D {
> -			.reg =3D CGU_REG_MPLL,
> +			.pll_reg =3D CGU_REG_MPLL,
> +			.bypass_reg =3D CGU_REG_MPLL,
> +			.rate_multiplier =3D 1,
>  			.m_shift =3D 24,
>  			.m_bits =3D 7,
>  			.m_offset =3D 1,
> --
> 2.7.4
>=20

=

