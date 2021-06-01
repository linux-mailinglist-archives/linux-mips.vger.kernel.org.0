Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45F7639751A
	for <lists+linux-mips@lfdr.de>; Tue,  1 Jun 2021 16:09:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234050AbhFAOKo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Jun 2021 10:10:44 -0400
Received: from out28-50.mail.aliyun.com ([115.124.28.50]:52115 "EHLO
        out28-50.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234027AbhFAOKm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 1 Jun 2021 10:10:42 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1194137|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.427396-0.000226577-0.572377;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047208;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=8;RT=8;SR=0;TI=SMTPD_---.KM.e4b8_1622556537;
Received: from 192.168.0.103(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.KM.e4b8_1622556537)
          by smtp.aliyun-inc.com(10.147.43.95);
          Tue, 01 Jun 2021 22:08:58 +0800
Subject: Re: [PATCH v2 3/6] clk: ingenic: Read bypass register only when there
 is one
To:     Paul Cercueil <paul@crapouillou.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        list@opendingux.net
References: <20210530164923.18134-1-paul@crapouillou.net>
 <20210530164923.18134-4-paul@crapouillou.net>
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <47eeb44b-2752-1c99-4209-09769e267c7f@wanyeetech.com>
Date:   Tue, 1 Jun 2021 22:08:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20210530164923.18134-4-paul@crapouillou.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


On 2021/5/31 上午12:49, Paul Cercueil wrote:
> Rework the clock code so that the bypass register is only read when
> there is actually a bypass functionality.
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>   drivers/clk/ingenic/cgu.c | 19 +++++++++++--------
>   1 file changed, 11 insertions(+), 8 deletions(-)


Tested-by: 周琰杰 (Zhou Yanjie)<zhouyanjie@wanyeetech.com>    # on CU1830-neo/X1830


>
> diff --git a/drivers/clk/ingenic/cgu.c b/drivers/clk/ingenic/cgu.c
> index 0619d45a950c..7686072aff8f 100644
> --- a/drivers/clk/ingenic/cgu.c
> +++ b/drivers/clk/ingenic/cgu.c
> @@ -99,13 +99,14 @@ ingenic_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
>   	od_enc = ctl >> pll_info->od_shift;
>   	od_enc &= GENMASK(pll_info->od_bits - 1, 0);
>   
> -	ctl = readl(cgu->base + pll_info->bypass_reg);
> +	if (!pll_info->no_bypass_bit) {
> +		ctl = readl(cgu->base + pll_info->bypass_reg);
>   
> -	bypass = !pll_info->no_bypass_bit &&
> -		 !!(ctl & BIT(pll_info->bypass_bit));
> +		bypass = !!(ctl & BIT(pll_info->bypass_bit));
>   
> -	if (bypass)
> -		return parent_rate;
> +		if (bypass)
> +			return parent_rate;
> +	}
>   
>   	for (od = 0; od < pll_info->od_max; od++) {
>   		if (pll_info->od_encoding[od] == od_enc)
> @@ -225,11 +226,13 @@ static int ingenic_pll_enable(struct clk_hw *hw)
>   	u32 ctl;
>   
>   	spin_lock_irqsave(&cgu->lock, flags);
> -	ctl = readl(cgu->base + pll_info->bypass_reg);
> +	if (!pll_info->no_bypass_bit) {
> +		ctl = readl(cgu->base + pll_info->bypass_reg);
>   
> -	ctl &= ~BIT(pll_info->bypass_bit);
> +		ctl &= ~BIT(pll_info->bypass_bit);
>   
> -	writel(ctl, cgu->base + pll_info->bypass_reg);
> +		writel(ctl, cgu->base + pll_info->bypass_reg);
> +	}
>   
>   	ctl = readl(cgu->base + pll_info->reg);
>   
