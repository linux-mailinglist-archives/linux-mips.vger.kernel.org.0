Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29A4F290BB7
	for <lists+linux-mips@lfdr.de>; Fri, 16 Oct 2020 20:50:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403890AbgJPSuK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 16 Oct 2020 14:50:10 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:45126 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403889AbgJPSuK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 16 Oct 2020 14:50:10 -0400
Received: by mail-ot1-f66.google.com with SMTP id f37so3326972otf.12;
        Fri, 16 Oct 2020 11:50:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tsEFGFDEJB33aFAr/ryJhZmR4NK4qeJppeYiZlNUE6k=;
        b=FHzypmEFW2rhOiXewDedbcaMsbTNvFeT5dM6s3ucj4RJFbySIkUojwNI+TMjbKdrvO
         c8AEwzzSxhq8YOpw+9Quq7EPvuPhaF1oATztYrVNpMt+3UIc2kNkwlMkYPnelyYyNxWh
         Nzngm1X8fXFYlwAfn2/Sb3lm/bW86MqB58iCf/SSiQdFPAruVf1Fu93zWhEZyx8ZbZpg
         OxhQpOqFmkgmaYJSy1yQqM+vMOV39UCjKXpJO8equpg1lzyD/JLydc3gSCtjbcPS6FQF
         1bQ/CKxEVbcJB772CWKsHGIHXpK+dX9if0OL8YrKoZWJq0qJIK3Bky47pJcIMJW9owOf
         /UvQ==
X-Gm-Message-State: AOAM533fL1kMGUmbqpQ6K4waomed6f8S8LklI74bZ5cHGzmgZixcwAWg
        BPps6afWX8c+8Q4aDC0zjA==
X-Google-Smtp-Source: ABdhPJwf1V8jGj40xsK56aM87EAIEjSM8YWRrCdA3QZNoYzUf4866Tswq3wAkcC4d06N05OwEMwF9Q==
X-Received: by 2002:a9d:6c16:: with SMTP id f22mr3379029otq.173.1602874209610;
        Fri, 16 Oct 2020 11:50:09 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l138sm1260817oih.32.2020.10.16.11.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 11:50:09 -0700 (PDT)
Received: (nullmailer pid 1733506 invoked by uid 1000);
        Fri, 16 Oct 2020 18:50:07 -0000
Date:   Fri, 16 Oct 2020 13:50:07 -0500
From:   Rob Herring <robh@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Andy Gross <agross@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-snps-arc@lists.infradead.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        linux-kernel@vger.kernel.org,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Felipe Balbi <balbi@kernel.org>, Roger Quadros <rogerq@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        linuxppc-dev@lists.ozlabs.org, Kevin Hilman <khilman@baylibre.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-arm-kernel@lists.infradead.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH 08/20] dt-bindings: usb: renesas-xhci: Refer to the
 usb-xhci.yaml file
Message-ID: <20201016185007.GA1733460@bogus>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-9-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014101402.18271-9-Sergey.Semin@baikalelectronics.ru>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 14 Oct 2020 13:13:50 +0300, Serge Semin wrote:
> With minor peculiarities (like uploading some vendor-specific firmware)
> these are just Generic xHCI controllers fully compatible with its
> properties. Make sure the Renesas USB xHCI DT nodes are also validated
> against the Generic xHCI DT schema.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> ---
>  Documentation/devicetree/bindings/usb/renesas,usb-xhci.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
