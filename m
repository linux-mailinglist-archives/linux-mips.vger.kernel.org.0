Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A08E4290BCE
	for <lists+linux-mips@lfdr.de>; Fri, 16 Oct 2020 20:53:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404046AbgJPSxn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 16 Oct 2020 14:53:43 -0400
Received: from mail-oo1-f65.google.com ([209.85.161.65]:35047 "EHLO
        mail-oo1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404031AbgJPSxn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 16 Oct 2020 14:53:43 -0400
Received: by mail-oo1-f65.google.com with SMTP id f2so865089ooj.2;
        Fri, 16 Oct 2020 11:53:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/BLMOeuNPLg/1+rmux5PnQpwOXbVITQef6gQqf/xRV4=;
        b=r0iPlj+VgkWzyANF8V4WjDIIEQ9E/r2wKjGV5W69sZZpVfVI9GagmexvAPte4nD9W6
         bCe4KBKcEaupY21yuGFfgZPmsRReQKHVlRxG/ytUDG0o+LoWfMG+O/1S+bNi7fNWrhBb
         YOa+rJEY2dzvHh1EQSEI5PrQmyS6fVNfVzYPP50ju8h6T9Jx5R5KJ/IguZKEJoGe3Pdy
         RRm0sZtS9+KnrnrR6kscEPvOPlKgKPXySMw5PiLLxj7bkXPGz03jX9mcmx5IlsCQVB6R
         XliQA8xoLIZPpvuMGvPBmROGKNG9u7FhfyzOtZZURcmI4eKOotTBBmIvkHL8R5lqSmWL
         Lh+w==
X-Gm-Message-State: AOAM5302JH6V2kihjQbTOiCQrEqUGTGWlQSRQezK6FuZHpeD0RambkC7
        fF8dAuaPc1n1HT7bukTHug==
X-Google-Smtp-Source: ABdhPJxtoraofuhC22sxyo8Q42rEuTESh7JvVkC+ACDOtuWNWIg2F8VJBGdmwUM7JkujSl0LOdhDaw==
X-Received: by 2002:a4a:e93a:: with SMTP id a26mr3885560ooe.58.1602874422546;
        Fri, 16 Oct 2020 11:53:42 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 33sm1194275otr.25.2020.10.16.11.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 11:53:41 -0700 (PDT)
Received: (nullmailer pid 1738434 invoked by uid 1000);
        Fri, 16 Oct 2020 18:53:40 -0000
Date:   Fri, 16 Oct 2020 13:53:40 -0500
From:   Rob Herring <robh@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Roger Quadros <rogerq@ti.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-snps-arc@lists.infradead.org, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 11/20] dt-bindings: usb: dwc3: Add synopsys,dwc3
 compatible string
Message-ID: <20201016185340.GA1734346@bogus>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-12-Sergey.Semin@baikalelectronics.ru>
 <20201014201818.GA6926@kozik-lap>
 <20201014213554.turskjyuntk35syj@mobilestation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014213554.turskjyuntk35syj@mobilestation>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Oct 15, 2020 at 12:35:54AM +0300, Serge Semin wrote:
> On Wed, Oct 14, 2020 at 10:18:18PM +0200, Krzysztof Kozlowski wrote:
> > On Wed, Oct 14, 2020 at 01:13:53PM +0300, Serge Semin wrote:
> > > The DWC USB3 driver and some DTS files like Exynos 5250, Keystone k2e, etc
> > > expects the DWC USB3 DT node to have the compatible string with the
> > > "synopsys" vendor prefix. Let's add the corresponding compatible string to
> > > the controller DT schema, but mark it as deprecated seeing the Synopsys,
> > > Inc. is presented with just "snps" vendor prefix.
> > 
> 
> > Instead of adding deprecated schema just correct the DTSes to use snps.
> > The "synopsys" is not even in vendor prefixes.
> 
> Yeah, it's not, but the driver and some dts'es use it this way. I am not sure
> that the solution suggested by you is much better than mine. So let's hear the
> Rob'es opinion out in this matter. @Rob, what do you think?

I think we should fix the dts files given there's only 5.

Rob
