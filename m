Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D5483E8BBC
	for <lists+linux-mips@lfdr.de>; Wed, 11 Aug 2021 10:25:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236024AbhHKIZj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Aug 2021 04:25:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235867AbhHKIZi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 11 Aug 2021 04:25:38 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17E53C0613D5
        for <linux-mips@vger.kernel.org>; Wed, 11 Aug 2021 01:25:15 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id m9so3241007ljp.7
        for <linux-mips@vger.kernel.org>; Wed, 11 Aug 2021 01:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zYG5OW/GuymVifdul+I5Blg04g1AAAuKaCzk0pvxhf0=;
        b=JkV7+VuBX5K8gla+CwLaHXvUhgX/3/dJKO5GvH3X+2fpHvc1tFi1HU1F0ziyTvpwf5
         QPM7g2HMUSED4KzVS/g/93Duae/vBTVp6NehMfjyCW1VA7AgjotRGjj+qxQylG2s3Wbf
         bPWzUwSX19VB0o394R2/B8eURFP2w3Yto/QB+Pug9yFjCGd5zwjlVbQOv2vGk6hv744V
         83I0NxCVq5gx8hG4Jy+sBpnSxOo0BYgeYXD5sFnWakt0/dbE3woTztU3g1TZhQ/dTac7
         zoGO6i3JdC/phPsXewy/Io6GaXQe+zOnBKcvcziyK/tt3l0HaMe6NA1qa+ZEOJHJmliP
         gDew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zYG5OW/GuymVifdul+I5Blg04g1AAAuKaCzk0pvxhf0=;
        b=BsBDK2JxihQwyMrTGayc7a1KtN2STida49caMjPgLwEgUmfABvZ+DpyopnjwErWVLV
         8qjEEu05s/dsm0wCCFZ6bNdOTmGRUCQUEVbtbCpOAXPTBkmo8vSgcjPKUALSPZKbV1d2
         Df2sYaJsA0ggBaHGLm2ZrapGzD6/1qEMFYZEVIVgFsGKlqopDOiUZOCCwW6M/hGinVri
         eBjT3FqxVcfx5bEjKymuNevsJ0U9TTslfuP2D+8aNrCCe/82b3Wrg3FAC8Ga9esj5QHe
         NZJ5MplejdzZXtLmiTRzcQzER9MFNfp33zgsyXXvNOSZP/52NaoV2ShsvVw0jluN9dUx
         hu1Q==
X-Gm-Message-State: AOAM531Vlzf+2mi7EUk9GzTPnaSfYp0soChZZ02+91Ym+PlMH4WwZgwa
        nTdW4kf/9SGq472M+kyLTOZ1HWnwz4yPYylphvX9zg==
X-Google-Smtp-Source: ABdhPJyCWvmoleKs+xBVZZ6DUMgjMXPl0OJ3a6DQFu9ePBD1OEIdGRr9JPO3iNfDJuIooutbqNKEx3Horr68DKpJ8SY=
X-Received: by 2002:a2e:9a4b:: with SMTP id k11mr11984502ljj.368.1628670313474;
 Wed, 11 Aug 2021 01:25:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210717174836.14776-1-paul@crapouillou.net> <20210717174836.14776-2-paul@crapouillou.net>
In-Reply-To: <20210717174836.14776-2-paul@crapouillou.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Aug 2021 10:25:02 +0200
Message-ID: <CACRpkdY3fyAqwGBpBBTNrERMVcP6+61DiDL6BPEFbn5BiuiQ6A@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: ingenic: Fix bias config for X2000(E)
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     =?UTF-8?B?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>,
        linux-mips@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Jul 17, 2021 at 7:48 PM Paul Cercueil <paul@crapouillou.net> wrote:

> The ingenic_set_bias() function's "bias" argument is not a
> "enum pin_config_param", so its value should not be compared against
> values of that enum.
>
> This should fix the bias config not working on the X2000(E) SoCs.
>
> Fixes: 943e0da15370 ("pinctrl: Ingenic: Add pinctrl driver for X2000.")
> Cc: <stable@vger.kernel.org> # v5.12
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Patch applied!

Yours,
Linus Walleij
