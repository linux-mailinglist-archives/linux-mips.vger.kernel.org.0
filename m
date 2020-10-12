Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9228C28C189
	for <lists+linux-mips@lfdr.de>; Mon, 12 Oct 2020 21:37:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728338AbgJLThQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Oct 2020 15:37:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728031AbgJLThQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 12 Oct 2020 15:37:16 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67C10C0613D0;
        Mon, 12 Oct 2020 12:37:16 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id l85so19846695oih.10;
        Mon, 12 Oct 2020 12:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=p1ZpjVcszStkZDefJuWb6d8WY1mKdaOZZ7wfdZDnMuU=;
        b=CUBfhkmahf1/vpcfm05O+btB7eEmlqL/y7i2iQ8uxWD83Be2xL8h3DKkqqa0HwGW8A
         oBNieCqstY8ccSgpofNNkVyEX2kGO/142yR2C2OwHi2iYjsIrCWu+CjjcfvG+3kCRppL
         8DER93E0gjb24q0iScesSgWXnXa3bPSvujLSNZX/XoJNf1l4csX7PK9gbngTKKUvV5MK
         cFF783eHsOkk4fdrEapOKev3itjRvv88loIITZ1OWLbxLws8PDM4h47ijktnyFzRSkQJ
         hVM94r/SBRQXVZahpGq1tY5nugV60Uft/OX36643mWm9dzQroQLJIIdo12oqfAB2FdbR
         7HaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mime-version:content-disposition:user-agent;
        bh=p1ZpjVcszStkZDefJuWb6d8WY1mKdaOZZ7wfdZDnMuU=;
        b=V6qv2tIvCNRH+T1oSTQnfspvTckKkKfav1PAkqfpVWTc6fBwrA0vFv3z4g3h/gL+J9
         wG2PYVKyJ/SFGJWN0mYVvEeAT4qCsU9hzFKFNzWEfb8W1HcAsyCa4isvOhDt3LrDHyHF
         zWVUKUnAxtE0XEMG5LVXIPI3XY/yp887ZvHnu/8emNT65ENcf3JGkH07dUsrBYG23Fl7
         HzXeiL5BcUvsgmZr4GjZ34RqFqEwgK/7v64iRQS2636cO9LUJ98lbnfBrqvP+sCpyd49
         t0U/Z0DBYkQwcuFu2g/nuRMcfjj43EF3lqef7+DmN5gT7D8yQ+4k1UGZ8j7yL9E5QdKr
         hMrw==
X-Gm-Message-State: AOAM533MnVv+powHdjJ0rl2NrGMiT1SzISXjgJmLXPGrdXGwvHKrRvNi
        Mr20k8pQ7fyspFuUtNTubGcye6rm2TU=
X-Google-Smtp-Source: ABdhPJxjZIwqRckKckwUcDxkbio8Y7OgQyN9/iJrI/OZPPisOpojdiBR0rHIwBvvDFUCLISL0zwhCg==
X-Received: by 2002:aca:1105:: with SMTP id 5mr12050115oir.46.1602531435679;
        Mon, 12 Oct 2020 12:37:15 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p17sm1109284oov.1.2020.10.12.12.37.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Oct 2020 12:37:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 12 Oct 2020 12:37:14 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "Maciej W . Rozycki" <macro@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Zhou Yanjie <zhouyanjie@wanyeetech.com>, od@zcrc.me,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: ingenic: Remove CPU_SUPPORTS_HUGEPAGES
Message-ID: <20201012193714.GA154159@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Oct 12, 2020 at 09:27:39PM +0200, Paul Cercueil wrote:
> While it is true that Ingenic SoCs support huge pages, we cannot use
> them yet as PTEs don't have any single bit that is free. Right now,
> having that symbol only causes build errors, so remove it until the
> situation with PTEs is resolved.
> 
> Fixes: f0f4a753079c ("MIPS: generic: Add support for Ingenic SoCs")
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Tested-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  arch/mips/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index f52fa211a4cf..29bad5bd3e70 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -103,7 +103,6 @@ config MACH_INGENIC
>  	select SYS_SUPPORTS_32BIT_KERNEL
>  	select SYS_SUPPORTS_LITTLE_ENDIAN
>  	select SYS_SUPPORTS_ZBOOT
> -	select CPU_SUPPORTS_HUGEPAGES
>  	select DMA_NONCOHERENT
>  	select IRQ_MIPS_CPU
>  	select PINCTRL
> -- 
> 2.28.0
> 
