Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF0B638239F
	for <lists+linux-mips@lfdr.de>; Mon, 17 May 2021 07:06:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233718AbhEQFHx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 17 May 2021 01:07:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229625AbhEQFHx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 17 May 2021 01:07:53 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D617FC061573;
        Sun, 16 May 2021 22:06:36 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id 197so4621840qkl.12;
        Sun, 16 May 2021 22:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wxTIt7EaGmZ3uYc414FQHUbL2Bjw3DIpD8O0/yF7DaU=;
        b=rYuD1hewJ/zYRU5JJnDd6QOqRY7sg7eH7DWYZ8s63aXJoi0ob+j9xF55vqqL+xxoqS
         wgbcUzvoh+WlQka+7v/dz8ABizUlSooIsIBham1xXCGhPdvb0L8ftAFxA1cxFepES0Hk
         YoWevMMF3or45Eyo9DVx5oGOWc2rQLNmjWS8fyXlf8e7l6tP6ZYkpAPDeqI4j28JsYfv
         nqqK+p8ahVzwvr5Q79bIfb2jzyqXXdZFONEMxmuc8B7TlGuXrLS6dPT8dtCTyjKGHaxj
         pR8gLNE6RvDSGJ1quTog6Dkur5kWMusKYhhuMyPNAWo7jP+g1sncOvbygwzscAc8L9Vv
         zB1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wxTIt7EaGmZ3uYc414FQHUbL2Bjw3DIpD8O0/yF7DaU=;
        b=ex2GXIbAOeIRS+LBuJIkxWBWVsCrSm0vhsibvsVSSwotp8iOicyVQDE6rZKhDIsBQD
         GWmtEsjtxCEdOGS+BWOMg0LgEjv0DBxo/lwdSFjOlKO1raZysziUEinRO1nrqES1URXD
         1FV7LVpsGdYfXIb2azPfDAhN1jfBPl8DibOTuWTUoATwAAyGjUHS0/EpWOkfwtzA+vrL
         A4TSGxUUvYbEFxc/Mcb/awcKzxXNBAggWFDu5Unh77qpSIBtG2kCBxc/Ooh0xlmAH0OD
         FnwLRarM7+6BhGwGMv3GZdBi+RgDLeJ2lxM2oDSGqdtBblp3VFHiiOj41O8CN5JL3QcM
         rQRA==
X-Gm-Message-State: AOAM532CJIAOtlOLXgA200ZW/0+M0BIb+Z8VB2DInPZrpzXa+OjystK1
        P8bxUZLR5XqhQ+tAgY05EuYTbSbrY9c=
X-Google-Smtp-Source: ABdhPJxqAKpQ/12HG5V/L8qp2fiDPCYnNZ3OZjdNNHjPpP0L/d5nDAxQofswv/XvnUvE/NDhrjaO3A==
X-Received: by 2002:a37:6554:: with SMTP id z81mr55966052qkb.472.1621227994344;
        Sun, 16 May 2021 22:06:34 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f1sm9623000qkl.93.2021.05.16.22.06.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 May 2021 22:06:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc:     Wim Van Sebroeck <wim@iguana.be>, John Crispin <john@phrozen.org>,
        linux-mips@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20210517005417.18338-1-rdunlap@infradead.org>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] MIPS: ralink: export rt_sysc_membase for rt2880_wdt.c
Message-ID: <e56fa6d9-1305-b3c5-d385-37042835686c@roeck-us.net>
Date:   Sun, 16 May 2021 22:06:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517005417.18338-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 5/16/21 5:54 PM, Randy Dunlap wrote:
> rt2880_wdt.c uses (well, attempts to use) rt_sysc_membase. However,
> when this watchdog driver is built as a loadable module, there is a
> build error since the rt_sysc_membase symbol is not exported.
> Export it to quell the build error.
> 
> ERROR: modpost: "rt_sysc_membase" [drivers/watchdog/rt2880_wdt.ko] undefined!
> 
> Fixes: 473cf939ff34 ("watchdog: add ralink watchdog driver")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Wim Van Sebroeck <wim@iguana.be>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> Cc: John Crispin <john@phrozen.org>
> Cc: linux-mips@vger.kernel.org
> Cc: linux-watchdog@vger.kernel.org
> ---
> or make the Kconfig symbol RALINK_WDT bool instead of tristate?
> 

You'd have to change several other config symbols to boolean as well.

Example with PHY_MT7621_PCI=m:

ERROR: modpost: "rt_sysc_membase" [drivers/phy/ralink/phy-mt7621-pci.ko] undefined!
make[1]: *** [scripts/Makefile.modpost:150: modules-only.symvers] Error 1

Same with MT7621_WDT=m.

ERROR: modpost: "rt_sysc_membase" [drivers/watchdog/mt7621_wdt.ko] undefined!

At that point I stopped looking.

Guenter

>   arch/mips/ralink/of.c |    2 ++
>   1 file changed, 2 insertions(+)
> 
> --- linux-next-20210514.orig/arch/mips/ralink/of.c
> +++ linux-next-20210514/arch/mips/ralink/of.c
> @@ -8,6 +8,7 @@
>   
>   #include <linux/io.h>
>   #include <linux/clk.h>
> +#include <linux/export.h>
>   #include <linux/init.h>
>   #include <linux/sizes.h>
>   #include <linux/of_fdt.h>
> @@ -25,6 +26,7 @@
>   
>   __iomem void *rt_sysc_membase;
>   __iomem void *rt_memc_membase;
> +EXPORT_SYMBOL_GPL(rt_sysc_membase);
>   
>   __iomem void *plat_of_remap_node(const char *node)
>   {
> 

