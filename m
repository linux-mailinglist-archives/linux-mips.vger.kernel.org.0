Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9ECF715FEC3
	for <lists+linux-mips@lfdr.de>; Sat, 15 Feb 2020 15:08:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726141AbgBOOI3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 15 Feb 2020 09:08:29 -0500
Received: from out28-196.mail.aliyun.com ([115.124.28.196]:59673 "EHLO
        out28-196.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726137AbgBOOI3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 15 Feb 2020 09:08:29 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07436495|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.203989-0.00336505-0.792646;DS=CONTINUE|ham_system_inform|0.398027-0.0005709-0.601402;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03267;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=9;RT=9;SR=0;TI=SMTPD_---.GoPj2jB_1581775647;
Received: from 192.168.10.227(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.GoPj2jB_1581775647)
          by smtp.aliyun-inc.com(10.147.40.233);
          Sat, 15 Feb 2020 22:07:28 +0800
Subject: Re: [PATCH v5 2/6] clk: Ingenic: Adjust cgu code to make it
 compatible with X1830.
To:     Paul Cercueil <paul@crapouillou.net>
References: <1581701262-110556-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1581701262-110556-4-git-send-email-zhouyanjie@wanyeetech.com>
 <1581706158.3.4@crapouillou.net>
Cc:     linux-mips@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <5E47FB1F.3080408@wanyeetech.com>
Date:   Sat, 15 Feb 2020 22:07:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1581706158.3.4@crapouillou.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

On 2020年02月15日 02:49, Paul Cercueil wrote:
> Hi Zhou,
>
>
> Le sam., févr. 15, 2020 at 01:27, 周琰杰 (Zhou Yanjie) 
> <zhouyanjie@wanyeetech.com> a écrit :
>> The PLL of X1830 Soc from Ingenic has been greatly changed,
>> the bypass control is placed in another register, so now two
>> registers may needed to control the PLL. To this end, the
>> original "reg" was changed to "pll_reg", and a new "bypass_reg"
>> was introduced. In addition, when calculating rate, the PLL of
>> X1830 introduced an extra 2x multiplier, so a new "rate_multiplier"
>> was introduced. And adjust the code in jz47xx-cgu.c and x1000-cgu.c,
>> make it to be compatible with the new cgu code.
>>
>> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>> ---
>>
>> Notes:
>>     v1->v2:
>>     1.Use two fields (pll_reg & bypass_reg) instead of the 2-values
>>       array (reg[2]).
>>     2.Remove the "pll_info->version" and add a 
>> "pll_info->rate_multiplier".
>>     3.Fix the coding style and add more detailed commit message.
>>     4.Change my Signed-off-by from "Zhou Yanjie <zhouyanjie@zoho.com>"
>>       to "周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>" because
>>       the old mailbox is in an unstable state.
>>
>>     v2->v3:
>>     Adjust order from [1/5] in v2 to [2/5] in v3.
>>
>>     v3->v4:
>>     Merge [3/5] in v3 into this patch.
>>
>>     v4->v5:
>>     Rebase on top of kernel 5.6-rc1.
>>
>>  drivers/clk/ingenic/cgu.c         | 32 +++++++++++++++++++++-----------
>>  drivers/clk/ingenic/cgu.h         |  8 ++++++--
>>  drivers/clk/ingenic/jz4725b-cgu.c |  4 +++-
>>  drivers/clk/ingenic/jz4740-cgu.c  |  4 +++-
>>  drivers/clk/ingenic/jz4770-cgu.c  |  8 ++++++--
>>  drivers/clk/ingenic/jz4780-cgu.c  |  4 +++-
>>  drivers/clk/ingenic/x1000-cgu.c   |  8 ++++++--
>>  7 files changed, 48 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/clk/ingenic/cgu.c b/drivers/clk/ingenic/cgu.c
>> index ab1302a..7d859e4 100644
>> --- a/drivers/clk/ingenic/cgu.c
>> +++ b/drivers/clk/ingenic/cgu.c
>> @@ -82,7 +82,7 @@ ingenic_pll_recalc_rate(struct clk_hw *hw, unsigned 
>> long parent_rate)
>>      BUG_ON(clk_info->type != CGU_CLK_PLL);
>>      pll_info = &clk_info->pll;
>>
>> -    ctl = readl(cgu->base + pll_info->reg);
>> +    ctl = readl(cgu->base + pll_info->pll_reg);
>>
>>      m = (ctl >> pll_info->m_shift) & GENMASK(pll_info->m_bits - 1, 0);
>>      m += pll_info->m_offset;
>> @@ -90,6 +90,9 @@ ingenic_pll_recalc_rate(struct clk_hw *hw, unsigned 
>> long parent_rate)
>>      n += pll_info->n_offset;
>>      od_enc = ctl >> pll_info->od_shift;
>>      od_enc &= GENMASK(pll_info->od_bits - 1, 0);
>> +
>> +    ctl = readl(cgu->base + pll_info->bypass_reg);
>> +
>>      bypass = !pll_info->no_bypass_bit &&
>>           !!(ctl & BIT(pll_info->bypass_bit));
>>
>> @@ -103,7 +106,8 @@ ingenic_pll_recalc_rate(struct clk_hw *hw, 
>> unsigned long parent_rate)
>>      BUG_ON(od == pll_info->od_max);
>>      od++;
>>
>> -    return div_u64((u64)parent_rate * m, n * od);
>> +    return div_u64((u64)parent_rate * m * pll_info->rate_multiplier,
>> +        n * od);
>>  }
>>
>>  static unsigned long
>> @@ -136,7 +140,8 @@ ingenic_pll_calc(const struct 
>> ingenic_cgu_clk_info *clk_info,
>>      if (pod)
>>          *pod = od;
>>
>> -    return div_u64((u64)parent_rate * m, n * od);
>> +    return div_u64((u64)parent_rate * m * pll_info->rate_multiplier,
>> +        n * od);
>>  }
>>
>>  static inline const struct ingenic_cgu_clk_info *to_clk_info(
>> @@ -180,7 +185,7 @@ ingenic_pll_set_rate(struct clk_hw *hw, unsigned 
>> long req_rate,
>>              clk_info->name, req_rate, rate);
>>
>>      spin_lock_irqsave(&cgu->lock, flags);
>> -    ctl = readl(cgu->base + pll_info->reg);
>> +    ctl = readl(cgu->base + pll_info->pll_reg);
>>
>>      ctl &= ~(GENMASK(pll_info->m_bits - 1, 0) << pll_info->m_shift);
>>      ctl |= (m - pll_info->m_offset) << pll_info->m_shift;
>> @@ -191,7 +196,7 @@ ingenic_pll_set_rate(struct clk_hw *hw, unsigned 
>> long req_rate,
>>      ctl &= ~(GENMASK(pll_info->od_bits - 1, 0) << pll_info->od_shift);
>>      ctl |= pll_info->od_encoding[od - 1] << pll_info->od_shift;
>>
>> -    writel(ctl, cgu->base + pll_info->reg);
>> +    writel(ctl, cgu->base + pll_info->pll_reg);
>>      spin_unlock_irqrestore(&cgu->lock, flags);
>>
>>      return 0;
>> @@ -209,16 +214,21 @@ static int ingenic_pll_enable(struct clk_hw *hw)
>>      u32 ctl;
>>
>>      spin_lock_irqsave(&cgu->lock, flags);
>> -    ctl = readl(cgu->base + pll_info->reg);
>> +    ctl = readl(cgu->base + pll_info->bypass_reg);
>>
>>      ctl &= ~BIT(pll_info->bypass_bit);
>> +
>> +    writel(ctl, cgu->base + pll_info->bypass_reg);
>> +
>> +    ctl = readl(cgu->base + pll_info->pll_reg);
>> +
>>      ctl |= BIT(pll_info->enable_bit);
>>
>> -    writel(ctl, cgu->base + pll_info->reg);
>> +    writel(ctl, cgu->base + pll_info->pll_reg);
>>
>>      /* wait for the PLL to stabilise */
>>      for (i = 0; i < timeout; i++) {
>> -        ctl = readl(cgu->base + pll_info->reg);
>> +        ctl = readl(cgu->base + pll_info->pll_reg);
>>          if (ctl & BIT(pll_info->stable_bit))
>>              break;
>>          mdelay(1);
>> @@ -242,11 +252,11 @@ static void ingenic_pll_disable(struct clk_hw *hw)
>>      u32 ctl;
>>
>>      spin_lock_irqsave(&cgu->lock, flags);
>> -    ctl = readl(cgu->base + pll_info->reg);
>> +    ctl = readl(cgu->base + pll_info->pll_reg);
>>
>>      ctl &= ~BIT(pll_info->enable_bit);
>>
>> -    writel(ctl, cgu->base + pll_info->reg);
>> +    writel(ctl, cgu->base + pll_info->pll_reg);
>>      spin_unlock_irqrestore(&cgu->lock, flags);
>>  }
>>
>> @@ -258,7 +268,7 @@ static int ingenic_pll_is_enabled(struct clk_hw *hw)
>>      const struct ingenic_cgu_pll_info *pll_info = &clk_info->pll;
>>      u32 ctl;
>>
>> -    ctl = readl(cgu->base + pll_info->reg);
>> +    ctl = readl(cgu->base + pll_info->pll_reg);
>>
>>      return !!(ctl & BIT(pll_info->enable_bit));
>>  }
>> diff --git a/drivers/clk/ingenic/cgu.h b/drivers/clk/ingenic/cgu.h
>> index 0dc8004..f7b6908 100644
>> --- a/drivers/clk/ingenic/cgu.h
>> +++ b/drivers/clk/ingenic/cgu.h
>> @@ -16,7 +16,9 @@
>>
>>  /**
>>   * struct ingenic_cgu_pll_info - information about a PLL
>> - * @reg: the offset of the PLL's control register within the CGU
>> + * @pll_reg: the offset of the PLL's control register within the CGU
>> + * @bypass_reg: the offset of the bypass control register within the 
>> CGU
>> + * @rate_multiplier: the multiplier needed by pll rate calculation
>>   * @m_shift: the number of bits to shift the multiplier value by 
>> (ie. the
>>   *           index of the lowest bit of the multiplier value in the 
>> PLL's
>>   *           control register)
>> @@ -43,7 +45,9 @@
>>   * @no_bypass_bit: if set, the PLL has no bypass functionality
>>   */
>>  struct ingenic_cgu_pll_info {
>> -    unsigned reg;
>> +    unsigned pll_reg;
>
> I'd prefer that you don't rename 'reg' to 'pll_reg', this patch would 
> be ten times smaller if you don't.
>

Sure, I will change it in next version.

> -Paul
>
>> +    unsigned bypass_reg;
>> +    unsigned rate_multiplier;
>>      const s8 *od_encoding;
>>      u8 m_shift, m_bits, m_offset;
>>      u8 n_shift, n_bits, n_offset;
>> diff --git a/drivers/clk/ingenic/jz4725b-cgu.c 
>> b/drivers/clk/ingenic/jz4725b-cgu.c
>> index a3b4635..0b05167 100644
>> --- a/drivers/clk/ingenic/jz4725b-cgu.c
>> +++ b/drivers/clk/ingenic/jz4725b-cgu.c
>> @@ -53,7 +53,9 @@ static const struct ingenic_cgu_clk_info 
>> jz4725b_cgu_clocks[] = {
>>          "pll", CGU_CLK_PLL,
>>          .parents = { JZ4725B_CLK_EXT, -1, -1, -1 },
>>          .pll = {
>> -            .reg = CGU_REG_CPPCR,
>> +            .pll_reg = CGU_REG_CPPCR,
>> +            .bypass_reg = CGU_REG_CPPCR,
>> +            .rate_multiplier = 1,
>>              .m_shift = 23,
>>              .m_bits = 9,
>>              .m_offset = 2,
>> diff --git a/drivers/clk/ingenic/jz4740-cgu.c 
>> b/drivers/clk/ingenic/jz4740-cgu.c
>> index 4f0e92c..78f31df 100644
>> --- a/drivers/clk/ingenic/jz4740-cgu.c
>> +++ b/drivers/clk/ingenic/jz4740-cgu.c
>> @@ -68,7 +68,9 @@ static const struct ingenic_cgu_clk_info 
>> jz4740_cgu_clocks[] = {
>>          "pll", CGU_CLK_PLL,
>>          .parents = { JZ4740_CLK_EXT, -1, -1, -1 },
>>          .pll = {
>> -            .reg = CGU_REG_CPPCR,
>> +            .pll_reg = CGU_REG_CPPCR,
>> +            .bypass_reg = CGU_REG_CPPCR,
>> +            .rate_multiplier = 1,
>>              .m_shift = 23,
>>              .m_bits = 9,
>>              .m_offset = 2,
>> diff --git a/drivers/clk/ingenic/jz4770-cgu.c 
>> b/drivers/clk/ingenic/jz4770-cgu.c
>> index 956dd65..32e476d 100644
>> --- a/drivers/clk/ingenic/jz4770-cgu.c
>> +++ b/drivers/clk/ingenic/jz4770-cgu.c
>> @@ -101,7 +101,9 @@ static const struct ingenic_cgu_clk_info 
>> jz4770_cgu_clocks[] = {
>>          "pll0", CGU_CLK_PLL,
>>          .parents = { JZ4770_CLK_EXT },
>>          .pll = {
>> -            .reg = CGU_REG_CPPCR0,
>> +            .pll_reg = CGU_REG_CPPCR0,
>> +            .bypass_reg = CGU_REG_CPPCR0,
>> +            .rate_multiplier = 1,
>>              .m_shift = 24,
>>              .m_bits = 7,
>>              .m_offset = 1,
>> @@ -123,7 +125,9 @@ static const struct ingenic_cgu_clk_info 
>> jz4770_cgu_clocks[] = {
>>          "pll1", CGU_CLK_PLL,
>>          .parents = { JZ4770_CLK_EXT },
>>          .pll = {
>> -            .reg = CGU_REG_CPPCR1,
>> +            .pll_reg = CGU_REG_CPPCR1,
>> +            .bypass_reg = CGU_REG_CPPCR1,
>> +            .rate_multiplier = 1,
>>              .m_shift = 24,
>>              .m_bits = 7,
>>              .m_offset = 1,
>> diff --git a/drivers/clk/ingenic/jz4780-cgu.c 
>> b/drivers/clk/ingenic/jz4780-cgu.c
>> index ea905ff..d07fff1 100644
>> --- a/drivers/clk/ingenic/jz4780-cgu.c
>> +++ b/drivers/clk/ingenic/jz4780-cgu.c
>> @@ -220,7 +220,9 @@ static const struct ingenic_cgu_clk_info 
>> jz4780_cgu_clocks[] = {
>>      /* PLLs */
>>
>>  #define DEF_PLL(name) { \
>> -    .reg = CGU_REG_ ## name, \
>> +    .pll_reg = CGU_REG_ ## name, \
>> +    .bypass_reg = CGU_REG_ ## name, \
>> +    .rate_multiplier = 1, \
>>      .m_shift = 19, \
>>      .m_bits = 13, \
>>      .m_offset = 1, \
>> diff --git a/drivers/clk/ingenic/x1000-cgu.c 
>> b/drivers/clk/ingenic/x1000-cgu.c
>> index b22d87b..d6fe28f 100644
>> --- a/drivers/clk/ingenic/x1000-cgu.c
>> +++ b/drivers/clk/ingenic/x1000-cgu.c
>> @@ -57,7 +57,9 @@ static const struct ingenic_cgu_clk_info 
>> x1000_cgu_clocks[] = {
>>          "apll", CGU_CLK_PLL,
>>          .parents = { X1000_CLK_EXCLK, -1, -1, -1 },
>>          .pll = {
>> -            .reg = CGU_REG_APLL,
>> +            .pll_reg = CGU_REG_APLL,
>> +            .bypass_reg = CGU_REG_APLL,
>> +            .rate_multiplier = 1,
>>              .m_shift = 24,
>>              .m_bits = 7,
>>              .m_offset = 1,
>> @@ -78,7 +80,9 @@ static const struct ingenic_cgu_clk_info 
>> x1000_cgu_clocks[] = {
>>          "mpll", CGU_CLK_PLL,
>>          .parents = { X1000_CLK_EXCLK, -1, -1, -1 },
>>          .pll = {
>> -            .reg = CGU_REG_MPLL,
>> +            .pll_reg = CGU_REG_MPLL,
>> +            .bypass_reg = CGU_REG_MPLL,
>> +            .rate_multiplier = 1,
>>              .m_shift = 24,
>>              .m_bits = 7,
>>              .m_offset = 1,
>> -- 
>> 2.7.4
>>
>

