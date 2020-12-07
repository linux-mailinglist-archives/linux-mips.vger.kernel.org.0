Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E2442D16D0
	for <lists+linux-mips@lfdr.de>; Mon,  7 Dec 2020 17:54:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726795AbgLGQvA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 7 Dec 2020 11:51:00 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:42822 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726000AbgLGQvA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 7 Dec 2020 11:51:00 -0500
Received: by mail-oi1-f193.google.com with SMTP id l200so16056907oig.9;
        Mon, 07 Dec 2020 08:50:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sVqHnk5+Qd48rsQgEdxe7AzLNS+jRVeavbI0MHrpgH8=;
        b=mhFKflBCMObZSH17lQMjW+k3zK24dBGsXUr6Y+btuZdO16J3yUt5JGOsFD3bRKdbS9
         /9h38T7Ow3YgKGoIbdFiUYxxOf/LpMq041vSSXtMED5zSBru666D31v+uh8P8VKUPuQ9
         ACeV179mAd/+Fn0PwYjttm+I/PdpTjKoKSkcgC190EzdtH/LPva/UpRvksLmBIXXh32C
         6/KIWuiYiXQ0uPSCqGhul7li4HxzaSyvQCGgp7LGL8cyaAJRuJ2I7ueprfXaAxut3yih
         8og4+gIPJePZ6B2mYKiBbMVbAen8s23gjE7S5DfiUtuCYGmwn4oetotp38irmw31Kl2i
         41gQ==
X-Gm-Message-State: AOAM532Boizf4foSujcvyXZQ2ZWR4Xu6P951zRGk+MHYSa0DbpVwmzoI
        aS7nr3692EcwoUDLalx2PA==
X-Google-Smtp-Source: ABdhPJyi1wFJCXTTwPWZTDNSZYVtXEjaTrMTXAL1g/vcuUtmd8ZXTbe7OhMA8bMQ/ovZiNG8xiPfvg==
X-Received: by 2002:aca:ccc1:: with SMTP id c184mr10424948oig.121.1607359813295;
        Mon, 07 Dec 2020 08:50:13 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id j62sm2730022otc.49.2020.12.07.08.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 08:50:12 -0800 (PST)
Received: (nullmailer pid 421441 invoked by uid 1000);
        Mon, 07 Dec 2020 16:50:10 -0000
Date:   Mon, 7 Dec 2020 10:50:10 -0600
From:   Rob Herring <robh@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        linux-usb@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-snps-arc@lists.infradead.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        devicetree@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Roger Quadros <rogerq@ti.com>, linux-kernel@vger.kernel.org,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Andy Gross <agross@kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v5 01/19] dt-bindings: usb: usb-hcd: Detach generic USB
 controller properties
Message-ID: <20201207165010.GB420349@robh.at.kernel.org>
References: <20201205152427.29537-1-Sergey.Semin@baikalelectronics.ru>
 <20201205152427.29537-2-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201205152427.29537-2-Sergey.Semin@baikalelectronics.ru>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, 05 Dec 2020 18:24:08 +0300, Serge Semin wrote:
> There can be three distinctive types of the USB controllers: USB hosts,
> USB peripherals/gadgets and USB OTG, which can switch from one role to
> another. In order to have that hierarchy handled in the DT binding files,
> we need to collect common properties in a common DT schema and specific
> properties in dedicated schemas. Seeing the usb-hcd.yaml DT schema is
> dedicated for the USB host controllers only, let's move some common
> properties from there into the usb.yaml schema. So the later would be
> available to evaluate all currently supported types of the USB
> controllers.
> 
> While at it add an explicit "additionalProperties: true" into the
> usb-hcd.yaml as setting the additionalProperties/unevaluateProperties
> properties is going to be get mandatory soon.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> ---
> 
> Changelog v4:
> - This is a new patch created as a result of the comment left
>   by Chunfeng Yun in v3
> 
> Changelog v5:
> - Discard duplicated additionalProperties property definition.
> ---
>  .../devicetree/bindings/usb/usb-hcd.yaml      | 14 ++-------
>  .../devicetree/bindings/usb/usb.yaml          | 29 +++++++++++++++++++
>  2 files changed, 31 insertions(+), 12 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/usb/usb.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
schemas/usb/usb-hcd.yaml: ignoring, error in schema: 
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-hcd.yaml: 'anyOf' conditional failed, one must be fixed:
	'properties' is a required property
	'patternProperties' is a required property
schemas/usb/usb-hcd.yaml: ignoring, error in schema: 
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-hcd.yaml: ignoring, error in schema: 
warning: no schema found in file: ./Documentation/devicetree/bindings/usb/usb-hcd.yaml
schemas/usb/usb-hcd.yaml: ignoring, error in schema: 
dt-validate: recursion error: Check for prior errors in a referenced schema
schemas/usb/usb-hcd.yaml: ignoring, error in schema: 
dt-validate: recursion error: Check for prior errors in a referenced schema
schemas/usb/usb-hcd.yaml: ignoring, error in schema: 
dt-validate: recursion error: Check for prior errors in a referenced schema
schemas/usb/usb-hcd.yaml: ignoring, error in schema: 
dt-validate: recursion error: Check for prior errors in a referenced schema
schemas/usb/usb-hcd.yaml: ignoring, error in schema: 
dt-validate: recursion error: Check for prior errors in a referenced schema
dt-validate: recursion error: Check for prior errors in a referenced schema


See https://patchwork.ozlabs.org/patch/1411574

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

