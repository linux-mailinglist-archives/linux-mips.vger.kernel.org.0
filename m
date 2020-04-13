Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7DA81A6E3A
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2020 23:25:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389018AbgDMVZC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Apr 2020 17:25:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2388994AbgDMVZA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 13 Apr 2020 17:25:00 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E092C0A3BDC;
        Mon, 13 Apr 2020 14:24:58 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id a201so11233242wme.1;
        Mon, 13 Apr 2020 14:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NjfnX3yyZ0YTWx7uzk4Ht6UqtS4i/q5/ley1mGpgiUA=;
        b=aOzt04mQcPVwqtO8kLOHJZAnPH5hHG78mg5pGx/YxhCfgzmPj9P//8wK0uF6aTpM5x
         bm1+0ujrEuWd9A7tyAXj5sNH62g18zm3WrxnhlKHKB/o8aO49X6yIh9nzlB0Ow5Trfi1
         OpgRdNvx5NZO4OE+RGHeVhO+PWiTClWyBANB88/EbG8b7RAq2p5naam1gwmJNSa6wkyS
         kyZYMYW8TNJ7BYPx17wRWibXC9u8AGeShHQS9NwskyciCEIrF2DBgHUO8PBvreXZvt75
         Oz7+11ac6PiyFHdrxwVNVs4Mp/1Qxg95ehwWWTfres2QwX7rLHBAFFFxtFdw+LUquNaf
         TqiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=NjfnX3yyZ0YTWx7uzk4Ht6UqtS4i/q5/ley1mGpgiUA=;
        b=hcQ8MvtvE/bWDIFAtZqI4rbRvau0CtPSbEqkmD3ISSbcB4gCFO5/X6pM+eB4xKW2h9
         6Vl7bYt92WfqdN9lIlcLibvEX+PITdMo1Lc24ZJxUID1/xBcU7C9+LdhhMpNgd/xmkak
         9ih9kZglJcNTzHZtjevaQdJ5hfVrP/5ZuawEe6d2n3D0Td4KpXHi4fDSYAqETbioGwfc
         oJMcUuLtxQSqFB2gpkkGKf3cL2K/956Zzv/1vzHySGDmqwTS6XZI2Bhkuv3YmUUVUg+C
         mUviQSztHX6f/iSsxl1t7HMngG948TI5BqMZAVQRAuPoQjHtivzBGe6h3GUTJbFs4ysa
         UYvw==
X-Gm-Message-State: AGi0PubIrGOnQE+JhzUPpIUsO8IOwCP4PTwbmeuJkF6t4oiJsg44vyDB
        LardY+kOEXbqQTikoK5CeWg=
X-Google-Smtp-Source: APiQypJRdxj20oIPNdAL/a+40xXz2F4DVRGJHEuDUDY4+6Et6gxmp+8a/Iqx498/PHHb+L9nluovHQ==
X-Received: by 2002:a1c:2506:: with SMTP id l6mr19601094wml.44.1586813097269;
        Mon, 13 Apr 2020 14:24:57 -0700 (PDT)
Received: from [192.168.1.39] (116.red-83-42-57.dynamicip.rima-tde.net. [83.42.57.116])
        by smtp.gmail.com with ESMTPSA id w17sm7946268wru.20.2020.04.13.14.24.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2020 14:24:55 -0700 (PDT)
Subject: Re: [PATCH] mips: loongsoon2ef: remove private clk api
To:     Arnd Bergmann <arnd@arndb.de>, sboyd@kernel.org,
        jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        chenhc@lemote.com, Paul Burton <paulburton@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        mturquette@baylibre.com
References: <20200409064416.83340-1-sboyd@kernel.org>
 <20200409090228.2241176-1-arnd@arndb.de>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Autocrypt: addr=f4bug@amsat.org; keydata=
 mQINBDU8rLoBEADb5b5dyglKgWF9uDbIjFXU4gDtcwiga9wJ/wX6xdhBqU8tlQ4BroH7AeRl
 u4zXP0QnBDAG7EetxlQzcfYbPmxFISWjckDBFvDbFsojrZmwF2/LkFSzlvKiN5KLghzzJhLO
 HhjGlF8deEZz/d/G8qzO9mIw8GIBS8uuWh6SIcG/qq7+y+2+aifaj92EdwU79apZepT/U3vN
 YrfcAuo1Ycy7/u0hJ7rlaFUn2Fu5KIgV2O++hHYtCCQfdPBg/+ujTL+U+sCDawCyq+9M5+LJ
 ojCzP9rViLZDd/gS6jX8T48hhidtbtsFRj/e9QpdZgDZfowRMVsRx+TB9yzjFdMO0YaYybXp
 dg/wCUepX5xmDBrle6cZ8VEe00+UQCAU1TY5Hs7QFfBbjgR3k9pgJzVXNUKcJ9DYQP0OBH9P
 ZbZvM0Ut2Bk6bLBO5iCVDOco0alrPkX7iJul2QWBy3Iy9j02GnA5jZ1Xtjr9kpCqQT+sRXso
 Vpm5TPGWaWljIeLWy/qL8drX1eyJzwTB3A36Ck4r3YmjMjfmvltSZB1uAdo1elHTlFEULpU/
 HiwvvqXQ9koB15U154VCuguvx/Qnboz8GFb9Uw8VyawzVxYVNME7xw7CQF8FYxzj6eI7rBf2
 Dj/II6wxWPgDEy3oUzuNOxTB7sT3b/Ym76yOJzWX5BylXQIJ5wARAQABtDFQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQJVBBMBCAA/AhsPBgsJ
 CAcDAgYVCAIJCgsEFgIDAQIeAQIXgBYhBPqr514SkXIh3P1rsuPjLCzercDeBQJd660aBQks
 klzgAAoJEOPjLCzercDe2iMP+gMG2dUf+qHz2uG8nTBGMjgK0aEJrKVPodFA+iedQ5Kp3BMo
 jrTg3/DG1HMYdcvQu/NFLYwamUfUasyor1k+3dB23hY09O4xOsYJBWdilkBGsJTKErUmkUO2
 3J/kawosvYtJJSHUpw3N6mwz/iWnjkT8BPp7fFXSujV63aZWZINueTbK7Y8skFHI0zpype9s
 loU8xc4JBrieGccy3n4E/kogGrTG5jcMTNHZ106DsQkhFnjhWETp6g9xOKrzZQbETeRBOe4P
 sRsY9YSG2Sj+ZqmZePvO8LyzGRjYU7T6Z80S1xV0lH6KTMvq7vvz5rd92f3pL4YrXq+e//HZ
 JsiLen8LH/FRhTsWRgBtNYkOsd5F9NvfJtSM0qbX32cSXMAStDVnS4U+H2vCVCWnfNug2TdY
 7v4NtdpaCi4CBBa3ZtqYVOU05IoLnlx0miKTBMqmI05kpgX98pi2QUPJBYi/+yNu3fjjcuS9
 K5WmpNFTNi6yiBbNjJA5E2qUKbIT/RwQFQvhrxBUcRCuK4x/5uOZrysjFvhtR8YGm08h+8vS
 n0JCnJD5aBhiVdkohEFAz7e5YNrAg6kOA5IVRHB44lTBOatLqz7ntwdGD0rteKuHaUuXpTYy
 CRqCVAKqFJtxhvJvaX0vLS1Z2dwtDwhjfIdgPiKEGOgCNGH7R8l+aaM4OPOd
Message-ID: <42da80f7-49ab-8c46-36fc-16e325c1707f@amsat.org>
Date:   Mon, 13 Apr 2020 23:24:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200409090228.2241176-1-arnd@arndb.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 4/9/20 11:02 AM, Arnd Bergmann wrote:
> As platforms are moving to COMMON_CLK in general, loongson2ef
> stuck out as something that has a private implementation but
> does not actually use it except for setting the frequency of
> the CPU itself from the loongson2_cpufreq driver.
> 
> Change that driver to call the register setting function directly
> and remove the rest of the stub implementation.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  arch/mips/include/asm/clock.h                 | 49 ----------
>  .../include/asm/mach-loongson2ef/loongson.h   |  1 +
>  arch/mips/loongson2ef/Kconfig                 |  1 -
>  arch/mips/loongson2ef/lemote-2f/clock.c       | 98 +------------------
>  arch/mips/loongson64/smp.c                    |  1 -
>  drivers/cpufreq/loongson2_cpufreq.c           | 22 +----
>  6 files changed, 8 insertions(+), 164 deletions(-)
>  delete mode 100644 arch/mips/include/asm/clock.h
> 
> diff --git a/arch/mips/include/asm/clock.h b/arch/mips/include/asm/clock.h
> deleted file mode 100644
> index 5a8f96ebe5fa..000000000000
> --- a/arch/mips/include/asm/clock.h
> +++ /dev/null
> @@ -1,49 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#ifndef __ASM_MIPS_CLOCK_H
> -#define __ASM_MIPS_CLOCK_H
> -
> -#include <linux/kref.h>
> -#include <linux/list.h>
> -#include <linux/seq_file.h>
> -#include <linux/clk.h>
> -
> -struct clk;
> -
> -struct clk_ops {
> -	void (*init) (struct clk *clk);
> -	void (*enable) (struct clk *clk);
> -	void (*disable) (struct clk *clk);
> -	void (*recalc) (struct clk *clk);
> -	int (*set_rate) (struct clk *clk, unsigned long rate, int algo_id);
> -	long (*round_rate) (struct clk *clk, unsigned long rate);
> -};
> -
> -struct clk {
> -	struct list_head node;
> -	const char *name;
> -	int id;
> -	struct module *owner;
> -
> -	struct clk *parent;
> -	struct clk_ops *ops;
> -
> -	struct kref kref;
> -
> -	unsigned long rate;
> -	unsigned long flags;
> -};
> -
> -#define CLK_ALWAYS_ENABLED	(1 << 0)
> -#define CLK_RATE_PROPAGATES	(1 << 1)
> -
> -int clk_init(void);
> -
> -int __clk_enable(struct clk *);
> -void __clk_disable(struct clk *);
> -
> -void clk_recalc_rate(struct clk *);
> -
> -int clk_register(struct clk *);
> -void clk_unregister(struct clk *);
> -
> -#endif				/* __ASM_MIPS_CLOCK_H */
> diff --git a/arch/mips/include/asm/mach-loongson2ef/loongson.h b/arch/mips/include/asm/mach-loongson2ef/loongson.h
> index 5008af0a1a19..57e571128489 100644
> --- a/arch/mips/include/asm/mach-loongson2ef/loongson.h
> +++ b/arch/mips/include/asm/mach-loongson2ef/loongson.h
> @@ -244,6 +244,7 @@ static inline void do_perfcnt_IRQ(void)
>  #ifdef CONFIG_CPU_SUPPORTS_CPUFREQ
>  #include <linux/cpufreq.h>
>  extern struct cpufreq_frequency_table loongson2_clockmod_table[];
> +extern int loongson2_cpu_set_rate(unsigned long rate_khz);
>  #endif
>  
>  /*
> diff --git a/arch/mips/loongson2ef/Kconfig b/arch/mips/loongson2ef/Kconfig
> index 595dd48e1e4d..96dc6eba4310 100644
> --- a/arch/mips/loongson2ef/Kconfig
> +++ b/arch/mips/loongson2ef/Kconfig
> @@ -46,7 +46,6 @@ config LEMOTE_MACH2F
>  	select CSRC_R4K if ! MIPS_EXTERNAL_TIMER
>  	select DMA_NONCOHERENT
>  	select GENERIC_ISA_DMA_SUPPORT_BROKEN
> -	select HAVE_CLK
>  	select FORCE_PCI
>  	select I8259
>  	select IRQ_MIPS_CPU
> diff --git a/arch/mips/loongson2ef/lemote-2f/clock.c b/arch/mips/loongson2ef/lemote-2f/clock.c
> index 414f282c8ab5..850b6b9f8f15 100644
> --- a/arch/mips/loongson2ef/lemote-2f/clock.c
> +++ b/arch/mips/loongson2ef/lemote-2f/clock.c
> @@ -6,22 +6,12 @@
>   * License.  See the file "COPYING" in the main directory of this archive
>   * for more details.
>   */
> -#include <linux/clk.h>
>  #include <linux/cpufreq.h>
>  #include <linux/errno.h>
>  #include <linux/export.h>
> -#include <linux/list.h>
> -#include <linux/mutex.h>
> -#include <linux/spinlock.h>
>  
> -#include <asm/clock.h>
>  #include <asm/mach-loongson2ef/loongson.h>
>  
> -static LIST_HEAD(clock_list);
> -static DEFINE_SPINLOCK(clock_lock);
> -static DEFINE_MUTEX(clock_list_sem);
> -
> -/* Minimum CLK support */
>  enum {
>  	DC_ZERO, DC_25PT = 2, DC_37PT, DC_50PT, DC_62PT, DC_75PT,
>  	DC_87PT, DC_DISABLE, DC_RESV
> @@ -41,103 +31,21 @@ struct cpufreq_frequency_table loongson2_clockmod_table[] = {
>  };
>  EXPORT_SYMBOL_GPL(loongson2_clockmod_table);
>  
> -static struct clk cpu_clk = {
> -	.name = "cpu_clk",
> -	.flags = CLK_ALWAYS_ENABLED | CLK_RATE_PROPAGATES,
> -	.rate = 800000000,
> -};
> -
> -struct clk *clk_get(struct device *dev, const char *id)
> -{
> -	return &cpu_clk;
> -}
> -EXPORT_SYMBOL(clk_get);
> -
> -static void propagate_rate(struct clk *clk)
> -{
> -	struct clk *clkp;
> -
> -	list_for_each_entry(clkp, &clock_list, node) {
> -		if (likely(clkp->parent != clk))
> -			continue;
> -		if (likely(clkp->ops && clkp->ops->recalc))
> -			clkp->ops->recalc(clkp);
> -		if (unlikely(clkp->flags & CLK_RATE_PROPAGATES))
> -			propagate_rate(clkp);
> -	}
> -}
> -
> -int clk_enable(struct clk *clk)
> -{
> -	return 0;
> -}
> -EXPORT_SYMBOL(clk_enable);
> -
> -void clk_disable(struct clk *clk)
> +int loongson2_cpu_set_rate(unsigned long rate_khz)
>  {
> -}
> -EXPORT_SYMBOL(clk_disable);
> -
> -unsigned long clk_get_rate(struct clk *clk)
> -{
> -	if (!clk)
> -		return 0;
> -
> -	return (unsigned long)clk->rate;
> -}
> -EXPORT_SYMBOL(clk_get_rate);
> -
> -void clk_put(struct clk *clk)
> -{
> -}
> -EXPORT_SYMBOL(clk_put);
> -
> -int clk_set_rate(struct clk *clk, unsigned long rate)
> -{
> -	unsigned int rate_khz = rate / 1000;
>  	struct cpufreq_frequency_table *pos;
> -	int ret = 0;
>  	int regval;
>  
> -	if (likely(clk->ops && clk->ops->set_rate)) {
> -		unsigned long flags;
> -
> -		spin_lock_irqsave(&clock_lock, flags);
> -		ret = clk->ops->set_rate(clk, rate, 0);
> -		spin_unlock_irqrestore(&clock_lock, flags);
> -	}
> -
> -	if (unlikely(clk->flags & CLK_RATE_PROPAGATES))
> -		propagate_rate(clk);
> -
>  	cpufreq_for_each_valid_entry(pos, loongson2_clockmod_table)
>  		if (rate_khz == pos->frequency)
>  			break;
>  	if (rate_khz != pos->frequency)
>  		return -ENOTSUPP;
>  
> -	clk->rate = rate;
> -
>  	regval = readl(LOONGSON_CHIPCFG);
>  	regval = (regval & ~0x7) | (pos->driver_data - 1);
>  	writel(regval, LOONGSON_CHIPCFG);
>  
> -	return ret;
> -}
> -EXPORT_SYMBOL_GPL(clk_set_rate);
> -
> -long clk_round_rate(struct clk *clk, unsigned long rate)
> -{
> -	if (likely(clk->ops && clk->ops->round_rate)) {
> -		unsigned long flags, rounded;
> -
> -		spin_lock_irqsave(&clock_lock, flags);
> -		rounded = clk->ops->round_rate(clk, rate);
> -		spin_unlock_irqrestore(&clock_lock, flags);
> -
> -		return rounded;
> -	}
> -
> -	return rate;
> +	return 0;
>  }
> -EXPORT_SYMBOL_GPL(clk_round_rate);
> +EXPORT_SYMBOL_GPL(loongson2_cpu_set_rate);
> diff --git a/arch/mips/loongson64/smp.c b/arch/mips/loongson64/smp.c
> index e1fe8bbb377d..e744e1bee49e 100644
> --- a/arch/mips/loongson64/smp.c
> +++ b/arch/mips/loongson64/smp.c
> @@ -15,7 +15,6 @@
>  #include <linux/kexec.h>
>  #include <asm/processor.h>
>  #include <asm/time.h>
> -#include <asm/clock.h>
>  #include <asm/tlbflush.h>
>  #include <asm/cacheflush.h>
>  #include <loongson.h>
> diff --git a/drivers/cpufreq/loongson2_cpufreq.c b/drivers/cpufreq/loongson2_cpufreq.c
> index 909f40fbcde2..d05e761d9572 100644
> --- a/drivers/cpufreq/loongson2_cpufreq.c
> +++ b/drivers/cpufreq/loongson2_cpufreq.c
> @@ -20,7 +20,6 @@
>  #include <linux/delay.h>
>  #include <linux/platform_device.h>
>  
> -#include <asm/clock.h>
>  #include <asm/idle.h>
>  
>  #include <asm/mach-loongson2ef/loongson.h>
> @@ -58,29 +57,20 @@ static int loongson2_cpufreq_target(struct cpufreq_policy *policy,
>  	     loongson2_clockmod_table[index].driver_data) / 8;
>  
>  	/* setting the cpu frequency */
> -	clk_set_rate(policy->clk, freq * 1000);
> +	loongson2_cpu_set_rate(freq);
>  
>  	return 0;
>  }
>  
>  static int loongson2_cpufreq_cpu_init(struct cpufreq_policy *policy)
>  {
> -	struct clk *cpuclk;
>  	int i;
>  	unsigned long rate;
>  	int ret;
>  
> -	cpuclk = clk_get(NULL, "cpu_clk");
> -	if (IS_ERR(cpuclk)) {
> -		pr_err("couldn't get CPU clk\n");
> -		return PTR_ERR(cpuclk);
> -	}
> -
>  	rate = cpu_clock_freq / 1000;
> -	if (!rate) {
> -		clk_put(cpuclk);
> +	if (!rate)
>  		return -EINVAL;
> -	}
>  
>  	/* clock table init */
>  	for (i = 2;
> @@ -88,20 +78,16 @@ static int loongson2_cpufreq_cpu_init(struct cpufreq_policy *policy)
>  	     i++)
>  		loongson2_clockmod_table[i].frequency = (rate * i) / 8;
>  
> -	ret = clk_set_rate(cpuclk, rate * 1000);
> -	if (ret) {
> -		clk_put(cpuclk);
> +	ret = loongson2_cpu_set_rate(rate);
> +	if (ret)
>  		return ret;
> -	}
>  
> -	policy->clk = cpuclk;
>  	cpufreq_generic_init(policy, &loongson2_clockmod_table[0], 0);
>  	return 0;
>  }
>  
>  static int loongson2_cpufreq_exit(struct cpufreq_policy *policy)
>  {
> -	clk_put(policy->clk);
>  	return 0;
>  }
>  
> 
