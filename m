Return-Path: <linux-mips+bounces-3327-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCC18CFFE7
	for <lists+linux-mips@lfdr.de>; Mon, 27 May 2024 14:21:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E6750B23D6A
	for <lists+linux-mips@lfdr.de>; Mon, 27 May 2024 12:21:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1610115DBC7;
	Mon, 27 May 2024 12:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pViCnqJv"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D09015DBCC
	for <linux-mips@vger.kernel.org>; Mon, 27 May 2024 12:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716812420; cv=none; b=Ikgil/2GgYx2nfCvBfm3HIGfvfesvSLO7rc/j03CdUJoZLS0p9LyVGzjqOIb99DYAPxgVBxKO25QnEwJh3K60lP6NNf+bxJOOGYBiXUSVyNNaXoimstMUEaRPk4KRen9F+KCU0Uwf6iXHonDconV7h/yBaOcEulJISUXn+IqSxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716812420; c=relaxed/simple;
	bh=JORPMngvobZc4VwXSAHwmLVdN+mISEnwWhTtVXqckK4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sLXxSeJQO5s4mz8UijhekbpNLGI6lC7n+uUj7UVH79jJAGBhXazjMoRzgyno7IllSut2mNxhjpTBlj18cIitMpAUnHv5aD/1mEUY3tNcAFoonJI0b6I65vISc4UlaD9qSwA7W9CJAX39O1HFtbKz0EjTmABrpcI2LIYTBl40pVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pViCnqJv; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a6267643794so148778366b.2
        for <linux-mips@vger.kernel.org>; Mon, 27 May 2024 05:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716812416; x=1717417216; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rbkau0elypGQ8gua5kPGlwsAuXIezMiLROfFecqvTt8=;
        b=pViCnqJveqcEQVxKNyNKak4DatC41RKolvhagFyZ95vE4Rle9miF3rAU/seN6caNj+
         wpp8/jtYmglx10aBj0u07ceXbNXahyVtxkxAyFNACF1jqrBuPnKsMo2xqOlgVpJ3I7Q8
         TKqn5cOZZRVDkMMv80rNXCgIWe2RYLrODWTRfymVyxZEfXKCOpvr5DQTruI4Y2iCjz91
         XQAgjsurwE7dA/aMAm2ty+0njo8aA0ZDLofJFQnX5/v3m4OAAn/M1GFTpkrpG/21TciS
         +mQ+ZNStO8keQDFzyIM+VZsvj1MLBIBNq0IEC3ggBrpRIrXN9h667s/1Cw8CCw+BtpTt
         7NnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716812416; x=1717417216;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rbkau0elypGQ8gua5kPGlwsAuXIezMiLROfFecqvTt8=;
        b=d/bGN9aY6YVm5vP/cut0lc2DJznyefkHhnjB0PcuWQVnen2jbqT3EKzdBi6OTAGsjl
         QOH5jOH4EiAHAy4XoFx3ZtLoIV6nee3lOzRVI1U+4tGxlao0J3vhciIWMX1amFcTiwpI
         ySaAQgcGP6L6NTdJgmEJxFHOWQwXONy2Qq5+/MCL2FEfk2hdq7j9hzgB5RUVurEuBMoR
         og47qvnxNFdCyLzSofPD4HxZyKblOYy/8sMVym4Z2IERGnPMwU5EtNVSbtVtjWovRRiZ
         4+Cd6zB6heXeWdD7lZAVa9QcklRyTmV08uvxcrX4ZEPvm9e1EFoOE/wfx+i+Ah1nAfYJ
         DNug==
X-Forwarded-Encrypted: i=1; AJvYcCXIeljkZOlQextM+n+qNEIG0O4DQ5IyVY16iyB337F8cC+cwNPyCcHs/KEFWO7ngQe+NM/OZzg4P8pahKbbdi6ujRVdX9mJSd9QlA==
X-Gm-Message-State: AOJu0YyU/Q62HgXk078ktA4QschKm8bjuXZJv+QntNvcllQr9LzGfpRf
	WLqhrAkSVyppcmx0nwGQGwA8Ms2LhAR6mKmwyx+q4VE736n6XNgQ5MMh75i3kOA=
X-Google-Smtp-Source: AGHT+IEmX8jP9vhuFMUdD2fM7U214Wh5sWN4iEtg9z3ZkQrLLr308V35uKjmX8VURGnfvbjCW4ob5w==
X-Received: by 2002:a50:d55b:0:b0:578:631b:3090 with SMTP id 4fb4d7f45d1cf-578631b3ad1mr5848685a12.33.1716812416487;
        Mon, 27 May 2024 05:20:16 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.152.134])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5785233a96esm5738532a12.5.2024.05.27.05.20.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 May 2024 05:20:16 -0700 (PDT)
Message-ID: <8f6d2408-cada-4f03-aa95-31bd234aa47d@linaro.org>
Date: Mon, 27 May 2024 14:20:14 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clocksource: Add node counter timer driver for
 MIPS/Loongson64
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen
 <chenhuacai@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
References: <20240517-loongson_nodecnt-v2-1-5bd0bb20ff5f@flygoat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240517-loongson_nodecnt-v2-1-5bd0bb20ff5f@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jiaxun,

On 17/5/24 19:13, Jiaxun Yang wrote:
> Node counter is a timer presents on many Loongson-3 series CPUs.
> It is maintained on every node in system. To avoid synchronisation
> complexity we only access the copy from first node in system.
> 
> It also has many ways to be accessed, on latest Loongson-3 CPU with
> IOCSR instruction support it should be accessed with a IOCSR request,
> while on earlier Loongson-3 CPUs it is attached to a 32 bits MMIO bus.
> For QEMU's Loongson-3 virt system it is mapped to a 64 bit MMIO location.
> 
> On some rare case the counter is disabled by firmware or not present
> on chip, so we need to perform a lightweight test to ensure it is
> running before actually use it.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> Changes in v2:
> - Fix build failure when it's not enabled.
> - Link to v1: https://lore.kernel.org/r/20240512-loongson_nodecnt-v1-1-2157b92ef8f8@flygoat.com
> ---
>   MAINTAINERS                                      |   1 +
>   arch/mips/include/asm/mach-loongson64/loongson.h |   3 +
>   arch/mips/loongson64/time.c                      |   3 +
>   drivers/clocksource/Kconfig                      |   8 ++
>   drivers/clocksource/loongson-nodecnt.c           | 112 +++++++++++++++++++++++
>   5 files changed, 127 insertions(+)


> diff --git a/drivers/clocksource/loongson-nodecnt.c b/drivers/clocksource/loongson-nodecnt.c
> new file mode 100644
> index 000000000000..3cea4045ce75
> --- /dev/null
> +++ b/drivers/clocksource/loongson-nodecnt.c


> +#define NODECNT_REGBASE		0x3ff00408
> +
> +static void __iomem *nodecnt_reg;
> +static u64 (*nodecnt_read_fn)(void);
> +
> +static u64 notrace nodecnt_read_2x32(void)
> +{
> +	unsigned int hi, hi2, lo;
> +
> +	do {
> +		hi = readl_relaxed(nodecnt_reg + 4);
> +		lo = readl_relaxed(nodecnt_reg);
> +		hi2 = readl_relaxed(nodecnt_reg + 4);
> +	} while (hi2 != hi);
> +
> +	return (((u64) hi) << 32) + lo;
> +}
> +
> +static u64 notrace nodecnt_read_64(void)
> +{
> +	return readq_relaxed(nodecnt_reg);
> +}


> +int __init nodecnt_clocksource_init(void)
> +{
> +	int err;
> +	uint64_t delta;
> +
> +	if (!cpu_clock_freq)
> +		return -ENODEV;
> +
> +	if (cpu_has_csr() && csr_readl(LOONGSON_CSR_FEATURES) & LOONGSON_CSRF_NODECNT) {
> +		nodecnt_read_fn = nodecnt_read_csr;
> +	} else if (loongson_sysconf.bridgetype == VIRTUAL) {
> +		nodecnt_reg = ioremap(NODECNT_REGBASE, 8);
> +		if (!nodecnt_reg)
> +			return -ENOMEM;
> +		nodecnt_read_fn = nodecnt_read_64;
> +	} else {
> +		switch (boot_cpu_data.processor_id & (PRID_IMP_MASK | PRID_REV_MASK)) {
> +		case PRID_IMP_LOONGSON_64C | PRID_REV_LOONGSON3A_R2_0:
> +		case PRID_IMP_LOONGSON_64C | PRID_REV_LOONGSON3A_R2_1:
> +		case PRID_IMP_LOONGSON_64C | PRID_REV_LOONGSON3A_R3_0:
> +		case PRID_IMP_LOONGSON_64C | PRID_REV_LOONGSON3A_R3_1:
> +			break;
> +		default:
> +			return -ENODEV;
> +		}
> +		nodecnt_reg = ioremap(NODECNT_REGBASE, 8);
> +		if (!nodecnt_reg)
> +			return -ENOMEM;
> +		nodecnt_read_fn = nodecnt_read_2x32;
> +	}
> +
> +	/* Test if nodecnt is usable */
> +	delta = nodecnt_read_fn();
> +	udelay(10);
> +	delta = nodecnt_read_fn() - delta;
> +
> +	if (!delta) {
> +		pr_info("nodecnt: clocksource unusable\n");
> +		err = -ENODEV;
> +		goto out;
> +	}
> +
> +	err = clocksource_register_hz(&nodecnt_clocksource, cpu_clock_freq);
> +	if (err) {
> +		pr_err("nodecnt: clocksource register failed\n");
> +		goto out;
> +	}
> +
> +	/* It fits for sched_clock if we don't suffer from cross node access */
> +	if (loongson_sysconf.bridgetype == VIRTUAL || loongson_sysconf.nr_nodes <= 1)
> +		sched_clock_register(nodecnt_read_fn, 64, cpu_clock_freq);

return 0; ? ...

> +
> +out:

... or:

   if (err) ?

> +	if (nodecnt_reg)
> +		iounmap(nodecnt_reg);
> +	return err;
> +}
> 
> ---
> base-commit: 75fa778d74b786a1608d55d655d42b480a6fa8bd
> change-id: 20240512-loongson_nodecnt-0704f76bc959
> 
> Best regards,


