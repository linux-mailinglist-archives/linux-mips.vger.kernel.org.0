Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF98A2D16DE
	for <lists+linux-mips@lfdr.de>; Mon,  7 Dec 2020 17:54:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727457AbgLGQx4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 7 Dec 2020 11:53:56 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:46715 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725832AbgLGQxz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 7 Dec 2020 11:53:55 -0500
Received: by mail-ot1-f66.google.com with SMTP id w3so12438030otp.13;
        Mon, 07 Dec 2020 08:53:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7U3Yhw/pl02ZoaOBu+HcEPYWSZaSb6JEpp9JpxVMzwM=;
        b=fYfC4KqeFvhbX4miWrNPXO1fjzpj68LjNr10zgjfNUTNkyoOFkRbx4/cUZqISa+5FI
         RpWNSWv5hACzZ1VKxjpBtHsMZtZX8ycboKWqzcmIQhv/mfUMTl8KEqXgBqS5eWDxE3OY
         ikPliu/Sdugf7Z+hASEdawo3fv/m51ZWI6m2dfkdVfiXDYj5m+xKxeofWvIyRPjAgEWm
         7Rav9TZpqv/0xfYq7U6GEaFIxlihsZiMuJ5Apl9myc6qkmKAriHIY5qcEkkVDw3jGjYQ
         5ya9d5haitxEDfa3vmk+GUItoHqMN9CXvCU8VYaZ3/1EFXs68vcRH6KXkQ13xbm9C068
         q2FA==
X-Gm-Message-State: AOAM533WTcLMQ0gFseLZD69nAnt2W+MYCR+Y+c+IFZFpwQjU+RQUAM3d
        tJPxBzJvjhVNF7kbX49HaQ==
X-Google-Smtp-Source: ABdhPJy7Q0USqnNLm3yD6fipjmEKQhCRZjQyZNGy1bziDJf63sFl8UXBj77WW4CCsAJh3BBAvF6/3A==
X-Received: by 2002:a9d:6b88:: with SMTP id b8mr13781346otq.60.1607359994430;
        Mon, 07 Dec 2020 08:53:14 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t5sm2754514oth.16.2020.12.07.08.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 08:53:13 -0800 (PST)
Received: (nullmailer pid 425824 invoked by uid 1000);
        Mon, 07 Dec 2020 16:53:12 -0000
Date:   Mon, 7 Dec 2020 10:53:12 -0600
From:   Rob Herring <robh@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        linux-snps-arc@lists.infradead.org,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        linux-usb@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
        Serge Semin <fancer.lancer@gmail.com>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Kevin Hilman <khilman@baylibre.com>,
        Andy Gross <agross@kernel.org>, Roger Quadros <rogerq@ti.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-mips@vger.kernel.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v5 19/19] dt-bindings: usb: intel, keembay-dwc3: Validate
 DWC3 sub-node
Message-ID: <20201207165312.GA425775@robh.at.kernel.org>
References: <20201205152427.29537-1-Sergey.Semin@baikalelectronics.ru>
 <20201205152427.29537-20-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201205152427.29537-20-Sergey.Semin@baikalelectronics.ru>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, 05 Dec 2020 18:24:26 +0300, Serge Semin wrote:
> Intel Keem Bay DWC3 compatible DT nodes are supposed to have a DWC USB3
> compatible sub-node to describe a fully functioning USB interface. Let's
> use the available DWC USB3 DT schema to validate the Qualcomm DWC3
> sub-nodes.
> 
> Note since the generic DWC USB3 DT node is supposed to be named as generic
> USB HCD ("^usb(@.*)?") one we have to accordingly fix the sub-nodes name
> regexp and fix the DT node example.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> ---
> 
> Changelog v5:
> - This is a new patch created for the new Intel Keem Bay bindings file,
>   which has been added just recently.
> ---
>  .../devicetree/bindings/usb/intel,keembay-dwc3.yaml      | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
