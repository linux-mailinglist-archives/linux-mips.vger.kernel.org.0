Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 352E8E733
	for <lists+linux-mips@lfdr.de>; Mon, 29 Apr 2019 18:02:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728493AbfD2QCe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 29 Apr 2019 12:02:34 -0400
Received: from pegase1.c-s.fr ([93.17.236.30]:37078 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728394AbfD2QCe (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 29 Apr 2019 12:02:34 -0400
Received: from localhost (mailhub1-int [192.168.12.234])
        by localhost (Postfix) with ESMTP id 44t8Yt4z6qz9vD3W;
        Mon, 29 Apr 2019 18:02:26 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
        reason="1024-bit key; insecure key"
        header.d=c-s.fr header.i=@c-s.fr header.b=uA79P5zs; dkim-adsp=pass;
        dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id 905VH79wAdJv; Mon, 29 Apr 2019 18:02:26 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 44t8Yt3dNTz9vD3V;
        Mon, 29 Apr 2019 18:02:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
        t=1556553746; bh=T0R91daQOtdOH7tKHhta8172OsZU9Bi8+jnmZywXEP8=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=uA79P5zsw1WI5+2UmqF/21J7JNMj2aTsFgEYwRWbLSvnD+grpuVIyZHrgXaVpyhcL
         5OuXLLnWaQiLIrvMYMpZTidvoJKAnUXNE/2CCFZ1E4i5VW6A3dVsnieAZe3TLrthWI
         rZo1nFN72tAyWEa1qaDx8FOzxVLD2uSTAzKJ8kkY=
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id AE6868B8B4;
        Mon, 29 Apr 2019 18:02:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id DgkTUp-_afaR; Mon, 29 Apr 2019 18:02:31 +0200 (CEST)
Received: from PO15451 (po15451.idsi0.si.c-s.fr [172.25.231.6])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 021048B8B3;
        Mon, 29 Apr 2019 18:02:30 +0200 (CEST)
Subject: Re: [PATCH 20/41] drivers: tty: serial: cpm_uart: use
 dev_err()/dev_warn() instead of printk()
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
 <1556369542-13247-21-git-send-email-info@metux.net>
From:   Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <7509c580-e7c6-7d22-b6a2-8356264f408e@c-s.fr>
Date:   Mon, 29 Apr 2019 18:02:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1556369542-13247-21-git-send-email-info@metux.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le 27/04/2019 à 14:52, Enrico Weigelt, metux IT consult a écrit :
> Using dev_err()/dev_warn() instead of printk() for more consistent output.
> (prints device name, etc).
> 
> Signed-off-by: Enrico Weigelt <info@metux.net>

Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>

> ---
>   drivers/tty/serial/cpm_uart/cpm_uart_core.c | 6 +++---
>   drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/tty/serial/cpm_uart/cpm_uart_core.c b/drivers/tty/serial/cpm_uart/cpm_uart_core.c
> index b929c7a..374b8bb 100644
> --- a/drivers/tty/serial/cpm_uart/cpm_uart_core.c
> +++ b/drivers/tty/serial/cpm_uart/cpm_uart_core.c
> @@ -265,7 +265,7 @@ static void cpm_uart_int_rx(struct uart_port *port)
>   		 * later, which will be the next rx-interrupt or a timeout
>   		 */
>   		if (tty_buffer_request_room(tport, i) < i) {
> -			printk(KERN_WARNING "No room in flip buffer\n");
> +			dev_warn(port->dev, "No room in flip buffer\n");
>   			return;
>   		}
>   
> @@ -1155,7 +1155,7 @@ static int cpm_uart_init_port(struct device_node *np,
>   	if (!pinfo->clk) {
>   		data = of_get_property(np, "fsl,cpm-brg", &len);
>   		if (!data || len != 4) {
> -			printk(KERN_ERR "CPM UART %pOFn has no/invalid "
> +			dev_err(port->dev, "CPM UART %pOFn has no/invalid "
>   			                "fsl,cpm-brg property.\n", np);
>   			return -EINVAL;
>   		}
> @@ -1164,7 +1164,7 @@ static int cpm_uart_init_port(struct device_node *np,
>   
>   	data = of_get_property(np, "fsl,cpm-command", &len);
>   	if (!data || len != 4) {
> -		printk(KERN_ERR "CPM UART %pOFn has no/invalid "
> +		dev_err(port->dev, "CPM UART %pOFn has no/invalid "
>   		                "fsl,cpm-command property.\n", np);
>   		return -EINVAL;
>   	}
> diff --git a/drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c b/drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c
> index 6a1cd03..ef1ae08 100644
> --- a/drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c
> +++ b/drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c
> @@ -67,7 +67,7 @@ void __iomem *cpm_uart_map_pram(struct uart_cpm_port *port,
>   		return pram;
>   
>   	if (len != 2) {
> -		printk(KERN_WARNING "cpm_uart[%d]: device tree references "
> +		dev_warn(port->dev, "cpm_uart[%d]: device tree references "
>   			"SMC pram, using boot loader/wrapper pram mapping. "
>   			"Please fix your device tree to reference the pram "
>   			"base register instead.\n",
> 
