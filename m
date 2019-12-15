Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 209FD11F81D
	for <lists+linux-mips@lfdr.de>; Sun, 15 Dec 2019 15:12:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726112AbfLOOMF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 15 Dec 2019 09:12:05 -0500
Received: from out28-194.mail.aliyun.com ([115.124.28.194]:45803 "EHLO
        out28-194.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726103AbfLOOME (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 15 Dec 2019 09:12:04 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07524233|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.748144-0.0180301-0.233826;DS=SPAM|spam_ad|0.859637-0.000764868-0.139599;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03311;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=13;RT=13;SR=0;TI=SMTPD_---.GHcsMuJ_1576419116;
Received: from 192.168.88.128(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.GHcsMuJ_1576419116)
          by smtp.aliyun-inc.com(10.147.41.143);
          Sun, 15 Dec 2019 22:11:58 +0800
Subject: Re: [PATCH v3 1/5] clk: Ingenic: Remove unnecessary spinlock when
 reading registers.
To:     Paul Cercueil <paul@crapouillou.net>
References: <1576337630-78576-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1576337630-78576-3-git-send-email-zhouyanjie@wanyeetech.com>
 <1576346863.3.1@crapouillou.net>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, paul.burton@mips.com, paulburton@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, mark.rutland@arm.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <5DF63F2E.2040608@wanyeetech.com>
Date:   Sun, 15 Dec 2019 22:11:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1576346863.3.1@crapouillou.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

On 2019年12月15日 02:07, Paul Cercueil wrote:
> Hi Zhou,
>
> You can also remove the locks around ingenic_cgu_gate_get(), they are 
> useless. Then also edit the doc of this function as currently it says 
> that the caller must hold the lock.
>

Sure, I'll remove it in v4.

Thanks and best regards!

> -Paul
>
>
> Le sam., déc. 14, 2019 at 23:33, 周琰杰 (Zhou Yanjie) 
> <zhouyanjie@wanyeetech.com> a écrit :
>> It is not necessary to use spinlock when reading registers,
>> so remove it from cgu.c.
>>
>> Suggested-by: Paul Cercueil <paul@crapouillou.net>
>> Suggested-by: Paul Burton <paulburton@kernel.org>
>> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>> ---
>>
>> Notes:
>>     v2:
>>     New patch.
>>
>>     v2->v3:
>>     Adjust order from [5/5] in v2 to [1/5] in v3.
>>
>>  drivers/clk/ingenic/cgu.c | 6 ------
>>  1 file changed, 6 deletions(-)
>>
>> diff --git a/drivers/clk/ingenic/cgu.c b/drivers/clk/ingenic/cgu.c
>> index 6e96303..8bd3998 100644
>> --- a/drivers/clk/ingenic/cgu.c
>> +++ b/drivers/clk/ingenic/cgu.c
>> @@ -76,16 +76,13 @@ ingenic_pll_recalc_rate(struct clk_hw *hw, 
>> unsigned long parent_rate)
>>      const struct ingenic_cgu_pll_info *pll_info;
>>      unsigned m, n, od_enc, od;
>>      bool bypass;
>> -    unsigned long flags;
>>      u32 ctl;
>>
>>      clk_info = &cgu->clock_info[ingenic_clk->idx];
>>      BUG_ON(clk_info->type != CGU_CLK_PLL);
>>      pll_info = &clk_info->pll;
>>
>> -    spin_lock_irqsave(&cgu->lock, flags);
>>      ctl = readl(cgu->base + pll_info->reg);
>> -    spin_unlock_irqrestore(&cgu->lock, flags);
>>
>>      m = (ctl >> pll_info->m_shift) & GENMASK(pll_info->m_bits - 1, 0);
>>      m += pll_info->m_offset;
>> @@ -259,12 +256,9 @@ static int ingenic_pll_is_enabled(struct clk_hw 
>> *hw)
>>      struct ingenic_cgu *cgu = ingenic_clk->cgu;
>>      const struct ingenic_cgu_clk_info *clk_info = 
>> to_clk_info(ingenic_clk);
>>      const struct ingenic_cgu_pll_info *pll_info = &clk_info->pll;
>> -    unsigned long flags;
>>      u32 ctl;
>>
>> -    spin_lock_irqsave(&cgu->lock, flags);
>>      ctl = readl(cgu->base + pll_info->reg);
>> -    spin_unlock_irqrestore(&cgu->lock, flags);
>>
>>      return !!(ctl & BIT(pll_info->enable_bit));
>>  }
>> -- 
>> 2.7.4
>>
>

