Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A80E11F1B8
	for <lists+linux-mips@lfdr.de>; Sat, 14 Dec 2019 13:16:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726691AbfLNMQx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 14 Dec 2019 07:16:53 -0500
Received: from out28-53.mail.aliyun.com ([115.124.28.53]:54946 "EHLO
        out28-53.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725809AbfLNMQx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 14 Dec 2019 07:16:53 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07436329|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.477822-0.00910106-0.513076;DS=CONTINUE|ham_regular_dialog|0.28273-0.00130711-0.715963;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03300;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=13;RT=13;SR=0;TI=SMTPD_---.GH.ETg._1576325792;
Received: from 192.168.88.128(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.GH.ETg._1576325792)
          by smtp.aliyun-inc.com(10.147.40.2);
          Sat, 14 Dec 2019 20:16:33 +0800
Subject: Re: [PATCH v2 1/5] clk: Ingenic: Adjust cgu code to make it
 compatible with X1830.
To:     Paul Cercueil <paul@crapouillou.net>
References: <1576250472-124315-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1576250472-124315-3-git-send-email-zhouyanjie@wanyeetech.com>
 <1576272301.3.3@crapouillou.net>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, paul.burton@mips.com, paulburton@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, mark.rutland@arm.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
From:   zhouyanjie <zhouyanjie@wanyeetech.com>
Message-ID: <5DF4D2A0.3010603@wanyeetech.com>
Date:   Sat, 14 Dec 2019 20:16:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1576272301.3.3@crapouillou.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

On 2019年12月14日 05:25, Paul Cercueil wrote:
> Hi Zhou,
>
>
> Le ven., déc. 13, 2019 at 23:21, 周琰杰 (Zhou Yanjie) 
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
>>  drivers/clk/ingenic/cgu.c | 32 +++++++++++++++++++++-----------
>>  drivers/clk/ingenic/cgu.h |  8 ++++++--
>>  2 files changed, 27 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/clk/ingenic/cgu.c b/drivers/clk/ingenic/cgu.c
>> index 6e96303..ae1ddcb 100644
>> --- a/drivers/clk/ingenic/cgu.c
>> +++ b/drivers/clk/ingenic/cgu.c
>> @@ -84,7 +84,7 @@ ingenic_pll_recalc_rate(struct clk_hw *hw, unsigned 
>> long parent_rate)
>>      pll_info = &clk_info->pll;
>>
>>      spin_lock_irqsave(&cgu->lock, flags);
>> -    ctl = readl(cgu->base + pll_info->reg);
>> +    ctl = readl(cgu->base + pll_info->pll_reg);
>>      spin_unlock_irqrestore(&cgu->lock, flags);
>>
>>      m = (ctl >> pll_info->m_shift) & GENMASK(pll_info->m_bits - 1, 0);
>> @@ -93,6 +93,11 @@ ingenic_pll_recalc_rate(struct clk_hw *hw, 
>> unsigned long parent_rate)
>>      n += pll_info->n_offset;
>>      od_enc = ctl >> pll_info->od_shift;
>>      od_enc &= GENMASK(pll_info->od_bits - 1, 0);
>> +
>> +    spin_lock_irqsave(&cgu->lock, flags);
>> +    ctl = readl(cgu->base + pll_info->bypass_reg);
>> +    spin_unlock_irqrestore(&cgu->lock, flags);
>
> I think you should start the patchset with the current [5/5] patch; 
> then you wouldn't have to add spinlock protection here just to see it 
> removed later in the same patchset.
>

OK, I will adjust their order in v3.

Thanks and best regards!

> Cheers,
> -Paul
>
>> +
>>      bypass = !pll_info->no_bypass_bit &&
>>           !!(ctl & BIT(pll_info->bypass_bit));
>>
>> @@ -106,7 +111,7 @@ ingenic_pll_recalc_rate(struct clk_hw *hw, 
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
>> @@ -139,7 +144,7 @@ ingenic_pll_calc(const struct 
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
>> @@ -183,7 +188,7 @@ ingenic_pll_set_rate(struct clk_hw *hw, unsigned 
>> long req_rate,
>>              clk_info->name, req_rate, rate);
>>
>>      spin_lock_irqsave(&cgu->lock, flags);
>> -    ctl = readl(cgu->base + pll_info->reg);
>> +    ctl = readl(cgu->base + pll_info->pll_reg);
>>
>>      ctl &= ~(GENMASK(pll_info->m_bits - 1, 0) << pll_info->m_shift);
>>      ctl |= (m - pll_info->m_offset) << pll_info->m_shift;
>> @@ -194,7 +199,7 @@ ingenic_pll_set_rate(struct clk_hw *hw, unsigned 
>> long req_rate,
>>      ctl &= ~(GENMASK(pll_info->od_bits - 1, 0) << pll_info->od_shift);
>>      ctl |= pll_info->od_encoding[od - 1] << pll_info->od_shift;
>>
>> -    writel(ctl, cgu->base + pll_info->reg);
>> +    writel(ctl, cgu->base + pll_info->pll_reg);
>>      spin_unlock_irqrestore(&cgu->lock, flags);
>>
>>      return 0;
>> @@ -212,16 +217,21 @@ static int ingenic_pll_enable(struct clk_hw *hw)
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
>> @@ -245,11 +255,11 @@ static void ingenic_pll_disable(struct clk_hw *hw)
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
>> @@ -263,7 +273,7 @@ static int ingenic_pll_is_enabled(struct clk_hw *hw)
>>      u32 ctl;
>>
>>      spin_lock_irqsave(&cgu->lock, flags);
>> -    ctl = readl(cgu->base + pll_info->reg);
>> +    ctl = readl(cgu->base + pll_info->pll_reg);
>>      spin_unlock_irqrestore(&cgu->lock, flags);
>>
>>      return !!(ctl & BIT(pll_info->enable_bit));
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

