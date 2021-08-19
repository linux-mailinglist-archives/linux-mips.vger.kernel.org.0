Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 245723F1661
	for <lists+linux-mips@lfdr.de>; Thu, 19 Aug 2021 11:38:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237404AbhHSJim convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Thu, 19 Aug 2021 05:38:42 -0400
Received: from aposti.net ([89.234.176.197]:42596 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233957AbhHSJil (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 19 Aug 2021 05:38:41 -0400
Date:   Thu, 19 Aug 2021 11:37:53 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v7 02/11] clk: Ingenic: Adjust cgu code to make it
 compatible with I2S PLL.
To:     =?UTF-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>
Cc:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org,
        linux-clk@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sihui.liu@ingenic.com,
        jun.jiang@ingenic.com, sernia.zhou@foxmail.com
Message-Id: <5RY2YQ.VQN2WB38KM14@crapouillou.net>
In-Reply-To: <1627119286-125821-3-git-send-email-zhouyanjie@wanyeetech.com>
References: <1627119286-125821-1-git-send-email-zhouyanjie@wanyeetech.com>
        <1627119286-125821-3-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Zhou,

Le sam., juil. 24 2021 at 17:34:37 +0800, 周琰杰 (Zhou Yanjie) 
<zhouyanjie@wanyeetech.com> a écrit :
> I2S PLL is different from the APLL/MPLL, which have no OD bits,
> no stable bit, but have parent clock selection bits, therefore,
> it is necessary to modify the CGU PLL correlation code to make
> it compatible with I2S PLL.
> 
> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>

Could you split this commit into three:
- one commit to support PLLs with no OD bit,
- one commit to support PLLs with no stable bit,
- one commit to support setting the parents of PLLs.

> ---
> 
> Notes:
>     v5:
>     New patch.
> 
>     v5->v6:
>     Change the type of stable_bit from u8 to s8, because a negative 
> value will appear
>     when the stable_bit bit does not exist.
>     Reported-by: kernel test robot <lkp@intel.com>
> 
>     v6->v7:
>     No change.
> 
>  drivers/clk/ingenic/cgu.c | 118 
> ++++++++++++++++++++++++++++++++++++++++------
>  drivers/clk/ingenic/cgu.h |  10 +++-
>  2 files changed, 111 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/clk/ingenic/cgu.c b/drivers/clk/ingenic/cgu.c
> index 266c759..391bf50 100644
> --- a/drivers/clk/ingenic/cgu.c
> +++ b/drivers/clk/ingenic/cgu.c
> @@ -76,6 +76,85 @@ ingenic_cgu_gate_set(struct ingenic_cgu *cgu,
>   * PLL operations
>   */
> 
> +static u8 ingenic_pll_get_parent(struct clk_hw *hw)
> +{
> +	struct ingenic_clk *ingenic_clk = to_ingenic_clk(hw);
> +	const struct ingenic_cgu_clk_info *clk_info = 
> to_clk_info(ingenic_clk);
> +	struct ingenic_cgu *cgu = ingenic_clk->cgu;
> +	const struct ingenic_cgu_pll_info *pll_info;
> +	u32 reg;
> +	u8 i, hw_idx, idx = 0;
> +
> +	BUG_ON(clk_info->type != CGU_CLK_PLL);
> +	pll_info = &clk_info->pll;
> +
> +	if (pll_info->mux_bits <= 0)
> +		return 1;
> +
> +	reg = readl(cgu->base + pll_info->reg);
> +	hw_idx = (reg >> pll_info->mux_shift) &
> +		 GENMASK(pll_info->mux_bits - 1, 0);
> +
> +	/*
> +	 * Convert the hardware index to the parent index by skipping
> +	 * over any -1's in the parents array.
> +	 */
> +	for (i = 0; i < hw_idx; i++) {
> +		if (clk_info->parents[i] != -1)
> +			idx++;
> +	}
> +
> +	return idx;
> +}
> +
> +static int ingenic_pll_set_parent(struct clk_hw *hw, u8 idx)
> +{
> +	struct ingenic_clk *ingenic_clk = to_ingenic_clk(hw);
> +	const struct ingenic_cgu_clk_info *clk_info = 
> to_clk_info(ingenic_clk);
> +	struct ingenic_cgu *cgu = ingenic_clk->cgu;
> +	const struct ingenic_cgu_pll_info *pll_info;
> +	unsigned long flags;
> +	u32 reg;
> +	u8 curr_idx, hw_idx, num_poss;
> +
> +	BUG_ON(clk_info->type != CGU_CLK_PLL);
> +	pll_info = &clk_info->pll;
> +
> +	if (pll_info->mux_bits <= 0)
> +		return 0;
> +
> +	/*
> +	 * Convert the parent index to the hardware index by adding
> +	 * 1 for any -1 in the parents array preceding the given
> +	 * index. That is, we want the index of idx'th entry in
> +	 * clk_info->parents which does not equal -1.
> +	 */
> +	hw_idx = curr_idx = 0;
> +	num_poss = 1 << pll_info->mux_bits;
> +	for (; hw_idx < num_poss; hw_idx++) {
> +		if (clk_info->parents[hw_idx] == -1)
> +			continue;
> +		if (curr_idx == idx)
> +			break;
> +		curr_idx++;
> +	}
> +
> +	/* idx should always be a valid parent */
> +	BUG_ON(curr_idx != idx);
> +
> +	spin_lock_irqsave(&cgu->lock, flags);
> +
> +	/* write the register */
> +	reg = readl(cgu->base + pll_info->reg);
> +	reg &= ~(GENMASK(pll_info->mux_bits - 1, 0) << pll_info->mux_shift);
> +	reg |= hw_idx << pll_info->mux_shift;
> +	writel(reg, cgu->base + pll_info->reg);
> +
> +	spin_unlock_irqrestore(&cgu->lock, flags);
> +
> +	return 0;
> +}
> +
>  static unsigned long
>  ingenic_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
>  {
> @@ -96,8 +175,20 @@ ingenic_pll_recalc_rate(struct clk_hw *hw, 
> unsigned long parent_rate)
>  	m += pll_info->m_offset;
>  	n = (ctl >> pll_info->n_shift) & GENMASK(pll_info->n_bits - 1, 0);
>  	n += pll_info->n_offset;
> -	od_enc = ctl >> pll_info->od_shift;
> -	od_enc &= GENMASK(pll_info->od_bits - 1, 0);
> +
> +	if (pll_info->od_encoding) {
> +		od_enc = ctl >> pll_info->od_shift;
> +		od_enc &= GENMASK(pll_info->od_bits - 1, 0);
> +
> +		for (od = 0; od < pll_info->od_max; od++) {
> +			if (pll_info->od_encoding[od] == od_enc)
> +				break;
> +		}
> +		BUG_ON(od == pll_info->od_max);
> +		od++;
> +	} else {
> +		od = 1;
> +	}
> 
>  	if (pll_info->bypass_bit >= 0) {
>  		ctl = readl(cgu->base + pll_info->bypass_reg);
> @@ -108,15 +199,7 @@ ingenic_pll_recalc_rate(struct clk_hw *hw, 
> unsigned long parent_rate)
>  			return parent_rate;
>  	}
> 
> -	for (od = 0; od < pll_info->od_max; od++) {
> -		if (pll_info->od_encoding[od] == od_enc)
> -			break;
> -	}
> -	BUG_ON(od == pll_info->od_max);
> -	od++;
> -
> -	return div_u64((u64)parent_rate * m * pll_info->rate_multiplier,
> -		n * od);
> +	return div_u64((u64)parent_rate * m * pll_info->rate_multiplier, n 
> * od);
>  }
> 
>  static void
> @@ -215,13 +298,15 @@ ingenic_pll_set_rate(struct clk_hw *hw, 
> unsigned long req_rate,
>  	ctl &= ~(GENMASK(pll_info->n_bits - 1, 0) << pll_info->n_shift);
>  	ctl |= (n - pll_info->n_offset) << pll_info->n_shift;
> 
> -	ctl &= ~(GENMASK(pll_info->od_bits - 1, 0) << pll_info->od_shift);
> -	ctl |= pll_info->od_encoding[od - 1] << pll_info->od_shift;
> +	if (pll_info->od_encoding) {
> +		ctl &= ~(GENMASK(pll_info->od_bits - 1, 0) << pll_info->od_shift);
> +		ctl |= pll_info->od_encoding[od - 1] << pll_info->od_shift;
> +	}
> 
>  	writel(ctl, cgu->base + pll_info->reg);
> 
>  	/* If the PLL is enabled, verify that it's stable */
> -	if (ctl & BIT(pll_info->enable_bit))
> +	if ((pll_info->stable_bit >= 0) && (ctl & 
> BIT(pll_info->enable_bit)))
>  		ret = ingenic_pll_check_stable(cgu, pll_info);
> 
>  	spin_unlock_irqrestore(&cgu->lock, flags);
> @@ -292,6 +377,9 @@ static int ingenic_pll_is_enabled(struct clk_hw 
> *hw)
>  }
> 
>  static const struct clk_ops ingenic_pll_ops = {
> +	.get_parent = ingenic_pll_get_parent,
> +	.set_parent = ingenic_pll_set_parent,

If you move the "pll" field of struct ingenic_cgu_clk_info to the 
nameless "struct" that follows it, you will then be able to use the 
other fields as well. That means that you'll be able to use 
ingenic_clk_get_parent() / ingenic_clk_set_parent() instead of 
duplicating code.

> +
>  	.recalc_rate = ingenic_pll_recalc_rate,
>  	.round_rate = ingenic_pll_round_rate,
>  	.set_rate = ingenic_pll_set_rate,
> @@ -672,7 +760,7 @@ static int ingenic_register_clock(struct 
> ingenic_cgu *cgu, unsigned idx)
>  		clk_init.flags |= CLK_SET_RATE_PARENT;
>  	}
> 
> -	if (caps & (CGU_CLK_MUX | CGU_CLK_CUSTOM)) {
> +	if (caps & (CGU_CLK_PLL | CGU_CLK_MUX | CGU_CLK_CUSTOM)) {

I tend to disagree with this - clocks that support parenting should use 
the CGU_CLK_MUX flag. I know it conflicts with CGU_CLK_PLL right now, 
but with the change I suggested above, your clock should be able to use 
.type = CGU_CLK_PLL | CGU_CLK_MUX.

Cheers,
-Paul

>  		clk_init.num_parents = 0;
> 
>  		if (caps & CGU_CLK_MUX)
> diff --git a/drivers/clk/ingenic/cgu.h b/drivers/clk/ingenic/cgu.h
> index bfc2b9c..30d575d 100644
> --- a/drivers/clk/ingenic/cgu.h
> +++ b/drivers/clk/ingenic/cgu.h
> @@ -18,6 +18,10 @@
>   * struct ingenic_cgu_pll_info - information about a PLL
>   * @reg: the offset of the PLL's control register within the CGU
>   * @rate_multiplier: the multiplier needed by pll rate calculation
> + * @mux_shift: the number of bits to shift the mux value by (ie. the
> + *           index of the lowest bit of the mux value in the I2S 
> PLL's
> + *           control register)
> + * @mux_bits: the size of the mux field in bits
>   * @m_shift: the number of bits to shift the multiplier value by 
> (ie. the
>   *           index of the lowest bit of the multiplier value in the 
> PLL's
>   *           control register)
> @@ -42,19 +46,21 @@
>   * @bypass_bit: the index of the bypass bit in the PLL control 
> register, or
>   *              -1 if there is no bypass bit
>   * @enable_bit: the index of the enable bit in the PLL control 
> register
> - * @stable_bit: the index of the stable bit in the PLL control 
> register
> + * @stable_bit: the index of the stable bit in the PLL control 
> register, or
> + *              -1 if there is no stable bit
>   */
>  struct ingenic_cgu_pll_info {
>  	unsigned reg;
>  	unsigned rate_multiplier;
>  	const s8 *od_encoding;
> +	u8 mux_shift, mux_bits;
>  	u8 m_shift, m_bits, m_offset;
>  	u8 n_shift, n_bits, n_offset;
>  	u8 od_shift, od_bits, od_max;
>  	unsigned bypass_reg;
>  	s8 bypass_bit;
>  	u8 enable_bit;
> -	u8 stable_bit;
> +	s8 stable_bit;
>  	void (*calc_m_n_od)(const struct ingenic_cgu_pll_info *pll_info,
>  			    unsigned long rate, unsigned long parent_rate,
>  			    unsigned int *m, unsigned int *n, unsigned int *od);
> --
> 2.7.4
> 


