Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F769178F07
	for <lists+linux-mips@lfdr.de>; Wed,  4 Mar 2020 11:58:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729138AbgCDK6l (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 4 Mar 2020 05:58:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:48102 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728953AbgCDK6l (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 4 Mar 2020 05:58:41 -0500
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C5ECA2166E;
        Wed,  4 Mar 2020 10:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583319520;
        bh=HkpTmmopcWeiJOUsgTP+pcb5bKUbqsfE8qE/21U6EO0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ognYXJmePYp6yQ4NZn96MFB+MLpGmSQ5o7fC/QRcNKdilISLKMp1t8ioLh5fb34ax
         /KdpfBRN3D+xH6axDzHuRjrrNsa2oCNrA2cXnkwP2URDtO204FUUnBQEXQjrJLhoho
         A1Jft/Qcph5Pl4wFIxgaVp6C/HqBoYtd1MtFBJX0=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1j9Rjb-009xyH-1n; Wed, 04 Mar 2020 10:58:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Wed, 04 Mar 2020 10:58:38 +0000
From:   Marc Zyngier <maz@kernel.org>
To:     =?UTF-8?Q?=E5=91=A8=E7=90=B0=E6=9D=B0_=28Zhou_Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        tglx@linutronix.de, jason@lakedaemon.net, sboyd@kernel.org,
        mturquette@baylibre.com, mark.rutland@arm.com, robh+dt@kernel.org,
        daniel.lezcano@linaro.org, paul@crapouillou.net,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com,
        dongsheng.qiu@ingenic.com
Subject: Re: [PATCH 4/4] irqchip: Ingenic: Add support for TCU of X1000.
In-Reply-To: <1582100974-129559-6-git-send-email-zhouyanjie@wanyeetech.com>
References: <1582100974-129559-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1582100974-129559-6-git-send-email-zhouyanjie@wanyeetech.com>
Message-ID: <cf9434a075ee7efa6430bc39877c416c@kernel.org>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/1.3.10
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: zhouyanjie@wanyeetech.com, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, tglx@linutronix.de, jason@lakedaemon.net, sboyd@kernel.org, mturquette@baylibre.com, mark.rutland@arm.com, robh+dt@kernel.org, daniel.lezcano@linaro.org, paul@crapouillou.net, sernia.zhou@foxmail.com, zhenwenjin@gmail.com, dongsheng.qiu@ingenic.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2020-02-19 08:29, 周琰杰 wrote:
> X1000 has a different TCU containing OST, since X1000, OST has been
> independent of TCU. This patch is prepare for later OST driver.

You keep on talking about OST (whatever that is), but never deals with 
it.
Why don't you just say

"Enable TCU support for Ingenic X1000, which can be supported by
the existing driver."

as this is what the patch is doing?

> 
> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
> ---
>  drivers/irqchip/irq-ingenic-tcu.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/irqchip/irq-ingenic-tcu.c
> b/drivers/irqchip/irq-ingenic-tcu.c
> index 6d05cef..7a7222d 100644
> --- a/drivers/irqchip/irq-ingenic-tcu.c
> +++ b/drivers/irqchip/irq-ingenic-tcu.c
> @@ -180,3 +180,4 @@ static int __init ingenic_tcu_irq_init(struct
> device_node *np,
>  IRQCHIP_DECLARE(jz4740_tcu_irq, "ingenic,jz4740-tcu", 
> ingenic_tcu_irq_init);
>  IRQCHIP_DECLARE(jz4725b_tcu_irq, "ingenic,jz4725b-tcu", 
> ingenic_tcu_irq_init);
>  IRQCHIP_DECLARE(jz4770_tcu_irq, "ingenic,jz4770-tcu", 
> ingenic_tcu_irq_init);
> +IRQCHIP_DECLARE(x1000_tcu_irq, "ingenic,x1000-tcu", 
> ingenic_tcu_irq_init);

Otherwise,

Acked-by: Marc Zyngier <maz@kernel.org>

I expect this to go via the MIPS tree as a series.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
