Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FA9E290BE3
	for <lists+linux-mips@lfdr.de>; Fri, 16 Oct 2020 20:55:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407346AbgJPSzD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 16 Oct 2020 14:55:03 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:37941 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406782AbgJPSzC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 16 Oct 2020 14:55:02 -0400
Received: by mail-oi1-f196.google.com with SMTP id h10so3573230oie.5;
        Fri, 16 Oct 2020 11:55:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TGrH8tVmrp2DQwkSPaPH+x2TeW+bXYbWOYv8P0MTPiA=;
        b=oR3sKl30JmNdJ8HLpVqnSkETfptTgXj3zpUPP7wJH+PQ8JOkdy+Qbp711Mb9cY0gmQ
         KkGZKJMl/D4YN6lsL+b3/W0nNR3Z3BG5iFPoCF08ubYek27Sjb1TGR+Ol1hjadKEc+1/
         H8vGW17xHkNBlB3MtME7WvGa2u67PgbS5zLG0h+sWN6Zz+0zDh9Y/Q1HGmw4LrehS1ku
         jGy4vZBbZq4iXfkwUREgIJp1h+qODn+nFlE370NKk5ICEKxV+LMxv4Yd47O/IqQE8F2z
         To1kY1FidgSyvY68ZyCzIHHGq05yfmmW5yle8gxkvLZQhk+lR2PZRRsYXZ2C/WcxaK7Y
         pSfg==
X-Gm-Message-State: AOAM531nI9h8zvWz1pwNRx9NMLnRLVlcbCQi/Yzcl9qHxVz6n+w/7+82
        VHWA42trxQ8jWjYMQYQheA==
X-Google-Smtp-Source: ABdhPJwnZgFRvBDy/tFBiG5qnk1HDuFUgcTqyGaZJkTAhrpV/gkKkosLe8nlbRQyokQSpe8q3F4/vA==
X-Received: by 2002:aca:442:: with SMTP id 63mr3220005oie.111.1602874501767;
        Fri, 16 Oct 2020 11:55:01 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y194sm1266324oie.22.2020.10.16.11.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 11:55:01 -0700 (PDT)
Received: (nullmailer pid 1740583 invoked by uid 1000);
        Fri, 16 Oct 2020 18:54:59 -0000
Date:   Fri, 16 Oct 2020 13:54:59 -0500
From:   Rob Herring <robh@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Kevin Hilman <khilman@baylibre.com>, linux-usb@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        Andy Gross <agross@kernel.org>,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-kernel@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Roger Quadros <rogerq@ti.com>, linuxppc-dev@lists.ozlabs.org,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        linux-snps-arc@lists.infradead.org,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-mips@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        devicetree@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>,
        Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH 15/20] dt-bindings: usb: meson-g12a-usb: Validate
 DWC2/DWC3 sub-nodes
Message-ID: <20201016185459.GA1740536@bogus>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-16-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014101402.18271-16-Sergey.Semin@baikalelectronics.ru>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 14 Oct 2020 13:13:57 +0300, Serge Semin wrote:
> Amlogic G12A USB DT sub-nodes are supposed to be compatible with the
> generic DWC USB2 and USB3 devices. Since now we've got DT schemas for
> both of the later IP cores let's make sure that the Amlogic G12A USB
> DT nodes are fully evaluated including the DWC sub-nodes.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> 
> ---
> 
> Changelog v2:
> - Use "oneOf: [dwc2.yaml#, snps,dwc3.yaml#]" instead of the bulky "if:
>   properties: compatibe: ..." statement.
> ---
>  .../devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml  | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
