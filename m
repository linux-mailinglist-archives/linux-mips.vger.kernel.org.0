Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7B1A3DB8B3
	for <lists+linux-mips@lfdr.de>; Fri, 30 Jul 2021 14:38:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230429AbhG3Mi1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 30 Jul 2021 08:38:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230127AbhG3Mi1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 30 Jul 2021 08:38:27 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A387C0613CF
        for <linux-mips@vger.kernel.org>; Fri, 30 Jul 2021 05:38:22 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id m9so12137226ljp.7
        for <linux-mips@vger.kernel.org>; Fri, 30 Jul 2021 05:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0TPrFNXDo3fiyz0l/s2CJAtmfo7kIvxhcbaJib7tKDk=;
        b=vpScR3U25Ovsfdyt7Y7crUtNpsGq4dweZaIpvd8TbQumwlSW4i5tBuVwczmFcoNcag
         E5iJtmPSdE/flOnlqdoR7VnY2Urk4sEyFZoAqDFiQJO4l9KdnfJleH0V44thWadtf/Pp
         O5XP0NtMiDiHDoIV9gE95mHJYDORJ7LY9PJIAXJP+sX16UMVzKbr+c8A3E3WyFcfvKef
         6xpUyXD21hyy0FeF/GtvAkJOw8bvd2wZLqzKPjMCgab5KGN4rAkcNQ+qAj07dMlSCrnd
         XwWPyN8bK8PK5WXgLWMPU7HuJ5GnwHucT8meJhzA7QvtdiyCQideDgaHRNQFqE3wsUG1
         8sXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0TPrFNXDo3fiyz0l/s2CJAtmfo7kIvxhcbaJib7tKDk=;
        b=CWOKfOfKt57KluiDM2nLv91U+J6yRxaw1WnSJLd8LhsB7pkbZFEV3gj92uPz6UmCy3
         mnHyM79nXy1yZtxN6CzotMtHx6fKXu0rosEpUdPWmaZAufaYAfa7tBT3r2BycbMxMwZk
         iXXrf6bOiRF0AJGjMdzggHYHKuGSYIFXC+vFrSM2zT+JrjdPQWSmKvOpL5dk1/xm7j89
         GiRMiTtzVBdlwYibSy+BITUE020gpk414MXH17gUi7siKaBszOV5N8ZuuesR1KqJJBUn
         WyMviAvJ74tG1l4AfWXn2MlQ3Fh6H4nwhoG1EtnDzak9aajdh8CK9jrEKc9tzNaSjwDJ
         ueIA==
X-Gm-Message-State: AOAM530h1zSJsfaVRdOTW5n5AFLULbNlxpfMeBxJGFt8WYroRbn/CYtM
        XeAdPxx61Oc11+fUYTx7IALvHCTDUH9L94U/9Rkvkg==
X-Google-Smtp-Source: ABdhPJwQP9rYUjp+G/nfNIv5a0w33o23MO0STAgKSfw8PMCWe/ucqXTK5QcMMJ+7QOP5dAlI1PRu3SaENWjQzVQNYHU=
X-Received: by 2002:a2e:888f:: with SMTP id k15mr1528246lji.326.1627648700492;
 Fri, 30 Jul 2021 05:38:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210721030134.10562-1-jiaxun.yang@flygoat.com> <20210721030134.10562-7-jiaxun.yang@flygoat.com>
In-Reply-To: <20210721030134.10562-7-jiaxun.yang@flygoat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 30 Jul 2021 14:38:09 +0200
Message-ID: <CACRpkdbFw0SE8iHs+Y+D-oUBrjxkB_1gqdL2TCYHtd8EsT_edw@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] pinctrl: pistachio: Make it as an option
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-phy@lists.infradead.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jul 21, 2021 at 5:02 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:

> So it will be avilable for generic MIPS kernel.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

I just applied this one patch to the pinctrl tree, let's see if
it works!

Yours,
Linus Walleij
