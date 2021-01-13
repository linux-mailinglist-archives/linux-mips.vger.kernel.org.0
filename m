Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45AFF2F48E9
	for <lists+linux-mips@lfdr.de>; Wed, 13 Jan 2021 11:46:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727560AbhAMKoq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 Jan 2021 05:44:46 -0500
Received: from elvis.franken.de ([193.175.24.41]:47759 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727304AbhAMKoq (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 13 Jan 2021 05:44:46 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kzddE-00021m-05; Wed, 13 Jan 2021 11:44:04 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 2B1E5C02B1; Wed, 13 Jan 2021 11:40:57 +0100 (CET)
Date:   Wed, 13 Jan 2021 11:40:57 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        john@phrozen.org, hauke@hauke-m.de
Subject: Re: [PATCH] MIPS: lantiq: irq: register the interrupt controllers
 with irqchip_init
Message-ID: <20210113104057.GF10351@alpha.franken.de>
References: <20210109195351.2724769-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210109195351.2724769-1-martin.blumenstingl@googlemail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Jan 09, 2021 at 08:53:51PM +0100, Martin Blumenstingl wrote:
> Add support for more interrupt controllers by switching from
> of_irq_init() to irqchip_init() in Lantiq's arch_init_irq(). This
> requires switching the ICU interrupt controller to use
> IRQCHIP_DECLARE(), like a real irqchip driver would do.
> 
> This is needed for future changes when new irqchip drivers are
> implemented:
> - a dedicated driver for the EIU interrupt controller
> - a driver for the MSI PIC (Programmable Interrupt Controller) found on
>   VRX200 and newer SoCs
> - ..or any other driver which uses IRQCHIP_DECLARE
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  arch/mips/lantiq/irq.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
