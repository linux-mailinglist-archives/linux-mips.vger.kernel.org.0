Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A39F32FD85
	for <lists+linux-mips@lfdr.de>; Sat,  6 Mar 2021 22:36:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229729AbhCFVff (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 6 Mar 2021 16:35:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:48120 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229709AbhCFVff (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 6 Mar 2021 16:35:35 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 18850650C9;
        Sat,  6 Mar 2021 21:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615066535;
        bh=7A0VOvCfl+U06ZpaUEf3bWRU7A3XrmarnXWCSLAZIa8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=iEd2cL/EcpOfzk5qqnv2vAS9AQ96X87gITqP0XNsJnmwB6B4qSjekqrlRyJG5lGk+
         f0pYzSEud0YZoLAn8iYkKOQUur+uYCxBKD4mBdDMPsXvhw3RyAtDUVNTNm+mPhGifF
         yEkC/16w0Yuf45Sw6we1fGRyRxfATAYzf4OG3DH6fyNHl/9tD1G3oPQRmM5H17Qol0
         UFh0XWgLemnBoHSt2fYePOm23TzHKwJM60rifWtQximb28s0zvPPrvhGJiYAZOeyPj
         v0Yr6BkjGCmlBZeNCLJTfr1E0Q4S5WG6/mgsD/azXnN2rOyJxNdSxPjz0DknBqt3wW
         yiL2I5YPicePA==
Received: by mail-ej1-f47.google.com with SMTP id p8so11765729ejb.10;
        Sat, 06 Mar 2021 13:35:35 -0800 (PST)
X-Gm-Message-State: AOAM533p0X0qV/1sOG7AApUDENslkWG5hwNsL4ciIKvo44NucoLj5h0c
        MhMJtffrPawEK5nX4tHnIudN6DO7M2ME26Mffw==
X-Google-Smtp-Source: ABdhPJxXFZVhSRPDf9x8QRYq/Xu9KATA0aCen7wNLOhjGQKIJ9Vb39DtoBXl4iyG5lmGPzuGpLojYL6uGKiqFkwOgZc=
X-Received: by 2002:a17:906:d153:: with SMTP id br19mr8111116ejb.360.1615066533691;
 Sat, 06 Mar 2021 13:35:33 -0800 (PST)
MIME-Version: 1.0
References: <20210303193305.924384-1-paul@crapouillou.net> <CAL_JsqLfkjC4c4PYfm6yJLZMH-5WaKA_mr9ziJ1J63UohcgRCw@mail.gmail.com>
 <20210306084513.GA5453@alpha.franken.de>
In-Reply-To: <20210306084513.GA5453@alpha.franken.de>
From:   Rob Herring <robh@kernel.org>
Date:   Sat, 6 Mar 2021 14:35:21 -0700
X-Gmail-Original-Message-ID: <CAL_JsqK0_M18gnoYFyTyf_OaQgbmbYYyoAr-WaFCzzsmFuFeFg@mail.gmail.com>
Message-ID: <CAL_JsqK0_M18gnoYFyTyf_OaQgbmbYYyoAr-WaFCzzsmFuFeFg@mail.gmail.com>
Subject: Re: [PATCH] MIPS: boot/compressed: Copy DTB to aligned address
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Mar 6, 2021 at 1:45 AM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Wed, Mar 03, 2021 at 02:37:55PM -0600, Rob Herring wrote:
> > On Wed, Mar 3, 2021 at 1:33 PM Paul Cercueil <paul@crapouillou.net> wrote:
> > >
> > > Since 5.12-rc1, the Device Tree blob must now be properly aligned.
> >
> > I had checked the other built-in cases as microblaze broke too, but
> > missed some of the many ways MIPS can have a dtb. Appended and
> > built-in DTBs were supposed to be temporary. :(
>
> and a fdt can also be provided by firmware. And according to spec
> there is no aligmnet requirement. So this whole change will break
> then. What was the reason for the whole churn ?

There was a long discussion on devicetree-compiler list a few months
ago. In summary, a while back libfdt switched to accessors from raw
pointer accesses to avoid any possible unaligned accesses (is MIPS
always okay with unaligned accesses?). This was determined to be a
performance regression and an overkill as the DT structure itself
should always be naturally aligned if the dtb is 64-bit aligned. I
think 32-bit aligned has some possible misaligned accesses.

As part of this, a dtb alignment check was added. So worst case, we
could disable that if need be.

Rob
