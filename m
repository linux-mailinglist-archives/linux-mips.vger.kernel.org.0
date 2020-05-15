Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB0ED1D43E7
	for <lists+linux-mips@lfdr.de>; Fri, 15 May 2020 05:13:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727819AbgEODNO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 May 2020 23:13:14 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:42068 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726316AbgEODNO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 14 May 2020 23:13:14 -0400
Received: by mail-oi1-f193.google.com with SMTP id i13so988852oie.9;
        Thu, 14 May 2020 20:13:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=n6818GMr2n+GYZP/OuGBE+slZY1zUjDWJMT4ZWn99jo=;
        b=Ch7uOWYzuPjG9vZIdRAO+XLIgBjKaanQKTByXfhgFbnkV0MSAuf4ZU8+kd4QKQdui0
         j8xnl8gRuVRNlQ1QMSeMKLDBa7yxyNPS3Vh2qVN+y+NT6a1x1vKGVZrz8Tmu2ACLrl0/
         x8UP0+zfOYoX5UIMULJQA5tQA0MuHBCunPdgkUadu/dbG5euWgp0/8C3UVx+8B0FcNUn
         OdzHj50s4steItMjln045YPyDuPf3IBXflAzi7e4nzGHC2ACrKZox6wapCaVjYY4n5kM
         rC+tWna75be1J4uJ4TRN72EKnLRw3i/TS0b/TdzjUtWXKU3dDZie8KDyQZQxpRRhac9B
         gHwg==
X-Gm-Message-State: AOAM530sXbr3/Xec5TX6s5ZF+xJGVWeWRwy9Q7LjgooPMxyeyPRE8NES
        3iLcT0/aeIpbyD0Kd0iv5g==
X-Google-Smtp-Source: ABdhPJyh5gk9eC0CJO0ytuiro5+mPeYwPAJ2nx3OBw53xSgCkPxSAdUhuH5e7ARdnllvCUh3mBrqBg==
X-Received: by 2002:aca:d696:: with SMTP id n144mr741298oig.136.1589512393508;
        Thu, 14 May 2020 20:13:13 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id a7sm259449otr.15.2020.05.14.20.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 20:13:12 -0700 (PDT)
Received: (nullmailer pid 29993 invoked by uid 1000);
        Fri, 15 May 2020 03:13:11 -0000
Date:   Thu, 14 May 2020 22:13:11 -0500
From:   Rob Herring <robh@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Olof Johansson <olof@lixom.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        devicetree@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
        Tero Kristo <t-kristo@ti.com>, Arnd Bergmann <arnd@arndb.de>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Paul Burton <paulburton@kernel.org>,
        linux-kernel@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        soc@kernel.org, Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: bus: Add Baikal-T1 AXI-bus binding
Message-ID: <20200515031311.GA29918@bogus>
References: <20200306130731.938808030702@mail.baikalelectronics.ru>
 <20200507224116.1523-1-Sergey.Semin@baikalelectronics.ru>
 <20200507224116.1523-2-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200507224116.1523-2-Sergey.Semin@baikalelectronics.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 8 May 2020 01:41:13 +0300, Serge Semin wrote:
> AXI3-bus is the main communication bus connecting all high-speed
> peripheral IP-cores with RAM controller and with MIPS P5600 cores on
> Baikal-T1 SoC. This binding describes the DW AMBA 3 AXI Inteconnect
> and Errors Handler Block synthesized on top of it, which are
> responsible for the AXI-bus traffic arbitration and errors reporting
> upstream to CPU. Baikal-T1 AXI-bus DT node is supposed to be compatible
> with "be,bt1-axi" and "simple-bus" drivers, should have reg property with
> AXI-bus QOS registers space, syscon phandle reference to the Baikal-T1
> System Controller, IRQ line declared, AXI Interconnect reference clock and
> reset line.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Tero Kristo <t-kristo@ti.com>
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Cc: Jeffrey Hugo <jhugo@codeaurora.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Olof Johansson <olof@lixom.net>
> Cc: linux-mips@vger.kernel.org
> Cc: soc@kernel.org
> 
> ---
> 
> Rob, I had to remove your Reviewed-by tag, since new changes had been
> introduced.
> 
> Changelog v2:
> - Move driver to the bus subsystem.
> - Use dual GPL/BSD license.
> - Use single lined copyright header.
> - Lowercase the unit-address.
> - Convert a simple EHB block binding to the Baikal-T1 AXI-bus one with
>   interconnect capabilities support.
> - Replace "additionalProperties: false" property with
>   "unevaluatedProperties: false".
> - Add AXI reference clock and reset support.
> - Add syscon phandle reference to the Baikal-T1 System Controller node.
> ---
>  .../bindings/bus/baikal,bt1-axi.yaml          | 95 +++++++++++++++++++
>  1 file changed, 95 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bus/baikal,bt1-axi.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
