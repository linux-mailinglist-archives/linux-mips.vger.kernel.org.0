Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AF9E290B60
	for <lists+linux-mips@lfdr.de>; Fri, 16 Oct 2020 20:34:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391963AbgJPSe2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 16 Oct 2020 14:34:28 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:37084 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391885AbgJPSdy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 16 Oct 2020 14:33:54 -0400
Received: by mail-oi1-f194.google.com with SMTP id t77so3503361oie.4;
        Fri, 16 Oct 2020 11:33:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UDTtNlOGm1HvWwHnEyl2J0aIGj7blB2zVqE4G+OLkzg=;
        b=KAUeXffVCDdZbOFs6d/ktjE+xm1h3DHbpzT4xGrPZqfBHR26hPzmUCV4BwxZWxzU7I
         IFe9tMqy03pGMhhgiXm8ET7kmzoCoTKZlDKNp4Ehbo2dkIgEgUXLyTLEkWqsdxqNtu9z
         0zy+NPyNyDtdiARy4UACJmErUWR4/LKLtEWcXvn/mq6PfkOEbSoRM5y3Ab5EFn9Uo4O/
         6r3cnLo5uLc8iEIRzMmHmZNPbVUYjFBH5Kw2uKQs45MExwxBkrYB1DUdaHe0cOwuGaoB
         I+KLuLK67PvojN3kmruuhwBDbb1f9Ok3adgnXNiT3ryrKvs+sQWVDb/QDJuty3AelvdU
         Q5UA==
X-Gm-Message-State: AOAM530Quv/0jooLZU5Ii3sxUOVBB3kHFsDPXGCUKpw/b5NmRY0oxqh3
        JorPJLM9QV41jRIA2BoLxg==
X-Google-Smtp-Source: ABdhPJwJMxgjSojEb765Vf9jtXqW2AE6c488Kfu3npxryBaa3nw0GZZPQdSCsowUayDeivmee8U+9w==
X-Received: by 2002:aca:4485:: with SMTP id r127mr3224405oia.160.1602873233618;
        Fri, 16 Oct 2020 11:33:53 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id z25sm1314185oot.23.2020.10.16.11.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 11:33:53 -0700 (PDT)
Received: (nullmailer pid 1698948 invoked by uid 1000);
        Fri, 16 Oct 2020 18:33:51 -0000
Date:   Fri, 16 Oct 2020 13:33:51 -0500
From:   Rob Herring <robh@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Roger Quadros <rogerq@ti.com>,
        linux-arm-kernel@lists.infradead.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Rob Herring <robh+dt@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        linux-usb@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
        Manu Gautam <mgautam@codeaurora.org>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>, devicetree@vger.kernel.org,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Andy Gross <agross@kernel.org>, linux-mips@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-snps-arc@lists.infradead.org,
        Mathias Nyman <mathias.nyman@intel.com>
Subject: Re: [PATCH 02/20] dt-bindings: usb: usb-hcd: Add "otg-rev" property
 restriction
Message-ID: <20201016183351.GA1698901@bogus>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-3-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014101402.18271-3-Sergey.Semin@baikalelectronics.ru>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 14 Oct 2020 13:13:44 +0300, Serge Semin wrote:
> There are only four OTG revisions are currently supported by the kernel:
> 0x0100, 0x0120, 0x0130, 0x0200. Any another value is considered as
> invalid.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> ---
>  Documentation/devicetree/bindings/usb/usb-hcd.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
