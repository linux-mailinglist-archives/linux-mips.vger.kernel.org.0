Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 345F51D896F
	for <lists+linux-mips@lfdr.de>; Mon, 18 May 2020 22:41:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727799AbgERUkl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 18 May 2020 16:40:41 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:35507 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726502AbgERUkk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 18 May 2020 16:40:40 -0400
Received: by mail-il1-f195.google.com with SMTP id a14so5912010ilk.2;
        Mon, 18 May 2020 13:40:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3XIblm8zUqQuuY/X/TRE5azM2syRVCTbnkaQ5PvYeqQ=;
        b=CgOIpOr7aRmEtY+sNfPRku4mULjelQH08nxiiyd4/Iz2V1Ku2AyCQHLPeB5Bv9HYtD
         AXDvsnpaq9RC9UijbJX3yQEktMazTO0URsa+n4IVulCEaD1Dz3X6LwNrPd99w+zetvfm
         8uXzhhlKZ0pczIvsV/ISXIykptgyK70F6npju3iRdqhnq2lYC3e6oM29HJqf6HKrTmb5
         zzmBUzpPUe9bo+mhTIi6fKTTjWDfVMadTy2va/Y66mxgKPy2+3AITm2J+FT7CRenYaAz
         K0aEtgQ8Ib/pyDvteiZ3/BVpZX9U0agX51oL2bnYJHG48akHuqFTwjk1C1Jy5Ww99DxA
         BREw==
X-Gm-Message-State: AOAM531/dIFwBdFgqimkhwJjnlj3xeNrC/0hKIszL0egb+k6uuULKSKl
        JtfX7wgr4PBSXLS3wx/pMQ==
X-Google-Smtp-Source: ABdhPJzP6946xepHNazaOLD4ewVhDy31f9QxjZeD/1Q0ypDixwfmV7lyLnzYrKfUH8Jo45fkyUMnUg==
X-Received: by 2002:a92:5acb:: with SMTP id b72mr18300906ilg.76.1589834439429;
        Mon, 18 May 2020 13:40:39 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id r9sm5157600ilm.10.2020.05.18.13.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 13:40:38 -0700 (PDT)
Received: (nullmailer pid 9739 invoked by uid 1000);
        Mon, 18 May 2020 20:40:37 -0000
Date:   Mon, 18 May 2020 14:40:37 -0600
From:   Rob Herring <robh@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-mips@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/7] dt-bindings: watchdog: dw-wdt: Add watchdog TOPs
 array property
Message-ID: <20200518204037.GA4909@bogus>
References: <20200306132758.703FC8030704@mail.baikalelectronics.ru>
 <20200510105807.880-1-Sergey.Semin@baikalelectronics.ru>
 <20200510105807.880-4-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200510105807.880-4-Sergey.Semin@baikalelectronics.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, May 10, 2020 at 01:58:03PM +0300, Serge Semin wrote:
> In case if DW Watchdog IP core is built with WDT_USE_FIX_TOP == false,
> a custom timeout periods are used to preset the timer counter. In
> this case that periods should be specified in a new "snps,watchdog-tops"
> property of the DW watchdog dts node.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: linux-mips@vger.kernel.org
> 
> ---
> 
> Rob, I had to remove your Reviewed-by tag, since the patch needed
> to be updated a bit (see changelog).
> 
> Changelog v2:
> - Rearrange SoBs.
> - Move $ref to the root level of the "snps,watchdog-tops" property
>   so does the constraints.
> - Add default TOP values array.
> - Discard the label definition from the new bindings example.
> ---
>  .../bindings/watchdog/snps,dw-wdt.yaml        | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> index 5bf6dc6377f3..cc741fb5a685 100644
> --- a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> @@ -39,6 +39,24 @@ properties:
>      description: Phandle to the DW Watchdog reset lane
>      maxItems: 1
>  
> +  snps,watchdog-tops:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description: |
> +      DW APB Watchdog custom timer intervals - Timeout Period ranges (TOPs).
> +      Each TOP is a number loaded into the watchdog counter at the moment of
> +      the timer restart. The counter decrementing happens each tick of the
> +      reference clock. Therefore the TOPs array is equivalent to an array of
> +      the timer expiration intervals supported by the DW APB Watchdog. Note
> +      DW APB Watchdog IP-core might be synthesized with fixed TOP values,
> +      in which case this property is unnecessary with default TOPs utilized.
> +    default: [0x0001000 0x0002000 0x0004000 0x0008000
> +      0x0010000 0x0020000 0x0040000 0x0080000
> +      0x0100000 0x0200000 0x0400000 0x0800000
> +      0x1000000 0x2000000 0x4000000 0x8000000]
> +    items:
> +      minItems: 16
> +      maxItems: 16

Drop 'items' and move these up a level. That may have given you some 
issues, but I made some fixes recently.

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

Rob
