Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 062F22D16C5
	for <lists+linux-mips@lfdr.de>; Mon,  7 Dec 2020 17:50:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726168AbgLGQuc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 7 Dec 2020 11:50:32 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:38022 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726007AbgLGQub (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 7 Dec 2020 11:50:31 -0500
Received: by mail-ot1-f68.google.com with SMTP id b62so13062988otc.5;
        Mon, 07 Dec 2020 08:50:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UuU157skWGSfcX1NxkRT5BCxvQhS6DEbdRKPwY10+n0=;
        b=hCK6FDD4WU2yynGVHiEr7PlQf2WEC969EJ0vecyIyYzNyLdcXCpFPiT+cIt868FFn/
         XGrut0KXl74RIs+evyFoUkUYQbC+XwrGOZ0ppEEFnG1cRgpueDcFoxNES6n++AFfEyhv
         sEx6PYMh57zw9RLk7TV22Ac2HuN9YUbf4X9UaXEV24ZozqpVO9PM8mlMx9M7PF1dG59E
         oSNgUNNTSrzyaAb0u33l5Grg3rfEEGEMNefIvsWS6HAVdj6vXSO9e/zCebJsyOOPeWDw
         opJTzKxJ879dJAXKMPsJUPkdr0OeZPkDyUiu68XRKf10P4FjsHl8VtSRbK0owYbAjT3r
         +alA==
X-Gm-Message-State: AOAM531z9b6RvfIUU77KY3tXS4Q1gS6J8vksaFaXOQ3VvNvk829MAInq
        HZcAd8eugS4mutGD5MAf8A==
X-Google-Smtp-Source: ABdhPJxmcf4zm/wuxPhsKUoUScvOLy83vfBUwi8g1uPSshO3b0CcihsttcupDMYjJmpikbuM3HuZZw==
X-Received: by 2002:a9d:7304:: with SMTP id e4mr4414560otk.228.1607359790146;
        Mon, 07 Dec 2020 08:49:50 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x72sm3040778oia.16.2020.12.07.08.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 08:49:48 -0800 (PST)
Received: (nullmailer pid 420892 invoked by uid 1000);
        Mon, 07 Dec 2020 16:49:47 -0000
Date:   Mon, 7 Dec 2020 10:49:47 -0600
From:   Rob Herring <robh@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Roger Quadros <rogerq@ti.com>, linux-kernel@vger.kernel.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        devicetree@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        linux-mips@vger.kernel.org, linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linuxppc-dev@lists.ozlabs.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-usb@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v5 10/19] dt-bindings: usb: Convert DWC USB3 bindings to
 DT schema
Message-ID: <20201207164947.GA420349@robh.at.kernel.org>
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


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/usb/snps,dwc3.yaml:55:4: [warning] wrong indentation: expected 4 but found 3 (indentation)

dtschema/dtc warnings/errors:
Unknown file referenced: [Errno 2] No such file or directory: '/usr/local/lib/python3.8/dist-packages/dtschema/schemas/usb/usb-drd.yaml'
xargs: dt-doc-validate: exited with status 255; aborting
make[1]: *** [Documentation/devicetree/bindings/Makefile:59: Documentation/devicetree/bindings/processed-schema-examples.json] Error 124
make: *** [Makefile:1364: dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1411582

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

