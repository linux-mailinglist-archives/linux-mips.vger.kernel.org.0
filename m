Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A410F1D43EC
	for <lists+linux-mips@lfdr.de>; Fri, 15 May 2020 05:14:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727117AbgEODOC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 May 2020 23:14:02 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:43042 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726316AbgEODOB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 14 May 2020 23:14:01 -0400
Received: by mail-ot1-f66.google.com with SMTP id a68so800113otb.10;
        Thu, 14 May 2020 20:14:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eEwE27xsOgv9JycQDV37OtX9WeuthbVrp0z44aW/Zvw=;
        b=DWO4cCuRrulPmtUO3EMqH0dKZ1ftI+nw07ui+exQa8IBgnzx1i7uwpQ7uVacuyW9eQ
         obSgvCwqZ5RYruJhpUUOYaxMcpmE3qdtkmKtfWIkPMAuL0o7z6JJjUzJtsCtg4dU3Cc1
         O6uMeL2tv1gB6pc/uTGIV/Bu7qf6MEWTeaU2l8cgM4GY1a+73yDkIWRZbXgctz+0KiQf
         AEhaW6aNGbECYQqDnT/jWQK7Nu7zW4bupTE99nfWu+u+NN0n6jb9NSwDE/+1/rAox2zK
         hA1CM1DKpBmhk9juadihysqARpXXs5vHgwE5FGzOQ/qROmHQP+85rNXAq3m+0EzkVvCa
         Lx5Q==
X-Gm-Message-State: AOAM531Ze+jWknin1W+4IeskZcT/NMJLpWdDSLM5svkdFvA5yJ3NFDpc
        iszHiMwNDFHAvxp28cSgQg==
X-Google-Smtp-Source: ABdhPJwpWbMICvyvkyhZlS6SePhlT8tESIl1O31AB3TFMnVClmmOx24e5VxIHuZG6/hnpXLeLJ2OPg==
X-Received: by 2002:a05:6830:1057:: with SMTP id b23mr764647otp.82.1589512440943;
        Thu, 14 May 2020 20:14:00 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id o10sm250923oti.52.2020.05.14.20.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 20:14:00 -0700 (PDT)
Received: (nullmailer pid 31220 invoked by uid 1000);
        Fri, 15 May 2020 03:13:59 -0000
Date:   Thu, 14 May 2020 22:13:59 -0500
From:   Rob Herring <robh@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Paul Burton <paulburton@kernel.org>, soc@kernel.org,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        linux-kernel@vger.kernel.org, Jeffrey Hugo <jhugo@codeaurora.org>,
        linux-mips@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
        Tero Kristo <t-kristo@ti.com>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Olof Johansson <olof@lixom.net>, devicetree@vger.kernel.org,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 2/4] dt-bindings: bus: Add Baikal-T1 APB-bus binding
Message-ID: <20200515031359.GA31181@bogus>
References: <20200306130731.938808030702@mail.baikalelectronics.ru>
 <20200507224116.1523-1-Sergey.Semin@baikalelectronics.ru>
 <20200507224116.1523-3-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200507224116.1523-3-Sergey.Semin@baikalelectronics.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 8 May 2020 01:41:14 +0300, Serge Semin wrote:
> Baikal-T1 CPU or DMAC MMIO requests are handled by the AMBA 3 AXI
> Interconnect which routes them to the AXI-APB bridge, which in turn
> serializes accesses and routes them to the corresponding APB slave device.
> This binding describes the AXI-APB bridge considered as the APB-bus. It is
> supposed to be compatible with "be,bt1-apb" and "simple-bus" drivers,
> should be equipped with EHB MMIO region and a region with no slave device
> mapped, interrupts line number, APB reference clock and domain reset line.
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
> - Don't use a multi-arg clock phandle reference in the examples dt-bindings
>   property. Thus redundant include statement can be removed.
> - Use dual GPL/BSD license.
> - Use single lined copyright header.
> - Lowercase the unit-address.
> - Convert a dedicated EHB block binding to the Baikal-T1 APB-bus one.
> - Add APB reference clock and reset support.
> - Replace "additionalProperties: false" property with
>   "unevaluatedProperties: false".
> - Add reg-names property.
> ---
>  .../bindings/bus/baikal,bt1-apb.yaml          | 90 +++++++++++++++++++
>  1 file changed, 90 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bus/baikal,bt1-apb.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
