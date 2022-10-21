Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4825B607338
	for <lists+linux-mips@lfdr.de>; Fri, 21 Oct 2022 11:06:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230035AbiJUJGD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 Oct 2022 05:06:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230434AbiJUJGB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 21 Oct 2022 05:06:01 -0400
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D511188ABC;
        Fri, 21 Oct 2022 02:06:00 -0700 (PDT)
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-1364357a691so2768875fac.7;
        Fri, 21 Oct 2022 02:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=onjZXLG5H2eVDEoLf+HexzRMICClQImrKow0XsbPTTQ=;
        b=Gc2ApEBJRflPhL9aV+noMvFYdlw6wIhvbOvlZZxZUewbW4QniqgA8kAUEthFZYmfDS
         wjGMrkgwX1uGTa2vbCjBltlr6IU4LRMKoZbPjeIutvSNULidxLyDk2CSf4X2C/970ada
         4BL47PUVQNr59n+uJWfcIjTNDye4vFjDfjF9pkP+XJjhoTzrQ5v4LBsOHSWT8jMSn2EJ
         9Q78APpeXeBhLSOIWXifdGsYGsCBxcRUi6PGqAng/RL2KsQBadxDbez26KZ929kk+N5i
         ulhMXqOzcpXnFU+hBDOSPe2lG7zFuHkf7fKWgBlOSKYfShZZwQhPWUbqsoAO+BAovmWS
         IuJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=onjZXLG5H2eVDEoLf+HexzRMICClQImrKow0XsbPTTQ=;
        b=oHl6maTiWR8zfqGUmGzB6eA1yvrk4CczaIXIjHFvsXCWhh7wKlZR2eX+XCWSsNFD2i
         gqPrXGkBXVp1zk3TdEV53L+zrg1m1gBzH2iWdQQNEVlzaUHEOgTYXFQhQogA3DoP1eXP
         /SNlyeLJDitZNXHusw2F873MrOU3z1nYFv3rB7OqBsihx2N62anER7Ceu8F5cTKMUChL
         KBpoEXj+SmL/0VZkBYB1akT7soxXU5rD9X7aTeWhMNbbA7se2ZgEBNuEJ/8TGkoh08b0
         AqoEOpwPGgQUC0D8P3A+uvvMcAf6LrqBXM5vC25PSmEUaquW38lnDRvL/7OoMf8qcGBA
         ihOw==
X-Gm-Message-State: ACrzQf0Fb96MRxhUg6n30jxrpu2WXMpTt1tHITPZ59MOdFbmFqqX9ZkC
        VF2gR+d1pW+TUDAJw4eQQ7Q56PjXOvhWKkd0deY=
X-Google-Smtp-Source: AMsMyM6pSrFzgRAYvL2maH3o/SXFldyuk69Y/lp2Iw0ym6rUQD++QPnLIzone6m0BGwlAojeid+GOz0obxoRpHrprD4=
X-Received: by 2002:a05:6871:89:b0:131:6362:e26f with SMTP id
 u9-20020a056871008900b001316362e26fmr12120233oaa.144.1666343159659; Fri, 21
 Oct 2022 02:05:59 -0700 (PDT)
MIME-Version: 1.0
References: <20221006042945.1038594-1-sergio.paracuellos@gmail.com>
 <20221006042945.1038594-2-sergio.paracuellos@gmail.com> <615c8c6d-3eab-0474-2c2c-6442052c0eee@fungible.com>
 <CAMhs-H8tMP-TyH9dBeO5dGe8spu3h6571-Zeo=_Xshh04x+w1g@mail.gmail.com> <20221021084713.GA5976@alpha.franken.de>
In-Reply-To: <20221021084713.GA5976@alpha.franken.de>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Fri, 21 Oct 2022 11:05:48 +0200
Message-ID: <CAMhs-H_wEBELsKkpjA1aTTAjywz-LCDvA17AyE5vfzrEpSr-xQ@mail.gmail.com>
Subject: Re: [PATCH v8 1/2] dt-bindings: mips: add CPU bindings for MIPS architecture
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@fungible.com>,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, hauke@hauke-m.de,
        zajec5@gmail.com, zhouyanjie@wanyeetech.com,
        linux-mips@vger.kernel.org, arinc.unal@arinc9.com,
        f.fainelli@gmail.com, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Oct 21, 2022 at 11:02 AM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Mon, Oct 17, 2022 at 07:53:00AM +0200, Sergio Paracuellos wrote:
> > On Thu, Oct 6, 2022 at 1:24 PM Philippe Mathieu-Daud=C3=A9
> > <philmd@fungible.com> wrote:
> > >
> > > On 6/10/22 06:29, Sergio Paracuellos wrote:
> > > > Add the yaml binding for available CPUs in MIPS architecture.
> > > >
> > > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > > > ---
> > > >   .../bindings/mips/brcm/brcm,bmips.txt         |   8 --
> > > >   .../devicetree/bindings/mips/cpus.yaml        | 115 +++++++++++++=
+++++
> > > >   .../bindings/mips/ingenic/ingenic,cpu.yaml    |  69 -----------
> > > >   3 files changed, 115 insertions(+), 77 deletions(-)
> > > >   delete mode 100644 Documentation/devicetree/bindings/mips/brcm/br=
cm,bmips.txt
> > > >   create mode 100644 Documentation/devicetree/bindings/mips/cpus.ya=
ml
> > > >   delete mode 100644 Documentation/devicetree/bindings/mips/ingenic=
/ingenic,cpu.yaml
> > >
> > > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@fungible.com>
> >
> > Thanks!
> >
> > Thomas, are this series going through your tree?
>
> I'll take them.

Thanks for letting me know!!

>
> Thomas.
>

Best regards,
    Sergio Paracuellos


> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessaril=
y a
> good idea.                                                [ RFC1925, 2.3 =
]
