Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 519B3210460
	for <lists+linux-mips@lfdr.de>; Wed,  1 Jul 2020 09:00:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728001AbgGAHAP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 1 Jul 2020 03:00:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727991AbgGAHAH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 1 Jul 2020 03:00:07 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFAF4C03E97A
        for <linux-mips@vger.kernel.org>; Wed,  1 Jul 2020 00:00:06 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id k6so22641225wrn.3
        for <linux-mips@vger.kernel.org>; Wed, 01 Jul 2020 00:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+pRKYTmuOThutSuGqfNrgAamAdWYk1YESRlVS2CO28A=;
        b=j8Toj+Y1Sm33G/MY5KpRJO/4MLA6Xmjv5NEmZN881Y2JY1sddA5DRPZK6/0hHYYGcd
         krHNiAHXOdRvae6EVQZAGELUQtm8CGXJ/x+SgYHM0VvPaidxeEwowx7vTVi8h37/rb9C
         R7BfnkfDNL4HN0vdPWCRCwrMaip4v5M1lbG4IKaFHPpDzHWHhYc+HHpuyL85P/cGtTGi
         WyANo0R3IJVjvT7gqHcbR4cXVNMm9/NoowviYuOanpFmwrhD5+xp9JMNCo9TJNFskga1
         /lU/Kvj3kKhEUI3AAcKj3cvObXMNLBpVx5h/aEMMdxo8fGGXRH2H1kj9IBR9Z7shRmJe
         qOpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+pRKYTmuOThutSuGqfNrgAamAdWYk1YESRlVS2CO28A=;
        b=n1MMvQD/s88JHBI6yZo20Hx2jE9oyueei5wwi2BTLy0WsUxkwdV2NmrDepMBb6hGjw
         KFgOmHv8no0rOC/D8Q/XsbaW7HCvcGD+gsJJWcFpH9YCzNdFNvaoZBbQR6B5YiMzERmC
         8R0KyYINlLenQ/WajYbyFC7ItULVnAGc1rwVefEwBBSkD1e/AMQaw7oyT8YDYToawrRC
         Axcelk4ywZBILImsPHgKB33TupuaLWMFdjBfBHinPXxB0SDTJQk+3YzQigyJbJi59wcp
         SYADZBxXA4jVBuVIMNdfR/wbR161GSEP9BPJbj6eNYN323q1NH8E3SYbwvjRnob+G2/a
         6iXw==
X-Gm-Message-State: AOAM5320gZm8h8lqF8L/h9F6jnpGL9ffZH+yBc0nfkHZVXnkfQctfRIn
        lkiyw8b8/dakHm7HxjUOjOf05Q==
X-Google-Smtp-Source: ABdhPJzXAeq3ERQ5grT5ciAC17dbRoZi+Anv+tNI3+3VRZcEoztY0g+mRZPxmb9Cn/QQRsS3FfyLAQ==
X-Received: by 2002:adf:828b:: with SMTP id 11mr27284990wrc.58.1593586805272;
        Wed, 01 Jul 2020 00:00:05 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:54f4:a99f:ab88:bc07? ([2a01:e34:ed2f:f020:54f4:a99f:ab88:bc07])
        by smtp.googlemail.com with ESMTPSA id o205sm6355532wme.24.2020.07.01.00.00.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2020 00:00:04 -0700 (PDT)
Subject: Re: [PATCH v4 6/6] MAINTAINERS: Add maintainers for MIPS core drivers
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Marc Zyngier <maz@kernel.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200617223201.23259-1-Sergey.Semin@baikalelectronics.ru>
 <20200617223201.23259-7-Sergey.Semin@baikalelectronics.ru>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <e29c9643-db5c-2d89-ff56-0900091770ea@linaro.org>
Date:   Wed, 1 Jul 2020 09:00:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200617223201.23259-7-Sergey.Semin@baikalelectronics.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 18/06/2020 00:32, Serge Semin wrote:
> Add Thomas and myself as maintainers of the MIPS CPU and GIC IRQchip, MIPS
> GIC timer and MIPS CPS CPUidle drivers.

Why will you add yourself in the MAINTAINERS file for those drivers when
git shows just one contribution for the mips-gic-timer for the timer
stability ?

git shortlog --numbered --summary drivers/cpuidle/cpuidle-cps.c
     4  Paul Burton
     1  Daniel Lezcano
     1  Marcin Nowakowski
     1  Matt Redfearn
     1  Thomas Gleixner

git shortlog --numbered --summary drivers/clocksource/mips-gic-timer.c
    11  Andrew Bresticker
     4  Ezequiel Garcia
     4  Matt Redfearn
     4  Paul Burton
     3  Daniel Lezcano
     3  Thomas Gleixner
     2  Linus Torvalds
     1  Alex Smith
     1  Christophe Jaillet
     1  Felix Fietkau
     1  Ingo Molnar
     1  Markos Chandras
     1  Paul Gortmaker
     1  Rafał Miłecki
     1  Richard Cochran
     1  Serge Semin
     1  Viresh Kumar
     1  YueHaibing

Also, in the cpuidle-cps.c history, there is no signed-off from Rafael,
neither an Acked-by when it was merged. That make me think the patch
went through another path than the linux-pm tree without a cpuidle
framework maintainer acknowledgement.

Perhaps it is a mistake and the patch was actually acked-by, but I would
like to remind the patches have to be acked by the upper maintainers and
being listed in the MAINTAINERS file does not give the right of override
this rule.



> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Acked-by: Marc Zyngier <maz@kernel.org>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: linux-mips@vger.kernel.org
> Cc: devicetree@vger.kernel.org
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
> @@ -11278,6 +11278,17 @@ F:	arch/mips/configs/generic/board-boston.config
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
> 


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
