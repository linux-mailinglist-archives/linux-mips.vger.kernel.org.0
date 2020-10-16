Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7676290BB2
	for <lists+linux-mips@lfdr.de>; Fri, 16 Oct 2020 20:49:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403872AbgJPSty (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 16 Oct 2020 14:49:54 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:38910 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403868AbgJPSty (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 16 Oct 2020 14:49:54 -0400
Received: by mail-ot1-f68.google.com with SMTP id i12so3356323ota.5;
        Fri, 16 Oct 2020 11:49:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+7rk6mULs7E7giUj43cA1IP/FNs4mrAUMdNjX3XPy9Q=;
        b=eXsx3Cs/tsami3gZ8aOHL6iKmzgNQgUDk3s3E0PWVIjHT69hu7NiGiW+WcDfMdhnOU
         c8oXpPF0fkt0n7rGcGUWmDpYrfGHYx5HZS9vzU4HkDhTA+efhq3jcbBiKzsYbzRpt10r
         YtEsQZOYK93T91JqCTJeHkqImPmhF58yXy0+/83HIOLTsrhHIkPoTeMg1Ro69zrUVqLR
         FUZIBSI1dOttlEYRR8T+nSmtOrqcdvae0fK4x4dC8DqNZB9JZ2as0Ke120aS+PipzAcM
         UMW+D1irZLfrgoTXtOm98J9yvAVMvaTl0/jU/cnIzEnIuZgoyCfxEuHp3FliApOPq3s7
         NoQQ==
X-Gm-Message-State: AOAM530krRK0JW9CsE5sDV5BPrbxgFvWXGOPtvrYkGgf/OUSBzqWSKfc
        CM99bU4bcY7t/bxJd08XYTB30rkFvw==
X-Google-Smtp-Source: ABdhPJwhDAteawNmw6uR+cUrj6Q9kHmeXiVaLKCaqkOS9AtmXWCjKDSR7JcUL4/bZsjQu3uW2S135A==
X-Received: by 2002:a05:6830:10d3:: with SMTP id z19mr3806259oto.295.1602874193111;
        Fri, 16 Oct 2020 11:49:53 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id h14sm1214366otl.0.2020.10.16.11.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 11:49:52 -0700 (PDT)
Received: (nullmailer pid 1733036 invoked by uid 1000);
        Fri, 16 Oct 2020 18:49:51 -0000
Date:   Fri, 16 Oct 2020 13:49:51 -0500
From:   Rob Herring <robh@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Mathias Nyman <mathias.nyman@intel.com>,
        devicetree@vger.kernel.org, Roger Quadros <rogerq@ti.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linuxppc-dev@lists.ozlabs.org, Felipe Balbi <balbi@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        linux-mips@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-snps-arc@lists.infradead.org, Andy Gross <agross@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 07/20] dt-bindings: usb: xhci: Add Broadcom STB v2
 compatible device
Message-ID: <20201016184951.GA1732957@bogus>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-8-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014101402.18271-8-Sergey.Semin@baikalelectronics.ru>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 14 Oct 2020 13:13:49 +0300, Serge Semin wrote:
> For some reason the "brcm,xhci-brcm-v2" compatible string has been missing
> in the original bindings file. Add it to the Generic xHCI Controllers DT
> schema since the controller driver expects it to be supported.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> ---
>  Documentation/devicetree/bindings/usb/generic-xhci.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
