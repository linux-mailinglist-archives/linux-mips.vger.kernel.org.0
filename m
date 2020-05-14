Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8C061D26D1
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2020 07:52:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725943AbgENFwZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 May 2020 01:52:25 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:44335 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725794AbgENFwY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 14 May 2020 01:52:24 -0400
Received: by mail-io1-f66.google.com with SMTP id f4so1563575iov.11
        for <linux-mips@vger.kernel.org>; Wed, 13 May 2020 22:52:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mfwsnQNbIdsaEf7Y1rIghBc1SRs1hgXNWyWBcEFLR9E=;
        b=uBPRJwXYHRlJhDvwezeK1jT1204q+/dI1DXXAUIHVWo/+QWGQIC3lGE9Dj7bhWIROI
         YVGwezkdV8OQXSE9dMtcInzXTSggP/Zur8eecAeUMKG8fAeTPb4KZjhgLEi1VhxTUHEp
         /s1rFYrHDWfMsDwHCMJ3gNy7BlrDrrjb0CPRRLNgbk4XK7tfGbdl+sTxGNM2j867q7/o
         0KU9zCXAaPZPYctFP437CSlwfK4O4ULxkcqZXXpxGhuXUagZ8UgWd+XPLD+/tUDTkqkX
         Jl+2c6rSTNJYc4N0UrsxRxkg5QywB201pYWBOSVJ4bng1yIJD+aBFF7h4Z6ObuLNhFXB
         eCaQ==
X-Gm-Message-State: AGi0PubqkcuYNkXiz0vUXJdL5VfWYakdR5Fcyr6dVs0LnBn7Cxbf1Vkz
        3UZ/eC+iiS6KHDmskxH3ur79JZp9zJRic+6c1Tg=
X-Google-Smtp-Source: APiQypJEaqh5T7u1Qj2gLeoOjEHhClxMrf8DGbrv4pADeC9KnmiIoLsMhZFufC0sjopir0daN8tMfGf98xY+D2B/tmY=
X-Received: by 2002:a02:3f47:: with SMTP id c7mr3085359jaf.126.1589435543935;
 Wed, 13 May 2020 22:52:23 -0700 (PDT)
MIME-Version: 1.0
References: <1589359121-1572-1-git-send-email-chenhc@lemote.com> <20200513112101.GC7151@alpha.franken.de>
In-Reply-To: <20200513112101.GC7151@alpha.franken.de>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Thu, 14 May 2020 13:52:14 +0800
Message-ID: <CAAhV-H4bsXyLmGH=pAism3R7Gup1fCMyAcE6fB+F=9cgS6uM-Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] MIPS: Fix typos in arch/mips/Kbuild.platforms
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Thomas,

On Wed, May 13, 2020 at 7:21 PM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Wed, May 13, 2020 at 04:38:40PM +0800, Huacai Chen wrote:
> > Commit 26bff9eb49201aeb ("MIPS: Only include the platform file needed")
> > misspelled "txx9" to "tx99", so fix it.
> >
> > Fixes: 26bff9eb49201aeb ("MIPS: Only include the platform file needed")
> > Signed-off-by: Huacai Chen <chenhc@lemote.com>
> > ---
> >  arch/mips/Kbuild.platforms | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
>
> applied both patches to mips-next. Thank you for fixing.
It seems like there are more problems caused by your patch, due to the
lack of arch/mips/vr41xx/Makefile, all VR41XX configs cannot be build
now, including:
arch/mips/configs/workpad_defconfig
arch/mips/configs/tb0219_defconfig
arch/mips/configs/tb0287_defconfig
arch/mips/configs/tb0226_defconfig
arch/mips/configs/mpc30x_defconfig
arch/mips/configs/capcella_defconfig
arch/mips/configs/e55_defconfig

And I don't know how to fix...
>
> Thomas.
>
> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]
Huacai
