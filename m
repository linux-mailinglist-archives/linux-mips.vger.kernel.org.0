Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 037EC3ED2A6
	for <lists+linux-mips@lfdr.de>; Mon, 16 Aug 2021 12:55:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236522AbhHPK4W (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 16 Aug 2021 06:56:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236469AbhHPK4T (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 16 Aug 2021 06:56:19 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8834C0613C1;
        Mon, 16 Aug 2021 03:55:47 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id c5so18830151ybn.5;
        Mon, 16 Aug 2021 03:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Sm5A719WTRfkErC21Ap2FHw1IatmWaYQOyDloD/tWFw=;
        b=iVShdmgEimGmOy5mjJ/skiJws1UTQ8dBkdsVhE+oLf4woI/tT/2uK4EZmTgT+vH92A
         8zl1D7PKc1D/uMdO8jKvVAStPkHIP9D6OSDh7QV2NeGrtxuiV3r5RJ+KlUaAJlpic/i/
         Uu8SIloB1GYu66Q9KdcibrB/39MOkGyNs5i2yxAybZK+sWRM883gF7H5FajkRbNiAgAl
         1R8qiQt5VgSlGIKVNkyMlkkK4PZ1pwrtC6On4QNS4jqhCEWVSTspLjvrAhJMpwxnVovy
         bMuAMdsQYYXBSsZ+tgU7sjV2VvK5yeb36Rog3OM5JaIuG1ZfT5FvmRYCNo079Q/I8GcC
         DN+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Sm5A719WTRfkErC21Ap2FHw1IatmWaYQOyDloD/tWFw=;
        b=bIhD0QInFCBJNiy++8y8DPO+eofmlz6KpkaAxDNPAwStjwDlnRpcDgupZNDAyuylsS
         S9fZIgvnVtZl//YpTcfGwxSj6sbgIlAM+uKfytDYjA9HjK0RTILjOPzhsFZHP1nfBuRe
         S8/zSlKKUbQR+TKbWXSvkifIGO5MG/q9yKe9yNiJYLvJS8szQKeKydGlKMLJU3UhmmBy
         FBxQXrTufg45xa/5S3ULTAdQ+/yJborDERTd6Q0pAm+Q0Uzur7KciVTeQdlbYADdGBw4
         dQBs26fZyocwd8qUypD9C6CgFs+hlWkvcJcKUbj03MPj/BFVpz/BrqJrd5930sS9Ma39
         vWqw==
X-Gm-Message-State: AOAM531+dRNadQFOwMPFIo1EqIlUBGnegdbreFCHMq4/MNHYFy9NvrCX
        8VQ5Y+dWc/XLx3aSW5vUyZx2uyr4T/l7bsJafIGlynIpvqY=
X-Google-Smtp-Source: ABdhPJwEftTZAvq7MlR28oRsv4Gy0q5rnZcQzlKqE+APsj1FgRE2EcJI4pZ+7//YozINxOnr8c7JH7tjllDizl/eTV4=
X-Received: by 2002:a25:3046:: with SMTP id w67mr21127707ybw.134.1629111347170;
 Mon, 16 Aug 2021 03:55:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210816102942.6976-1-lukas.bulwahn@gmail.com> <CAKXUXMx8o-s=TY9A7DNLdif90PrTYc_bd_aaMRtOmyQAOFXgUw@mail.gmail.com>
In-Reply-To: <CAKXUXMx8o-s=TY9A7DNLdif90PrTYc_bd_aaMRtOmyQAOFXgUw@mail.gmail.com>
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date:   Mon, 16 Aug 2021 12:55:39 +0200
Message-ID: <CAKXUXMy73DkB6fxTM3JBZR+rULMk+73SYGTWAhdkOhys09+HNw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: adjust PISTACHIO SOC SUPPORT after its retirement
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        James Hartley <james.hartley@sondrel.com>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>
Cc:     kernel-janitors <kernel-janitors@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Aug 16, 2021 at 12:38 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> On Mon, Aug 16, 2021 at 12:29 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> >
> > Commit 104f942b2832 ("MIPS: Retire MACH_PISTACHIO") removes
> > ./arch/mips/pistachio/ and ./arch/mips/configs/pistachio_defconfig, but
> > misses to adjust the corresponding section PISTACHIO SOC SUPPORT
> > in MAINTAINERS.
> >
> > Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:
> >
> >   warning: no file matches    F:    arch/mips/configs/pistachio*_defconfig
> >   warning: no file matches    F:    arch/mips/pistachio/
> >
> > Adjust the PISTACHIO SOC SUPPORT after its retirement.
> >
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > ---
> > applies cleanly on next-20210816
> >
> > Jiaxun, James, please ack.
> > Thomas, please pick this minor non-urgent clean-up patch on mips-next.
> >
>
> I just received the response that the email james.hartley@sondrel.com
> is unreachable. So, we will probably be better to delete the section
> PISTACHIO SOC SUPPORT completely and extend MARDUK (CREATOR CI40)
> DEVICE TREE SUPPORT to include arch/mips/boot/dts/img/pistachio* (so
> to include the dtsi, the current dts depends on).
>
> If there are no objections, I will send a patch V2.
>

I send out a patch V2:

https://lore.kernel.org/linux-mips/20210816105326.8050-1-lukas.bulwahn@gmail.com/

Please acknowledge and pick that patch V2 instead.

Lukas
