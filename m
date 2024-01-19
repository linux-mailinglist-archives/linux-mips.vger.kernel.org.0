Return-Path: <linux-mips+bounces-1014-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A93832C43
	for <lists+linux-mips@lfdr.de>; Fri, 19 Jan 2024 16:24:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADCC91F2449D
	for <lists+linux-mips@lfdr.de>; Fri, 19 Jan 2024 15:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71AE954BD4;
	Fri, 19 Jan 2024 15:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GgVtUwkB"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A306354789
	for <linux-mips@vger.kernel.org>; Fri, 19 Jan 2024 15:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705677838; cv=none; b=LhgC0AKeNYykpi4LiUgLGxEUk2ckCY7mtXmFGgdEZuDNXaQG+kG5MI/tf7dNpUXKvWw3N5cJWJ232JjO9FQR/C5tUETHbwPDo8q40UDXJNRtFNosYsrt1rBJiOi6ILMOCdIhL9X9o1lq0JZNrtA6SSaZs9aa5bwiJ+PK9FS8WA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705677838; c=relaxed/simple;
	bh=Fu2EPOgZIT5XlsgvtcbnPAYbiwafVsq5PEc0CBhlTPE=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=F4MSSZjQMMuZ2kVhOYyBkkIy9Wv4hen3pt/sGGb7iblFqgoYZgWgIAxmjocrZEzMEMq1t8HkUWx0xKA1k4opiQJtdaPfOwxZbrh8QUpula+wRvx8iUY526Yr/823s8Aj1re8XbMezpdlWT/QD2z3L/2H6lP9hMk6Dmj/S4Q9Mvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GgVtUwkB; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-50e80d14404so1729261e87.1
        for <linux-mips@vger.kernel.org>; Fri, 19 Jan 2024 07:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705677834; x=1706282634; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4jIaXQvXMUghrieYLNFk5OtiCsVDnvPF654uBwJbpJ8=;
        b=GgVtUwkBP4QBNLcvmkeZGKnHx2QU0t9L4ifdjqmYBwuc4sccz59eEDDlfwrqx36HmM
         n092z2UrxXfTlQ67hrFiokb3kLQuXBT/5xqG9g9J5edKGgS1p5QNqvox03VHeiczhCx+
         8H4B2Onn2vzQCgvN2enZgSEGuxCZd5+Lr+9Dye9/7ngALVuWbbmORARracdunfZepjOK
         a9C/dw1mK6ayx+9FUuhZRRjdqmRiWPdyrGcFoD4ZLBau+QMQ6E8nAlLSCWhjokearN43
         XlxE16oXyXgMQ3ZbikEhxNo4bz3+279X84Vdikru8MTgRadtyRofHydFk5+/ogTw49z0
         kKPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705677834; x=1706282634;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4jIaXQvXMUghrieYLNFk5OtiCsVDnvPF654uBwJbpJ8=;
        b=qHcZ+NBEOwXQis0C7Jd0uaddCfFMjMuKjk2ySS+1+vXNIPty4XG8AD0t1eenPXRg2C
         fF6wZsH7P2Qg+UUcNREKmoRBaKu2cRP+jzg+4EhlQEyGh2o/GiUEnzvIbZaw7f9x1qxm
         xPCL7GPNXiQHK5FRXz/Zqg7BXV+b1Z1feinaLr8hr9Qlv+Nw+XhMIliZss3DoOCIWf9Y
         LboRQKlPoNa53vVH4gcTKsoSmisINoLoKULoDaWo3Sgkm3jFyeHPANIxNh4Z9IRIrdAK
         XeN72AXPgVqdawesaaHUYQ8741NNPJfsZojn70LdIrIbepzABY5md0WlK/r7XG+DwPbg
         AREg==
X-Gm-Message-State: AOJu0YyhB2Fkx8jDYVtVPlph7n3u107P9b5hLf2vr0e1NK01ASQfIh+f
	Zy6ZMAeKiW46O2k1ATlOaqQeVQ1Ax/TcoerbbiCpiE00cbJygZt8ncOK7wNu
X-Google-Smtp-Source: AGHT+IGhx+S/iW8UWT82WpmyDYiP8bNoAGbanCMIloHerUhJCjVMr6AK/Oe0P3qmHe8gJqZfr8wBUg==
X-Received: by 2002:ac2:5b92:0:b0:50e:7fb1:6433 with SMTP id o18-20020ac25b92000000b0050e7fb16433mr820548lfn.28.1705677834356;
        Fri, 19 Jan 2024 07:23:54 -0800 (PST)
Received: from [192.168.1.105] ([31.173.80.144])
        by smtp.gmail.com with ESMTPSA id o4-20020ac24344000000b0050bfe926aa0sm996232lfl.253.2024.01.19.07.23.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jan 2024 07:23:53 -0800 (PST)
Subject: Re: [PATCH 1/2] MIPS: reserve exception vector space ONLY ONCE
To: Huang Pei <huangpei@loongson.cn>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Bibo Mao <maobibo@loongson.cn>, linux-mips@vger.kernel.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paul Burton <paulburton@kernel.org>,
 Li Xuefeng <lixuefeng@loongson.cn>, Yang Tiezhu <yangtiezhu@loongson.cn>,
 Gao Juxin <gaojuxin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>
References: <ZZ29Wr9yfAcqGxrN@alpha.franken.de>
 <20240119040240.392442-1-huangpei@loongson.cn>
 <20240119040240.392442-2-huangpei@loongson.cn>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <811003c8-6750-f761-e084-10cefd18ccd0@gmail.com>
Date: Fri, 19 Jan 2024 18:23:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240119040240.392442-2-huangpei@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/19/24 7:02 AM, Huang Pei wrote:

> "cpu_probe" is called both by BP and APs, but reserving exception vector
> (like 0x0-0x1000) called by "cpu_probe" need once and calling on BPs is
> too late since memblock is unavailable at that time.
> 
> So, reserve exception vector ONLY by BP.
> 
> Signed-off-by: Huang Pei <huangpei@loongson.cn>
> ---
>  arch/mips/kernel/cpu-probe.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
> index b406d8bfb15a..6939d0de2a03 100644
> --- a/arch/mips/kernel/cpu-probe.c
> +++ b/arch/mips/kernel/cpu-probe.c
> @@ -1581,7 +1581,9 @@ static inline void cpu_probe_broadcom(struct cpuinfo_mips *c, unsigned int cpu)
>  			__cpu_name[cpu] = "Broadcom BMIPS4380";
>  			set_elf_platform(cpu, "bmips4380");
>  			c->options |= MIPS_CPU_RIXI;
> -			reserve_exception_space(0x400, VECTORSPACING * 64);
> +			if (cpu == 0) {

   No need for {} around single statement.

> +				reserve_exception_space(0x400, VECTORSPACING * 64);
> +			}
>  		} else {
>  			c->cputype = CPU_BMIPS4350;
>  			__cpu_name[cpu] = "Broadcom BMIPS4350";
> @@ -1598,7 +1600,9 @@ static inline void cpu_probe_broadcom(struct cpuinfo_mips *c, unsigned int cpu)
>  			__cpu_name[cpu] = "Broadcom BMIPS5000";
>  		set_elf_platform(cpu, "bmips5000");
>  		c->options |= MIPS_CPU_ULRI | MIPS_CPU_RIXI;
> -		reserve_exception_space(0x1000, VECTORSPACING * 64);
> +		if (cpu == 0) {

  Ditto.

> +			reserve_exception_space(0x1000, VECTORSPACING * 64);
> +		}
>  		break;
>  	}
>  }
[...]

MBR, Sergey

