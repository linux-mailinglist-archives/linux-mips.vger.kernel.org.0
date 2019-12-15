Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F23E111F81E
	for <lists+linux-mips@lfdr.de>; Sun, 15 Dec 2019 15:13:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726112AbfLOON0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 15 Dec 2019 09:13:26 -0500
Received: from out28-5.mail.aliyun.com ([115.124.28.5]:40820 "EHLO
        out28-5.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726103AbfLOON0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 15 Dec 2019 09:13:26 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07436489|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.477822-0.00910106-0.513076;DS=CONTINUE|ham_regular_dialog|0.288924-0.00126952-0.709806;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03301;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=13;RT=13;SR=0;TI=SMTPD_---.GHd2RIv_1576419196;
Received: from 192.168.88.128(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.GHd2RIv_1576419196)
          by smtp.aliyun-inc.com(10.147.42.135);
          Sun, 15 Dec 2019 22:13:17 +0800
Subject: Re: [PATCH v3 2/5] clk: Ingenic: Adjust cgu code to make it
 compatible with X1830.
To:     Paul Cercueil <paul@crapouillou.net>
References: <1576337630-78576-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1576337630-78576-4-git-send-email-zhouyanjie@wanyeetech.com>
 <1576346987.3.2@crapouillou.net>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, paul.burton@mips.com, paulburton@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, mark.rutland@arm.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <5DF63F7E.4040106@wanyeetech.com>
Date:   Sun, 15 Dec 2019 22:13:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1576346987.3.2@crapouillou.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

On 2019年12月15日 02:09, Paul Cercueil wrote:
> Hi Zhou,
>
> The patch looks good but it should be merged with [3/5]. Because right 
> now it is not atomic, if you only have the first two patches applied 
> the kernel won't compile.
>

OK, I will merge it in v4.

> -Paul
>
>
> Le sam., déc. 14, 2019 at 23:33, 周琰杰 (Zhou Yanjie) 
> <zhouyanjie@wanyeetech.com> a écrit :
>> The PLL of X1830 Soc from Ingenic has been greatly changed,
>> the bypass control is placed in another register, so now two
>> registers may needed to control the PLL. To this end, the
>> original "reg" was changed to "pll_reg", and a new "bypass_reg"
>> was introduced. In addition, when calculating rate, the PLL of
>> X1830 introduced an extra 2x multiplier, so a new "rate_multiplier"
>> was introduced.
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
>>  drivers/clk/ingenic/cgu.c | 30 +++++++++++++++++++-----------
>>  drivers/clk/ingenic/cgu.h |  8 ++++++--
>>  2 files changed, 25 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/clk/ingenic/cgu.c b/drivers/clk/ingenic/cgu.c
>> index 8bd3998..3c95451 100644
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
>> @@ -103,7 +106,7 @@ ingenic_pll_recalc_rate(struct clk_hw *hw, 
>> unsigned long parent_rate)
>>      BUG_ON(od == pll_info->od_max);
>>      od++;
>>
>> -    return div_u64((u64)parent_rate * m, n * od);
>> +    return div_u64((u64)parent_rate * m * pll_info->rate_multiplier, 
>> n * od);
>>  }
>>
>>  static unsigned long
>> @@ -136,7 +139,7 @@ ingenic_pll_calc(const struct 
>> ingenic_cgu_clk_info *clk_info,
>>      if (pod)
>>          *pod = od;
>>
>> -    return div_u64((u64)parent_rate * m, n * od);
>> +    return div_u64((u64)parent_rate * m * pll_info->rate_multiplier, 
>> n * od);
>>  }
>>
>>  static inline const struct ingenic_cgu_clk_info *to_clk_info(
>> @@ -180,7 +183,7 @@ ingenic_pll_set_rate(struct clk_hw *hw, unsigned 
>> long req_rate,
>>              clk_info->name, req_rate, rate);
>>
>>      spin_lock_irqsave(&cgu->lock, flags);
>> -    ctl = readl(cgu->base + pll_info->reg);
>> +    ctl = readl(cgu->base + pll_info->pll_reg);
>>
>>      ctl &= ~(GENMASK(pll_info->m_bits - 1, 0) << pll_info->m_shift);
>>      ctl |= (m - pll_info->m_offset) << pll_info->m_shift;
>> @@ -191,7 +194,7 @@ ingenic_pll_set_rate(struct clk_hw *hw, unsigned 
>> long req_rate,
>>      ctl &= ~(GENMASK(pll_info->od_bits - 1, 0) << pll_info->od_shift);
>>      ctl |= pll_info->od_encoding[od - 1] << pll_info->od_shift;
>>
>> -    writel(ctl, cgu->base + pll_info->reg);
>> +    writel(ctl, cgu->base + pll_info->pll_reg);
>>      spin_unlock_irqrestore(&cgu->lock, flags);
>>
>>      return 0;
>> @@ -209,16 +212,21 @@ static int ingenic_pll_enable(struct clk_hw *hw)
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
>> @@ -242,11 +250,11 @@ static void ingenic_pll_disable(struct clk_hw *hw)
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
>> @@ -258,7 +266,7 @@ static int ingenic_pll_is_enabled(struct clk_hw *hw)
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
>> +    unsigned bypass_reg;
>> +    unsigned rate_multiplier;
>>      const s8 *od_encoding;
>>      u8 m_shift, m_bits, m_offset;
>>      u8 n_shift, n_bits, n_offset;
>> -- 
>> 2.7.4
>>
>

