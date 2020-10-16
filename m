Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C34B3290B9E
	for <lists+linux-mips@lfdr.de>; Fri, 16 Oct 2020 20:47:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393004AbgJPSrJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 16 Oct 2020 14:47:09 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:41460 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393001AbgJPSrI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 16 Oct 2020 14:47:08 -0400
Received: by mail-oi1-f195.google.com with SMTP id q136so3522650oic.8;
        Fri, 16 Oct 2020 11:47:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8zDeag4KGqmKT8c+d4RekR3O6YxnQntnp7Q/reDb+L8=;
        b=hLxvWhCcS0DiCgdxNgFavG/F3KkBUKYky3IAuHgB80Eu+M5aNb7nhC9M5xbTJZKeFc
         honkaFr5clWRS7wTtQjG1IiKbXLpJLesU/UkKC/+Dy1AyRG/+bz46kv7AMqdOePzzFfz
         GfWO2MypxO8dnk3CCZ8BVC5VEL7FlLsQuucnUEY4zzLboNXi8dpToJBrLJunJ/EHccny
         RKX5/r1rGniOzEEG+gUhlOK5DnjmOkFAfIXfCNXBqQBWMXXozeUZzX8kgGp7r5ywvLH7
         dz614MyjzoP0lO7v2zjLt03i7KKUlY6WXzlhwfblH2FW2bYjBDUwVgUu8piUgI8EGHKO
         jgcw==
X-Gm-Message-State: AOAM532UqkXq/6Yq6i/diZWdWHlAyRwaw6g6OuipNramYmkDkhPCINUX
        c8rMQIgRGOJ+fKZCmdZyFQ==
X-Google-Smtp-Source: ABdhPJyENso3SKw3F4zLfI0AJYdmFcov/RsupjIYFRIArytE0XwOHw7L8ThI9GD3vqlzQ1CWLvOUKQ==
X-Received: by 2002:a54:438f:: with SMTP id u15mr3503365oiv.162.1602874027264;
        Fri, 16 Oct 2020 11:47:07 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k23sm1379873ool.5.2020.10.16.11.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 11:47:06 -0700 (PDT)
Received: (nullmailer pid 1729036 invoked by uid 1000);
        Fri, 16 Oct 2020 18:47:05 -0000
Date:   Fri, 16 Oct 2020 13:47:05 -0500
From:   Rob Herring <robh@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-snps-arc@lists.infradead.org,
        Serge Semin <fancer.lancer@gmail.com>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        Mathias Nyman <mathias.nyman@intel.com>,
        Manu Gautam <mgautam@codeaurora.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Andy Gross <agross@kernel.org>, linuxppc-dev@lists.ozlabs.org,
        Roger Quadros <rogerq@ti.com>,
        Kevin Hilman <khilman@baylibre.com>, linux-usb@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Subject: Re: [PATCH 04/20] dt-bindings: usb: usb-hcd: Add "tpl-support"
 property
Message-ID: <20201016184705.GA1728990@bogus>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-5-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014101402.18271-5-Sergey.Semin@baikalelectronics.ru>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 14 Oct 2020 13:13:46 +0300, Serge Semin wrote:
> The host controller device might be designed to work for the particular
> products or applications. In that case its DT node is supposed to be
> equipped with the tpl-support property.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> ---
> 
> Changelog v2:
> - Grammar fix: "s/it'/its"
> - Discard '|' from the property description, since we don't need to preserve
>   the text formatting.
> ---
>  Documentation/devicetree/bindings/usb/usb-hcd.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
