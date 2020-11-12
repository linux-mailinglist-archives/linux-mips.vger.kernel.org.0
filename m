Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6EE92B027A
	for <lists+linux-mips@lfdr.de>; Thu, 12 Nov 2020 11:04:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727773AbgKLKE7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 12 Nov 2020 05:04:59 -0500
Received: from relay3.mymailcheap.com ([217.182.66.161]:59003 "EHLO
        relay3.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725979AbgKLKE6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 12 Nov 2020 05:04:58 -0500
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com [91.134.140.82])
        by relay3.mymailcheap.com (Postfix) with ESMTPS id 1633F3ECDF;
        Thu, 12 Nov 2020 11:04:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by filter2.mymailcheap.com (Postfix) with ESMTP id E93042A5BA;
        Thu, 12 Nov 2020 11:04:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1605175495;
        bh=zh5QbvdJNva57xftuxTRDRu35taAmiCnFAbGwdjoI3w=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=w+bRHiEB8c+JrI7N3NrJc/1vbgvvjClPLLyuIxdXNwKV9awAigH6+so8MjcDu6Yu/
         eCK32KvbiTqAWpM2Jwf7OA231jw7B9fpBjypp9eLyH2hgKYvWli2Dp1PmJSKsmDuWl
         QJatTWDQnBifzlQz8d5WeWJ5T6zbp/dBeQhe9OsM=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
        by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id iZ3H2m4NFtU7; Thu, 12 Nov 2020 11:04:53 +0100 (CET)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter2.mymailcheap.com (Postfix) with ESMTPS;
        Thu, 12 Nov 2020 11:04:53 +0100 (CET)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
        by mail20.mymailcheap.com (Postfix) with ESMTP id 25E4D41DB0;
        Thu, 12 Nov 2020 10:04:51 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="CnpIsC4g";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (unknown [113.52.132.214])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id 4323741E35;
        Thu, 12 Nov 2020 10:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1605175475;
        bh=zh5QbvdJNva57xftuxTRDRu35taAmiCnFAbGwdjoI3w=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=CnpIsC4gsP0Hp6Cij/sd/OYLr/qnt7V/cIn0ow0pjTu0V5nNGLvlOFQqrD9iQMhsX
         ocDfeQuNY925/wRWsQ+QSvn/z2pKvgBjaINGgP6WrRW9nk5LReJucOl0jdhQHzjeo8
         yLI7V6iLLBOsJ751Wg2o4xu89Nvhutl7ved/B7Ck=
Subject: Re: [PATCH] MIPS: Loongson64: Add read_persistent_clock64()
To:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Yinglu Yang <yangyinglu@loongson.cn>
References: <1605169793-10481-1-git-send-email-yangtiezhu@loongson.cn>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <8d6ebfe2-e300-3f38-6316-196cba947d36@flygoat.com>
Date:   Thu, 12 Nov 2020 18:04:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <1605169793-10481-1-git-send-email-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 25E4D41DB0
X-Spamd-Result: default: False [2.90 / 10.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         RECEIVED_SPAMHAUS_XBL(3.00)[113.52.132.214:received];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         ARC_NA(0.00)[];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         R_SPF_SOFTFAIL(0.00)[~all];
         ML_SERVERS(-3.10)[213.133.102.83];
         DKIM_TRACE(0.00)[flygoat.com:+];
         DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
         RCPT_COUNT_SEVEN(0.00)[7];
         DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:24940, ipnet:213.133.96.0/19, country:DE];
         RCVD_COUNT_TWO(0.00)[2];
         MID_RHS_MATCH_FROM(0.00)[];
         HFILTER_HELO_BAREIP(3.00)[213.133.102.83,1]
X-Rspamd-Server: mail20.mymailcheap.com
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Tiezhu,

ÔÚ 2020/11/12 16:29, Tiezhu Yang Ð´µÀ:
> Add read_persistent_clock64() to read the time from the battery backed
> persistent clock. With this patch, we can fix the wrong time issue due
> to the system clock is not consistent with hardware clock after resume
> from sleep state S3 (suspend to RAM), at the same time, the system time
> can be right instead of "Thu Jan 1 08:00:00 CST 1970" without rtc driver.
>
> start_kernel()
>    timekeeping_init()
>      read_persistent_wall_and_boot_offset()
>        read_persistent_clock64()
>
> timekeeping_resume()
>    read_persistent_clock64()
>
> timekeeping_suspend()
>    read_persistent_clock64()

It is highly discoraged to do anything with bridgetype, which isn't 
probed via
devicetree.

Please check if you can deal with that inside RTC framework, or make it as
a part of RTC driver (e.g. set up a callback).

Also you should submit RTC driver at first if you intend to complete 
LS7A support.

Thanks.

- Jiaxun

>
> Signed-off-by: Yinglu Yang <yangyinglu@loongson.cn>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>   arch/mips/include/asm/mach-loongson64/loongson.h | 20 +++++++++++++++++
>   arch/mips/loongson64/time.c                      | 28 +++++++++++++++++++++++-
>   2 files changed, 47 insertions(+), 1 deletion(-)
>
> diff --git a/arch/mips/include/asm/mach-loongson64/loongson.h b/arch/mips/include/asm/mach-loongson64/loongson.h
> index fde1b75..448289e 100644
> --- a/arch/mips/include/asm/mach-loongson64/loongson.h
> +++ b/arch/mips/include/asm/mach-loongson64/loongson.h
> @@ -238,4 +238,24 @@ extern u64 loongson_freqctrl[MAX_PACKAGES];
>   #define LOONGSON_PCIMAP_WIN(WIN, ADDR)	\
>   	((((ADDR)>>26) & LOONGSON_PCIMAP_PCIMAP_LO0) << ((WIN)*6))
>   
> +/* LS7A RTC */
> +#define LS7A_MISC_REG_BASE		0x10080000
> +#define LS7A_RTC_ADDR_OFFSET		0x50100
> +#define LS7A_RTC_SYS_TOYREAD0_OFFSET	0x2c
> +#define LS7A_RTC_SYS_TOYREAD1_OFFSET	0x30
> +#define LS7A_RTC_REG_BASE		(LS7A_MISC_REG_BASE + LS7A_RTC_ADDR_OFFSET)
> +#define LS7A_RTC_SYS_TOYREAD0_ADDR	(LS7A_RTC_REG_BASE + LS7A_RTC_SYS_TOYREAD0_OFFSET)
> +#define LS7A_RTC_SYS_TOYREAD1_ADDR	(LS7A_RTC_REG_BASE + LS7A_RTC_SYS_TOYREAD1_OFFSET)
> +#define LS7A_RTC_TOY_MON_MASK		GENMASK(31, 26)
> +#define LS7A_RTC_TOY_MON_SHIFT		26
> +#define LS7A_RTC_TOY_DAY_MASK		GENMASK(25, 21)
> +#define LS7A_RTC_TOY_DAY_SHIFT		21
> +#define LS7A_RTC_TOY_HOUR_MASK		GENMASK(20, 16)
> +#define LS7A_RTC_TOY_HOUR_SHIFT		16
> +#define LS7A_RTC_TOY_MIN_MASK		GENMASK(15, 10)
> +#define LS7A_RTC_TOY_MIN_SHIFT		10
> +#define LS7A_RTC_TOY_SEC_MASK		GENMASK(9, 4)
> +#define LS7A_RTC_TOY_SEC_SHIFT		4
> +#define LS7A_RTC_YEAR_BASE		1900
> +
>   #endif /* __ASM_MACH_LOONGSON64_LOONGSON_H */
> diff --git a/arch/mips/loongson64/time.c b/arch/mips/loongson64/time.c
> index 91e842b..7f3095546 100644
> --- a/arch/mips/loongson64/time.c
> +++ b/arch/mips/loongson64/time.c
> @@ -9,7 +9,7 @@
>   
>   #include <asm/time.h>
>   #include <asm/hpet.h>
> -
> +#include <asm/mc146818-time.h>
>   #include <loongson.h>
>   
>   void __init plat_time_init(void)
> @@ -21,3 +21,29 @@ void __init plat_time_init(void)
>   	setup_hpet_timer();
>   #endif
>   }
> +
> +static time64_t ls7a_get_rtc_time(void)
> +{
> +	unsigned int year, mon, day, hour, min, sec;
> +	unsigned int value;
> +
> +	value = readl((void __iomem *)TO_UNCAC(LS7A_RTC_SYS_TOYREAD0_ADDR));
> +	sec = (value & LS7A_RTC_TOY_SEC_MASK) >> LS7A_RTC_TOY_SEC_SHIFT;
> +	min = (value & LS7A_RTC_TOY_MIN_MASK) >> LS7A_RTC_TOY_MIN_SHIFT;
> +	hour = (value & LS7A_RTC_TOY_HOUR_MASK) >> LS7A_RTC_TOY_HOUR_SHIFT;
> +	day = (value & LS7A_RTC_TOY_DAY_MASK) >> LS7A_RTC_TOY_DAY_SHIFT;
> +	mon = (value & LS7A_RTC_TOY_MON_MASK) >> LS7A_RTC_TOY_MON_SHIFT;
> +	year = readl((void __iomem *)TO_UNCAC(LS7A_RTC_SYS_TOYREAD1_ADDR));
> +
> +	return mktime64(year + LS7A_RTC_YEAR_BASE, mon, day, hour, min, sec);
> +}
> +
> +void read_persistent_clock64(struct timespec64 *ts)
> +{
> +	if (loongson_sysconf.bridgetype == LS7A)
> +		ts->tv_sec = ls7a_get_rtc_time();
> +	else
> +		ts->tv_sec = mc146818_get_cmos_time();
> +
> +	ts->tv_nsec = 0;
> +}
