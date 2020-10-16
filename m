Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7AD1290BAD
	for <lists+linux-mips@lfdr.de>; Fri, 16 Oct 2020 20:49:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403843AbgJPStY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 16 Oct 2020 14:49:24 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:33453 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390142AbgJPStX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 16 Oct 2020 14:49:23 -0400
Received: by mail-oi1-f196.google.com with SMTP id s21so3569701oij.0;
        Fri, 16 Oct 2020 11:49:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3MxugCiE5y0heSpZifDkccjElq8hTuw4iGDrR5HUSmI=;
        b=OUAXikZuiDr71yEkCYphgaD+qJmNhBCYQdNiQwJxPuRs4Zaa5DgM69l6WSbkPgZjTz
         inN22ZAdfYhvLbvfH8X2pM1bz5i/JMvLvXtRASVMQj2g3zCnyq8f63nxURGKPH8M1z83
         1lnNxapD5WMFb2jdu+yMejAl82OMpD+TuuK3Mabgwmt34pP1rVpqnm6ue5LaG0DiGXFG
         a/YZ5WT73TyxpSeSCHvPwJ4vvvq4LPzPS8X+tgdWDk2t8zmoCe66GDVVUomgADl+RitT
         9w6bc5CJUYRCILhuw5VHRONrUQlW55jmoj8XcRA6Y0PibT4Jb2y/dlSu3DROs8Yvvw//
         PaQQ==
X-Gm-Message-State: AOAM531vjKpmrA09y1EKKyyocMuUdhX9COidv3sKCJB0Gr7lqTJXMwlL
        lLrco27lecknDFlYa3Tp3Q==
X-Google-Smtp-Source: ABdhPJxhlHWdR759W2/ZwO3kHuI+wtcySV279kCyDwV40mkUK/8z3O06wkP5ssZVrgQY5g1y7yDEXA==
X-Received: by 2002:aca:bf82:: with SMTP id p124mr3170755oif.133.1602874162686;
        Fri, 16 Oct 2020 11:49:22 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id d11sm1192131otf.44.2020.10.16.11.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 11:49:22 -0700 (PDT)
Received: (nullmailer pid 1732283 invoked by uid 1000);
        Fri, 16 Oct 2020 18:49:21 -0000
Date:   Fri, 16 Oct 2020 13:49:21 -0500
From:   Rob Herring <robh@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Manu Gautam <mgautam@codeaurora.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-mips@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linuxppc-dev@lists.ozlabs.org,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        linux-usb@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 06/20] dt-bindings: usb: Convert xHCI bindings to DT
 schema
Message-ID: <20201016184921.GA1732241@bogus>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-7-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014101402.18271-7-Sergey.Semin@baikalelectronics.ru>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 14 Oct 2020 13:13:48 +0300, Serge Semin wrote:
> Currently the DT bindings of Generic xHCI Controllers are described by means
> of the legacy text file. Since such format is deprecated in favor of the
> DT schema, let's convert the Generic xHCI Controllers bindings file to the
> corresponding yaml files. There will be two of them: a DT schema for the
> xHCI controllers on a generic platform and a DT schema validating a generic
> xHCI controllers properties. The later will be used to validate the xHCI
> controllers, which aside from some vendor-specific features support the
> basic xHCI functionality.
> 
> An xHCI-compatible DT node shall support the standard USB HCD properties
> and custom ones like: usb2-lpm-disable, usb3-lpm-capable,
> quirk-broken-port-ped and imod-interval-ns. In addition if a generic xHCI
> controller is being validated against the DT schema it is also supposed to
> be equipped with mandatory compatible string, single registers range,
> single interrupts source, and is supposed to optionally contain up to two
> reference clocks for the controller core and CSRs.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> ---
> 
> Changelog v2:
> - Add explicit "additionalProperties: true" to the usb-xhci.yaml schema,
>   since additionalProperties/unevaluatedProperties are going to be mandary
>   for each binding.
> ---
>  .../devicetree/bindings/usb/generic-xhci.yaml | 63 +++++++++++++++++++
>  .../devicetree/bindings/usb/usb-xhci.txt      | 41 ------------
>  .../devicetree/bindings/usb/usb-xhci.yaml     | 42 +++++++++++++
>  3 files changed, 105 insertions(+), 41 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/usb/generic-xhci.yaml
>  delete mode 100644 Documentation/devicetree/bindings/usb/usb-xhci.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/usb-xhci.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
