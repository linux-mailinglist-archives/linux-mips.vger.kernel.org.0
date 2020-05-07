Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC1341C8A10
	for <lists+linux-mips@lfdr.de>; Thu,  7 May 2020 14:05:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726093AbgEGMFU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 May 2020 08:05:20 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:58121 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbgEGMFU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 7 May 2020 08:05:20 -0400
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 015A2FF814;
        Thu,  7 May 2020 12:03:01 +0000 (UTC)
Date:   Thu, 7 May 2020 14:03:01 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Rob Herring <robh+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Arnd Bergmann <arnd@arndb.de>, linux-mips@vger.kernel.org,
        Rob Herring <robh@kernel.org>, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/7] dt-bindings: timer: Move snps,dw-apb-timer DT
 schema from rtc
Message-ID: <20200507120301.GF34497@piout.net>
References: <20200324174325.14213-1-Sergey.Semin@baikalelectronics.ru>
 <20200506214107.25956-1-Sergey.Semin@baikalelectronics.ru>
 <20200506214107.25956-3-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200506214107.25956-3-Sergey.Semin@baikalelectronics.ru>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 07/05/2020 00:41:02+0300, Serge Semin wrote:
> This binding file doesn't belong to the rtc seeing it's a pure timer
> with no rtc facilities like days/months/years counting and alarms.
> So move the YAML-file to the Documentation/devicetree/bindings/timer/
> directory.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: linux-mips@vger.kernel.org
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  .../devicetree/bindings/{rtc => timer}/snps,dw-apb-timer.yaml   | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename Documentation/devicetree/bindings/{rtc => timer}/snps,dw-apb-timer.yaml (96%)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/snps,dw-apb-timer.yaml b/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml
> similarity index 96%
> rename from Documentation/devicetree/bindings/rtc/snps,dw-apb-timer.yaml
> rename to Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml
> index 002fe1ee709b..5d300efdf0ca 100644
> --- a/Documentation/devicetree/bindings/rtc/snps,dw-apb-timer.yaml
> +++ b/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  %YAML 1.2
>  ---
> -$id: http://devicetree.org/schemas/rtc/snps,dw-apb-timer.yaml#
> +$id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
>  title: Synopsys DesignWare APB Timer
> -- 
> 2.25.1
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
