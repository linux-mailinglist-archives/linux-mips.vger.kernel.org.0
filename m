Return-Path: <linux-mips+bounces-12812-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 45987D0D8A3
	for <lists+linux-mips@lfdr.de>; Sat, 10 Jan 2026 16:28:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3FD25300AB27
	for <lists+linux-mips@lfdr.de>; Sat, 10 Jan 2026 15:28:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34DC7343D6E;
	Sat, 10 Jan 2026 15:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="EKVwUv40"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AF73451AA
	for <linux-mips@vger.kernel.org>; Sat, 10 Jan 2026 15:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768058917; cv=none; b=VFGukeR2otlmO7IWlqAh0qWTpQT/dycbOOcstuoTz57+f2ulq9l3WFmdfKqVD/JUcGV0eoOR05u2XnbH136bB4mWwBgMC0jU7XIBiYzHKn18olCNu/Fp2S5gZn4uPnddHiKo2MTAMRUIfvv2KTALdBgRGy+5gVw/kp1Ns/V58rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768058917; c=relaxed/simple;
	bh=glHT6b2bqm4sMoS2dYUMfoGDohQHQqnV+2B6wVaPYqU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g1JvsgfaaMyQFOCbkivigN3eETiU6zQNIt9vFZnmCOKSP3YUaQSbYifV8RuL2alihDr1loAPMdbbdcJm68acPxTY7yJGE1O5rEPKEjbDYSFhxa2XIuB1I1ysxmuz5Tb/Lrv6VEkykrBiWQDjQk1l/IMyZRfluY5b1r2V6tB/AZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=EKVwUv40; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42fbc305882so2705481f8f.0
        for <linux-mips@vger.kernel.org>; Sat, 10 Jan 2026 07:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768058914; x=1768663714; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YpYyf1APoTA772gFxnYJ0GWae+lUgyRvjHxcsPbRc/M=;
        b=EKVwUv40C81cwgFURrQ+v7NSe+ica2qTgfrg95RSgCMMwakX5Og3Ilg4gwZ5JtMnjy
         lKnZFSBnJPge0Kdaz22AoJdvmCFBwFKVbHraXDjamLdzLiTuu2MkIKs3IyjBZhk4ftC+
         OTKCY8IerpnwvhzXJydZVoaf/q+mYoPo5NkjRADw8yHsilrFdBs1gcKH4GLPirdHGkNF
         0NoscuXqi3u5666xXXWz7OBNfrrCp5c2RYC8+OtdGBSHdBuVMDKvB/kdCtDpZIWTVDvB
         So+rgh3Mh/ej4WiYJhSRL6nIyJlPYaTYlCuiHg8DKSqJS7VklIkG/J3DQnWy3mPnKI5v
         a0XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768058914; x=1768663714;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YpYyf1APoTA772gFxnYJ0GWae+lUgyRvjHxcsPbRc/M=;
        b=IWhzTgnAVEsmIF4khmmuM3eNqKL7FZc6qccD3oIeCxeik+hVoTqAsBMtXcrinUCDmj
         i90+qeEjl1QpFdoQokak99mdK2kZNb/9o++HVX9gQTgYSfk+pTQ8Uk/4OUJ62RyyVOmY
         Q/RI8/lAuGxyttkC38LCNjgJF3lVguB77+BLSXv2tEYcZm0Lb2Y0oPH7u3MQZxqVbwZJ
         TY/Fdr9QkVbZ1Hac/RativoxE96BJd9TVDcb0Giam0oK90poX3vOMOkF2y9kfuo9aSay
         aSaJAIFM/Aale8+UpeyFaFdNa6zhudHsh5AN1kQ1V8MWbFBRB2IX+P38Qf7siNzOQCdI
         UgQg==
X-Gm-Message-State: AOJu0YyptvjLl4+Ys+NmCzmXUM6DIG4Se7jCDccfZeeYawYyHam09++j
	9rEQSP7wtgpsCu8l7Dvvr8cUm5H/XQmW9oMPd1MbS8Mq35Rn/OkLAc8lsj366UQUs8Q=
X-Gm-Gg: AY/fxX4dKNA8XaJh/WkqiVhnpuSCPIorAQkz213RvXishzgpsqUrmpJYDonrvnliVTt
	GqvWKh7S/YGOjxSL8kWtyMX4HaBrigyHkEo6PSktPLFzhW+Y9SIQmP7u7zcQlZ0EnYIQpdeO608
	g0cBsqMGP/ZxDoQgJLuDaRZeth5EoMNoYtlOB2Wb+c+f0l1l9aWq9fGImnc0kRoPGFPbbACuKFy
	D4eukYusc8FaHJrCW5OJ/3j89LgAAC0IXUldvUEo1xhOxWKGqzkT7iWcC8bcZxe9hXyrv41Ws1s
	6T9H4EyNjXLZCLZHVRRsk7MWC3gJsXRGFmQ2Z8gf/Vb6sQSDd9XEOm/RPY6KrqYwL0M1LtnBiOx
	fyVnGKXEl3QZslohl8pJ22gi2HbUXghCmBLGHfMhRqGrnR5k7WwCvlz1Jx/8xpVn8zZtDb8T/w9
	KczpZJsmLgC84Yb+M1+w==
X-Google-Smtp-Source: AGHT+IEITP8gByjcpRS5ei0+JysAUJuGJqzwKHtFOvRA1fqrvMo/LtlQhe5rjUXg6BMnfA4eNo4d0A==
X-Received: by 2002:a05:6000:4212:b0:430:f718:2388 with SMTP id ffacd0b85a97d-432c36280a4mr12995160f8f.8.1768058913628;
        Sat, 10 Jan 2026 07:28:33 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee5e3sm28155668f8f.35.2026.01.10.07.28.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Jan 2026 07:28:33 -0800 (PST)
Message-ID: <e3f6f4fb-8438-42a3-acd7-57926942117a@tuxon.dev>
Date: Sat, 10 Jan 2026 17:28:32 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/13] MIPS: drop unused pic32.h header
To: Brian Masney <bmasney@redhat.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260109-mips-pic32-header-move-v1-0-99859c55783d@redhat.com>
 <20260109-mips-pic32-header-move-v1-12-99859c55783d@redhat.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260109-mips-pic32-header-move-v1-12-99859c55783d@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Brian,

On 1/9/26 18:41, Brian Masney wrote:
> All users of the MIPS pic32.h asm header have been migrated to
> linux/platform_data/pic32.h, so let's go ahead and drop the unused asm
> variant.
> 
> Signed-off-by: Brian Masney<bmasney@redhat.com>
> 
> ---
> To: Thomas Bogendoerfer<tsbogend@alpha.franken.de>
> Cc:linux-mips@vger.kernel.org
> Cc:linux-kernel@vger.kernel.org
> ---
>   arch/mips/include/asm/mach-pic32/pic32.h | 36 --------------------------------
>   1 file changed, 36 deletions(-)
> 
> diff --git a/arch/mips/include/asm/mach-pic32/pic32.h b/arch/mips/include/asm/mach-pic32/pic32.h
> deleted file mode 100644
> index 53918a671a4c39dba2a22121187cdd73e1935b24..0000000000000000000000000000000000000000
> --- a/arch/mips/include/asm/mach-pic32/pic32.h
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -/*
> - * Joshua Henderson<joshua.henderson@microchip.com>
> - * Copyright (C) 2015 Microchip Technology Inc.  All rights reserved.
> - */
> -#ifndef _ASM_MACH_PIC32_H
> -#define _ASM_MACH_PIC32_H
> -
> -#include <linux/io.h>
> -

There are compilation errors when building pic32mzda_defconfig (see 
below) and I presume those are related to the fact that this include was 
dropped from include/linux/platform_data/pic32.h:

../arch/mips/pic32/common/reset.c: In function 'pic32_machine_restart':
../arch/mips/pic32/common/reset.c:27:17: error: implicit declaration of 
function 'ioremap' [-Wimplicit-function-declaration]
    27 |                 ioremap(PIC32_BASE_RESET + PIC32_RSWRST, 
sizeof(u32));
       |                 ^~~~~~~
../arch/mips/pic32/common/reset.c:27:17: error: initialization of 'void 
*' from 'int' makes pointer from integer without a cast [-Wint-conversion]
../arch/mips/pic32/common/reset.c:32:9: error: implicit declaration of 
function '__raw_writel'; did you mean '_raw_write_lock'? 
[-Wimplicit-function-declaration]
    32 |         __raw_writel(1, reg);
       |         ^~~~~~~~~~~~
       |         _raw_write_lock
   CC      fs/iomap/iter.o
../arch/mips/pic32/common/reset.c:33:15: error: implicit declaration of 
function '__raw_readl'; did you mean '_raw_read_lock'? 
[-Wimplicit-function-declaration]
    33 |         (void)__raw_readl(reg);
       |               ^~~~~~~~~~~
       |               _raw_read_lock
   CC      arch/mips/vdso/vgettimeofday.o
make[6]: *** [../scripts/Makefile.build:287: 
arch/mips/pic32/common/reset.o] Error 1
   CC      arch/mips/pic32/pic32mzda/early_clk.o
In file included from ../arch/mips/pic32/pic32mzda/early_clk.c:6:
../include/linux/platform_data/pic32.h:29:54: error: unknown type name 
'ulong'; did you mean 'long'?
    29 | void pic32_syskey_unlock_debug(const char *fn, const ulong ln);
       |                                                      ^~~~~
       |                                                      long
In file included from ../arch/mips/pic32/pic32mzda/early_clk.c:8:
../arch/mips/pic32/pic32mzda/pic32mzda.h:10:1: error: unknown type name 
'u32'
    10 | u32 pic32_get_pbclk(int bus);
       | ^~~
../arch/mips/pic32/pic32mzda/pic32mzda.h:11:1: error: unknown type name 
'u32'
    11 | u32 pic32_get_sysclk(void);
       | ^~~
../arch/mips/pic32/pic32mzda/pic32mzda.h:14:13: error: expected '=', 
',', ';', 'asm' or '__attribute__' before 'pic32_config_init'
    14 | void __init pic32_config_init(void);
       |             ^~~~~~~~~~~~~~~~~
../arch/mips/pic32/pic32mzda/pic32mzda.h:16:41: error: unknown type name 
'u32'
    16 | int pic32_set_sdhci_adma_fifo_threshold(u32 rthrs, u32 wthrs);
       |                                         ^~~
../arch/mips/pic32/pic32mzda/pic32mzda.h:16:52: error: unknown type name 
'u32'
    16 | int pic32_set_sdhci_adma_fifo_threshold(u32 rthrs, u32 wthrs);
       |                                                    ^~~
../arch/mips/pic32/pic32mzda/pic32mzda.h:17:1: error: unknown type name 
'u32'
    17 | u32 pic32_get_boot_status(void);
       | ^~~
../arch/mips/pic32/pic32mzda/early_clk.c:28:1: error: unknown type name 
'u32'
    28 | u32 pic32_get_sysclk(void)
       | ^~~
../arch/mips/pic32/pic32mzda/early_clk.c: In function 'pic32_get_sysclk':
../arch/mips/pic32/pic32mzda/early_clk.c:30:9: error: unknown type name 
'u32'
    30 |         u32 osc_freq = 0;
       |         ^~~
../arch/mips/pic32/pic32mzda/early_clk.c:31:9: error: unknown type name 
'u32'
    31 |         u32 pllclk;
       |         ^~~
../arch/mips/pic32/pic32mzda/early_clk.c:32:9: error: unknown type name 
'u32'
    32 |         u32 frcdivn;
       |         ^~~
../arch/mips/pic32/pic32mzda/early_clk.c:33:9: error: unknown type name 
'u32'
    33 |         u32 osccon;
       |         ^~~
../arch/mips/pic32/pic32mzda/early_clk.c:34:9: error: unknown type name 
'u32'
    34 |         u32 spllcon;
       |         ^~~
../arch/mips/pic32/pic32mzda/early_clk.c:37:9: error: unknown type name 
'u32'
    37 |         u32 plliclk;
       |         ^~~
../arch/mips/pic32/pic32mzda/early_clk.c:38:9: error: unknown type name 
'u32'
    38 |         u32 pllidiv;
       |         ^~~
../arch/mips/pic32/pic32mzda/early_clk.c:39:9: error: unknown type name 
'u32'
    39 |         u32 pllodiv;
       |         ^~~
../arch/mips/pic32/pic32mzda/early_clk.c:40:9: error: unknown type name 
'u32'
    40 |         u32 pllmult;
       |         ^~~
../arch/mips/pic32/pic32mzda/early_clk.c:41:9: error: unknown type name 
'u32'
    41 |         u32 frcdiv;
       |         ^~~
../arch/mips/pic32/pic32mzda/early_clk.c:43:34: error: implicit 
declaration of function 'ioremap' [-Wimplicit-function-declaration]
    43 |         void __iomem *osc_base = ioremap(PIC32_BASE_OSC, 0x200);
       |                                  ^~~~~~~
../arch/mips/pic32/pic32mzda/early_clk.c:43:34: error: initialization of 
'void *' from 'int' makes pointer from integer without a cast 
[-Wint-conversion]
../arch/mips/pic32/pic32mzda/early_clk.c:45:18: error: implicit 
declaration of function '__raw_readl' [-Wimplicit-function-declaration]
    45 |         osccon = __raw_readl(osc_base + OSCCON);
       |                  ^~~~~~~~~~~
../arch/mips/pic32/pic32mzda/early_clk.c:81:9: error: implicit 
declaration of function 'iounmap' [-Wimplicit-function-declaration]
    81 |         iounmap(osc_base);
       |         ^~~~~~~
../arch/mips/pic32/pic32mzda/early_clk.c: At top level:
../arch/mips/pic32/pic32mzda/early_clk.c:86:1: error: unknown type name 
'u32'
    86 | u32 pic32_get_pbclk(int bus)
       | ^~~
../arch/mips/pic32/pic32mzda/early_clk.c: In function 'pic32_get_pbclk':
../arch/mips/pic32/pic32mzda/early_clk.c:88:9: error: unknown type name 
'u32'
    88 |         u32 clk_freq;
       |         ^~~
../arch/mips/pic32/pic32mzda/early_clk.c:89:34: error: initialization of 
'void *' from 'int' makes pointer from integer without a cast 
[-Wint-conversion]
    89 |         void __iomem *osc_base = ioremap(PIC32_BASE_OSC, 0x200);
       |                                  ^~~~~~~
../arch/mips/pic32/pic32mzda/early_clk.c:90:9: error: unknown type name 
'u32'
    90 |         u32 pbxdiv = PB1DIV + ((bus - 1) * 0x10);
       |         ^~~
../arch/mips/pic32/pic32mzda/early_clk.c:91:9: error: unknown type name 
'u32'
    91 |         u32 pbdiv = (__raw_readl(osc_base + pbxdiv) & PB_MASK) + 1;
       |         ^~~
make[6]: *** [../scripts/Makefile.build:287: 
arch/mips/pic32/pic32mzda/early_clk.o] Error 1


Thank you,
Claudiu

