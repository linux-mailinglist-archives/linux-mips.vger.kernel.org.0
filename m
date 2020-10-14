Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3909628E15A
	for <lists+linux-mips@lfdr.de>; Wed, 14 Oct 2020 15:32:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727703AbgJNNcX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 14 Oct 2020 09:32:23 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:41310 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727250AbgJNNcW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 14 Oct 2020 09:32:22 -0400
Received: by mail-oi1-f195.google.com with SMTP id q136so3207636oic.8;
        Wed, 14 Oct 2020 06:32:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RfUVv3fCiTl2E9POO6Buswiqzr2whvPDBuKBRK/9qXo=;
        b=Br2rDl/wy/hG61xdFs1wMZ/sr69Q+sP0b/xcZpwc2PDXB71uy7D+XpvGpwb26tJdHo
         d2GssCjK4eFZCXwl03Gkfkb3xOVDKEck7USPf8wwRrC6XBCCjewR4OJsG/RPcpvExITA
         WqOcxQNQo1vl/GaZy4w97ZHsW44qcglKfjKQEX883xERjL2esP7bUTQlGKDjIyeNzaWu
         JMApsr6wpBAuiNgeyTXbJYVkyQvGJMq0uy0+09L6UnWlUK7aAmhU+hZoZ6J7qN9o92Zi
         iwoE4tEJS5jRhf9WPLYteKE9kctJrFvHUBolOtwUgoExiqdr+D5UH5cPeEBlQhC4BviO
         GaMw==
X-Gm-Message-State: AOAM530lNJfDpF9cCUG6TLwCQuDMYcBUHmuKbwnWoribjHbRe5A7VNq5
        GjQTAHQQyb5zTPVmLpFkug==
X-Google-Smtp-Source: ABdhPJxd/P4qzAtPsd2916G42APosJoO+yYmHIG+zpWj3QmjNHSypnWafNQcsvqbK5VxDOltQFbAXQ==
X-Received: by 2002:aca:ea84:: with SMTP id i126mr1059134oih.98.1602682341597;
        Wed, 14 Oct 2020 06:32:21 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 92sm1204900otl.1.2020.10.14.06.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2020 06:32:20 -0700 (PDT)
Received: (nullmailer pid 1546268 invoked by uid 1000);
        Wed, 14 Oct 2020 13:32:19 -0000
Date:   Wed, 14 Oct 2020 08:32:19 -0500
From:   Rob Herring <robh@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-usb@vger.kernel.org, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Felipe Balbi <balbi@kernel.org>, Roger Quadros <rogerq@ti.com>,
        linux-arm-kernel@lists.infradead.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-snps-arc@lists.infradead.org,
        Manu Gautam <mgautam@codeaurora.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 09/20] dt-bindings: usb: Convert DWC USB3 bindings to DT
 schema
Message-ID: <20201014133219.GA1545403@bogus>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-10-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014101402.18271-10-Sergey.Semin@baikalelectronics.ru>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 14 Oct 2020 13:13:51 +0300, Serge Semin wrote:
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
> ---
>  .../devicetree/bindings/usb/dwc3.txt          | 125 --------
>  .../devicetree/bindings/usb/snps,dwc3.yaml    | 295 ++++++++++++++++++
>  2 files changed, 295 insertions(+), 125 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/dwc3.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

./Documentation/devicetree/bindings/usb/snps,dwc3.yaml:44:4: [warning] wrong indentation: expected 4 but found 3 (indentation)
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/qcom,dwc3.example.dt.yaml: dwc3@a600000: $nodename:0: 'dwc3@a600000' does not match '^usb(@.*)?'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.example.dt.yaml: usb@ff500000: snps,quirk-frame-length-adjustment: True is not of type 'array'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/snps,dwc3.yaml


See https://patchwork.ozlabs.org/patch/1382003

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

