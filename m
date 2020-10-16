Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D38C290BC1
	for <lists+linux-mips@lfdr.de>; Fri, 16 Oct 2020 20:50:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403935AbgJPSuf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 16 Oct 2020 14:50:35 -0400
Received: from mail-oo1-f68.google.com ([209.85.161.68]:36499 "EHLO
        mail-oo1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403933AbgJPSuf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 16 Oct 2020 14:50:35 -0400
Received: by mail-oo1-f68.google.com with SMTP id z1so863442ooj.3;
        Fri, 16 Oct 2020 11:50:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tQIAtcfZOgzbTee3ynuA+97EgTw4Y5zn1K5sehyraYU=;
        b=U72hTD7ndluWvnIbav8UOywurDRG6f6Rbtunv3wosKGf5v4PI/CVHnRjVRuawDofOz
         Bn9E8YhEiVYdJlWgFY8RtP58HDkblSqve16UV2XoQEJVWuBIg7hnV72msA2o3KpLbsGX
         laItSuOVk1r9I8qogaTZKnI2TD7prZtZgQ/mR0urPWMsH/Xhoc/S+hWtjv4RIa0fUQi2
         Hy0rJHy9G/zoQPth/KyNMZMfo3WJtf4WVaRhefcmomJxxy/iVSkvmhgNPm2rWXFF7I6O
         Qoo1HS/Ov7isWTAAbjOxglDYUZXSY++Ci6nqFJgs4C71Lc512hfEExWRECi/kHhIiw9y
         fFFg==
X-Gm-Message-State: AOAM531MEoxkTqWQ3m1/ITw3M8HLrzuu+EA/b9RdUAbIZa9tQbiVpVFl
        CZ+lIT0v41oPqZlvJ9lRxw==
X-Google-Smtp-Source: ABdhPJxlpklNvXwoGw9+00fyPv9Ov10bBunf9ANT94mdSsa1luXvKLcFtohW6R2sBFI6b/zUGoM++g==
X-Received: by 2002:a4a:d815:: with SMTP id f21mr3846003oov.44.1602874234188;
        Fri, 16 Oct 2020 11:50:34 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x13sm1372705oot.24.2020.10.16.11.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 11:50:33 -0700 (PDT)
Received: (nullmailer pid 1734139 invoked by uid 1000);
        Fri, 16 Oct 2020 18:50:32 -0000
Date:   Fri, 16 Oct 2020 13:50:32 -0500
From:   Rob Herring <robh@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-snps-arc@lists.infradead.org,
        Felipe Balbi <balbi@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Roger Quadros <rogerq@ti.com>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Andy Gross <agross@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 10/20] dt-bindings: usb: dwc3: Add interrupt-names
 property support
Message-ID: <20201016185032.GA1734092@bogus>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-11-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014101402.18271-11-Sergey.Semin@baikalelectronics.ru>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 14 Oct 2020 13:13:52 +0300, Serge Semin wrote:
> The controller driver supports two types of DWC USB3 devices: with a
> common interrupt lane and with individual interrupts for each mode. Add
> support for both these cases to the DWC USB3 DT schema.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> ---
> 
> Changelog v2:
> - Grammar fix: "s/both of these cases support/support for both these cases"
> - Drop quotes from around the string constants.
> ---
>  Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
