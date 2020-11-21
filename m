Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC7A12BBF03
	for <lists+linux-mips@lfdr.de>; Sat, 21 Nov 2020 13:46:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727787AbgKUMoM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 21 Nov 2020 07:44:12 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:36628 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727699AbgKUMoL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 21 Nov 2020 07:44:11 -0500
Received: by mail-ot1-f66.google.com with SMTP id y24so5910047otk.3;
        Sat, 21 Nov 2020 04:44:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=O6Nr/Rieym0i/OHuod4YgdUg5NHz7ccPxXo1aK1Oha0=;
        b=jmuyJkOc+U7TsmNsImpbp278LLx9OYx4opT4ekriETd7sUWbRofa00xdag2L581Eyi
         SJeYtwje0nHEs0TYJKQ9bVfeVFbU4hqjX1LAdsroEmjlYw+k/diZPGMPiIaJoBSd5M8O
         4EzdoCATP1CO8lyh9als75yE5b7MfQm5yYlUnOQPYgd22cYVQGlqUxrZh/Ttz26HtR0S
         bPpkf8KvewsWBmgF2VEgp8Y1EaP+gtZNdkJad9kA3XJVs1nPjxuHNg2Hegf+n+vyJub5
         QKvcBMQFhePY6MOji+8Tg8zx9QNQWSd3WR0IIVioWWgEp1utEXrq1j2MpaODTqnU2D/+
         64vA==
X-Gm-Message-State: AOAM531GPiIC15fOge+reTlo113ur7rUBLsbTfsTPOFt4uufDo0iYT6b
        RONjgcCrO2lxadE5AgomuQ==
X-Google-Smtp-Source: ABdhPJw3HoleXj4Ds9tiz5eVa//gqnZHEYkUUG/e1jSOlz7u3ljD+0RipYCaATEwmrx6h4HXBMJXYg==
X-Received: by 2002:a05:6830:1283:: with SMTP id z3mr18198570otp.323.1605962650796;
        Sat, 21 Nov 2020 04:44:10 -0800 (PST)
Received: from xps15 ([2607:fb90:5feb:6270:cdf7:680e:59f2:6ccd])
        by smtp.gmail.com with ESMTPSA id t5sm3116800oth.16.2020.11.21.04.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2020 04:44:10 -0800 (PST)
Received: (nullmailer pid 2067061 invoked by uid 1000);
        Sat, 21 Nov 2020 12:44:03 -0000
Date:   Sat, 21 Nov 2020 06:44:03 -0600
From:   Rob Herring <robh@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-mips@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Andy Gross <agross@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        Rob Herring <robh+dt@kernel.org>, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Roger Quadros <rogerq@ti.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Manu Gautam <mgautam@codeaurora.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v4 02/18] dt-bindings: usb: Convert generic USB
 properties to DT schemas
Message-ID: <20201121124403.GA2066237@robh.at.kernel.org>
References: <20201111090853.14112-1-Sergey.Semin@baikalelectronics.ru>
 <20201111090853.14112-3-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201111090853.14112-3-Sergey.Semin@baikalelectronics.ru>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 11 Nov 2020 12:08:37 +0300, Serge Semin wrote:
> The generic USB properties have been described in the legacy bindings
> text file: Documentation/devicetree/bindings/usb/generic.txt . Let's
> convert its content into the generic USB, USB HCD and USB DRD DT
> schemas. So the Generic USB schema will be applicable to all USB
> controllers, USB HCD - for the generic USB Host controllers and the USB
> DRD - for the USB Dual-role controllers.
> 
> Note the USB DRD schema is supposed to work in conjunction with
> the USB peripheral/gadget and USB host controllers DT schemas.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> ---
> 
> Changelog v2:
> - Discard '|' in all the new properties, since we don't need to preserve
>   the text formatting.
> - Convert abbreviated form of the "maximum-speed" enum restriction into
>   the multi-lined version of the list.
> - Drop quotes from around the string constants.
> 
> Changelog v4:
> - Redistribute the properties between generic ones, USB HCD-specific and
>   USB DRD-specific.
> - Discard the Rob'es Reviewed-by tag. Please review the patch one more time.
> ---
>  .../devicetree/bindings/usb/generic.txt       | 57 --------------
>  .../devicetree/bindings/usb/usb-drd.yaml      | 77 +++++++++++++++++++
>  .../devicetree/bindings/usb/usb-hcd.yaml      |  5 ++
>  .../devicetree/bindings/usb/usb.yaml          | 22 ++++++
>  4 files changed, 104 insertions(+), 57 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/generic.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/usb-drd.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
