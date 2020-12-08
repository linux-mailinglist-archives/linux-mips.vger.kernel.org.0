Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A02D2D2E12
	for <lists+linux-mips@lfdr.de>; Tue,  8 Dec 2020 16:23:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730006AbgLHPWJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Dec 2020 10:22:09 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:34519 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729334AbgLHPWI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Dec 2020 10:22:08 -0500
Received: by mail-ot1-f66.google.com with SMTP id a109so491728otc.1;
        Tue, 08 Dec 2020 07:21:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IQ3hrRr5CR/EHc+P2sk3O7yO90fJ2PV9jiKrnTl/JOE=;
        b=Gb/FuTyn+nNaXeU7lOwcaB4pBKAMoV/igr3nasJEYZdNFWb4VNztcBDxS42qpT45ji
         RhXa5veknPwRYxAFDQZxvgswRvvFas7YF2dLATvpEV//3r/KSLiOk3wAktB8wxFJPegd
         /jGZOZGT7Q3rn7aHuVMYNZdAiqf5xLK1tJ4ZRj+vMGSlRylfsr7SV7LUdHS2auc+iajp
         7CiKeCt0/odUuFgDc1wpQSWKWFb5MNdA3ccp32A9b9R7mo8DtNCjkgZAGiCn0EbdqW7C
         zTcAHO0dIuj/7yeT0X9Ho+CMsK6XgiVoa5oARzblssGqv+fmDFGWSQOS5YGRa0LZHnO+
         PGcw==
X-Gm-Message-State: AOAM531LXgfZsZR5UI9BRKC49e6Cm29pXjjhFpz8cHQbhJHS94/fX+Lp
        y9Kbn3QjGtjakytnWM9hVw==
X-Google-Smtp-Source: ABdhPJzmCHNnVAHVBS3T6eGsSQKp+szBNnE+KgDyZOtKt+lyLKF1btlAQoWaO2PnCHLoZUrZlxBiKg==
X-Received: by 2002:a05:6830:1352:: with SMTP id r18mr16663484otq.73.1607440887454;
        Tue, 08 Dec 2020 07:21:27 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id u130sm3717886oib.53.2020.12.08.07.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 07:21:25 -0800 (PST)
Received: (nullmailer pid 2539592 invoked by uid 1000);
        Tue, 08 Dec 2020 15:21:23 -0000
Date:   Tue, 8 Dec 2020 09:21:23 -0600
From:   Rob Herring <robh@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        devicetree@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Manu Gautam <mgautam@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        linux-arm-kernel@lists.infradead.org,
        Kevin Hilman <khilman@baylibre.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-snps-arc@lists.infradead.org,
        Serge Semin <fancer.lancer@gmail.com>,
        linux-usb@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linuxppc-dev@lists.ozlabs.org, Felipe Balbi <balbi@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Roger Quadros <rogerq@ti.com>, linux-mips@vger.kernel.org
Subject: Re: [PATCH v5 10/19] dt-bindings: usb: Convert DWC USB3 bindings to
 DT schema
Message-ID: <20201208152123.GA2539227@robh.at.kernel.org>
References: <20201205152427.29537-1-Sergey.Semin@baikalelectronics.ru>
 <20201205152427.29537-11-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201205152427.29537-11-Sergey.Semin@baikalelectronics.ru>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, 05 Dec 2020 18:24:17 +0300, Serge Semin wrote:
> DWC USB3 DT node is supposed to be compliant with the Generic xHCI
> Controller schema, but with additional vendor-specific properties, the
> controller-specific reference clocks and PHYs. So let's convert the
> currently available legacy text-based DWC USB3 bindings to the DT schema
> and make sure the DWC USB3 nodes are also validated against the
> usb-xhci.yaml schema.
> 
> Note 1. we have to discard the nodename restriction of being prefixed with
> "dwc3@" string, since in accordance with the usb-hcd.yaml schema USB nodes
> are supposed to be named as "^usb(@.*)".
> 
> Note 2. The clock-related properties are marked as optional to match the
> DWC USB3 driver expectation and to improve the bindings mainainability
> so in case if there is a glue-node it would the responsible for the
> clocks initialization.
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
> 
> Changelog v4:
> - Apply usb-drd.yaml schema first. If the controller is configured
>   to work in a gadget mode only, then apply the usb.yaml schema too,
>   otherwise apply the usb-xhci.yaml schema.
> - Discard the Rob'es Reviewed-by tag. Please review the patch one more
>   time.
> 
> Changelog v5:
> - Add "snps,dis-split-quirk" property to the DWC USB3 DT schema.
> - Add a commit log text about the clock-related property changes.
> - Make sure dr_mode exist to apply the USB-gadget-only schema.
> ---
>  .../devicetree/bindings/usb/dwc3.txt          | 128 -------
>  .../devicetree/bindings/usb/snps,dwc3.yaml    | 312 ++++++++++++++++++
>  2 files changed, 312 insertions(+), 128 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/dwc3.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
