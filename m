Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 374212D5145
	for <lists+linux-mips@lfdr.de>; Thu, 10 Dec 2020 04:26:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729139AbgLJDYo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 9 Dec 2020 22:24:44 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:44188 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728199AbgLJDYo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 9 Dec 2020 22:24:44 -0500
Received: by mail-ot1-f66.google.com with SMTP id f16so3590543otl.11;
        Wed, 09 Dec 2020 19:24:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BPV+mbc7aH16lyR1Iy3IK6IHtEQI7lxOlNJLzhXVprg=;
        b=C0z+Fs4DZeylTcA3P39LK1NiYXw9e3cAFxmHBvy2xNgTrpFChgK/0pHR1zoCesZbOb
         gQiU+UNIvVs40OjixuT6cNseZs+9ulZxEdHMMXv2tYcsVaJZEV9qZt9CzL2o/LSCKmab
         qEJ4Pw/mImBiu1NlhRb5BmJArdLjLwon13U/tz/2C9ZTHp+krOZQb5NQgjECXNkxCxlD
         L3MRtwf9qvQ5AXwo57cc5It2JnWNcnMYcaNFB0QI3Bx4OBgkceD6zVRkrBsLooXpEdyZ
         5L7T7eF25DvbzakTuPVxZFBuOLFUjisyjPDNnF4pbdKITxIhnMa1NZepZeSLH8UtwhS/
         qazA==
X-Gm-Message-State: AOAM531SG/ndtjNWzCb/aBgC/Emj3EAZTcrOD9pP+kPqd9uGgAb52fFD
        YxbzLsd2i06hVDU172mfTw==
X-Google-Smtp-Source: ABdhPJxHS5abRR5IlwX+r1rqFuy3fjpJvhGxKQY1kv5d7hwo6ynHH2We4bKSmeX6t6ufoe/klKpb4w==
X-Received: by 2002:a9d:5f9a:: with SMTP id g26mr4523870oti.241.1607570643083;
        Wed, 09 Dec 2020 19:24:03 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r204sm334552oif.0.2020.12.09.19.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 19:24:01 -0800 (PST)
Received: (nullmailer pid 1590264 invoked by uid 1000);
        Thu, 10 Dec 2020 03:23:59 -0000
Date:   Wed, 9 Dec 2020 21:23:59 -0600
From:   Rob Herring <robh@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        linux-mips@vger.kernel.org,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Roger Quadros <rogerq@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Felipe Balbi <balbi@kernel.org>,
        linux-snps-arc@lists.infradead.org,
        Kevin Hilman <khilman@baylibre.com>, linux-usb@vger.kernel.org,
        Mathias Nyman <mathias.nyman@intel.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        devicetree@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v5 01/19] dt-bindings: usb: usb-hcd: Detach generic USB
 controller properties
Message-ID: <20201210032359.GA1590225@robh.at.kernel.org>
References: <20201205152427.29537-1-Sergey.Semin@baikalelectronics.ru>
 <20201205152427.29537-2-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201205152427.29537-2-Sergey.Semin@baikalelectronics.ru>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, 05 Dec 2020 18:24:08 +0300, Serge Semin wrote:
> There can be three distinctive types of the USB controllers: USB hosts,
> USB peripherals/gadgets and USB OTG, which can switch from one role to
> another. In order to have that hierarchy handled in the DT binding files,
> we need to collect common properties in a common DT schema and specific
> properties in dedicated schemas. Seeing the usb-hcd.yaml DT schema is
> dedicated for the USB host controllers only, let's move some common
> properties from there into the usb.yaml schema. So the later would be
> available to evaluate all currently supported types of the USB
> controllers.
> 
> While at it add an explicit "additionalProperties: true" into the
> usb-hcd.yaml as setting the additionalProperties/unevaluateProperties
> properties is going to be get mandatory soon.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> ---
> 
> Changelog v4:
> - This is a new patch created as a result of the comment left
>   by Chunfeng Yun in v3
> 
> Changelog v5:
> - Discard duplicated additionalProperties property definition.
> ---
>  .../devicetree/bindings/usb/usb-hcd.yaml      | 14 ++-------
>  .../devicetree/bindings/usb/usb.yaml          | 29 +++++++++++++++++++
>  2 files changed, 31 insertions(+), 12 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/usb/usb.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
