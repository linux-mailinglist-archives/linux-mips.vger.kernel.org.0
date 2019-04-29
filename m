Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82418E73D
	for <lists+linux-mips@lfdr.de>; Mon, 29 Apr 2019 18:03:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728520AbfD2QDB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 29 Apr 2019 12:03:01 -0400
Received: from pegase1.c-s.fr ([93.17.236.30]:38632 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728394AbfD2QDB (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 29 Apr 2019 12:03:01 -0400
Received: from localhost (mailhub1-int [192.168.12.234])
        by localhost (Postfix) with ESMTP id 44t8ZP4p0Zz9vD3X;
        Mon, 29 Apr 2019 18:02:53 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
        reason="1024-bit key; insecure key"
        header.d=c-s.fr header.i=@c-s.fr header.b=t/XWwwgi; dkim-adsp=pass;
        dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id rDCK6vg8yFrw; Mon, 29 Apr 2019 18:02:53 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 44t8ZP3Xg2z9vD3V;
        Mon, 29 Apr 2019 18:02:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
        t=1556553773; bh=rcIaV+qc0a8fdgHPWG+m+q/P408Q7NZbpDrRgA8ibzQ=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=t/XWwwgiGGqb4fakwrx+64OJYiFmBqOtxxKKg57IrO65WVTL2+3oxzYQlAOb07xCN
         hpbOzwzvRRN8iDlKe0D/LoYalhYWGTFpN2A7XfiJ+NZRewX5LsG70Dxwza+yb4Dq3p
         808JBPA7xndmvAbkD9TLLUUvyTOqQmYhUgZj+G4E=
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id AD3468B8B4;
        Mon, 29 Apr 2019 18:02:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id 7KbpjHDpfWiZ; Mon, 29 Apr 2019 18:02:58 +0200 (CEST)
Received: from PO15451 (po15451.idsi0.si.c-s.fr [172.25.231.6])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 636AD8B8B3;
        Mon, 29 Apr 2019 18:02:58 +0200 (CEST)
Subject: Re: [PATCH 21/41] drivers: tty: serial: cpm_uart: fix includes
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>,
        linux-kernel@vger.kernel.org
Cc:     lorenzo.pieralisi@arm.com, linux-ia64@vger.kernel.org,
        linux-serial@vger.kernel.org, andrew@aj.id.au,
        gregkh@linuxfoundation.org, sudeep.holla@arm.com,
        liviu.dudau@arm.com, linux-mips@vger.kernel.org, vz@mleia.com,
        linux@prisktech.co.nz, sparclinux@vger.kernel.org,
        khilman@baylibre.com, macro@linux-mips.org,
        slemieux.tyco@gmail.com, matthias.bgg@gmail.com, jacmet@sunsite.dk,
        linux-amlogic@lists.infradead.org,
        andriy.shevchenko@linux.intel.com, linuxppc-dev@lists.ozlabs.org,
        davem@davemloft.net
References: <1556369542-13247-1-git-send-email-info@metux.net>
 <1556369542-13247-22-git-send-email-info@metux.net>
From:   Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <da473f1b-d6a5-f82a-5af3-d4dfaaabf947@c-s.fr>
Date:   Mon, 29 Apr 2019 18:02:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1556369542-13247-22-git-send-email-info@metux.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le 27/04/2019 à 14:52, Enrico Weigelt, metux IT consult a écrit :
> Fixing checkpatch warning:
> 
>      WARNING: Use #include <linux/io.h> instead of <asm/io.h>
>      #25: FILE: drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c:25:
>      +#include <asm/io.h>
> 
>      WARNING: Use #include <linux/io.h> instead of <asm/io.h>
>      +#include <asm/io.h>
> 
>      WARNING: Use #include <linux/delay.h> instead of <asm/delay.h>
>      +#include <asm/delay.h>
> 
> Signed-off-by: Enrico Weigelt <info@metux.net>

Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>

> ---
>   drivers/tty/serial/cpm_uart/cpm_uart_core.c | 4 ++--
>   drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/tty/serial/cpm_uart/cpm_uart_core.c b/drivers/tty/serial/cpm_uart/cpm_uart_core.c
> index 374b8bb..c831d31 100644
> --- a/drivers/tty/serial/cpm_uart/cpm_uart_core.c
> +++ b/drivers/tty/serial/cpm_uart/cpm_uart_core.c
> @@ -33,10 +33,10 @@
>   #include <linux/gpio.h>
>   #include <linux/of_gpio.h>
>   #include <linux/clk.h>
> +#include <linux/io.h>
> +#include <linux/delay.h>
>   
> -#include <asm/io.h>
>   #include <asm/irq.h>
> -#include <asm/delay.h>
>   #include <asm/fs_pd.h>
>   #include <asm/udbg.h>
>   
> diff --git a/drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c b/drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c
> index ef1ae08..40cfcf4 100644
> --- a/drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c
> +++ b/drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c
> @@ -21,8 +21,8 @@
>   #include <linux/device.h>
>   #include <linux/memblock.h>
>   #include <linux/dma-mapping.h>
> +#include <linux/io.h>
>   
> -#include <asm/io.h>
>   #include <asm/irq.h>
>   #include <asm/fs_pd.h>
>   #include <asm/prom.h>
> 
