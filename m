Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF4E6290B62
	for <lists+linux-mips@lfdr.de>; Fri, 16 Oct 2020 20:34:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391893AbgJPSe1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 16 Oct 2020 14:34:27 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:44954 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390625AbgJPSeP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 16 Oct 2020 14:34:15 -0400
Received: by mail-ot1-f67.google.com with SMTP id e20so3280740otj.11;
        Fri, 16 Oct 2020 11:34:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Qwu3JG9+LDlewH987hNzyQoOEX0CL8g7zvaZjjCcw4U=;
        b=ngP/cqAuwC/pPeCaWClziGog/bfnUC4wbDkk1UBWlN0Gy0fjhEThazJEwNsLKyF/Mv
         fx+QeUXlwZvwbicnnxDcywlJQZy5jaJ3Ssp+wQj6KkLme1V6wAfvEjfFdzuhQu56NAno
         OWGLFo5usW5QIV8YneflEL71C7bx6mlyUWp8mrQdid4sFrwri0CWUJZAAfeRBYRvFoeY
         6Gf2gqQXPOwe3yrLRQK7/cjuIDyZ+FdOwyCg2xUqWX00VBcp493+ZJfxt5QNq4ozc/Yi
         8ZgLcgmn+wMXG8yRrm9gtrgZUWnjCl5JOkP/CnnWkJ4WVdYOfvONZAzsNGGSoFo+m7zr
         uGDg==
X-Gm-Message-State: AOAM532YyJ/bgze11WQPtKiuA+FJPL3BGY4+4IFghtB4mD+a0y0s+4Lz
        7z9CO7mbGTMtcowRWgZNsw==
X-Google-Smtp-Source: ABdhPJyi6z0hP/x6L+MrsJNmQGndEN2hAnyiGpicmxYQV/nKNfR9ytGgBHm+fPvoXX+6vbcG4GvIAA==
X-Received: by 2002:a9d:53cc:: with SMTP id i12mr3447418oth.215.1602873254082;
        Fri, 16 Oct 2020 11:34:14 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m23sm1354610ooq.30.2020.10.16.11.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 11:34:13 -0700 (PDT)
Received: (nullmailer pid 1699483 invoked by uid 1000);
        Fri, 16 Oct 2020 18:34:12 -0000
Date:   Fri, 16 Oct 2020 13:34:12 -0500
From:   Rob Herring <robh@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     linux-snps-arc@lists.infradead.org, linux-usb@vger.kernel.org,
        Serge Semin <fancer.lancer@gmail.com>,
        linux-mips@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Roger Quadros <rogerq@ti.com>, linux-kernel@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Felipe Balbi <balbi@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 03/20] dt-bindings: usb: usb-hcd: Add "ulpi/serial/hsic"
 PHY types
Message-ID: <20201016183412.GA1699346@bogus>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-4-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014101402.18271-4-Sergey.Semin@baikalelectronics.ru>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 14 Oct 2020 13:13:45 +0300, Serge Semin wrote:
> Aside from the UTMI+ there are also ULPI, Serial and HSIC PHY types
> that can be specified in the phy_type HCD property. Add them to the
> enumeration of the acceptable values.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> ---
> 
> Changelog v2:
> - Grammar fix: "s/PHY types can be/PHY types that can be"
> - Drop quotes from around the string constants.
> ---
>  Documentation/devicetree/bindings/usb/usb-hcd.yaml | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
