Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F83010401
	for <lists+linux-mips@lfdr.de>; Wed,  1 May 2019 04:29:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727083AbfEAC3l (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 Apr 2019 22:29:41 -0400
Received: from eddie.linux-mips.org ([148.251.95.138]:50488 "EHLO
        cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726123AbfEAC3l (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 30 Apr 2019 22:29:41 -0400
Received: (from localhost user: 'macro', uid#1010) by eddie.linux-mips.org
        with ESMTP id S23990394AbfEAC3gOuPKs (ORCPT
        <rfc822;sparclinux@vger.kernel.org> + 4 others);
        Wed, 1 May 2019 04:29:36 +0200
Date:   Wed, 1 May 2019 03:29:36 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
cc:     linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        andrew@aj.id.au, andriy.shevchenko@linux.intel.com, vz@mleia.com,
        slemieux.tyco@gmail.com, khilman@baylibre.com, liviu.dudau@arm.com,
        sudeep.holla@arm.com, lorenzo.pieralisi@arm.com,
        "David S. Miller" <davem@davemloft.net>, jacmet@sunsite.dk,
        linux@prisktech.co.nz, matthias.bgg@gmail.com,
        linux-mips@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org
Subject: Re: [PATCH 06/41] drivers: tty: serial: sb1250-duart: use dev_err()
 instead of printk()
In-Reply-To: <1556369542-13247-7-git-send-email-info@metux.net>
Message-ID: <alpine.LFD.2.21.1905010257020.30973@eddie.linux-mips.org>
References: <1556369542-13247-1-git-send-email-info@metux.net> <1556369542-13247-7-git-send-email-info@metux.net>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, 27 Apr 2019, Enrico Weigelt, metux IT consult wrote:

> diff --git a/drivers/tty/serial/sb1250-duart.c b/drivers/tty/serial/sb1250-duart.c
> index 329aced..655961c 100644
> --- a/drivers/tty/serial/sb1250-duart.c
> +++ b/drivers/tty/serial/sb1250-duart.c
> @@ -663,7 +663,6 @@ static void sbd_release_port(struct uart_port *uport)
>  
>  static int sbd_map_port(struct uart_port *uport)
>  {
> -	const char *err = KERN_ERR "sbd: Cannot map MMIO\n";
>  	struct sbd_port *sport = to_sport(uport);
>  	struct sbd_duart *duart = sport->duart;
>  
> @@ -671,7 +670,7 @@ static int sbd_map_port(struct uart_port *uport)
>  		uport->membase = ioremap_nocache(uport->mapbase,
>  						 DUART_CHANREG_SPACING);
>  	if (!uport->membase) {
> -		printk(err);
> +		dev_err(uport->dev, "Cannot map MMIO (base)\n");
>  		return -ENOMEM;
>  	}
>  
> @@ -679,7 +678,7 @@ static int sbd_map_port(struct uart_port *uport)
>  		sport->memctrl = ioremap_nocache(duart->mapctrl,
>  						 DUART_CHANREG_SPACING);
>  	if (!sport->memctrl) {
> -		printk(err);
> +		dev_err(uport->dev, "Cannot map MMIO (ctrl)\n");
>  		iounmap(uport->membase);
>  		uport->membase = NULL;
>  		return -ENOMEM;

 Hmm, what's the point to have separate messages, which consume extra 
memory, for a hardly if at all possible error condition?

  Maciej
