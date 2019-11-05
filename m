Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3EEEEF273
	for <lists+linux-mips@lfdr.de>; Tue,  5 Nov 2019 02:08:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729796AbfKEBIn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 4 Nov 2019 20:08:43 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:42208 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728602AbfKEBIm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 4 Nov 2019 20:08:42 -0500
Received: by mail-io1-f65.google.com with SMTP id k1so20708498iom.9
        for <linux-mips@vger.kernel.org>; Mon, 04 Nov 2019 17:08:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3iKTK9NDRXcOl8sogEDKyOwVRxBdTkLL2PgDkaYWwME=;
        b=IsuJVeEUkSREle8ufiI2DRTQgLxzHJktbRhAy9Cw85+tsTqlsI7enIqKfR3FTsW5xz
         5/+abrRt81IOcesFRqh7FvTx+goEnewQ50nTGVO1QGv9f8Cy272s3M+SchqjjMnlCnMB
         MU4xcsAvR+vczoM17zSXJu2GiyYdHzKaRyEXYCYmS3xQQyY6LO4BvBBjbhjtRmhvixZV
         wmxBLFmZIAJ5xPdBsyxtzIBXiqzDQqan25leMqodnh0ZCQOtWDgwvxsQ9lvEW60bfFhC
         ciKKKGsIX8OnSYrmqo/TBkkPMVSFqo7mlza2dfYt0QH+cwvqV6DeswSbyHi6B9Fb6vNG
         zwlw==
X-Gm-Message-State: APjAAAWd357iGxujEJMaCKfYe0mWIHDTUC2dqcAc0xNo3KRJFmuVFWK1
        HCh1q4YklX4tjIS8JmzZC0D60013PjxFpxDmGyM=
X-Google-Smtp-Source: APXvYqzBYYv65fxO8N5aeRHVeHEu8yJeXGRSJoXCOZBt8mBZOzrrM8tEq6oC3yfr2/+3zX4LCA17avgyu0zHO1Bo/Lo=
X-Received: by 2002:a5d:9b0f:: with SMTP id y15mr12428908ion.35.1572916121938;
 Mon, 04 Nov 2019 17:08:41 -0800 (PST)
MIME-Version: 1.0
References: <1572758417-29265-1-git-send-email-chenhc@lemote.com> <20191104190330.hpzuqsyh5j5tkr4p@lantea.localdomain>
In-Reply-To: <20191104190330.hpzuqsyh5j5tkr4p@lantea.localdomain>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Tue, 5 Nov 2019 09:14:22 +0800
Message-ID: <CAAhV-H4tzoPu_iHh9aUVRtwmNsJTQLkOJRN2i2159m_L7m1YRQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] MIPS: Loongson: Remove Loongson-2E/2F support
To:     Paul Burton <paulburton@kernel.org>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Paul Burton <paul.burton@mips.com>,
        Linux MIPS Mailing List <linux-mips@linux-mips.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Paul

On Tue, Nov 5, 2019 at 3:03 AM Paul Burton <paulburton@kernel.org> wrote:
>
> Hi Huacai,
>
> On Sun, Nov 03, 2019 at 01:20:15PM +0800, Huacai Chen wrote:
> > Loongson-2E/2F is old, inactive and a bit ugly, so let's remove them
> > and the world will be more comfortable.
> >
> > Old:
> > Products with Loongson-2E/2F are more than ten years old, there is no
> > new products.
> >
> > Inactive:
> > There are not any updates for a long time, and the maintainer (Jiaxun
> > Yang) focuses on Loongson-3 now.
>
> Jiaxun just made changes to the 2E/2F code just a couple of weeks ago to
> separate it from other Loongson64 support & clean it up - he also
> indicated at the same time that he intends to contiue maintaining this
> code [1].
>
> > Ugly:
> > Loongson-2E/2F are not compatible with regular MIPS, e.g., ebase, cache
> > flush method and tlb refill handler.
>
> Sadly "quirks" like this aren't solely the domain of Loongson 2E/2F
> machines, so this isn't an unusual burden.
>
> > Linux-5.4.x is a LTS release, I think it is the suitable time to remove
> > Loongson-2E/2F.
>
> I disagree - Jiaxun says he's happy to maintain the platform & has
> recently been working on it. I'm not going to remove it & deny him that
> chance. If it does indeed become unmaintained then sure let's drop it,
> but that doesn't seem to be the case here.
>
OK, I will keep Loongson-2E/2F in the kernel, and please review my
other patches. Thanks.

Huacai
> Thanks,
>     Paul
>
> [1] https://lore.kernel.org/linux-mips/AF48876C-308C-46AD-B7B4-77BFA2413EDE@flygoat.com/
