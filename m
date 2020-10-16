Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 953DD290BD5
	for <lists+linux-mips@lfdr.de>; Fri, 16 Oct 2020 20:54:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404091AbgJPSyS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 16 Oct 2020 14:54:18 -0400
Received: from mail-oo1-f67.google.com ([209.85.161.67]:35060 "EHLO
        mail-oo1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404087AbgJPSyS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 16 Oct 2020 14:54:18 -0400
Received: by mail-oo1-f67.google.com with SMTP id f2so865453ooj.2;
        Fri, 16 Oct 2020 11:54:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rJzbPAxzg6ilw2UkQ6tAV4yqkzoyoHPXjWkUniuz3xs=;
        b=jo9pONncFqjnncQE+jzNuNgxjM8+9RC8zsv2Kj+FQVTdeYDNxSJiC7kbWSIyZFkj30
         uEkXDN/hpIHuRq4nCQ3wBKDldlj6gDOxa7XBPM86y8W8kSdm9JgUR3PC+mEBv5T89i5p
         1kHNoKaeO3XRl7JbsMqMNJnAOSseqXTAIDQiT0S7rkEn1mRYAlHRdJN5ylVbY3WgWjMQ
         JtFM2xbao9LSp7gk/buqr6rra+QPCqvUSUK5l0HSXnWPutfkLTW6SpKy6IN5DzOW8mYw
         nGerHqCP+jCDFY9u7K0DEZL/5BTTfogbKrb6ONMbv0rJY3c2mcHvZezC2o+Iev8T/E0v
         Wu/Q==
X-Gm-Message-State: AOAM531RexQI0hMYd91y7ISOZERszhibqqnaYSbwYNfH1jdL7udu1L/h
        CHiftxSZ29XngCJk7qfQbw==
X-Google-Smtp-Source: ABdhPJxHQw8SwIo5pxcTDGGAB6KVAXfb74xhoP1dlxCV0EYXTwri1nV7bGwspN7IGCzr6tBvWECjQQ==
X-Received: by 2002:a4a:be14:: with SMTP id l20mr3781868oop.27.1602874457029;
        Fri, 16 Oct 2020 11:54:17 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 15sm1393723ooy.36.2020.10.16.11.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 11:54:16 -0700 (PDT)
Received: (nullmailer pid 1739428 invoked by uid 1000);
        Fri, 16 Oct 2020 18:54:15 -0000
Date:   Fri, 16 Oct 2020 13:54:15 -0500
From:   Rob Herring <robh@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Manu Gautam <mgautam@codeaurora.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        Serge Semin <fancer.lancer@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Andy Gross <agross@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Roger Quadros <rogerq@ti.com>, linux-mips@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH 13/20] dt-bindings: usb: dwc3: Add Frame Length Adj
 restrictions
Message-ID: <20201016185415.GA1739379@bogus>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-14-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014101402.18271-14-Sergey.Semin@baikalelectronics.ru>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 14 Oct 2020 13:13:55 +0300, Serge Semin wrote:
> In accordance with the IP core databook the
> snps,quirk-frame-length-adjustment property can be set within [0, 0x3F].
> Let's make sure the DT schema applies a correct restriction on the
> property.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> ---
>  Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
