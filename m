Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39D713D8076
	for <lists+linux-mips@lfdr.de>; Tue, 27 Jul 2021 23:05:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232392AbhG0VFJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 27 Jul 2021 17:05:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231368AbhG0VFJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 27 Jul 2021 17:05:09 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F15C5C061757;
        Tue, 27 Jul 2021 14:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=NO0RGVu+XndYKUq3uNCgF+Kta6CYfhtwRahspvD+83o=; b=LHPi7HOMmKXpl/JTivGeHL+Uc/
        gubaL8xVK/zdLXCvONaAPiqG5U2sYv8n1bPlDYE/POrSnQYVhIscyxFVGD6H0COPC/fziMsUFIpy6
        YqheJe1AcA8FtncDzpDzfKvjP5LmVPCsOAJktFaVYBi5pardy6QnQF8Y7A9ucqqfsEYbyX4GC1uM+
        T9oKfls5/9bUIs7HSJJBJ+hQU814fh9DNJMxovTxGoGgsmSCzk8Ia+uUs/7Qn7CUJz3WGCb12FBt4
        9kDgGiiaP45Yr75bFU/HFyCEt7ab0t6jWoolqzcgttG+Odq5YouAKuyPkkgAqtrPdy3SAzhRwFLbJ
        9sc5tW7Q==;
Received: from [2601:1c0:6280:3f0::aefb]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1m8UGA-00GMRO-TV; Tue, 27 Jul 2021 21:05:07 +0000
Subject: Re: [PATCH v4 19/19] auxdisplay: ht16k33: Add LED support
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Robin van der Gracht <robin@protonic.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@ucw.cz>, Marek Behun <marek.behun@nic.cz>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210727140459.3767788-1-geert@linux-m68k.org>
 <20210727140459.3767788-20-geert@linux-m68k.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <5b70f272-eec9-0ff7-1bd2-bf1659b10e9c@infradead.org>
Date:   Tue, 27 Jul 2021 14:05:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210727140459.3767788-20-geert@linux-m68k.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 7/27/21 7:04 AM, Geert Uytterhoeven wrote:
> Instantiate a single LED based on the "led" subnode in DT.
> This allows the user to control display brightness and blinking (backed
> by hardware support) through the LED class API and triggers, and exposes
> the display color.  The LED will be named
> "auxdisplay:<color>:<function>".
> 
> When running in dot-matrix mode and if no "led" subnode is found, the
> driver falls back to the traditional backlight mode, to preserve
> backwards compatibility.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> v4:
>   - Add missing select LEDS_CLASS,
> 
> v3:
>   - Remove unneeded C++ comment,
>   - Use "err" instead of "error" to be consistent with existing driver
>     naming style,
>   - Make the creation of the LED device dependent on the presence of the
>     "led" subnode in DT, so it can be used in dot-matrix mode too.
>   - Use led_init_data() and devm_led_classdev_register_ext() to retrieve
>     all LED properties from DT, instead of manual LED name construction
>     based on just the "color" property,
> 
> v2:
>   - Use "auxdisplay" instead of DRIVER_NAME in LED name.

Hi Geert,

Since LEDS_CLASS depends on NEW_LEDS, does this also need to
select NEW_LEDS?

and similar for INPUT_MATRIXKMAP: it depends on INPUT.

However, selecting (enabling) an entire subsystem is not a
preferable thing to do.

> ---
>  drivers/auxdisplay/Kconfig   |   1 +
>  drivers/auxdisplay/ht16k33.c | 124 ++++++++++++++++++++++++++++++-----
>  2 files changed, 108 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/auxdisplay/Kconfig b/drivers/auxdisplay/Kconfig
> index 42fc7b155de09dbc..7436b9a4edbe5450 100644
> --- a/drivers/auxdisplay/Kconfig
> +++ b/drivers/auxdisplay/Kconfig
> @@ -176,6 +176,7 @@ config HT16K33
>  	select FB_SYS_IMAGEBLIT
>  	select INPUT_MATRIXKMAP
>  	select FB_BACKLIGHT
> +	select LEDS_CLASS
>  	select LINEDISP
>  	help
>  	  Say yes here to add support for Holtek HT16K33, RAM mapping 16*8

thanks.
-- 
~Randy

