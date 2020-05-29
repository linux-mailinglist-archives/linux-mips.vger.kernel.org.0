Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0BBF1E8B90
	for <lists+linux-mips@lfdr.de>; Sat, 30 May 2020 00:53:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728473AbgE2Wxr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 May 2020 18:53:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725913AbgE2Wxr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 May 2020 18:53:47 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DAE0C03E969;
        Fri, 29 May 2020 15:53:47 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id h95so1168818pje.4;
        Fri, 29 May 2020 15:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=MylFDr6w/5dfpKOGo8aa5TLw+GcZOzIgst3igfTEQ+U=;
        b=HohSlJiHAk0uBBwpZ/BHJyPD5TsWSlEpJ/lJHz13uKu8K5YfVqsAopttAfjZN+yeu3
         aDi3/k8B4e6eNvala1c+hVdyMX9g/O13EUE5917xFA0K2P3R3IM8irFqbcIisIFno8Ec
         NloEQMrVvWDJgUX79mlPW5VFGOZoSHtMlC6V+9tLuo62+Of7mGu/tj6p5iM/6IyPGXEL
         meZuZU31mDlB0A9mu+yZm316dm3ofDKWbhQa4ifdtFWydEDhHTXrIOEDjPRmvJo2/Jd3
         wzGMtrA4hxaPtRpJXW4BCqj57Ibky2dm4tMPn6eChSK0LFfst0aB6DatCvVbjfBjwspV
         QXUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=MylFDr6w/5dfpKOGo8aa5TLw+GcZOzIgst3igfTEQ+U=;
        b=dxCxKad7gx7Rec5e6zOCoUzSFcXUtggSKm1qCoTxqPd5hH/jqbxpZO7RvzVo63RsLv
         WqCUcHYBbxD68FMVMdq3WSuXNvr/9rDGr6+O6vHL1Gk3X/IHMiSuBi0yu/w9G5NusIF5
         VBVthEHCoK7yAVih2x8DysQPQMZTYMZA0ZqgfaReOMhkm5tro28rY2e+osQMY+eSAxJ1
         gLGZxoGKBet/dEu+yon2EY0MsDsevgZl6DtN47YrI6fVbnLvSOSy7BqJLlf8sK4mEScL
         Cgsn4dlWtvAa1zWNVE4FKRlISURAG/B9Bv9U//5BFPSi00VXawGJSFNvMQOr0GM4AgdY
         b3jw==
X-Gm-Message-State: AOAM532xUDM+cgRwsKURr/1t+CD2WuiLitjY0YiwmeaT+nhaY8bdGnVU
        xVNXmhrP0L5THGp0/ruOcls=
X-Google-Smtp-Source: ABdhPJyWdqXEvTjUGuPpCs1shW4vNFSYO6DXHtyjBO7tB7/dd5D+DtsnBkIPB5oQBYp85uKqXIsRtQ==
X-Received: by 2002:a17:90a:2070:: with SMTP id n103mr3326785pjc.109.1590792826739;
        Fri, 29 May 2020 15:53:46 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u12sm412828pjy.37.2020.05.29.15.53.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 May 2020 15:53:46 -0700 (PDT)
Date:   Fri, 29 May 2020 15:53:45 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Arnd Bergmann <arnd@arndb.de>, linux-mips@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/7] dt-bindings: watchdog: dw-wdt: Support devices
 with asynch clocks
Message-ID: <20200529225345.GA194089@roeck-us.net>
References: <20200526154123.24402-1-Sergey.Semin@baikalelectronics.ru>
 <20200526154123.24402-3-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200526154123.24402-3-Sergey.Semin@baikalelectronics.ru>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, May 26, 2020 at 06:41:18PM +0300, Serge Semin wrote:
> DW Watchdog IP core can be synthesised with asynchronous timer/APB
> clocks support (WDT_ASYNC_CLK_MODE_ENABLE == 1). In this case
> separate clock signals are supposed to be used to feed watchdog timer
> and APB interface of the device. Let's update the DW Watchdog DT node
> schema so it would support the optional APB3 bus clock specified along
> with the mandatory watchdog timer reference clock.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: linux-mips@vger.kernel.org

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> 
> Changelog v2:
> - It's a new patch unpinned from the previous one.
> ---
>  .../devicetree/bindings/watchdog/snps,dw-wdt.yaml         | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> index 4f6944756ab4..5bf6dc6377f3 100644
> --- a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> @@ -24,8 +24,16 @@ properties:
>      maxItems: 1
>  
>    clocks:
> +    minItems: 1
>      items:
>        - description: Watchdog timer reference clock
> +      - description: APB3 interface clock
> +
> +  clock-names:
> +    minItems: 1
> +    items:
> +      - const: tclk
> +      - const: pclk
>  
>    resets:
>      description: Phandle to the DW Watchdog reset lane
