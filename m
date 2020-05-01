Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32E251C1F6A
	for <lists+linux-mips@lfdr.de>; Fri,  1 May 2020 23:14:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726344AbgEAVOv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 1 May 2020 17:14:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726045AbgEAVOu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 1 May 2020 17:14:50 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88DAFC061A0C
        for <linux-mips@vger.kernel.org>; Fri,  1 May 2020 14:14:50 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id n17so8543735ejh.7
        for <linux-mips@vger.kernel.org>; Fri, 01 May 2020 14:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=us9WMkr6wKnyYx/hgFQnJdJ65nSZxBY8d4KZLY6FNHM=;
        b=VZRrLltv/S+U4KaH0b8v/NgosrB3HibBD5BAxu7qZpvdPN5PKQBHPf2EwxpUgmke40
         1j4a/IRmKb6HWubZ2ckxp+A7iSJWo/RkQ+kvMqKpDVsrUhA+CR2382e5ckfiWm4D8Otl
         uPrxVnPfLRSlR8vgtwepNSjZHGRPa/dC6R+eb090p/xFe40r+/mmRi267zPI8kCzJc6P
         6uWluYTtzQyGhg9IagBVYcQmCNe8MrECoWmPrvXXWcos2RVpSbppPfaIz86iHcd15wl/
         pL4SP8x2zsrrA6y1bX0IvivKnsZNYFkweV4X0lAy2L5b87ABuOCBnTNzuq8TvGuTh+dp
         u1Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=us9WMkr6wKnyYx/hgFQnJdJ65nSZxBY8d4KZLY6FNHM=;
        b=ZSRzjXhPuMXhN3PX2iI67X49zqwMIzUmCQeGalMVYg0uDnC0ztnT0MWft8SmV9REpd
         lWI13tvEVm5gjw/mHcMVDVNXzs9/ej7hExTQLx/+tSeIQautvqFkEgoPCRl4zYSRAdEy
         Rci9kU6psajSAd112AR6/6H77hc2faBtag3Qp8JPuQcWWsQSPPycBwTwjIur0pV/QRFG
         RMQMZ7elmQKeqmJsOfTwc4fhKLbJpTwlvzB8g5MjmKnswhWIXD2PB10cHCyNl32dF6fq
         vqLLNH/t5kwvToDap+fv1vvZLW1Dt8pz0Kh9DTKD4Z47l/CEYfIrgmNCCJpxOitC7QGh
         d7zQ==
X-Gm-Message-State: AGi0PuZo3AqzTK/9ISIGWqh4bhLQvUC9d4hsJg+FtWjxa7ptnRyz4nGB
        U83Ww3I5lxAAiz3OLzpbX/gmmRF6Ze9OwRoc+Qib
X-Google-Smtp-Source: APiQypI06H5AjLHya/8neX/PwPs/MhJ6QoaTYrimLEvjr3QVzovpXkFejuz2QZHd7O6PUX8G9UyMM+2AOd0/OaZ90mU=
X-Received: by 2002:a17:906:d7a2:: with SMTP id pk2mr5302234ejb.272.1588367688992;
 Fri, 01 May 2020 14:14:48 -0700 (PDT)
MIME-Version: 1.0
References: <1584006083-28936-1-git-send-email-chenhc@lemote.com> <CAAhV-H6Jy_7N99XmBwjSEX=Fx16AY4Azt_fUNvPBZNiqxhJ_zQ@mail.gmail.com>
In-Reply-To: <CAAhV-H6Jy_7N99XmBwjSEX=Fx16AY4Azt_fUNvPBZNiqxhJ_zQ@mail.gmail.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Fri, 1 May 2020 17:14:37 -0400
Message-ID: <CAHC9VhTbTKF3+adVq8ubwHu7HuVJvGBgokNxSaH1f1Hcku8Rzg@mail.gmail.com>
Subject: Re: [PATCH Resend] MIPS: Add syscall auditing support
To:     Huacai Chen <chenhuacai@gmail.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Eric Paris <eparis@redhat.com>, linux-audit@redhat.com,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Apr 27, 2020 at 5:12 AM Huacai Chen <chenhuacai@gmail.com> wrote:
> On Thu, Mar 12, 2020 at 5:33 PM Huacai Chen <chenhc@lemote.com> wrote:
> >
> > From: Ralf Baechle <ralf@linux-mips.org>
> >
> > The original patch is from Ralf. I have maintained it for more than six
> > years on Loongson platform, and it works perfectly. Most of the commit
> > messages are written by Ralf.
> >
> > MIPS doesn't quite fit into the existing pattern of other architectures
> > and I'd appreciate your comments and maybe even an Acked-by.
> >
> >  - Linux on MIPS extends the traditional syscall table used by older UNIX
> >    implementations.  This is why 32-bit Linux syscalls are starting from
> >    4000; the native 64-bit syscalls start from 5000 and the N32 compat ABI
> >    from 6000.  The existing syscall bitmap is only large enough for at most
> >    2048 syscalls, so I had to increase AUDIT_BITMASK_SIZE to 256 which
> >    provides enough space for 8192 syscalls.  Because include/uapi/linux/
> >    audit.h and AUDIT_BITMASK_SIZE are exported to userspace I've used an
> >    #ifdef __mips__ for this.

I'm sure you're aware of the hacky nature of such a change and
considering that it is a break in the kernel/userspace API, hacky
changes make me nervous.  Very nervous.

The ultimate fix for this would be to move away from passing structs
across netlink and use netlink attributes; this would allow us the
flexibility to tweak the fields like we would need for this without
completely breaking existing systems.  However, that is a big chunk of
work (and I'm just talking about the control plane, not the audit
records themselves as has been discussed in the past) and I can
understand if that is not something you want to take on at this point.

A less disruptive, but even more of an awful hack would be to extend
past the end of the audit_rule_data struct with an audit_rule_data_ext
(?) struct (perhaps indicated by a flag), but that is tricky due the
variable length buffer at the end of audit_rule_data.  I *really*
dislike this idea, but it is *an* idea.

I'm open to suggestions, but my current leaning is that if we are
going to add support for MIPS, we'll need to actually do the work to
convert the netlink control plane to use netlink attributes.

> >  - The code treats the little endian MIPS architecture as separate from
> >    big endian.  Combined with the 3 ABIs that's 6 combinations.  I tried
> >    to sort of follow the example set by ARM which explicitly lists the
> >    (rare) big endian architecture variant - but it doesn't seem to very
> >    useful so I wonder if this could be squashed to just the three ABIs
> >    without consideration of endianess?

Forgive my ignorance of MIPS, but as I understand it there is 32-bit
MIPS (old-ABI), 64-bit MIPS (new-ABI), and 64/32-bit MIPS (new-API,
aka N32); with each having both little and big endian variants, is
that correct?

Is it also safe to assume that 64-bit MIPS (new-API) can only run
64-bit new-API and N32 binaries and *not* 32-bit old-API binaries?

I'm guessing MIPS does not support running both little and big endian
binaries simultaneously on the same booted system?  Or does it?

-- 
paul moore
www.paul-moore.com
