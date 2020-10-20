Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 008EB293FBE
	for <lists+linux-mips@lfdr.de>; Tue, 20 Oct 2020 17:41:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436686AbgJTPk4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 20 Oct 2020 11:40:56 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:42458 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436684AbgJTPk4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 20 Oct 2020 11:40:56 -0400
Received: by mail-ot1-f65.google.com with SMTP id h62so2092368oth.9;
        Tue, 20 Oct 2020 08:40:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bPJ41BbXrVBpKagW0AFLuDG820FKrJowO4JL4r2A7Mg=;
        b=m4MKVE45v8ptwLdXIBne6C7bj0k194iIGvR0uaWxLQdrmz2sXl73ncM8gnWD8D3T/7
         Xipn/2TG3I+T7sRuOjOBLGhfXgYs4zJVxm/z9qmtcQ24QtsFAUeuq7y48tX/EzHXN4j9
         1/AEtUth7a3owBen/kGHFWmNH/cxKfavmT/h6zo3KpnCAcpGtP3GQBBfIhPmNDAC5Aty
         dzFCbHUkkNbLrEtQpr1raAoDRM9g5azcWIozLoV2LIUCCFiFrBqFAjGr48Aq95cqU1Kc
         sTpew5Qv06Bmd3xXeSccNcTiQ+t8zrIejJmixgtdqPxurMZLkeZTp08p1+XIRX65IfU3
         3GLA==
X-Gm-Message-State: AOAM532gYW5KO+cAiSb6r8Jz+3fAhMTYGgeO7s3x5HWKYz/1Dggl+9Dx
        UidkcgaHJAU+O1hpQMvGPA==
X-Google-Smtp-Source: ABdhPJxaxCIP6Kd2pnNLtDOo2/dAgOtLCptI3qgvO+i9WOyGybYr0U/8yYzB9sCXkm1PHVRrZpc3zw==
X-Received: by 2002:a9d:6:: with SMTP id 6mr1983535ota.235.1603208454213;
        Tue, 20 Oct 2020 08:40:54 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i14sm515801ota.59.2020.10.20.08.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2020 08:40:53 -0700 (PDT)
Received: (nullmailer pid 889399 invoked by uid 1000);
        Tue, 20 Oct 2020 15:40:52 -0000
Date:   Tue, 20 Oct 2020 10:40:52 -0500
From:   Rob Herring <robh@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-mips@vger.kernel.org, linux-snps-arc@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-kernel@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Kevin Hilman <khilman@baylibre.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Roger Quadros <rogerq@ti.com>, devicetree@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v3 09/16] dt-bindings: usb: Convert DWC USB3 bindings to
 DT schema
Message-ID: <20201020154052.GA889228@bogus>
References: <20201020112101.19077-1-Sergey.Semin@baikalelectronics.ru>
 <20201020112101.19077-10-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201020112101.19077-10-Sergey.Semin@baikalelectronics.ru>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 20 Oct 2020 14:20:54 +0300, Serge Semin wrote:
> DWC USB3 DT node is supposed to be compliant with the Generic xHCI
> Controller schema, but with additional vendor-specific properties, the
> controller-specific reference clocks and PHYs. So let's convert the
> currently available legacy text-based DWC USB3 bindings to the DT schema
> and make sure the DWC USB3 nodes are also validated against the
> usb-xhci.yaml schema.
> 
> Note we have to discard the nodename restriction of being prefixed with
> "dwc3@" string, since in accordance with the usb-hcd.yaml schema USB nodes
> are supposed to be named as "^usb(@.*)".
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> ---
> 
> Changelog v2:
> - Discard '|' from the descriptions, since we don't need to preserve
>   the text formatting in any of them.
> - Drop quotes from around the string constants.
> - Fix the "clock-names" prop description to be referring the enumerated
>   clock-names instead of the ones from the Databook.
> 
> Changelog v3:
> - Apply usb-xhci.yaml# schema only if the controller is supposed to work
>   as either host or otg.
> ---
>  .../devicetree/bindings/usb/dwc3.txt          | 125 --------
>  .../devicetree/bindings/usb/snps,dwc3.yaml    | 302 ++++++++++++++++++
>  2 files changed, 302 insertions(+), 125 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/dwc3.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
