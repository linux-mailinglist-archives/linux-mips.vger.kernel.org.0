Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 482DF50A24A
	for <lists+linux-mips@lfdr.de>; Thu, 21 Apr 2022 16:27:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1389331AbiDUOaX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 21 Apr 2022 10:30:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1389250AbiDUOaR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 21 Apr 2022 10:30:17 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEED33E0D5
        for <linux-mips@vger.kernel.org>; Thu, 21 Apr 2022 07:27:25 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id m132so9052846ybm.4
        for <linux-mips@vger.kernel.org>; Thu, 21 Apr 2022 07:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=rZBFlmHymTZ2XITuJ76uKuNQ0o0eA5W4vkdFBM1hN1c=;
        b=HIUTIlxPXowbJ3dcoyknjSXqxR5CjgMSug5s2lgyUCH6fubEhvkPqSs0IQEDbIUavK
         rsUZpjscswS7NpGcWsb4RmKrAcIcd8Szmtj1s/qcOR1cYUm45ffupKZabx5GPyeqlA3X
         BW+y35hFDgzhnFox/GHjge6OtB6J5xqVUoQdR+SO5hJy97Q5J8JHBGhWGKORRF6ezZJJ
         aLtfoRyuL76mWxeQWWMRn6UscTZmDGHerZo7SFSdKEw3tnsw2BeISqIz46UbGlEGFJdF
         hofHZ2NlkXN5SCdQKsNHU/MnOPdwknu3LGVzxvS3Az86dxhgXmhw+xODOjaW0TXdWtVR
         h2hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rZBFlmHymTZ2XITuJ76uKuNQ0o0eA5W4vkdFBM1hN1c=;
        b=AdBxeCyFAm0jyZmVwkl1vzlrkw/ndZ+pDccIFT7iqiURtuKqhW4n2NdcEZIRx6cx0f
         wU4MbFHdBauHaTMACRuiIw90j3PJLiB+zeYW1lqr0BV+WUA0UP0qe17U1PLopz0ukTjv
         v7ydOpm2S4zghXuTNtvshk6luNwPyZW5FMupCfo2h4E9oqEIoBcVc4PvO+9SbJYdPUsv
         ej9XXyhE6Gr3hrk6+K7OwEaG1Fwsjj2A1WLYOTo/qPvZS0pFGD5adOEhbE+fh5lX8C3Y
         hmStpSSfgLMBDGKNAy2qrlXm8/WhsSVCOa4y0+l+AYvlknGHlsBFSpN7bOUXe7FcB3b+
         ecSg==
X-Gm-Message-State: AOAM533jDJ2jzkUZ1wcF7PpIo+J7fl/tdBgM5OUgHr0GrpY+zV6TO/kP
        mVnIrEiACSsyOCEuKIl8Cm0Nhsu8nJmxgceogyklTA==
X-Google-Smtp-Source: ABdhPJxwa0wYivda5wva68xSE6bQM3iIiGgh0H/o0EtiG339T3VCMNkaKR8Ayly0FrW7pr65Fgv+eV4VQGZN5Tvmkzk=
X-Received: by 2002:a25:4e82:0:b0:633:68d7:b864 with SMTP id
 c124-20020a254e82000000b0063368d7b864mr26018665ybb.514.1650551245081; Thu, 21
 Apr 2022 07:27:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220413060729.27639-1-arinc.unal@arinc9.com>
In-Reply-To: <20220413060729.27639-1-arinc.unal@arinc9.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 21 Apr 2022 16:27:13 +0200
Message-ID: <CACRpkdbbMFYNNjAKwhysKpu1JVh2JSB-N=Y8QMx1JvMhCPBpwg@mail.gmail.com>
Subject: Re: [PATCH 0/14] Refactor Ralink Pinctrl and Add Documentation
To:     =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc:     Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        Luiz Angelo Daros de Luca <luizluca@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        erkin.bozoglu@xeront.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Apr 13, 2022 at 8:08 AM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc=
9.com> wrote:

> This patch series brings complete refactoring to the Ralink pinctrl drive=
r
> and its subdrivers.

I just merged all the patches, the comments seem minor and any further
fixes can certainly be done on top of this. Anyone interested in ralink
working nicely is likely in the thread and we mostly care about that this
works for OpenWrt, and if it works for them we are happy.

>   mips: dts: ralink: mt7621: use the new compatible string for MT7621 pin=
ctrl

This was a bit scary since we usually take these through the respective
SoC tree, but I just applied it anyway, it makes logical sense in the
series.

I hope it will not lead to conflicts.

Good work with this series!

My personal headache with RT2880 is the Ralink RT2880F mini PCI card
which apparently contains a non-reflashable firmware. It's not
the RT2880:s fault though, I'm just always reminded of this when
working with RT2880 :/

Yours,
Linus Walleij
