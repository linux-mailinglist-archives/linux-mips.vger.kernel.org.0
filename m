Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA87E1EB949
	for <lists+linux-mips@lfdr.de>; Tue,  2 Jun 2020 12:13:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726139AbgFBKMe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 2 Jun 2020 06:12:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:58202 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725958AbgFBKMe (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 2 Jun 2020 06:12:34 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5FE93206A4;
        Tue,  2 Jun 2020 10:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591092753;
        bh=SLLzKcGsTJXQ60yS/kV3falFlkEtJC5sxntPHrVvGSg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=mMic7uphuWI5aqcLn+Nz+tgHFctkAGlSazm8tfzL/4N6Ho+KUOKG7bQ4AtjTdfgxC
         /GWuU7p0eBlrPQF5wrWpOKAhA1L1i+WFr9D4QjBSU6dFOkN1W+TsuL3hWSWarhiKvY
         DNUA/FA51c+Mh/xkizq8ehJzV+zZ1NkDiaobG5mc=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1jg3uJ-00H9lr-Hu; Tue, 02 Jun 2020 11:12:31 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 02 Jun 2020 11:12:31 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paul.burton@imgtec.com>,
        Rob Herring <robh+dt@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Jason Cooper <jason@lakedaemon.net>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/6] MAINTAINERS: Add maintainers for MIPS core drivers
In-Reply-To: <20200602100921.1155-7-Sergey.Semin@baikalelectronics.ru>
References: <20200602100921.1155-1-Sergey.Semin@baikalelectronics.ru>
 <20200602100921.1155-7-Sergey.Semin@baikalelectronics.ru>
User-Agent: Roundcube Webmail/1.4.4
Message-ID: <61afd4bd10ac644fa623e218f947328e@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: Sergey.Semin@baikalelectronics.ru, tsbogend@alpha.franken.de, tglx@linutronix.de, gregkh@linuxfoundation.org, fancer.lancer@gmail.com, Alexey.Malahov@baikalelectronics.ru, paul.burton@imgtec.com, robh+dt@kernel.org, arnd@arndb.de, jason@lakedaemon.net, rjw@rjwysocki.net, daniel.lezcano@linaro.org, jhogan@kernel.org, linux-mips@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2020-06-02 11:09, Serge Semin wrote:
> Add Thomas and myself as maintainers of the MIPS CPU and GIC IRQchip, 
> MIPS
> GIC timer and MIPS CPS CPUidle drivers.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> ---
> 
> Changelog v3:
> - Keep the files list alphabetically ordered.
> - Add Thomas as the co-maintainer of the designated drivers.
> ---
>  MAINTAINERS | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2926327e4976..20532e0287d7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11278,6 +11278,17 @@ 
> F:	arch/mips/configs/generic/board-boston.config
>  F:	drivers/clk/imgtec/clk-boston.c
>  F:	include/dt-bindings/clock/boston-clock.h
> 
> +MIPS CORE DRIVERS
> +M:	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> +M:	Serge Semin <fancer.lancer@gmail.com>
> +L:	linux-mips@vger.kernel.org
> +S:	Supported
> +F:	drivers/bus/mips_cdmm.c
> +F:	drivers/clocksource/mips-gic-timer.c
> +F:	drivers/cpuidle/cpuidle-cps.c
> +F:	drivers/irqchip/irq-mips-cpu.c
> +F:	drivers/irqchip/irq-mips-gic.c
> +
>  MIPS GENERIC PLATFORM
>  M:	Paul Burton <paulburton@kernel.org>
>  L:	linux-mips@vger.kernel.org

Acked-by: Marc Zyngier <maz@kernel.org>

I assume this will go via the MIPS tree.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
