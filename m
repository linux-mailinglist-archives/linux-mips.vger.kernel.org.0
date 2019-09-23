Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79CC9BAC53
	for <lists+linux-mips@lfdr.de>; Mon, 23 Sep 2019 03:11:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388986AbfIWBLb convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Sun, 22 Sep 2019 21:11:31 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:36384 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388556AbfIWBLb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 22 Sep 2019 21:11:31 -0400
Received: by mail-io1-f65.google.com with SMTP id b136so29517031iof.3
        for <linux-mips@vger.kernel.org>; Sun, 22 Sep 2019 18:11:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=OgP3l57rOQN1YJNBIs3iytzfJPiPA2Drvt3SnO/vEqQ=;
        b=JUesWxMVKdbQtGZGB0e6hQLzjb5Niwe8WJBxOT2gPoPNbKTZgjMLV/M7RQchHbD+Rl
         6Oz2aPQRoIJ58AxoZcuGsPJsGYIncWpPE4QGEFGXMUS1ucJZkmPZR3J4eMfuBt7F1XSR
         og7115ZC3UYgOTFdC++bbkdMvIiR3tW2EQlxdMPGqw73p2cOqR4fxjXW8FoK9+b5IdVg
         PwEQg7nb05/6Sfp7K29FQI/FOFg8cy/8g/xiGHa5oYPdXPZ0tiG5nbKmY8JM5a97Hxr7
         joR4V3+gaKOduGhKZSUPH1RyoAvzZGjgREuuWgrvrKi1zxfP7TzjTRlY9uIbFQYTVzrc
         57Og==
X-Gm-Message-State: APjAAAWhb/m6es5dn69XujVMZCpzxVeYcaBHtAJw9w23cwmyvKqCQ1kT
        bFrdD4x9JvDwkH9EsfVOfK2ZMPZd7LfqtNg1pHQ=
X-Google-Smtp-Source: APXvYqy6sV11oRVeIB3Ub6sgCqAWWdgmcJvEooVFGsk+IKeeWLpVqH894phY55F/W/MjM+obxJj8cPadHgueC8ncIxI=
X-Received: by 2002:a5d:8247:: with SMTP id n7mr30266604ioo.35.1569201090978;
 Sun, 22 Sep 2019 18:11:30 -0700 (PDT)
MIME-Version: 1.0
References: <1549454480-8962-1-git-send-email-chenhc@lemote.com> <0be2db69-6f36-69f7-4f66-ace4c76149f4@flygoat.com>
In-Reply-To: <0be2db69-6f36-69f7-4f66-ace4c76149f4@flygoat.com>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Mon, 23 Sep 2019 09:16:25 +0800
Message-ID: <CAAhV-H4_A9V49znJaODu6z4-eKg8bZEjt=qrk_7a_aeF0Cnb7w@mail.gmail.com>
Subject: Re: [PATCH] MIPS: Add syscall auditing support
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Paul Burton <paul.burton@mips.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Linux MIPS Mailing List <linux-mips@linux-mips.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Paul,

Nearly all archs (including alpha) have supported syscall audit, can
this mips audit patch be merged?

Huacai

On Sun, Sep 1, 2019 at 5:20 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
>
> On 2019/2/6 下午8:01, Huacai Chen wrote:
> > From: Ralf Baechle <ralf@linux-mips.org>
> >
> > The original patch is from Ralf. I have maintained it for more than six
> > years on Loongson platform, and it works perfectly. Most of the commit
> > messages are written by Ralf.
> >
> > MIPS doesn't quite fit into the existing pattern of other architectures
> > and I'd appreciate your comments and maybe even an Acked-by.
> >
> >   - Linux on MIPS extends the traditional syscall table used by older UNIX
> >     implementations.  This is why 32-bit Linux syscalls are starting from
> >     4000; the native 64-bit syscalls start from 5000 and the N32 compat ABI
> >     from 6000.  The existing syscall bitmap is only large enough for at most
> >     2048 syscalls, so I had to increase AUDIT_BITMASK_SIZE to 256 which
> >     provides enough space for 8192 syscalls.  Because include/uapi/linux/
> >     audit.h and AUDIT_BITMASK_SIZE are exported to userspace I've used an
> >     #ifdef __mips__ for this.
> >
> >   - The code treats the little endian MIPS architecture as separate from
> >     big endian.  Combined with the 3 ABIs that's 6 combinations.  I tried
> >     to sort of follow the example set by ARM which explicitly lists the
> >     (rare) big endian architecture variant - but it doesn't seem to very
> >     useful so I wonder if this could be squashed to just the three ABIs
> >     without consideration of endianess?
> >
> > Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
> > Signed-off-by: Huacai Chen <chenhc@lemote.com>
>
> Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>
> Any update about this patch?
>
> Thanks.
>
> --
>
> Jiaxun Yang
>
