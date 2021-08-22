Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9BD63F3F06
	for <lists+linux-mips@lfdr.de>; Sun, 22 Aug 2021 13:16:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233328AbhHVLRX convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Sun, 22 Aug 2021 07:17:23 -0400
Received: from aposti.net ([89.234.176.197]:45274 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232822AbhHVLRX (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 22 Aug 2021 07:17:23 -0400
Date:   Sun, 22 Aug 2021 12:16:29 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 1/3] serial: 8250_ingenic: Use of_device_get_match_data
To:     Tang Bin <tangbin@cmss.chinamobile.com>
Cc:     gregkh@linuxfoundation.org, jirislaby@kernel.org,
        ldewangan@nvidia.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, linux@prisktech.co.nz,
        linux-mips@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Zhang Shengju <zhangshengju@cmss.chinamobile.com>
Message-Id: <HBN8YQ.GODLCGECPCT01@crapouillou.net>
In-Reply-To: <20210822032806.3256-2-tangbin@cmss.chinamobile.com>
References: <20210822032806.3256-1-tangbin@cmss.chinamobile.com>
        <20210822032806.3256-2-tangbin@cmss.chinamobile.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

Le dim., août 22 2021 at 11:28:04 +0800, Tang Bin 
<tangbin@cmss.chinamobile.com> a écrit :
> Retrieve OF match data, it's better and cleaner to use
> 'of_device_get_match_data' over 'of_match_device'.
> 
> Signed-off-by: Zhang Shengju <zhangshengju@cmss.chinamobile.com>
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>

Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
>  drivers/tty/serial/8250/8250_ingenic.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/tty/serial/8250/8250_ingenic.c 
> b/drivers/tty/serial/8250/8250_ingenic.c
> index 988bf6bcc..65402d05e 100644
> --- a/drivers/tty/serial/8250/8250_ingenic.c
> +++ b/drivers/tty/serial/8250/8250_ingenic.c
> @@ -209,16 +209,14 @@ static int ingenic_uart_probe(struct 
> platform_device *pdev)
>  	struct uart_8250_port uart = {};
>  	struct ingenic_uart_data *data;
>  	const struct ingenic_uart_config *cdata;
> -	const struct of_device_id *match;
>  	struct resource *regs;
>  	int irq, err, line;
> 
> -	match = of_match_device(of_match, &pdev->dev);
> -	if (!match) {
> +	cdata = of_device_get_match_data(&pdev->dev);
> +	if (!cdata) {
>  		dev_err(&pdev->dev, "Error: No device match found\n");
>  		return -ENODEV;
>  	}
> -	cdata = match->data;
> 
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq < 0)
> --
> 2.20.1.windows.1
> 
> 
> 


