Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09CAD290BE5
	for <lists+linux-mips@lfdr.de>; Fri, 16 Oct 2020 20:55:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407466AbgJPSzV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 16 Oct 2020 14:55:21 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:45677 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407458AbgJPSzV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 16 Oct 2020 14:55:21 -0400
Received: by mail-ot1-f66.google.com with SMTP id f37so3342070otf.12;
        Fri, 16 Oct 2020 11:55:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WAD2Bkge9segqyiCp7/h5MSVkGWW1ZGdU9PxYNU4seQ=;
        b=i7vvHx53pxkUBJjksJPRuzaEahUS0ZnH7n5YHT5LyigvMh08fLWjP3yknMKs0d8S8I
         eZu/gVbT/EYyV31QHeiXsJiMtO888QNCWgyX3TDT8Jn6cAiXgOOJsSpKtvZW2RBCJ/On
         QoOX3CZDI7tr6oiaPtp4OJMl4574vEG0a2wke/ps+fNNp4Hxbqkp+atdNZK01083h0Qq
         jjlZWsxQM4fsacYPvZwnn432qIe0AZZNEcyLMd+dhwnVxcyIInEKLnS4EUDFP2lATtgD
         Uom3WJ3Qhn1GsoyaYTMx/0RsPmmBWi9l9nStC3pWqyDWvURq0GIuEnKEwYDo8LpXjfb8
         J1sg==
X-Gm-Message-State: AOAM532urd+zIw9wuWCqOY6ewWjn+nEPPnolqj1Tirs8+UHrmY3hcApb
        aKHCNrnu5SpfKhtaHLA7k1BpHE58kA==
X-Google-Smtp-Source: ABdhPJwbkYhh4uRLlvY2t2XIJwPP8W1OCk6oKHzS/TndVZiwTR4Y/5zgP20uNN5E07f6Hmc/pgEAuQ==
X-Received: by 2002:a05:6830:19e1:: with SMTP id t1mr3751137ott.120.1602874520469;
        Fri, 16 Oct 2020 11:55:20 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x13sm1187735otg.66.2020.10.16.11.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 11:55:19 -0700 (PDT)
Received: (nullmailer pid 1741086 invoked by uid 1000);
        Fri, 16 Oct 2020 18:55:18 -0000
Date:   Fri, 16 Oct 2020 13:55:18 -0500
From:   Rob Herring <robh@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Roger Quadros <rogerq@ti.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-kernel@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-usb@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org,
        linux-snps-arc@lists.infradead.org
Subject: Re: [PATCH 16/20] dt-bindings: usb: keystone-dwc3: Validate DWC3
 sub-node
Message-ID: <20201016185518.GA1741040@bogus>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-17-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014101402.18271-17-Sergey.Semin@baikalelectronics.ru>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 14 Oct 2020 13:13:58 +0300, Serge Semin wrote:
> TI Keystone DWC3 compatible DT node is supposed to have a DWC USB3
> compatible sub-node to describe a fully functioning USB interface.
> Since DWC USB3 has now got a DT schema describing its DT node, let's make
> sure the TI Keystone DWC3 sub-node passes validation against it.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> ---
> 
> Changelog v2:
> - Grammar fix: "s/it'/its"
> ---
>  Documentation/devicetree/bindings/usb/ti,keystone-dwc3.yaml | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
