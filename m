Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D0853825D5
	for <lists+linux-mips@lfdr.de>; Mon, 17 May 2021 09:50:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231585AbhEQHvu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 17 May 2021 03:51:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229755AbhEQHvq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 17 May 2021 03:51:46 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6558C061573;
        Mon, 17 May 2021 00:50:29 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id q7-20020a9d57870000b02902a5c2bd8c17so4813234oth.5;
        Mon, 17 May 2021 00:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vT6tVfgVQYax85ltv/yac9IUk/uA4vEprh4TNBKtlVo=;
        b=oEJ+FkzCAYVGNQuUH4qv+SoSmQPSANTJf31/FDy0Tb/92Bkg68SJQLBekz+JLd1ptU
         iGM9CKiH6/1gStpkopD39bEMw3X29dDPRQ0lYxa1BVpl4fXvCc8BKM9bC1DImzt2MbMx
         IzBCRq7CaNqntGWV4NNPoPPs2DmreKlrFcuZjE2vTaBr00gJDgcPbf7SCa+9vT5dExfU
         Nhsvm1SPzWFGUFvBcF9B3YGDQZc7vAHyX4RX/tH5jsaBj5osntfjhXUbqq6mML6szy00
         xGYXwxEGh7hQ9R/UdOHEEkFqWgYbutRS078EH9uRdo2fb88NT6Q1ca+JTMiefNOFFzFm
         FtVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vT6tVfgVQYax85ltv/yac9IUk/uA4vEprh4TNBKtlVo=;
        b=mZ9EGLSPugxA0MLuu48GXzbjkaBghYRxq7WlLjdlty4ow50dVLOjYkSdp0NPy8Ajek
         UW82o91srAPWk5eFu6eYUYAg6zcAhFQQeEekyNtlPhbohd+ACOqBgyVBe4RpSwJuCYJY
         ZRqsnBYM8quOf7r74lRmah13DM69xrnEZMIlL/KjsC0jMPTbI4RLPK5sXGVvGVRtIhh8
         Wq9QNNBM1kYjY2dzNe8ElVhplODGQJSD1JUZ+J8oA5j1PoFuSuCTP53M33kNcnUg4WuT
         4S0j9psN+WsoFt//ljyTNnIg5j22pufaN1bPM6+LRP2UOtTCXTmqU+78iH6BfnsCr5le
         KdoA==
X-Gm-Message-State: AOAM5313pYZ7qMr9MwZyKN0vRmcIEuE2+Icvkrw+lX76ntDW9wvbioJV
        xLkI8cyLhUXRRLSk0nm2Yn3axS7+LzJS6pYwD9U=
X-Google-Smtp-Source: ABdhPJwApu7Ibyl11BxwMoiIUtxGt5Yho6kiWDwGr7lzrzX6b81rl//LyrMsBGiUzKt9kYgrfNbvY2UZA3B7OTcrwAY=
X-Received: by 2002:a05:6830:1510:: with SMTP id k16mr35262204otp.290.1621237829236;
 Mon, 17 May 2021 00:50:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210517000108.26015-1-rdunlap@infradead.org>
In-Reply-To: <20210517000108.26015-1-rdunlap@infradead.org>
From:   Manuel Lauss <manuel.lauss@gmail.com>
Date:   Mon, 17 May 2021 09:49:53 +0200
Message-ID: <CAOLZvyEyayWctr4uv4MUaUknZ7FVhtCcG7ErjRuYBdez7zJuLA@mail.gmail.com>
Subject: Re: [PATCH] MIPS: alchemy: xxs1500: add gpio-au1000.h header file
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Linux-MIPS <linux-mips@vger.kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

On Mon, May 17, 2021 at 2:01 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> board-xxs1500.c references 2 functions without declaring them, so add
> the header file to placate the build.
>
> ../arch/mips/alchemy/board-xxs1500.c: In function 'board_setup':
> ../arch/mips/alchemy/board-xxs1500.c:56:2: error: implicit declaration of function 'alchemy_gpio1_input_enable' [-Werror=implicit-function-declaration]
>    56 |  alchemy_gpio1_input_enable();
> ../arch/mips/alchemy/board-xxs1500.c:57:2: error: implicit declaration of function 'alchemy_gpio2_enable'; did you mean 'alchemy_uart_enable'? [-Werror=implicit-function-declaration]
>    57 |  alchemy_gpio2_enable();
>
> Fixes: 8e026910fcd4 ("MIPS: Alchemy: merge GPR/MTX-1/XXS1500 board code into single files")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: linux-mips@vger.kernel.org
> Cc: Manuel Lauss <manuel.lauss@googlemail.com>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> ---
>  arch/mips/alchemy/board-xxs1500.c |    1 +
>  1 file changed, 1 insertion(+)
>
> --- linux-next-20210514.orig/arch/mips/alchemy/board-xxs1500.c
> +++ linux-next-20210514/arch/mips/alchemy/board-xxs1500.c
> @@ -18,6 +18,7 @@
>  #include <asm/reboot.h>
>  #include <asm/setup.h>
>  #include <asm/mach-au1x00/au1000.h>
> +#include <asm/mach-au1x00/gpio-au1000.h>

Acked-by: Manuel Lauss <manuel.lauss@gmail.com>

Thank you!
     Manuel
