Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A86E3285498
	for <lists+linux-mips@lfdr.de>; Wed,  7 Oct 2020 00:28:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727663AbgJFW2Z (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 6 Oct 2020 18:28:25 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:46608 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726323AbgJFW2Y (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 6 Oct 2020 18:28:24 -0400
Received: by mail-oi1-f196.google.com with SMTP id u126so266151oif.13;
        Tue, 06 Oct 2020 15:28:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BK9fnoo1uA83BhzEQ3W88lbLalesaiwBhSmKSbszAEo=;
        b=KGEHT7kDJeAoS+PCtr7d4LDVh1qCHZD5OL+6U2jHr3I1LiFWTioFyDhuhHrudsWh/A
         3r1zzcl3kM9yjBuVhk83rktb3dtXRtQAZvjWcbjLl36soVBvi4fA236UVnrrOOTp6mDF
         xy3Un4OeoG9lwSwtmJ4FzJJnz8gfG2UN3+9EL9rHsbCgSrtozpIsy5nNSZyZKYPn4oni
         jJUdABzoxMLLrNG+L9/729e2HFlCZvXprawK9GFvtzAQ8kh0AuIs0o/m4GuzNdnJocJR
         JqN/YDcPjzYp2/NLH+KdmULqeIBggnHai+87le1mpVDje43/kW5InJJH+1IZfRfiL6PQ
         897g==
X-Gm-Message-State: AOAM533zinPAZ9rbqNwI77aIwnq2UzvlBkEQHKSRqG6zn7Ct1v6z7qlB
        SkNQa1xWD2eEi3jEkVPXEA==
X-Google-Smtp-Source: ABdhPJxoVcEzp/l6VNBrV6AdkDsAonSUtV210T7j1H1LSoBOsP96XXbUFBTHpRVqHhawYzCR0qUyPA==
X-Received: by 2002:aca:af07:: with SMTP id y7mr298067oie.176.1602023303569;
        Tue, 06 Oct 2020 15:28:23 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k51sm86028otc.46.2020.10.06.15.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2020 15:28:22 -0700 (PDT)
Received: (nullmailer pid 2970094 invoked by uid 1000);
        Tue, 06 Oct 2020 22:28:21 -0000
Date:   Tue, 6 Oct 2020 17:28:21 -0500
From:   Rob Herring <robh@kernel.org>
To:     Alexander Dahl <post@lespocky.de>
Cc:     Dan Murphy <dmurphy@ti.com>, Jeff LaBundy <jeff@labundy.com>,
        Pavel Machek <pavel@ucw.cz>,
        linux-stm32@st-md-mailman.stormreply.com,
        Alexander Dahl <ada@thorsis.com>, linux-mips@vger.kernel.org,
        linux-omap@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Lee Jones <lee.jones@linaro.org>, linux-leds@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 03/12] dt-bindings: mfd: Fix schema warnings for
 pwm-leds
Message-ID: <20201006222821.GA2970040@bogus>
References: <20201005203451.9985-1-post@lespocky.de>
 <20201005203451.9985-4-post@lespocky.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201005203451.9985-4-post@lespocky.de>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 05 Oct 2020 22:34:42 +0200, Alexander Dahl wrote:
> The node names for devices using the pwm-leds driver follow a certain
> naming scheme (now).  Parent node name is not enforced, but recommended
> by DT project.
> 
>   DTC     Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml
>   CHECK   Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml
> /home/alex/build/linux/Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml: pwmleds: 'panel' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
>         From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
> 
> Signed-off-by: Alexander Dahl <post@lespocky.de>
> ---
> 
> Notes:
>     v6 -> v7:
>       * added warning message to commit message (Krzysztof Kozlowski)
> 
>     v6:
>       * added this patch to series
> 
>  Documentation/devicetree/bindings/mfd/iqs62x.yaml | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
