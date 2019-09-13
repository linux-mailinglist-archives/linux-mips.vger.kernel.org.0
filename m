Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E87DB2371
	for <lists+linux-mips@lfdr.de>; Fri, 13 Sep 2019 17:33:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388639AbfIMPdA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 13 Sep 2019 11:33:00 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:57372 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727452AbfIMPc7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 13 Sep 2019 11:32:59 -0400
Received: from [IPv6:2001:8a0:6c2f:b301:66f4:e6a0:633:7a5e] (unknown [IPv6:2001:8a0:6c2f:b301:66f4:e6a0:633:7a5e])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: ezequiel)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 279BE28B9BE;
        Fri, 13 Sep 2019 16:32:56 +0100 (BST)
Message-ID: <e9ef3a9093e8572eb3be2aa654dd30069c493a4b.camel@collabora.com>
Subject: Re: [PATCH 1/4] MMC: Ingenic: Adjust the macro definition name.
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Zhou Yanjie <zhouyanjie@zoho.com>, linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, ulf.hansson@linaro.org,
        paul.burton@mips.com, linus.walleij@linaro.org,
        paul@crapouillou.net, malat@debian.org, yuehaibing@huawei.com,
        robh+dt@kernel.org, mark.rutland@arm.com, syq@debian.org,
        jiaxun.yang@flygoat.com
Date:   Fri, 13 Sep 2019 16:32:52 +0100
In-Reply-To: <1567669089-88693-2-git-send-email-zhouyanjie@zoho.com>
References: <1567669089-88693-1-git-send-email-zhouyanjie@zoho.com>
         <1567669089-88693-2-git-send-email-zhouyanjie@zoho.com>
Organization: Collabora
X-Priority: 1
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Zhou,

Thanks for your interest in this driver, I'm glad
so see it's more used.

On Thu, 2019-09-05 at 15:38 +0800, Zhou Yanjie wrote:
> Adjust the macro definition name to match the corresponding
> register name in the datasheet.
> 

It's not really an issue to have slighlt different
names on the macros. They are currently sufficiently
descriptive, and I don't think it's deserves a patch.

Thanks,
Ezequiel

> Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
> ---
>  drivers/mmc/host/jz4740_mmc.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/mmc/host/jz4740_mmc.c b/drivers/mmc/host/jz4740_mmc.c
> index ffdbfaa..1b1fcb7 100644
> --- a/drivers/mmc/host/jz4740_mmc.c
> +++ b/drivers/mmc/host/jz4740_mmc.c
> @@ -28,7 +28,7 @@
>  #include <asm/mach-jz4740/dma.h>
>  
>  #define JZ_REG_MMC_STRPCL	0x00
> -#define JZ_REG_MMC_STATUS	0x04
> +#define JZ_REG_MMC_STAT		0x04
>  #define JZ_REG_MMC_CLKRT	0x08
>  #define JZ_REG_MMC_CMDAT	0x0C
>  #define JZ_REG_MMC_RESTO	0x10
> @@ -40,7 +40,7 @@
>  #define JZ_REG_MMC_IREG		0x28
>  #define JZ_REG_MMC_CMD		0x2C
>  #define JZ_REG_MMC_ARG		0x30
> -#define JZ_REG_MMC_RESP_FIFO	0x34
> +#define JZ_REG_MMC_RES		0x34
>  #define JZ_REG_MMC_RXFIFO	0x38
>  #define JZ_REG_MMC_TXFIFO	0x3C
>  #define JZ_REG_MMC_DMAC		0x44
> @@ -391,7 +391,7 @@ static void jz4740_mmc_clock_disable(struct jz4740_mmc_host *host)
>  
>  	writew(JZ_MMC_STRPCL_CLOCK_STOP, host->base + JZ_REG_MMC_STRPCL);
>  	do {
> -		status = readl(host->base + JZ_REG_MMC_STATUS);
> +		status = readl(host->base + JZ_REG_MMC_STAT);
>  	} while (status & JZ_MMC_STATUS_CLK_EN && --timeout);
>  }
>  
> @@ -403,7 +403,7 @@ static void jz4740_mmc_reset(struct jz4740_mmc_host *host)
>  	writew(JZ_MMC_STRPCL_RESET, host->base + JZ_REG_MMC_STRPCL);
>  	udelay(10);
>  	do {
> -		status = readl(host->base + JZ_REG_MMC_STATUS);
> +		status = readl(host->base + JZ_REG_MMC_STAT);
>  	} while (status & JZ_MMC_STATUS_IS_RESETTING && --timeout);
>  }
>  
> @@ -446,7 +446,7 @@ static void jz4740_mmc_transfer_check_state(struct jz4740_mmc_host *host,
>  {
>  	int status;
>  
> -	status = readl(host->base + JZ_REG_MMC_STATUS);
> +	status = readl(host->base + JZ_REG_MMC_STAT);
>  	if (status & JZ_MMC_STATUS_WRITE_ERROR_MASK) {
>  		if (status & (JZ_MMC_STATUS_TIMEOUT_WRITE)) {
>  			host->req->cmd->error = -ETIMEDOUT;
> @@ -580,10 +580,10 @@ static bool jz4740_mmc_read_data(struct jz4740_mmc_host *host,
>  	/* For whatever reason there is sometime one word more in the fifo then
>  	 * requested */
>  	timeout = 1000;
> -	status = readl(host->base + JZ_REG_MMC_STATUS);
> +	status = readl(host->base + JZ_REG_MMC_STAT);
>  	while (!(status & JZ_MMC_STATUS_DATA_FIFO_EMPTY) && --timeout) {
>  		d = readl(fifo_addr);
> -		status = readl(host->base + JZ_REG_MMC_STATUS);
> +		status = readl(host->base + JZ_REG_MMC_STAT);
>  	}
>  
>  	return false;
> @@ -614,7 +614,7 @@ static void jz4740_mmc_read_response(struct jz4740_mmc_host *host,
>  {
>  	int i;
>  	uint16_t tmp;
> -	void __iomem *fifo_addr = host->base + JZ_REG_MMC_RESP_FIFO;
> +	void __iomem *fifo_addr = host->base + JZ_REG_MMC_RES;
>  
>  	if (cmd->flags & MMC_RSP_136) {
>  		tmp = readw(fifo_addr);
> @@ -797,7 +797,7 @@ static irqreturn_t jz_mmc_irq(int irq, void *devid)
>  	struct mmc_command *cmd = host->cmd;
>  	uint32_t irq_reg, status, tmp;
>  
> -	status = readl(host->base + JZ_REG_MMC_STATUS);
> +	status = readl(host->base + JZ_REG_MMC_STAT);
>  	irq_reg = jz4740_mmc_read_irq_reg(host);
>  
>  	tmp = irq_reg;



