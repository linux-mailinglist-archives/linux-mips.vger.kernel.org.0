Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC118290CD7
	for <lists+linux-mips@lfdr.de>; Fri, 16 Oct 2020 22:46:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408082AbgJPUqh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 16 Oct 2020 16:46:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408077AbgJPUqh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 16 Oct 2020 16:46:37 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFEB3C061755;
        Fri, 16 Oct 2020 13:46:36 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id md26so5048299ejb.10;
        Fri, 16 Oct 2020 13:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mAY0QDFqvIDjx5HUOQ+MdvNYA3kylWMqxJWjR23AFzk=;
        b=Pge7XeimtOGQPWwobIeFhAVFY6hovQZpX0ZLcKzZ8AVgQQQ672h2NV6G4tVk7cpmI+
         1+gpE/GaiJ6rOXia2sUQl2tkgPYRwpujI/1jI9yUuZbMHNhhdIPSSFFZisDCvdGyMNCm
         Bv7XKMjurquBEjLiG0g7MIjYLAxlPxapoizFVEWiVkAHI83UW9jV/Zr0Oj+Y0jv0AGkL
         cttkNhvMmB1Ql9iOu8/GJqu+JOcP+inoZKVjC8g7gRUssTThoHFHguWhzOQMKNXZP0Bi
         /t44sdZ14d2mGGgRgIH93pq2zHZDD0h2Gi9RGZg69aSc7fX52eFBBVlYAcrwgabfDNox
         6p+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mAY0QDFqvIDjx5HUOQ+MdvNYA3kylWMqxJWjR23AFzk=;
        b=po1m8uwegap4OUymmHUBI9SwKOHwckXU2OC+oiIfQhE+ThvXWPpo5k4oN7rLNr72Zt
         d99Bn9ezles6r2hqXk5bc610CUl5TA7TVO5Pz9NGo3Pg8wu51mlZTbsj4WD8St9qR6Be
         h3U1sav7E7VSqxNAn+NE0nU98gO3SKATKmFFzbZuVxy+ZiiDSK6DnrWggX1G5keX2Oay
         zdU5Sj2rYvz2F+hca8SvlOAcOVf5TU7zygVi7aSnWMBTXqHXCNKiXV/30AbaN+OLcTpT
         /YQJX6LcgiRhDzhgfoaBcKcV/04RKBRkKgtLlz/+QTDHuwgEvJ0wp/h7jqUOHZ9uhbW4
         YHSA==
X-Gm-Message-State: AOAM530Tt76x/TK4Bs8Ke5DCe6WyeIN8qMozxEQmk0rN5vpF6whMs7Fx
        FNCrF2FBXh+k3n2UCGvBvjuh361MEtqB/VT9zsYy7DZgW9c=
X-Google-Smtp-Source: ABdhPJzZH9WV53owno/ZkjiRehR4EVV/83Ve6RR9ZDeTZs5Z1Fi5I5Jf9JSdZ0IMRjggvROTLl8Mkpi59PwKfkncEXs=
X-Received: by 2002:a17:906:cc0d:: with SMTP id ml13mr5630435ejb.2.1602881195652;
 Fri, 16 Oct 2020 13:46:35 -0700 (PDT)
MIME-Version: 1.0
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru> <20201014101402.18271-15-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20201014101402.18271-15-Sergey.Semin@baikalelectronics.ru>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Fri, 16 Oct 2020 22:46:24 +0200
Message-ID: <CAFBinCDYu+C62P37QjY75xG8iXa+MwZEL-agNhoOsaXQ0OQpgQ@mail.gmail.com>
Subject: Re: [PATCH 14/20] dt-bindings: usb: meson-g12a-usb: Fix FL-adj
 property value
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
> An empty snps,quirk-frame-length-adjustment won't cause any change
> performed by the driver. Moreover the DT schema validation will fail,
> since it expects the property being assigned with some value. So set
> fix the example by setting a valid FL-adj value in accordance with
> Neil Armstrong comment.
>
> Link: https://lore.kernel.org/linux-usb/20201010224121.12672-16-Sergey.Semin@baikalelectronics.ru/
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Acked-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
