Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2ADEE702
	for <lists+linux-mips@lfdr.de>; Mon, 29 Apr 2019 17:56:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728520AbfD2P4T (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 29 Apr 2019 11:56:19 -0400
Received: from pegase1.c-s.fr ([93.17.236.30]:54573 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728516AbfD2P4S (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 29 Apr 2019 11:56:18 -0400
Received: from localhost (mailhub1-int [192.168.12.234])
        by localhost (Postfix) with ESMTP id 44t8Qg1H7zz9vD3T;
        Mon, 29 Apr 2019 17:56:11 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
        reason="1024-bit key; insecure key"
        header.d=c-s.fr header.i=@c-s.fr header.b=TCJfhTf+; dkim-adsp=pass;
        dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id e4zvibUn7XuO; Mon, 29 Apr 2019 17:56:11 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 44t8Qg01MLz9vD3G;
        Mon, 29 Apr 2019 17:56:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
        t=1556553371; bh=MAsrBDvhnJttPasnsN8gBilzLEIc1tXHx2VDi8YmxeA=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=TCJfhTf+GtIv6E3INZukOMu5Yh2lbbCEwQPfE+Jza9vNBWj1fGcVlvS9y5bh8WQEf
         A7u5vGY3+mSGrzSQnBl5pVv9YKko+vqC2/RZ1Df503Iz9uiAHImnTg5AE5lZEFW3ho
         5D0sxY1tKt7QvFSa0C7DrgwII8Apaq2alR/vHwLs=
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 325D98B8B4;
        Mon, 29 Apr 2019 17:56:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id lnR_i6xj-pyv; Mon, 29 Apr 2019 17:56:16 +0200 (CEST)
Received: from PO15451 (po15451.idsi0.si.c-s.fr [172.25.231.6])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id D48808B8B3;
        Mon, 29 Apr 2019 17:56:15 +0200 (CEST)
Subject: Re: [PATCH 23/41] drivers: tty: serial: cpm_uart: fix styling issues
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
 <1556369542-13247-24-git-send-email-info@metux.net>
From:   Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <df50792f-88bc-379a-d9e1-4f2dc1f4965a@c-s.fr>
Date:   Mon, 29 Apr 2019 17:56:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1556369542-13247-24-git-send-email-info@metux.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le 27/04/2019 à 14:52, Enrico Weigelt, metux IT consult a écrit :
> Fix checkpatch errors:

What the main purpose of this change ?

If we apply this, any fix to stable will be a nightmare to backport. Is 
it really worth it ?

Anyway, a couple of comments in the patch below

[...]

> 
> 
> Signed-off-by: Enrico Weigelt <info@metux.net>
> ---
>   drivers/tty/serial/cpm_uart/cpm_uart.h      | 10 +--
>   drivers/tty/serial/cpm_uart/cpm_uart_core.c | 95 ++++++++++++++++-------------
>   drivers/tty/serial/cpm_uart/cpm_uart_cpm1.h |  4 +-
>   drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c |  6 +-
>   4 files changed, 64 insertions(+), 51 deletions(-)

[...]

> 
> @@ -1048,9 +1058,10 @@ static void cpm_uart_early_write(struct uart_cpm_port *pinfo,
>   static int poll_wait_key(char *obuf, struct uart_cpm_port *pinfo)
>   {
>   	u_char		c, *cp;
> -	volatile cbd_t	*bdp;
>   	int		i;
>   
> +	volatile cbd_t	*bdp;
> +

This was likely a false positive from checkpatch. The formatting was 
good, and now it is wrong as it adds an unnecessary blank line.

>   	/* Get the address of the host memory buffer.
>   	 */
>   	bdp = pinfo->rx_cur;

[...]

> diff --git a/drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c b/drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c
> index a0fccda..154ac19 100644
> --- a/drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c
> +++ b/drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c
> @@ -117,8 +117,7 @@ int cpm_uart_allocbuf(struct uart_cpm_port *pinfo, unsigned int is_con)
>   	if (is_con) {
>   		mem_addr = kzalloc(memsz, GFP_NOWAIT);
>   		dma_addr = virt_to_bus(mem_addr);
> -	}
> -	else
> +	} else
>   		mem_addr = dma_alloc_coherent(pinfo->port.dev, memsz, &dma_addr,
>   					      GFP_KERNEL);

Checkpatch should have told you that in case first leg has braces, 
second leg must have braces too even if it's a single line.

Christophe


>   
> @@ -148,7 +147,8 @@ void cpm_uart_freebuf(struct uart_cpm_port *pinfo)
>   	dma_free_coherent(pinfo->port.dev, L1_CACHE_ALIGN(pinfo->rx_nrfifos *
>   							  pinfo->rx_fifosize) +
>   			  L1_CACHE_ALIGN(pinfo->tx_nrfifos *
> -					 pinfo->tx_fifosize), (void __force *)pinfo->mem_addr,
> +					 pinfo->tx_fifosize),
> +			  (void __force *)pinfo->mem_addr,
>   			  pinfo->dma_addr);
>   
>   	cpm_dpfree(pinfo->dp_addr);
> 
