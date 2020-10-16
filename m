Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57030290CD9
	for <lists+linux-mips@lfdr.de>; Fri, 16 Oct 2020 22:47:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408884AbgJPUrP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 16 Oct 2020 16:47:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408853AbgJPUrP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 16 Oct 2020 16:47:15 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBE22C061755;
        Fri, 16 Oct 2020 13:47:14 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id x1so3866548eds.1;
        Fri, 16 Oct 2020 13:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cM0Y06ICfSsoQ7UyBgP3+N66oWYmNuuTL9tZcHXPGCQ=;
        b=YX9YE4prYIppUA6bWnjFZ1SlFrt/2+Clwt/Y2HOaFsDQzC62RsyOpLMDHdZRq05zfT
         oI/clGG8Wwp2uI3zODlg24vIR8B/Htq8McDYf1W7QK3oGDMpWznzASoFSXWHrH01hjDt
         9XeAgl969QeMhMjdXEfAEqQaPDHxl/FTduIQvEeC4cnXu5e1kiWb/4hD9M41+uVV4cfe
         5H3xhmf8eHN0rg93ykx/fi1xUJpSXfnawqwK+EblahRFKhuHpDMu1dcksPXMovgNM1DQ
         fYO6fnu/GvwZsfRs2OdOMn3qipwnLIl6sZsuRxGMwuzH17TOHn5w7AdnOe24CHKjHgoF
         ZQdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cM0Y06ICfSsoQ7UyBgP3+N66oWYmNuuTL9tZcHXPGCQ=;
        b=Usek5IJSl/9VpDgL3uyj82F8sLt3CFc8+UAtLcsVgA0vIVPdhq15S9cLTPH7hux+Cq
         9vtRFAmzkqBJj06d7Gewpq6r15cOQs8jKOUqV7zV+dG3iUTcv1RCdfJ06iuHwc25K62B
         6bKTTAHlpeK4Fbt9BrDQP+cyca5+MDfpWvJWzBsnPGUTgZdVLvPyat8wn/fZ6VP4BR26
         Rn3BG4Ke6L8CB5vQqVca5/y1pVaQSku5wGEHCJO4bUoipDHTkswY99t427RYydy8Tr16
         uOAuS0DIW3lMG7Fo3KjoB4Z86wdgElif3ysL22Zg0g1YK01iK9ROTOTxiOU+GNn/SHvG
         2uLg==
X-Gm-Message-State: AOAM532P/KEC/T+Qma+EsbKLQX3owRSsTBGQkMK6KLcRPC4GoSsmuYW6
        JP7NipmJPBr0CvCZ7KsBHWCwLSV+E0kzkDHfZdY=
X-Google-Smtp-Source: ABdhPJyY7U/2059vdl/trPuz5QmTks+M1tCJlzB3pZYDFJT8/0Yi++X7QL+PvBI+5qrHrP47VENdS6ZsuDkZG+Z/RX4=
X-Received: by 2002:aa7:d690:: with SMTP id d16mr6142313edr.301.1602881233657;
 Fri, 16 Oct 2020 13:47:13 -0700 (PDT)
MIME-Version: 1.0
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru> <20201014101402.18271-16-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20201014101402.18271-16-Sergey.Semin@baikalelectronics.ru>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Fri, 16 Oct 2020 22:47:02 +0200
Message-ID: <CAFBinCCRobE1kQhUrh3oorQTKcQZwYEJ_MaHRtr=f=sYFCoD8g@mail.gmail.com>
Subject: Re: [PATCH 15/20] dt-bindings: usb: meson-g12a-usb: Validate
 DWC2/DWC3 sub-nodes
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Roger Quadros <rogerq@ti.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-snps-arc@lists.infradead.org, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Oct 14, 2020 at 12:14 PM Serge Semin
<Sergey.Semin@baikalelectronics.ru> wrote:
>
> Amlogic G12A USB DT sub-nodes are supposed to be compatible with the
> generic DWC USB2 and USB3 devices. Since now we've got DT schemas for
> both of the later IP cores let's make sure that the Amlogic G12A USB
> DT nodes are fully evaluated including the DWC sub-nodes.
>
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
