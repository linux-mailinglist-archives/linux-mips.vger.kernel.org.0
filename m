Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A643F10B49E
	for <lists+linux-mips@lfdr.de>; Wed, 27 Nov 2019 18:37:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727191AbfK0Rhp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 Nov 2019 12:37:45 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:44368 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726655AbfK0Rho (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 27 Nov 2019 12:37:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1574876261; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Oa3OZjm+zEJz5+1jQe04LGYhtCNnLh9zKg5UN09ntFg=;
        b=bQGwY6V0vWGpfrUg1bm08VbV+6BMKYJithbTXTjZue4X2vjzrHQXmzq0L3mZtDGt7RkS75
        S1//m9TQocAwm9/hWOUkCMcdR4uKmeRJj5h953vM9IqpzMf39xEhR0hmmCSmdz039uSKbC
        fTPP98gbxUVh9DJGHCp9nMl8HvirH9c=
Date:   Wed, 27 Nov 2019 18:37:33 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 1/5] clk: Ingenic: Adjust code to make it compatible with
 X1830.
To:     Zhou Yanjie <zhouyanjie@zoho.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, paul.burton@mips.com, paulburton@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, mark.rutland@arm.com,
        syq@debian.org, sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Message-Id: <1574876253.3.4@crapouillou.net>
In-Reply-To: <1574825576-91028-2-git-send-email-zhouyanjie@zoho.com>
References: <1574825576-91028-1-git-send-email-zhouyanjie@zoho.com>
        <1574825576-91028-2-git-send-email-zhouyanjie@zoho.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Zhou,


Le mer., nov. 27, 2019 at 11:32, Zhou Yanjie <zhouyanjie@zoho.com> a=20
=E9crit :
> 1.Adjust the PLL related code in "cgu.c" and "cgu.h" to make it
>   compatible with the X1830 Soc from Ingenic.
> 2.Adjust the code in "jz4740-cgu.c" to be compatible with the
>   new cgu code.
> 3.Adjust the code in "jz4725b-cgu.c" to be compatible with the
>   new cgu code.
> 4.Adjust the code in "jz4770-cgu.c" to be compatible with the
>   new cgu code.
> 5.Adjust the code in "jz4780-cgu.c" to be compatible with the
>   new cgu code.
> 6.Adjust the code in "x1000-cgu.c" to be compatible with the
>   new cgu code.
>=20
> Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
> ---
>  drivers/clk/ingenic/cgu.c         | 55=20
> +++++++++++++++++++++++++++++----------
>  drivers/clk/ingenic/cgu.h         | 12 ++++++++-
>  drivers/clk/ingenic/jz4725b-cgu.c |  3 ++-
>  drivers/clk/ingenic/jz4740-cgu.c  |  3 ++-
>  drivers/clk/ingenic/jz4770-cgu.c  |  6 +++--
>  drivers/clk/ingenic/jz4780-cgu.c  |  3 ++-
>  drivers/clk/ingenic/x1000-cgu.c   |  6 +++--
>  7 files changed, 66 insertions(+), 22 deletions(-)
>=20
> diff --git a/drivers/clk/ingenic/cgu.c b/drivers/clk/ingenic/cgu.c
> index 6e96303..c3c69a8 100644
> --- a/drivers/clk/ingenic/cgu.c
> +++ b/drivers/clk/ingenic/cgu.c
> @@ -84,7 +84,7 @@ ingenic_pll_recalc_rate(struct clk_hw *hw, unsigned=20
> long parent_rate)
>  	pll_info =3D &clk_info->pll;
>=20
>  	spin_lock_irqsave(&cgu->lock, flags);
> -	ctl =3D readl(cgu->base + pll_info->reg);
> +	ctl =3D readl(cgu->base + pll_info->reg[1]);

I really don't like this patch. There is no info on what reg[1] and=20
reg[0] are. First, don't use hardcoded numbers, use macros with=20
meaningful names. Second, why not just have two fields instead of one=20
2-values array? That would remove a lot of the noise.


>  	spin_unlock_irqrestore(&cgu->lock, flags);
>=20
>  	m =3D (ctl >> pll_info->m_shift) & GENMASK(pll_info->m_bits - 1, 0);
> @@ -93,8 +93,17 @@ ingenic_pll_recalc_rate(struct clk_hw *hw,=20
> unsigned long parent_rate)
>  	n +=3D pll_info->n_offset;
>  	od_enc =3D ctl >> pll_info->od_shift;
>  	od_enc &=3D GENMASK(pll_info->od_bits - 1, 0);
> -	bypass =3D !pll_info->no_bypass_bit &&
> -		 !!(ctl & BIT(pll_info->bypass_bit));
> +
> +	if (pll_info->version >=3D CGU_X1830) {
> +		spin_lock_irqsave(&cgu->lock, flags);
> +		ctl =3D readl(cgu->base + pll_info->reg[0]);
> +		spin_unlock_irqrestore(&cgu->lock, flags);

Why the spinlock?


> +
> +		bypass =3D !pll_info->no_bypass_bit &&
> +			 !!(ctl & BIT(pll_info->bypass_bit));
> +	} else

Please comply to the kernel coding style - use brackets after the else.

> +		bypass =3D !pll_info->no_bypass_bit &&
> +			 !!(ctl & BIT(pll_info->bypass_bit));
>=20
>  	if (bypass)
>  		return parent_rate;
> @@ -106,7 +115,10 @@ ingenic_pll_recalc_rate(struct clk_hw *hw,=20
> unsigned long parent_rate)
>  	BUG_ON(od =3D=3D pll_info->od_max);
>  	od++;
>=20
> -	return div_u64((u64)parent_rate * m, n * od);
> +	if (pll_info->version >=3D CGU_X1830)
> +		return div_u64((u64)parent_rate * m * 2, n * od);

Where does that *2 come from?

> +	else
> +		return div_u64((u64)parent_rate * m, n * od);
>  }
>=20
>  static unsigned long
> @@ -139,7 +151,10 @@ ingenic_pll_calc(const struct=20
> ingenic_cgu_clk_info *clk_info,
>  	if (pod)
>  		*pod =3D od;
>=20
> -	return div_u64((u64)parent_rate * m, n * od);
> +	if (pll_info->version >=3D CGU_X1830)
> +		return div_u64((u64)parent_rate * m * 2, n * od);
> +	else
> +		return div_u64((u64)parent_rate * m, n * od);
>  }
>=20
>  static inline const struct ingenic_cgu_clk_info *to_clk_info(
> @@ -183,7 +198,7 @@ ingenic_pll_set_rate(struct clk_hw *hw, unsigned=20
> long req_rate,
>  			clk_info->name, req_rate, rate);
>=20
>  	spin_lock_irqsave(&cgu->lock, flags);
> -	ctl =3D readl(cgu->base + pll_info->reg);
> +	ctl =3D readl(cgu->base + pll_info->reg[1]);
>=20
>  	ctl &=3D ~(GENMASK(pll_info->m_bits - 1, 0) << pll_info->m_shift);
>  	ctl |=3D (m - pll_info->m_offset) << pll_info->m_shift;
> @@ -194,7 +209,7 @@ ingenic_pll_set_rate(struct clk_hw *hw, unsigned=20
> long req_rate,
>  	ctl &=3D ~(GENMASK(pll_info->od_bits - 1, 0) << pll_info->od_shift);
>  	ctl |=3D pll_info->od_encoding[od - 1] << pll_info->od_shift;
>=20
> -	writel(ctl, cgu->base + pll_info->reg);
> +	writel(ctl, cgu->base + pll_info->reg[1]);
>  	spin_unlock_irqrestore(&cgu->lock, flags);
>=20
>  	return 0;
> @@ -212,16 +227,28 @@ static int ingenic_pll_enable(struct clk_hw *hw)
>  	u32 ctl;
>=20
>  	spin_lock_irqsave(&cgu->lock, flags);
> -	ctl =3D readl(cgu->base + pll_info->reg);
>=20
> -	ctl &=3D ~BIT(pll_info->bypass_bit);
> +	if (pll_info->version >=3D CGU_X1830) {
> +		ctl =3D readl(cgu->base + pll_info->reg[0]);
> +
> +		ctl &=3D ~BIT(pll_info->bypass_bit);
> +
> +		writel(ctl, cgu->base + pll_info->reg[0]);
> +
> +		ctl =3D readl(cgu->base + pll_info->reg[1]);
> +	} else {
> +		ctl =3D readl(cgu->base + pll_info->reg[1]);
> +
> +		ctl &=3D ~BIT(pll_info->bypass_bit);
> +	}
> +
>  	ctl |=3D BIT(pll_info->enable_bit);
>=20
> -	writel(ctl, cgu->base + pll_info->reg);
> +	writel(ctl, cgu->base + pll_info->reg[1]);
>=20
>  	/* wait for the PLL to stabilise */
>  	for (i =3D 0; i < timeout; i++) {
> -		ctl =3D readl(cgu->base + pll_info->reg);
> +		ctl =3D readl(cgu->base + pll_info->reg[1]);
>  		if (ctl & BIT(pll_info->stable_bit))
>  			break;
>  		mdelay(1);
> @@ -245,11 +272,11 @@ static void ingenic_pll_disable(struct clk_hw=20
> *hw)
>  	u32 ctl;
>=20
>  	spin_lock_irqsave(&cgu->lock, flags);
> -	ctl =3D readl(cgu->base + pll_info->reg);
> +	ctl =3D readl(cgu->base + pll_info->reg[1]);
>=20
>  	ctl &=3D ~BIT(pll_info->enable_bit);
>=20
> -	writel(ctl, cgu->base + pll_info->reg);
> +	writel(ctl, cgu->base + pll_info->reg[1]);
>  	spin_unlock_irqrestore(&cgu->lock, flags);
>  }
>=20
> @@ -263,7 +290,7 @@ static int ingenic_pll_is_enabled(struct clk_hw=20
> *hw)
>  	u32 ctl;
>=20
>  	spin_lock_irqsave(&cgu->lock, flags);
> -	ctl =3D readl(cgu->base + pll_info->reg);
> +	ctl =3D readl(cgu->base + pll_info->reg[1]);
>  	spin_unlock_irqrestore(&cgu->lock, flags);
>=20
>  	return !!(ctl & BIT(pll_info->enable_bit));
> diff --git a/drivers/clk/ingenic/cgu.h b/drivers/clk/ingenic/cgu.h
> index 0dc8004..5f87be4 100644
> --- a/drivers/clk/ingenic/cgu.h
> +++ b/drivers/clk/ingenic/cgu.h
> @@ -42,8 +42,18 @@
>   * @stable_bit: the index of the stable bit in the PLL control=20
> register
>   * @no_bypass_bit: if set, the PLL has no bypass functionality
>   */
> +enum ingenic_cgu_version {
> +	CGU_JZ4740,
> +	CGU_JZ4725B,
> +	CGU_JZ4770,
> +	CGU_JZ4780,
> +	CGU_X1000,
> +	CGU_X1830,
> +};
> +
>  struct ingenic_cgu_pll_info {
> -	unsigned reg;
> +	enum ingenic_cgu_version version;
> +	unsigned reg[2];
>  	const s8 *od_encoding;
>  	u8 m_shift, m_bits, m_offset;
>  	u8 n_shift, n_bits, n_offset;
> diff --git a/drivers/clk/ingenic/jz4725b-cgu.c=20
> b/drivers/clk/ingenic/jz4725b-cgu.c
> index a3b4635..6da7b41 100644
> --- a/drivers/clk/ingenic/jz4725b-cgu.c
> +++ b/drivers/clk/ingenic/jz4725b-cgu.c
> @@ -53,7 +53,8 @@ static const struct ingenic_cgu_clk_info=20
> jz4725b_cgu_clocks[] =3D {
>  		"pll", CGU_CLK_PLL,
>  		.parents =3D { JZ4725B_CLK_EXT, -1, -1, -1 },
>  		.pll =3D {
> -			.reg =3D CGU_REG_CPPCR,
> +			.version =3D CGU_JZ4725B,
> +			.reg =3D { -1, CGU_REG_CPPCR },
>  			.m_shift =3D 23,
>  			.m_bits =3D 9,
>  			.m_offset =3D 2,
> diff --git a/drivers/clk/ingenic/jz4740-cgu.c=20
> b/drivers/clk/ingenic/jz4740-cgu.c
> index 4f0e92c..3cf800d 100644
> --- a/drivers/clk/ingenic/jz4740-cgu.c
> +++ b/drivers/clk/ingenic/jz4740-cgu.c
> @@ -68,7 +68,8 @@ static const struct ingenic_cgu_clk_info=20
> jz4740_cgu_clocks[] =3D {
>  		"pll", CGU_CLK_PLL,
>  		.parents =3D { JZ4740_CLK_EXT, -1, -1, -1 },
>  		.pll =3D {
> -			.reg =3D CGU_REG_CPPCR,
> +			.version =3D CGU_JZ4740,
> +			.reg =3D { -1, CGU_REG_CPPCR },
>  			.m_shift =3D 23,
>  			.m_bits =3D 9,
>  			.m_offset =3D 2,
> diff --git a/drivers/clk/ingenic/jz4770-cgu.c=20
> b/drivers/clk/ingenic/jz4770-cgu.c
> index 956dd65..a62dfb1 100644
> --- a/drivers/clk/ingenic/jz4770-cgu.c
> +++ b/drivers/clk/ingenic/jz4770-cgu.c
> @@ -101,7 +101,8 @@ static const struct ingenic_cgu_clk_info=20
> jz4770_cgu_clocks[] =3D {
>  		"pll0", CGU_CLK_PLL,
>  		.parents =3D { JZ4770_CLK_EXT },
>  		.pll =3D {
> -			.reg =3D CGU_REG_CPPCR0,
> +			.version =3D CGU_JZ4770,
> +			.reg =3D { -1, CGU_REG_CPPCR0 },
>  			.m_shift =3D 24,
>  			.m_bits =3D 7,
>  			.m_offset =3D 1,
> @@ -123,7 +124,8 @@ static const struct ingenic_cgu_clk_info=20
> jz4770_cgu_clocks[] =3D {
>  		"pll1", CGU_CLK_PLL,
>  		.parents =3D { JZ4770_CLK_EXT },
>  		.pll =3D {
> -			.reg =3D CGU_REG_CPPCR1,
> +			.version =3D CGU_JZ4770,
> +			.reg =3D { -1, CGU_REG_CPPCR1 },
>  			.m_shift =3D 24,
>  			.m_bits =3D 7,
>  			.m_offset =3D 1,
> diff --git a/drivers/clk/ingenic/jz4780-cgu.c=20
> b/drivers/clk/ingenic/jz4780-cgu.c
> index ea905ff..59356d1b 100644
> --- a/drivers/clk/ingenic/jz4780-cgu.c
> +++ b/drivers/clk/ingenic/jz4780-cgu.c
> @@ -220,7 +220,8 @@ static const struct ingenic_cgu_clk_info=20
> jz4780_cgu_clocks[] =3D {
>  	/* PLLs */
>=20
>  #define DEF_PLL(name) { \
> -	.reg =3D CGU_REG_ ## name, \
> +	.version =3D CGU_JZ4780, \
> +	.reg =3D { -1, CGU_REG_ ## name }, \
>  	.m_shift =3D 19, \
>  	.m_bits =3D 13, \
>  	.m_offset =3D 1, \
> diff --git a/drivers/clk/ingenic/x1000-cgu.c=20
> b/drivers/clk/ingenic/x1000-cgu.c
> index b22d87b..7179b9f 100644
> --- a/drivers/clk/ingenic/x1000-cgu.c
> +++ b/drivers/clk/ingenic/x1000-cgu.c
> @@ -57,7 +57,8 @@ static const struct ingenic_cgu_clk_info=20
> x1000_cgu_clocks[] =3D {
>  		"apll", CGU_CLK_PLL,
>  		.parents =3D { X1000_CLK_EXCLK, -1, -1, -1 },
>  		.pll =3D {
> -			.reg =3D CGU_REG_APLL,
> +			.version =3D CGU_X1000,
> +			.reg =3D { -1, CGU_REG_APLL },
>  			.m_shift =3D 24,
>  			.m_bits =3D 7,
>  			.m_offset =3D 1,
> @@ -78,7 +79,8 @@ static const struct ingenic_cgu_clk_info=20
> x1000_cgu_clocks[] =3D {
>  		"mpll", CGU_CLK_PLL,
>  		.parents =3D { X1000_CLK_EXCLK, -1, -1, -1 },
>  		.pll =3D {
> -			.reg =3D CGU_REG_MPLL,
> +			.version =3D CGU_X1000,
> +			.reg =3D { -1, CGU_REG_MPLL },
>  			.m_shift =3D 24,
>  			.m_bits =3D 7,
>  			.m_offset =3D 1,
> --
> 2.7.4
>=20
>=20

=

