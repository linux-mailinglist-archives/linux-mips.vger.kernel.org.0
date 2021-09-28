Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAFF941B68C
	for <lists+linux-mips@lfdr.de>; Tue, 28 Sep 2021 20:47:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241880AbhI1Ssm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Sep 2021 14:48:42 -0400
Received: from mxout02.lancloud.ru ([45.84.86.82]:50656 "EHLO
        mxout02.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236720AbhI1Ssl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 28 Sep 2021 14:48:41 -0400
X-Greylist: delayed 328 seconds by postgrey-1.27 at vger.kernel.org; Tue, 28 Sep 2021 14:48:40 EDT
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout02.lancloud.ru 7ADA1205E7B0
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH v3 14/14] irqchip: Fix kernel-doc parameter typo for
 IRQCHIP_DECLARE
To:     Florian Fainelli <f.fainelli@gmail.com>,
        <linux-kernel@vger.kernel.org>
CC:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        "maintainer:BROADCOM BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE..." 
        <bcm-kernel-feedback-list@broadcom.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "Will Deacon" <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        "moderated list:ARM SUB-ARCHITECTURES" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE" 
        <devicetree@vger.kernel.org>
References: <20210928182139.652896-1-f.fainelli@gmail.com>
 <20210928182139.652896-15-f.fainelli@gmail.com>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <79aa96aa-1c54-13ca-48ab-be00ec11bb14@omp.ru>
Date:   Tue, 28 Sep 2021 21:41:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210928182139.652896-15-f.fainelli@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 9/28/21 9:21 PM, Florian Fainelli wrote:

> The documentation refers to "compstr" when we have the argument named

   Nitpick: the arguments are what you pass to a function, you meant parameters.

> "compat", fix the typo.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  include/linux/irqchip.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/irqchip.h b/include/linux/irqchip.h
> index 67351aac65ef..ccf32758ea85 100644
> --- a/include/linux/irqchip.h
> +++ b/include/linux/irqchip.h
> @@ -23,7 +23,7 @@
>   *
>   * @name: name that must be unique across all IRQCHIP_DECLARE of the
>   * same file.
> - * @compstr: compatible string of the irqchip driver
> + * @compat: compatible string of the irqchip driver
>   * @fn: initialization function
>   */
>  #define IRQCHIP_DECLARE(name, compat, fn) OF_DECLARE_2(irqchip, name, compat, fn)

MBR. Sergey
