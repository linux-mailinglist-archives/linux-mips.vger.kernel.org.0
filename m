Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C9AA3ED216
	for <lists+linux-mips@lfdr.de>; Mon, 16 Aug 2021 12:38:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235755AbhHPKiq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 16 Aug 2021 06:38:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234197AbhHPKin (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 16 Aug 2021 06:38:43 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D0E1C061764;
        Mon, 16 Aug 2021 03:38:12 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id z5so31891683ybj.2;
        Mon, 16 Aug 2021 03:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1KbK256o4936T0+iP2lqkRf5oNWJgGjRNrOhWBLpkFU=;
        b=TQkfpC5oJKlGAa+jxY3mSiulJOhq65y2Sps6CSTQXaflomdvC1kFnANDQKiduq7Bmz
         enbULUi/RJVy4yWJpZB/pmiMB8caSuGkMWuSl54KnqVK4T+sjD4VgHFW8eeBycOnmCBb
         qM6d3hIMC3uWMbWVMZRmdYUJdRwBBW305BOmmaHm9gu0tbydoU+vbkCXg+HXoIRPbOUB
         26LTyQUX1QZTfX4RcNSao7e+1+MSj0lyzGreBZDSiSef0faZibik9qyQszzylc3EJgZH
         ScW5O8Gu9E7WWp5aj6pgIuyGyuMNKRKJ+Xe0Hql+ZGQzsP8jx3VSFA4G2QF5udX94aXg
         Il8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1KbK256o4936T0+iP2lqkRf5oNWJgGjRNrOhWBLpkFU=;
        b=AVH5ppDmH0JpykY+OgTVM9SSUrvD9Fphnc2lX9yp6c+3hV3N92MDRvc3SKMMfa145t
         /td6z8Qyx3eiSYtXzo2++Kl1cPeJaDHZ0K0cJMyEjqlLR4+K4PXUcSAkhVnx8lOZWuNh
         739BO0hCpWiJsysm+TM6iaZGP+sgW+Vo4O1GJSBqrte3SKfe86rRGckk9CrilBSlOuRM
         b3xim3CYiuQ4OjvPdeU8IvNFcX9ah1Of1SQNn5QpUR4ZIH4LDdgmvjrdzWj5VLDrjz0y
         KvUI2M/KKp2P+2dXxlccO/5/SG+fbX63LwqROu/pV74kuT0+y9cpW2G2VoYXREv48nhl
         EGRg==
X-Gm-Message-State: AOAM532amxu+6rdmANXTRZ6qkGv2l6JvYxA7NGiOO3PQQiRY8T4L8mqM
        RyPdLuFtxJqWhNt0Hf/YyUajtX1UFcJ7x+QjlFRe4OkbIKM=
X-Google-Smtp-Source: ABdhPJzdNKt6ySIqdGSttap8fl/rHvJ5JnDQaPdZVrNcewto9i/n12WsgWCb25hD0adKhs5xUvLP3TBI4hUlXSLflYY=
X-Received: by 2002:a25:505:: with SMTP id 5mr20105139ybf.157.1629110291142;
 Mon, 16 Aug 2021 03:38:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210816102942.6976-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20210816102942.6976-1-lukas.bulwahn@gmail.com>
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date:   Mon, 16 Aug 2021 12:38:03 +0200
Message-ID: <CAKXUXMx8o-s=TY9A7DNLdif90PrTYc_bd_aaMRtOmyQAOFXgUw@mail.gmail.com>
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

On Mon, Aug 16, 2021 at 12:29 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
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
> Adjust the PISTACHIO SOC SUPPORT after its retirement.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> applies cleanly on next-20210816
>
> Jiaxun, James, please ack.
> Thomas, please pick this minor non-urgent clean-up patch on mips-next.
>

I just received the response that the email james.hartley@sondrel.com
is unreachable. So, we will probably be better to delete the section
PISTACHIO SOC SUPPORT completely and extend MARDUK (CREATOR CI40)
DEVICE TREE SUPPORT to include arch/mips/boot/dts/img/pistachio* (so
to include the dtsi, the current dts depends on).

If there are no objections, I will send a patch V2.

Lukas

>  MAINTAINERS | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1a2d3ee2711e..8276e59406e4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14802,8 +14802,6 @@ M:      James Hartley <james.hartley@sondrel.com>
>  L:     linux-mips@vger.kernel.org
>  S:     Odd Fixes
>  F:     arch/mips/boot/dts/img/pistachio*
> -F:     arch/mips/configs/pistachio*_defconfig
> -F:     arch/mips/pistachio/
>
>  PKTCDVD DRIVER
>  M:     linux-block@vger.kernel.org
> --
> 2.26.2
>
