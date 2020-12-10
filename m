Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A7BD2D514C
	for <lists+linux-mips@lfdr.de>; Thu, 10 Dec 2020 04:26:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729456AbgLJDZe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 9 Dec 2020 22:25:34 -0500
Received: from mail-oo1-f66.google.com ([209.85.161.66]:36312 "EHLO
        mail-oo1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729002AbgLJDZb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 9 Dec 2020 22:25:31 -0500
Received: by mail-oo1-f66.google.com with SMTP id j8so958347oon.3;
        Wed, 09 Dec 2020 19:25:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SGHystu8KEcuTA0RNExv/VnJoWPktKLvdV3bpnziI/o=;
        b=fD0RQJop7KquIVS6OTt4/Y/vF4VBO2sOE5+TuF4qWHh/9huRsOsM1Bjb5YI63Fzj9B
         A95sGEu1XiHzqZfoW5XgrsJnmWz+XlM3CeFGolcQFR1Pkxgq1w2BGNuYVCMfy+Hy5K+2
         ehzAbYwn+Sojxv+JVXtZOpLs/2NmsPuW6POFOWFo/EiBF5G899yjMs7Ff1zYvH8rPm1b
         EXplGoz9wgU/O4NJfRBqbB2Ly+MYpH0Ue+92M7WlBGLEAO+2CDjHKEazGyJe7a3G6JPp
         3f9qWOxo3hyfikVq622rl1SPpeklmKA46zmzq/PgBZswX3d2EW5Y0LE+viheDyJxWCAF
         KUdQ==
X-Gm-Message-State: AOAM530WViBjaImgG3wMurajsSsIXcpgEwXN4mBuUvSNPq1uQ3c7lUJn
        Wz0jeLV6mIbseP/skQbEYA==
X-Google-Smtp-Source: ABdhPJxVr0iv7i61NhYxL1VKmCWErqvhvd6h7QtNaiu4n9B+aJ0EfyOf4EsAk/DaMrnShrdMqign7w==
X-Received: by 2002:a4a:6b4d:: with SMTP id h13mr4541165oof.67.1607570690575;
        Wed, 09 Dec 2020 19:24:50 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q18sm749828ood.35.2020.12.09.19.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 19:24:49 -0800 (PST)
Received: (nullmailer pid 1591441 invoked by uid 1000);
        Thu, 10 Dec 2020 03:24:48 -0000
Date:   Wed, 9 Dec 2020 21:24:48 -0600
From:   Rob Herring <robh@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     linux-snps-arc@lists.infradead.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-mips@vger.kernel.org,
        Mathias Nyman <mathias.nyman@intel.com>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Andy Gross <agross@kernel.org>, Roger Quadros <rogerq@ti.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-usb@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        devicetree@vger.kernel.org,
        Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
        linuxppc-dev@lists.ozlabs.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        linux-arm-kernel@lists.infradead.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Felipe Balbi <balbi@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v5 12/19] dt-bindings: usb: dwc3: Add synopsys, dwc3
 compatible string
Message-ID: <20201210032448.GA1591395@robh.at.kernel.org>
References: <20201205152427.29537-1-Sergey.Semin@baikalelectronics.ru>
 <20201205152427.29537-13-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201205152427.29537-13-Sergey.Semin@baikalelectronics.ru>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, 05 Dec 2020 18:24:19 +0300, Serge Semin wrote:
> The DWC USB3 driver and some DTS files like Exynos 5250, Keystone k2e, etc
> expects the DWC USB3 DT node to have the compatible string with the
> "synopsys" vendor prefix. Let's add the corresponding compatible string to
> the controller DT schema, but mark it as deprecated seeing the Synopsys,
> Inc. is presented with just "snps" vendor prefix.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> ---
> 
> Changelog v2:
> - Drop quotes from around the compat string constant.
> 
> Changelog v4:
> - Get the patch back, since we can't discard the deprecated prefix from the
>   driver.
> ---
>  Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
