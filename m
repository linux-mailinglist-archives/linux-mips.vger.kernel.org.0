Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15D77294304
	for <lists+linux-mips@lfdr.de>; Tue, 20 Oct 2020 21:34:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438119AbgJTTeY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 20 Oct 2020 15:34:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438116AbgJTTeX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 20 Oct 2020 15:34:23 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B060CC0613CE;
        Tue, 20 Oct 2020 12:34:21 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id l24so3055307edj.8;
        Tue, 20 Oct 2020 12:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SW+VSHIXtiXnaj2ApmMbMQMGmNjny+0l3tNBxFDXzPQ=;
        b=GX3Yqx/LGzHLUIjGjsF1kKPysogDyG2vVY+8s+N8PTYhKPTyh4ACcyF24+wMsvDkWV
         HoMpNTIC+E6bYuB8fDaKiYToCjnyJy6T5P8ksA6DbiLXI/qy2awow9Wiy4i+9ico7tmr
         g6jxHMX3ONcndVRYk8KlG6vNoPIB1NwOrTcKrEG/xos8ZEWNISy0RXB0os+sLxmUtWNF
         mgBSgcXSWHi7HK7kT9NbcjuAFZmSoLbt447t0YfPcndqwk592RUbYmWW1b5IBWZnDxKd
         4tKQPDU3IsTlwgNvOBhPO3gCVZHDTNVuPZstd9pobY90Gnq6dtOLbL4656x9U1Qqpt1D
         D3og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SW+VSHIXtiXnaj2ApmMbMQMGmNjny+0l3tNBxFDXzPQ=;
        b=n1phEfyIvTnbq23QfvnXOTnQ4aNVALg7dGGiFMTZpJgcEFnzuecmpEINLWSyo2FJ7h
         oLcKMUU/rCwV78i77qrM8k8bDDBgufsYhMIEPDNFUMIXD/Oasimiejw1HmDB5FwyjzYd
         IlGRSW5AJ52vhrHzFZFQ/+X3U+LNbduE87IJcIJ1GUzZ52hD2hlQIkCHZ2c64L9VPVjZ
         k0cHK3oucKBwIzeGQpRXUAkyZNvsB6PFUtboFl5XyJyYAxHwU48mVihZ0Ss/aP94e5az
         YV66+6cYwDGx5Mc/UaLj7wLxw3BTI4do+V06p4vfxrqgMpVHA1oIt4JHANP4K5CS/ydL
         r72A==
X-Gm-Message-State: AOAM5315eg5/pQ0gicBEnHvlAMSHWsPS+kuWSyBLI6/unru8b1AOyTCZ
        1yzUs1nCbrCqno4U98bQOCera9WdPD5HJmkCG/k=
X-Google-Smtp-Source: ABdhPJyz+B9K91a/msM+dSi3tWDZXEiIxtxc7t7+Nz5WVzNWfdgNtM43dsiSzf+FIStCK900mQNbeVT/50ZkdTQrSrg=
X-Received: by 2002:aa7:c683:: with SMTP id n3mr4407224edq.146.1603222460451;
 Tue, 20 Oct 2020 12:34:20 -0700 (PDT)
MIME-Version: 1.0
References: <20201020112101.19077-1-Sergey.Semin@baikalelectronics.ru> <20201020112101.19077-6-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20201020112101.19077-6-Sergey.Semin@baikalelectronics.ru>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Tue, 20 Oct 2020 21:34:09 +0200
Message-ID: <CAFBinCA+4c6pjYFx3MW3-G=rCKon_jUXQ77pYSxXpRE9k0mpAA@mail.gmail.com>
Subject: Re: [PATCH v3 05/16] dt-bindings: usb: usb-hcd: Add generic "usb-phy" property
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Roger Quadros <rogerq@ti.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-snps-arc@lists.infradead.org, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Oct 20, 2020 at 1:21 PM Serge Semin
<Sergey.Semin@baikalelectronics.ru> wrote:
>
> Even though the Generic PHY framework is the more preferable way of
> setting the USB PHY up, there are still many dts-files and DT bindings
> which rely on having the legacy "usb-phy" specified to attach particular
> USB PHYs to USB cores. Let's have the "usb-phy" property described in
> the generic USB HCD binding file so it would be validated against the
> nodes in which it's specified. Mark the property as deprecated to
> discourage the developers from using it.
>
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
