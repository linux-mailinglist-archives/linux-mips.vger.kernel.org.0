Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7AF2290BA3
	for <lists+linux-mips@lfdr.de>; Fri, 16 Oct 2020 20:47:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393017AbgJPSrq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 16 Oct 2020 14:47:46 -0400
Received: from mail-oo1-f68.google.com ([209.85.161.68]:34886 "EHLO
        mail-oo1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393016AbgJPSrq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 16 Oct 2020 14:47:46 -0400
Received: by mail-oo1-f68.google.com with SMTP id f2so860497ooj.2;
        Fri, 16 Oct 2020 11:47:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ah4l6QAR2mQ0/oHGxUZvIiL/bIHnlL8stCXNgxk0zPU=;
        b=G+jNTM163zK9UZ0z77v5dXhWdQfUBO62QnF/xsDc1P0DI2so4pRpIbH791JC7O2qPQ
         WG/7Y65s6S7jjCvFgchWEozdDbbLwBwJNtffAnqKUvtXB/Jelthq0Y5VmM45Et70mGdo
         pX0vfZ91F2jo465Z/uR6Y3mfGz11o0npT8Gew95wJcy0Ukytf5JMhRSXFF4IgrCcMVGh
         luojozI1vHM2AT09uj4B/OUVMr6sFcNI11yuE7DKy7GR4iMtGzBCOzfjgPoFKEw1199I
         is/CxQZVuMxwPLYr5Q9GLQ+6v38BhyL5YO3xgidyJkORMdyJJrFnNKrVjcv+9Ez+Xfc1
         WP7Q==
X-Gm-Message-State: AOAM532Orx7OM6nyDIHWJfLhrcQO2ph/qovA3LkeAx0cvsUdkMxmz6B7
        WxxAGF89WL627i2jWXm4f4QUFpRm9A==
X-Google-Smtp-Source: ABdhPJwi2sSg9TbyxlBb9FKSGQY3aAdhbGYA8TNts9SijJNIvpVCDN/KL4oZNOHs+2wFaZc9X3ZX/w==
X-Received: by 2002:a4a:e592:: with SMTP id o18mr3759398oov.28.1602874065319;
        Fri, 16 Oct 2020 11:47:45 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 189sm1239683oid.40.2020.10.16.11.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 11:47:44 -0700 (PDT)
Received: (nullmailer pid 1729968 invoked by uid 1000);
        Fri, 16 Oct 2020 18:47:43 -0000
Date:   Fri, 16 Oct 2020 13:47:43 -0500
From:   Rob Herring <robh@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     devicetree@vger.kernel.org,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Roger Quadros <rogerq@ti.com>, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-snps-arc@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        linuxppc-dev@lists.ozlabs.org, Felipe Balbi <balbi@kernel.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Subject: Re: [PATCH 05/20] dt-bindings: usb: usb-hcd: Add generic "usb-phy"
 property
Message-ID: <20201016184743.GA1729897@bogus>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-6-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014101402.18271-6-Sergey.Semin@baikalelectronics.ru>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 14 Oct 2020 13:13:47 +0300, Serge Semin wrote:
> Even though the Generic PHY framework is the more preferable way of
> setting the USB PHY up, there are still many dts-files and DT bindings
> which rely on having the legacy "usb-phy" specified to attach particular
> USB PHYs to USB cores. Let's have the "usb-phy" property described in
> the generic USB HCD binding file so it would be validated against the
> nodes in which it's specified. Mark the property as deprecated to
> discourage the developers from using it.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> ---
> 
> Changelog v2:
> - Discard '|' from the property description, since we don't need to preserve
>   the text formatting.
> ---
>  Documentation/devicetree/bindings/usb/usb-hcd.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
