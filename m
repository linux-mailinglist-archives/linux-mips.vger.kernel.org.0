Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEDCD293BDA
	for <lists+linux-mips@lfdr.de>; Tue, 20 Oct 2020 14:38:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406309AbgJTMiW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 20 Oct 2020 08:38:22 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34735 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406208AbgJTMiV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 20 Oct 2020 08:38:21 -0400
Received: by mail-wr1-f66.google.com with SMTP id i1so1946229wro.1;
        Tue, 20 Oct 2020 05:38:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sCAzGCkxAJS3QlgrbYIRbXlNmhdT/0i2DpUXZfdaEjI=;
        b=Y3kqfsKymMJxjolnLkIkp9v4OMCKbY3HDKrtDmspcT5qvhafV9ZGhXP6mXq+HW82QO
         xGfm3nc42rCXUU2kPvpPk23EDiEd7tcTEcDYy8Y7x5Abr6U7UzWTVeGO1r6Ry1FFa4yE
         fLjcJ04cbYe4js0a3+e+Iw10GjkXd+sJH+FSINGrMsIg/TOuR6g3Fh7qIL7pPIG+6pw4
         CwVFCCAc4eq+ykoujkNPLU2qHCPb2fGNVgKfy5uvmJNK0pv+Ms5+eivniG01EImftaAe
         2pSYEjXF/gnixBLV9y4LETVTGO6ORbxWYssOi2RIQRJ9AAc3dTCDUCi1qvBEZ1/wN5gu
         5Frw==
X-Gm-Message-State: AOAM530y0AP2qQFtILb3QWPZcn0XYmygvVbgg0h/6jXvkjJDoZz3lO9r
        IzYHEwFi01JD88xOwMfiAno=
X-Google-Smtp-Source: ABdhPJzP87nGP+zRq7oU13xo36adkNHri9YodfysJBp6ywOxu++5gLSynVhnDoAKx2V1SiafO/n07w==
X-Received: by 2002:a5d:5748:: with SMTP id q8mr3280781wrw.299.1603197497943;
        Tue, 20 Oct 2020 05:38:17 -0700 (PDT)
Received: from kozik-lap ([194.230.155.171])
        by smtp.googlemail.com with ESMTPSA id v6sm2952473wrp.69.2020.10.20.05.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2020 05:38:16 -0700 (PDT)
Date:   Tue, 20 Oct 2020 14:38:14 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 14/29] mips: dts: ralink: mt7628a: Harmonize EHCI/OHCI DT
 nodes name
Message-ID: <20201020123814.GK127386@kozik-lap>
References: <20201020115959.2658-1-Sergey.Semin@baikalelectronics.ru>
 <20201020115959.2658-15-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201020115959.2658-15-Sergey.Semin@baikalelectronics.ru>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Oct 20, 2020 at 02:59:44PM +0300, Serge Semin wrote:
> In accordance with the Generic EHCI/OHCI bindings the corresponding node
> name is suppose to comply with the Generic USB HCD DT schema, which
> requires the USB nodes to have the name acceptable by the regexp:
> "^usb(@.*)?" . Make sure the "generic-ehci" and "generic-ohci"-compatible
> nodes are correctly named.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> ---
>  arch/mips/boot/dts/ralink/mt7628a.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
