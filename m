Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FA69290BD3
	for <lists+linux-mips@lfdr.de>; Fri, 16 Oct 2020 20:54:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404075AbgJPSyE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 16 Oct 2020 14:54:04 -0400
Received: from mail-oo1-f68.google.com ([209.85.161.68]:37418 "EHLO
        mail-oo1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404070AbgJPSyE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 16 Oct 2020 14:54:04 -0400
Received: by mail-oo1-f68.google.com with SMTP id f19so860755oot.4;
        Fri, 16 Oct 2020 11:54:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2SJo91FUryiudrvp7hFXXd3itA6M64t3t+PTG337Wos=;
        b=UwYR9/eipCpCryDb+GPd0Wl0bMmMHodPIrNredQu7j1COmV32PWRdvcBMUni+JKiYn
         DrwFkPiJU+A5qGaSGWaY0MPqWYQ+TQaF+l+6TDzCZGLZXwLzdH7zVa9jm95GIhTv+rUe
         CaEwSxEkTERX9C/r21jldKK/UA9fcH9mxslz4+Lu4HICdizZ8FGl2rnhIfesknH3r/YT
         HllL4shWXD79x0aelSsQdQlHi9OOXGwd8fTVRvxHjVeTYwId4Ksgy6OFSqvJ1sHj1FCh
         iVe1Iqxupcx6XQi/VwMt9wxOXnBvDCj+IwLKw7Qm9tu/k1M4W/X5s97jmpmQ1TeTr6q3
         GNiA==
X-Gm-Message-State: AOAM530d1AbdfEVQbG4CYMz3D/qFK4O1xh2y4UYfMUDTCI5Njooezb+o
        8s3qcUlukOSZCw0W/lA6OA==
X-Google-Smtp-Source: ABdhPJxqrZ90dBQRwNY763mNG9iHYX8vq1NLO807gpJ9dzO8ZYI7ue+E+B9W403xLk4jO317PbFvMA==
X-Received: by 2002:a4a:be14:: with SMTP id l20mr3781334oop.27.1602874443081;
        Fri, 16 Oct 2020 11:54:03 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k6sm1204239otp.33.2020.10.16.11.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 11:54:02 -0700 (PDT)
Received: (nullmailer pid 1739020 invoked by uid 1000);
        Fri, 16 Oct 2020 18:54:01 -0000
Date:   Fri, 16 Oct 2020 13:54:01 -0500
From:   Rob Herring <robh@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        linux-usb@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-mips@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>, Roger Quadros <rogerq@ti.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        Manu Gautam <mgautam@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 12/20] dt-bindings: usb: dwc3: Add Tx De-emphasis
 restrictions
Message-ID: <20201016185401.GA1738966@bogus>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-13-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014101402.18271-13-Sergey.Semin@baikalelectronics.ru>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 14 Oct 2020 13:13:54 +0300, Serge Semin wrote:
> In accordance with the driver comments the PIPE3 de-emphasis can be tuned
> to be either -6dB, -2.5dB or disabled. Let's add the de-emphasis
> property restriction so the DT schema would make sure the controller DT
> node is equipped with correct value.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> ---
> 
> Changelog v2:
> - Grammar fix: "s/tunned/tuned"
> - Grammar fix: remove redundant "or" conjunction.
> ---
>  Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
