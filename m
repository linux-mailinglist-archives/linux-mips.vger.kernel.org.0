Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA07B290BEC
	for <lists+linux-mips@lfdr.de>; Fri, 16 Oct 2020 20:55:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408070AbgJPSzk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 16 Oct 2020 14:55:40 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:34346 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407918AbgJPSzj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 16 Oct 2020 14:55:39 -0400
Received: by mail-ot1-f67.google.com with SMTP id d28so3402037ote.1;
        Fri, 16 Oct 2020 11:55:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1qsbroh8jyH1La6q3n8nR798td9FmfS1E+IS46iSd8Y=;
        b=YFukM9Hs0zZPzd/cDSYpKHaGondsuhce2OW10oTP47gZ4Y70/rKEK5YOS6lygp8RBz
         9nO5yQ+Skd+BSoTq8q0BVWyFjHyHAl6/xYTFn3vupliy0loQOCq1tz5v/q2RraxIq28N
         KVx2i9RzSFkuuo20r3vr3xghFFpqmPd619TiUj7VbErgkdIPh0sPOoxSe5h+yuOURQMh
         jCKVxnL6MrtkQJspPmxrlGTrj0lLonZbcNwNSEVT0nstERglo0NAbfr2Mvai1xRFSe/J
         n9S92Y2M9VaIx4xA93rDwbHoFneoV4WmZ0XQH0xWQ+R6qAmEMsGT00qy3KGwsZaL2Ei4
         S4hg==
X-Gm-Message-State: AOAM530G4KesshAlgxmrrSH0Gg8ZGNgjuWaQizHAudqOwJiISNnovjlY
        2ytNOdwU76M6gv0QoZL7yg==
X-Google-Smtp-Source: ABdhPJyNJLnYhDVNfMr5gJcHIknRErh64x3+ylvRK0oSof5GJesuJTLIUcPjJE1UUw/Qlq2TlHLyzA==
X-Received: by 2002:a9d:7752:: with SMTP id t18mr3718386otl.341.1602874538699;
        Fri, 16 Oct 2020 11:55:38 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w3sm1380171oop.4.2020.10.16.11.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 11:55:38 -0700 (PDT)
Received: (nullmailer pid 1741601 invoked by uid 1000);
        Fri, 16 Oct 2020 18:55:37 -0000
Date:   Fri, 16 Oct 2020 13:55:37 -0500
From:   Rob Herring <robh@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-snps-arc@lists.infradead.org, Andy Gross <agross@kernel.org>,
        Felipe Balbi <balbi@kernel.org>, linux-arm-msm@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-mips@vger.kernel.org,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Manu Gautam <mgautam@codeaurora.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        devicetree@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
        linuxppc-dev@lists.ozlabs.org, Roger Quadros <rogerq@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 17/20] dt-bindings: usb: qcom,dwc3: Validate DWC3 sub-node
Message-ID: <20201016185537.GA1741555@bogus>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-18-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014101402.18271-18-Sergey.Semin@baikalelectronics.ru>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 14 Oct 2020 13:13:59 +0300, Serge Semin wrote:
> Qualcomm msm8996/sc7180/sdm845 DWC3 compatible DT nodes are supposed to
> have a DWC USB3 compatible sub-node to describe a fully functioning USB
> interface. Let's use the available DWC USB3 DT schema to validate the
> Qualcomm DWC3 sub-nodes.
> 
> Note since the generic DWC USB3 DT node is supposed to be named as generic
> USB HCD ("^usb(@.*)?") one we have to accordingly fix the sub-nodes name
> regexp and fix the DT node example.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> ---
> 
> Changelog v2:
> - Discard the "^dwc3@[0-9a-f]+$" nodes from being acceptable as sub-nodes.
> ---
>  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
