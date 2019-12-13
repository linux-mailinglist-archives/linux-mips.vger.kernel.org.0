Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B691311ECD8
	for <lists+linux-mips@lfdr.de>; Fri, 13 Dec 2019 22:26:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726759AbfLMVZM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 13 Dec 2019 16:25:12 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:50316 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726638AbfLMVZL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 13 Dec 2019 16:25:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1576272308; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Gyd/iXeMfPWamj4m2FYrweXavCCrf5f9T5ZiqQRwBNg=;
        b=kGau77ZjLiQK028CkDrJnLm/azl1Q1JFkuUyUEp/gNp1LLNgbdmU6uN6LUdngm7QHaFsYq
        feY035GcTKTT/LUYlZGV2nzxFHe8NM0oJBlCMDuSYRqU57RYEh1QbeY2tjEszihJC9ddpu
        HxZxumuUw4E7Kn6+XbOzY50GKYSdnxw=
Date:   Fri, 13 Dec 2019 22:25:01 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 1/5] clk: Ingenic: Adjust cgu code to make it
 compatible with X1830.
To:     =?UTF-8?b?5ZGo55Cw5p2w?= "(Zhou Yanjie)" 
        <zhouyanjie@wanyeetech.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, paul.burton@mips.com, paulburton@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, mark.rutland@arm.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Message-Id: <1576272301.3.3@crapouillou.net>
In-Reply-To: <1576250472-124315-3-git-send-email-zhouyanjie@wanyeetech.com>
References: <1576250472-124315-1-git-send-email-zhouyanjie@wanyeetech.com>
        <1576250472-124315-3-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Zhou,


Le ven., d=C3=A9c. 13, 2019 at 23:21, =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yan=
jie)=20
<zhouyanjie@wanyeetech.com> a =C3=A9crit :
> The PLL of X1830 Soc from Ingenic has been greatly changed,
> the bypass control is placed in another register, so now two
> registers may needed to control the PLL. To this end, the
> original "reg" was changed to "pll_reg", and a new "bypass_reg"
> was introduced. In addition, when calculating rate, the PLL of
> X1830 introduced an extra 2x multiplier, so a new "rate_multiplier"
> was introduced.
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
>  drivers/clk/ingenic/cgu.c | 32 +++++++++++++++++++++-----------
>  drivers/clk/ingenic/cgu.h |  8 ++++++--
>  2 files changed, 27 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/clk/ingenic/cgu.c b/drivers/clk/ingenic/cgu.c
> index 6e96303..ae1ddcb 100644
> --- a/drivers/clk/ingenic/cgu.c
> +++ b/drivers/clk/ingenic/cgu.c
> @@ -84,7 +84,7 @@ ingenic_pll_recalc_rate(struct clk_hw *hw, unsigned=20
> long parent_rate)
>  	pll_info =3D &clk_info->pll;
>=20
>  	spin_lock_irqsave(&cgu->lock, flags);
> -	ctl =3D readl(cgu->base + pll_info->reg);
> +	ctl =3D readl(cgu->base + pll_info->pll_reg);
>  	spin_unlock_irqrestore(&cgu->lock, flags);
>=20
>  	m =3D (ctl >> pll_info->m_shift) & GENMASK(pll_info->m_bits - 1, 0);
> @@ -93,6 +93,11 @@ ingenic_pll_recalc_rate(struct clk_hw *hw,=20
> unsigned long parent_rate)
>  	n +=3D pll_info->n_offset;
>  	od_enc =3D ctl >> pll_info->od_shift;
>  	od_enc &=3D GENMASK(pll_info->od_bits - 1, 0);
> +
> +	spin_lock_irqsave(&cgu->lock, flags);
> +	ctl =3D readl(cgu->base + pll_info->bypass_reg);
> +	spin_unlock_irqrestore(&cgu->lock, flags);

I think you should start the patchset with the current [5/5] patch;=20
then you wouldn't have to add spinlock protection here just to see it=20
removed later in the same patchset.

Cheers,
-Paul

> +
>  	bypass =3D !pll_info->no_bypass_bit &&
>  		 !!(ctl & BIT(pll_info->bypass_bit));
>=20
> @@ -106,7 +111,7 @@ ingenic_pll_recalc_rate(struct clk_hw *hw,=20
> unsigned long parent_rate)
>  	BUG_ON(od =3D=3D pll_info->od_max);
>  	od++;
>=20
> -	return div_u64((u64)parent_rate * m, n * od);
> +	return div_u64((u64)parent_rate * m * pll_info->rate_multiplier, n=20
> * od);
>  }
>=20
>  static unsigned long
> @@ -139,7 +144,7 @@ ingenic_pll_calc(const struct=20
> ingenic_cgu_clk_info *clk_info,
>  	if (pod)
>  		*pod =3D od;
>=20
> -	return div_u64((u64)parent_rate * m, n * od);
> +	return div_u64((u64)parent_rate * m * pll_info->rate_multiplier, n=20
> * od);
>  }
>=20
>  static inline const struct ingenic_cgu_clk_info *to_clk_info(
> @@ -183,7 +188,7 @@ ingenic_pll_set_rate(struct clk_hw *hw, unsigned=20
> long req_rate,
>  			clk_info->name, req_rate, rate);
>=20
>  	spin_lock_irqsave(&cgu->lock, flags);
> -	ctl =3D readl(cgu->base + pll_info->reg);
> +	ctl =3D readl(cgu->base + pll_info->pll_reg);
>=20
>  	ctl &=3D ~(GENMASK(pll_info->m_bits - 1, 0) << pll_info->m_shift);
>  	ctl |=3D (m - pll_info->m_offset) << pll_info->m_shift;
> @@ -194,7 +199,7 @@ ingenic_pll_set_rate(struct clk_hw *hw, unsigned=20
> long req_rate,
>  	ctl &=3D ~(GENMASK(pll_info->od_bits - 1, 0) << pll_info->od_shift);
>  	ctl |=3D pll_info->od_encoding[od - 1] << pll_info->od_shift;
>=20
> -	writel(ctl, cgu->base + pll_info->reg);
> +	writel(ctl, cgu->base + pll_info->pll_reg);
>  	spin_unlock_irqrestore(&cgu->lock, flags);
>=20
>  	return 0;
> @@ -212,16 +217,21 @@ static int ingenic_pll_enable(struct clk_hw *hw)
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
> @@ -245,11 +255,11 @@ static void ingenic_pll_disable(struct clk_hw=20
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
> @@ -263,7 +273,7 @@ static int ingenic_pll_is_enabled(struct clk_hw=20
> *hw)
>  	u32 ctl;
>=20
>  	spin_lock_irqsave(&cgu->lock, flags);
> -	ctl =3D readl(cgu->base + pll_info->reg);
> +	ctl =3D readl(cgu->base + pll_info->pll_reg);
>  	spin_unlock_irqrestore(&cgu->lock, flags);
>=20
>  	return !!(ctl & BIT(pll_info->enable_bit));
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
> +	unsigned bypass_reg;
> +	unsigned rate_multiplier;
>  	const s8 *od_encoding;
>  	u8 m_shift, m_bits, m_offset;
>  	u8 n_shift, n_bits, n_offset;
> --
> 2.7.4
>=20

=

