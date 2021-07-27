Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 889623D7F37
	for <lists+linux-mips@lfdr.de>; Tue, 27 Jul 2021 22:26:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232146AbhG0U0I (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 27 Jul 2021 16:26:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230425AbhG0U0H (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 27 Jul 2021 16:26:07 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1682CC061760
        for <linux-mips@vger.kernel.org>; Tue, 27 Jul 2021 13:26:07 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id r17so23889262lfe.2
        for <linux-mips@vger.kernel.org>; Tue, 27 Jul 2021 13:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5W7I5NJ7607nekgTVXMsjnvhBYEaNIc7ZnBD14nK1Lw=;
        b=SGmBbFjeBkkvg5TnrRW6wDpFH1NZFsjj8NeVunkx64lh+U9JXSYPNskR7ozV0UkJEJ
         zBkDxxdXq8bKevyGTMDR9q1g71RKl/lQjTPgnbPUIYWM4jMQVRggD6l7pJBWGfEAsUAf
         3xZI07lQmMXYSGk0PzGduvG7h5rGYaMFS2LXhIFUO3U4xQOLH4Y9dXb48ZCxiObAxxxJ
         CbO2ELTV6ZtUc0gkzVDRdYACFOpF2yjIXvG22ko/tFt/xDkhAWh8uqJW59JPlYdZlBZ6
         0KiO+dFjPFwHlfpo0/W1UpYFdGkksBsrQleck17dEYzoYLZxgeGW65qqOcakT1bLQpSH
         ixOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5W7I5NJ7607nekgTVXMsjnvhBYEaNIc7ZnBD14nK1Lw=;
        b=KCxzCH0BJ7PxZ5WunpN4GMVHrpzaVKaLStIesEmgnqzrcE4fwxLww95rt+Kxec8Zb6
         N9efSbyh25ggdPB+nZdljNUH609TFDekdqWsqw1qRrPUoJ5VbcNbadM0220OBQzSAq2F
         FBUBF+uFDh0oM6O0uSNn7/9jdV9CQK+fNHbFpn+LsqexfpVpsu8SAZtCHuyKiJEYXlLe
         kN7ZJJl6F5npAX+KAcDatW7e7JZrTg5DbT6NhTlkz2/JSGrBvvvvl7AxGJDdbT0WOfap
         OOj33hiRBszLzkLhAD7bLx/643V4OHxhbSsi95Mg3QRKR97g8gtF6dSDSh0ozOHkTJRb
         caew==
X-Gm-Message-State: AOAM533qjuT4j7DUAAskA2VXOEHS8OPkBHWJgw92rTfEwjLpWZ5VvOHK
        2EJkqt5XrS5gI5KeLGLQu2mJj0+QnVY7oMKRVmBzjw==
X-Google-Smtp-Source: ABdhPJwqrozlM71o/YWycrk4nFXhaQSolQceA5mTAAHS5NoeqVcyVBzNsPdOTSbtGWnIJUkr9LvsHBgHBJBrEUh0hWM=
X-Received: by 2002:a05:6512:3e0c:: with SMTP id i12mr17532275lfv.122.1627417565216;
 Tue, 27 Jul 2021 13:26:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210718130748.230758-1-paul@crapouillou.net> <CAKwvOdkVEa-CxbVschn5Tnh7-Ynvzcz+zChhP3LL3Q745wE7_A@mail.gmail.com>
 <7YIIWQ.1TU3IBLL4KNC2@crapouillou.net> <20210721161719.GA9805@alpha.franken.de>
In-Reply-To: <20210721161719.GA9805@alpha.franken.de>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 27 Jul 2021 13:25:54 -0700
Message-ID: <CAKwvOdmAxEUdSM-6g+pGHLdtzm1sRDoiPqMP_hWNLM9E4Kp7Dg@mail.gmail.com>
Subject: Re: [PATCH] MIPS: Avoid macro redefinitions
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Cercueil <paul@crapouillou.net>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        list@opendingux.net, Kees Cook <keescook@chromium.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jul 21, 2021 at 9:17 AM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Mon, Jul 19, 2021 at 11:10:55PM +0100, Paul Cercueil wrote:
> > > >   #ifndef TOOLCHAIN_SUPPORTS_VIRT
> > >
> > > Same question for GAS version support for virt?
> > > Documentation/process/changes.rst
> > > says GNU binutils 2.23+ is required for building the kernel.
> > > If we still need to support, have you tested this change on such an
> > > older version of GNU binutils?
> >
> > I have no idea about virt support - I hope Thomas can answer this.
>
> virt support was added in 2.24 and xpa in 2.25. So we still need the
> TOOLCHAIN defines for it.

Ah, ok then. Thanks for finding that.  Perhaps Paul you can note that
in the v2 that removes the commented out line, then we should be good
to go?
-- 
Thanks,
~Nick Desaulniers
