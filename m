Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 052C6290BD9
	for <lists+linux-mips@lfdr.de>; Fri, 16 Oct 2020 20:54:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406172AbgJPSyp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 16 Oct 2020 14:54:45 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:46555 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406163AbgJPSyp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 16 Oct 2020 14:54:45 -0400
Received: by mail-oi1-f196.google.com with SMTP id s81so3516234oie.13;
        Fri, 16 Oct 2020 11:54:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zvMrptKy4dN1SB2yXfhRT5/2zicQozsWBFp3boC0/4A=;
        b=Z2owZL+Kg+ZlpdNpZezieFH8mbmXqNiA6vDt/Zoe2JA568VCeO2pVEfQUMLRzJtjx1
         Va4NyiSpdI5UFrIFLFdVA9IhHidOZKdQmuRc1YeeU5UaSxJe0MemBbe1am3+BaPPH8p5
         ploAvYxZ/8p2EvS1qIgQPmCSAxHPfGrxZAd4ThPBT863ATK8W224B+f7/CZZ+Z/D/96t
         VtRAe1jj3lhyWBHiSb8YzOQaRx2Dj0j/hx5GYJKPIG3aITxkiw5EMHfi7TL9Z8WZALeV
         lXfySQQqlTXGbMnwl6p7qX+j58aPNTMnWVWKb03zCn2mxTw2s2AfNotiPu/KjvyzVwdH
         f/YA==
X-Gm-Message-State: AOAM531KlDjJ3+eRfvfpsSyvhSzGmhwjUyVALCdUPIeBQNAlk688G8kY
        KX8iry8Epd12p0B81Glaug==
X-Google-Smtp-Source: ABdhPJwQ5SzIeBajSNHp8WX+Z/226S6zLuIqiQtpDekHPyQyGxK5/tr2qhLgDAShhSioe6Tiyt355Q==
X-Received: by 2002:aca:bf82:: with SMTP id p124mr3181413oif.133.1602874484098;
        Fri, 16 Oct 2020 11:54:44 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id a82sm1232617oii.44.2020.10.16.11.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 11:54:43 -0700 (PDT)
Received: (nullmailer pid 1740107 invoked by uid 1000);
        Fri, 16 Oct 2020 18:54:42 -0000
Date:   Fri, 16 Oct 2020 13:54:42 -0500
From:   Rob Herring <robh@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     linuxppc-dev@lists.ozlabs.org, Kevin Hilman <khilman@baylibre.com>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        devicetree@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Roger Quadros <rogerq@ti.com>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        linux-amlogic@lists.infradead.org,
        Jerome Brunet <jbrunet@baylibre.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-usb@vger.kernel.org, linux-snps-arc@lists.infradead.org,
        linux-mips@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 14/20] dt-bindings: usb: meson-g12a-usb: Fix FL-adj
 property value
Message-ID: <20201016185442.GA1740059@bogus>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-15-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014101402.18271-15-Sergey.Semin@baikalelectronics.ru>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 14 Oct 2020 13:13:56 +0300, Serge Semin wrote:
> An empty snps,quirk-frame-length-adjustment won't cause any change
> performed by the driver. Moreover the DT schema validation will fail,
> since it expects the property being assigned with some value. So set
> fix the example by setting a valid FL-adj value in accordance with
> Neil Armstrong comment.
> 
> Link: https://lore.kernel.org/linux-usb/20201010224121.12672-16-Sergey.Semin@baikalelectronics.ru/
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Acked-by: Neil Armstrong <narmstrong@baylibre.com>
> 
> ---
> 
> Note the same problem is in the DT source file
> arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi .
> ---
>  .../devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
