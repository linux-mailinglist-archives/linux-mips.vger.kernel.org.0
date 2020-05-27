Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3FB61E519E
	for <lists+linux-mips@lfdr.de>; Thu, 28 May 2020 01:10:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725446AbgE0XK6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 May 2020 19:10:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725385AbgE0XK5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 27 May 2020 19:10:57 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC85DC08C5C1;
        Wed, 27 May 2020 16:10:57 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id p30so12496931pgl.11;
        Wed, 27 May 2020 16:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zMtt35pLxQhH0e+3rMcgNfVed4VL//myZjMB/4FBxzY=;
        b=Z5LlxT1jqpw+r272ovO77dIojvS1RWSWxniR6y0Ub96AvfQfySl3UFbrTXrNCakmE5
         7RnFaV8VNBC3Q20S+cbWqyOb7xcdHYPXuo+Gv2lJk17JlFSMUQlbDcHEF0c6eRz5Or6s
         cD/CCnsVwZ7TQhmeC8iuuZS4o0I4yfgqMLC/qVyAtpFvnIa7EXQURKVDTy4MgTnMX2N3
         1it58fas3bKAQihsE88bJQ0L+PnLrhNiqI9eDQrhD4bHNCbGuselusnov9FjFI/1hLG2
         fj7I3/o9hZqDd1LLYZtW35SqFphqX7jGg77Bcc3RelLW13GjyNJ+/MKYkhmZaikzMBIz
         a41w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=zMtt35pLxQhH0e+3rMcgNfVed4VL//myZjMB/4FBxzY=;
        b=nxpx8yjCosAjWaQYfqdxBu5aSx5HWvHpB4h2lWmIeBGdAVnnbpk8pEJJNU7pAQ1jTz
         3n+6Elbfh/anO6lUoHz/zJd+9Up6heISe4sBoiifq+kQMDalXHGYHas744JmbQGVMOLN
         YtE/9OEJ6vUqANkRI+YLk37owTDgml35MPsX0T8YxmugXrioRbuhLEUS7xJEoO1AaBqb
         v1vfmlzGtm4TQKH7H3K6hRGuLlbwlF98AKpiXsXTHzze3G1cQ+uCkCHmKPF3pJlGSi7a
         U8Uhowv0TKojotT/tJTzImKTvkTVMez37hci4OeAfzYngCzpNb9M951JUfchvEbvFqnn
         2aYw==
X-Gm-Message-State: AOAM532v0e45IBTuuBm6l9jamY/VcsgIElg0awrT/mD3hMNLav8y5iIO
        zy6D8uoYgVKXn1g4ijkxtqa7zhr0
X-Google-Smtp-Source: ABdhPJwG9RMYihgfoi/QUWvfwRWcNyRLqC96sXgXJroOTt7Pn1fNWepb6zJD+RztqNnMeayg/og4Rw==
X-Received: by 2002:a62:1512:: with SMTP id 18mr91386pfv.326.1590621057274;
        Wed, 27 May 2020 16:10:57 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u73sm3076205pfc.0.2020.05.27.16.10.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 May 2020 16:10:56 -0700 (PDT)
Date:   Wed, 27 May 2020 16:10:55 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH] MIPS: DTS: Only build subdir of current platform
Message-ID: <20200527231055.GA141265@roeck-us.net>
References: <1590027306-2137-1-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1590027306-2137-1-git-send-email-yangtiezhu@loongson.cn>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, May 21, 2020 at 10:15:06AM +0800, Tiezhu Yang wrote:
> Add config check in Makefile to only build the subdir of current platform.
> 
> E.g. without this patch:
> 
>   AR      arch/mips/built-in.a
>   AR      arch/mips/boot/dts/brcm/built-in.a
>   AR      arch/mips/boot/dts/cavium-octeon/built-in.a
>   AR      arch/mips/boot/dts/img/built-in.a
>   AR      arch/mips/boot/dts/ingenic/built-in.a
>   AR      arch/mips/boot/dts/lantiq/built-in.a
>   DTC     arch/mips/boot/dts/loongson/loongson3_4core_rs780e.dtb
>   DTB     arch/mips/boot/dts/loongson/loongson3_4core_rs780e.dtb.S
>   AS      arch/mips/boot/dts/loongson/loongson3_4core_rs780e.dtb.o
>   DTC     arch/mips/boot/dts/loongson/loongson3_8core_rs780e.dtb
>   DTB     arch/mips/boot/dts/loongson/loongson3_8core_rs780e.dtb.S
>   AS      arch/mips/boot/dts/loongson/loongson3_8core_rs780e.dtb.o
>   AR      arch/mips/boot/dts/loongson/built-in.a
>   AR      arch/mips/boot/dts/mscc/built-in.a
>   AR      arch/mips/boot/dts/mti/built-in.a
>   AR      arch/mips/boot/dts/netlogic/built-in.a
>   AR      arch/mips/boot/dts/ni/built-in.a
>   AR      arch/mips/boot/dts/pic32/built-in.a
>   AR      arch/mips/boot/dts/qca/built-in.a
>   AR      arch/mips/boot/dts/ralink/built-in.a
>   AR      arch/mips/boot/dts/xilfpga/built-in.a
>   AR      arch/mips/boot/dts/built-in.a
> 
> With this patch:
> 
>   AR      arch/mips/built-in.a
>   DTC     arch/mips/boot/dts/loongson/loongson3_4core_rs780e.dtb
>   DTB     arch/mips/boot/dts/loongson/loongson3_4core_rs780e.dtb.S
>   AS      arch/mips/boot/dts/loongson/loongson3_4core_rs780e.dtb.o
>   DTC     arch/mips/boot/dts/loongson/loongson3_8core_rs780e.dtb
>   DTB     arch/mips/boot/dts/loongson/loongson3_8core_rs780e.dtb.S
>   AS      arch/mips/boot/dts/loongson/loongson3_8core_rs780e.dtb.o
>   AR      arch/mips/boot/dts/loongson/built-in.a
>   AR      arch/mips/boot/dts/built-in.a
> 
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>

With this patch applied, boston.dtb is no longer built with
64r6el_defconfig, even though 64r6el_defconfig enables
CONFIG_FIT_IMAGE_FDT_BOSTON=y. This is because the img
subdirectory is now only included if CONFIG_MACH_PISTACHIO=y,
but that is not the case with 64r6el_defconfig.

Please revisit.

Guenter

> ---
>  arch/mips/boot/dts/Makefile | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/mips/boot/dts/Makefile b/arch/mips/boot/dts/Makefile
> index d429a69..dce32d1 100644
> --- a/arch/mips/boot/dts/Makefile
> +++ b/arch/mips/boot/dts/Makefile
> @@ -1,17 +1,17 @@
>  # SPDX-License-Identifier: GPL-2.0
> -subdir-y	+= brcm
> -subdir-y	+= cavium-octeon
> -subdir-y	+= img
> -subdir-y	+= ingenic
> -subdir-y	+= lantiq
> -subdir-y	+= loongson
> -subdir-y	+= mscc
> -subdir-y	+= mti
> -subdir-y	+= netlogic
> -subdir-y	+= ni
> -subdir-y	+= pic32
> -subdir-y	+= qca
> -subdir-y	+= ralink
> -subdir-y	+= xilfpga
> +subdir-$(CONFIG_BMIPS_GENERIC)		+= brcm
> +subdir-$(CONFIG_CAVIUM_OCTEON_SOC)	+= cavium-octeon
> +subdir-$(CONFIG_MACH_PISTACHIO)		+= img
> +subdir-$(CONFIG_MACH_INGENIC)		+= ingenic
> +subdir-$(CONFIG_LANTIQ)			+= lantiq
> +subdir-$(CONFIG_MACH_LOONGSON64)	+= loongson
> +subdir-$(CONFIG_MSCC_OCELOT)		+= mscc
> +subdir-$(CONFIG_MIPS_MALTA)		+= mti
> +subdir-$(CONFIG_NLM_XLP_BOARD)		+= netlogic
> +subdir-$(CONFIG_FIT_IMAGE_FDT_NI169445)	+= ni
> +subdir-$(CONFIG_MACH_PIC32)		+= pic32
> +subdir-$(CONFIG_ATH79)			+= qca
> +subdir-$(CONFIG_RALINK)			+= ralink
> +subdir-$(CONFIG_FIT_IMAGE_FDT_XILFPGA)	+= xilfpga
>  
>  obj-$(CONFIG_BUILTIN_DTB)	:= $(addsuffix /, $(subdir-y))
> -- 
> 2.1.0
> 
