Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DADE73EE633
	for <lists+linux-mips@lfdr.de>; Tue, 17 Aug 2021 07:22:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237947AbhHQFWN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 17 Aug 2021 01:22:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237824AbhHQFWM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 17 Aug 2021 01:22:12 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A268C061764;
        Mon, 16 Aug 2021 22:21:40 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id x12so26725136wrr.11;
        Mon, 16 Aug 2021 22:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gmPeJ9SRmD1Y407UAO7a6oCnsD4FV+lP8C3zd8UDDQ0=;
        b=DeDvjE0QvzrL9BqkSo+4q17iV3wCTRBPrLKDpswth7ozNXijzro04ud4iUeFjJ+I3R
         6wLnKVgHUtjNt/MPYdoPurrDoq510p/rcimQp3weuoOcMl6hWsBb4KtyjMI4mb7qxw+a
         kVbdmBgcU4ANB5PY8CZElozwy5muhVItxiDJhkpossnJ+fyqbQparBrFVwMnQMQPZgSM
         q0y/QXP38B282GNqTjlJGdlFNU94CpQIT2KsEVhZQ3vBSgkQG9lMdebs+FjmfNWoPC+4
         i8HRv+ft/XUf2NN6UspRojSl+dqDdD1C1iGKYFM8OU4wlWMU6RSD3ef/2GdurAyTYHwI
         nfeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gmPeJ9SRmD1Y407UAO7a6oCnsD4FV+lP8C3zd8UDDQ0=;
        b=g7keGcnZ6qvartFFdtg6BQfPrvz7utSeoRtQa/3XlqHp16n+S/jU9P1Awm2to14lDP
         UbLCRhfgYn+iireKuBs+1IYlD7R04ZQS4kgc1/iE0s1Wh0ru1U+FTkxMhvz6QfC0SCCy
         KrLYroVQ4DdT1sNbhIqCOeJQhbHOYbjyX7BmVFUCzAJyqhWrKO/ScZScUv8BsLxViero
         to093EUMsYttigicjC9YWrafn2grw/IbU/59GhY4T/hqmqfhbuHapd+eOZcCZ8l6Ou8f
         BSt1Y+QKr+UhBpTYZbRVlqy7m0QmIkIcAW2b8AJdAZOiFgJx/tC4Rct2R2soq6YMxLzs
         NLUw==
X-Gm-Message-State: AOAM531ICpA64A888Cs4hscHxct51NbeaxL8OWJw2YOT35qsRND+gr2M
        Jxx36e/Rl8p47GgsYmKZdLsWGuiezD8T0alpi0c=
X-Google-Smtp-Source: ABdhPJxuB9CebbDZj0HLfsO/DoIJ0qw3ZssKK0n1vBn6bZyTvDiUirchfy/IAUSB886QSguuJKj2VHNwL0mhFgdt0To=
X-Received: by 2002:a5d:55cd:: with SMTP id i13mr1660589wrw.315.1629177698661;
 Mon, 16 Aug 2021 22:21:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210816105326.8050-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20210816105326.8050-1-lukas.bulwahn@gmail.com>
From:   Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date:   Tue, 17 Aug 2021 10:51:25 +0530
Message-ID: <CA+NV+VmVzc-4ShL8hZ7JPUHFQsNs+GWSOW4_+FmWZyucEGT1sw@mail.gmail.com>
Subject: Re: [PATCH v2] MAINTAINERS: adjust PISTACHIO SOC SUPPORT after its retirement
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Aug 16, 2021 at 4:23 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Commit 104f942b2832 ("MIPS: Retire MACH_PISTACHIO") removes
> ./arch/mips/pistachio/ and ./arch/mips/configs/pistachio_defconfig, but
> misses to adjust the corresponding section PISTACHIO SOC SUPPORT
> in MAINTAINERS.
>
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:
>
>   warning: no file matches    F:    arch/mips/configs/pistachio*_defconfig
>   warning: no file matches    F:    arch/mips/pistachio/
>
> As James Hartley is not reachable with the provided email address, the
> remaining dtsi file, arch/mips/boot/dts/img/pistachio.dtsi, must be
> maintained by its only user pistachio_marduk.dts, which is part of MARDUK
> (CREATOR CI40) DEVICE TREE SUPPORT.
>
> Add maintenance of pistachio.dtsi to that section and drop the PISTACHIO
> SOC SUPPORT after its retirement.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Acked-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>

Thanks,
Rahul
> ---
> applies cleanly on next-20210816
>
> Jiaxun, Rahul, please ack.
> Thomas, please pick this minor non-urgent clean-up patch on mips-next.
>
>  MAINTAINERS | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1a2d3ee2711e..968008105fe7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11088,7 +11088,7 @@ MARDUK (CREATOR CI40) DEVICE TREE SUPPORT
>  M:     Rahul Bedarkar <rahulbedarkar89@gmail.com>
>  L:     linux-mips@vger.kernel.org
>  S:     Maintained
> -F:     arch/mips/boot/dts/img/pistachio_marduk.dts
> +F:     arch/mips/boot/dts/img/pistachio*
>
>  MARVELL 88E6XXX ETHERNET SWITCH FABRIC DRIVER
>  M:     Andrew Lunn <andrew@lunn.ch>
> @@ -14797,14 +14797,6 @@ S:     Maintained
>  W:     http://www.st.com/spear
>  F:     drivers/pinctrl/spear/
>
> -PISTACHIO SOC SUPPORT
> -M:     James Hartley <james.hartley@sondrel.com>
> -L:     linux-mips@vger.kernel.org
> -S:     Odd Fixes
> -F:     arch/mips/boot/dts/img/pistachio*
> -F:     arch/mips/configs/pistachio*_defconfig
> -F:     arch/mips/pistachio/
> -
>  PKTCDVD DRIVER
>  M:     linux-block@vger.kernel.org
>  S:     Orphan
> --
> 2.26.2
>
