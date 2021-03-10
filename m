Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72508334099
	for <lists+linux-mips@lfdr.de>; Wed, 10 Mar 2021 15:43:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232971AbhCJOnC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Mar 2021 09:43:02 -0500
Received: from out28-147.mail.aliyun.com ([115.124.28.147]:51366 "EHLO
        out28-147.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232975AbhCJOmr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Mar 2021 09:42:47 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07436317|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.193297-0.00363244-0.80307;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047198;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=9;RT=9;SR=0;TI=SMTPD_---.Jj1IsSD_1615387362;
Received: from 192.168.10.152(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.Jj1IsSD_1615387362)
          by smtp.aliyun-inc.com(10.147.42.22);
          Wed, 10 Mar 2021 22:42:43 +0800
Subject: Re: [PATCH 5/6] clk: ingenic: Support overriding PLLs M/N/OD calc
 algorithm
To:     Paul Cercueil <paul@crapouillou.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     od@zcrc.me, linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
References: <20210307141759.30426-1-paul@crapouillou.net>
 <20210307141759.30426-6-paul@crapouillou.net>
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <14fe0eed-5657-c555-f8eb-6e6b8b367b44@wanyeetech.com>
Date:   Wed, 10 Mar 2021 22:42:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20210307141759.30426-6-paul@crapouillou.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

On 2021/3/7 下午10:17, Paul Cercueil wrote:
> SoC-specific code can now provide a callback if they need to compute the
> M/N/OD values in a specific way.
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>   drivers/clk/ingenic/cgu.c | 40 ++++++++++++++++++++++++++-------------
>   drivers/clk/ingenic/cgu.h |  3 +++
>   2 files changed, 30 insertions(+), 13 deletions(-)


Tested-by: 周琰杰 (Zhou Yanjie)<zhouyanjie@wanyeetech.com>   # on CU1000-neo/X1000E


> diff --git a/drivers/clk/ingenic/cgu.c b/drivers/clk/ingenic/cgu.c
> index 58f7ab5cf0fe..266c7595d330 100644
> --- a/drivers/clk/ingenic/cgu.c
> +++ b/drivers/clk/ingenic/cgu.c
> @@ -119,28 +119,42 @@ ingenic_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
>   		n * od);
>   }
>   
> -static unsigned long
> -ingenic_pll_calc(const struct ingenic_cgu_clk_info *clk_info,
> -		 unsigned long rate, unsigned long parent_rate,
> -		 unsigned *pm, unsigned *pn, unsigned *pod)
> +static void
> +ingenic_pll_calc_m_n_od(const struct ingenic_cgu_pll_info *pll_info,
> +			unsigned long rate, unsigned long parent_rate,
> +			unsigned int *pm, unsigned int *pn, unsigned int *pod)
>   {
> -	const struct ingenic_cgu_pll_info *pll_info;
> -	unsigned m, n, od;
> -
> -	pll_info = &clk_info->pll;
> -	od = 1;
> +	unsigned int m, n, od = 1;
>   
>   	/*
>   	 * The frequency after the input divider must be between 10 and 50 MHz.
>   	 * The highest divider yields the best resolution.
>   	 */
>   	n = parent_rate / (10 * MHZ);
> -	n = min_t(unsigned, n, 1 << clk_info->pll.n_bits);
> -	n = max_t(unsigned, n, pll_info->n_offset);
> +	n = min_t(unsigned int, n, 1 << pll_info->n_bits);
> +	n = max_t(unsigned int, n, pll_info->n_offset);
>   
>   	m = (rate / MHZ) * od * n / (parent_rate / MHZ);
> -	m = min_t(unsigned, m, 1 << clk_info->pll.m_bits);
> -	m = max_t(unsigned, m, pll_info->m_offset);
> +	m = min_t(unsigned int, m, 1 << pll_info->m_bits);
> +	m = max_t(unsigned int, m, pll_info->m_offset);
> +
> +	*pm = m;
> +	*pn = n;
> +	*pod = od;
> +}
> +
> +static unsigned long
> +ingenic_pll_calc(const struct ingenic_cgu_clk_info *clk_info,
> +		 unsigned long rate, unsigned long parent_rate,
> +		 unsigned int *pm, unsigned int *pn, unsigned int *pod)
> +{
> +	const struct ingenic_cgu_pll_info *pll_info = &clk_info->pll;
> +	unsigned int m, n, od;
> +
> +	if (pll_info->calc_m_n_od)
> +		(*pll_info->calc_m_n_od)(pll_info, rate, parent_rate, &m, &n, &od);
> +	else
> +		ingenic_pll_calc_m_n_od(pll_info, rate, parent_rate, &m, &n, &od);
>   
>   	if (pm)
>   		*pm = m;
> diff --git a/drivers/clk/ingenic/cgu.h b/drivers/clk/ingenic/cgu.h
> index 10521d1b7b12..bfc2b9c38a41 100644
> --- a/drivers/clk/ingenic/cgu.h
> +++ b/drivers/clk/ingenic/cgu.h
> @@ -55,6 +55,9 @@ struct ingenic_cgu_pll_info {
>   	s8 bypass_bit;
>   	u8 enable_bit;
>   	u8 stable_bit;
> +	void (*calc_m_n_od)(const struct ingenic_cgu_pll_info *pll_info,
> +			    unsigned long rate, unsigned long parent_rate,
> +			    unsigned int *m, unsigned int *n, unsigned int *od);
>   };
>   
>   /**
