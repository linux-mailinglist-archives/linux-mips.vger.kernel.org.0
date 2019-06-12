Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8121E419DC
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2019 03:10:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408002AbfFLBJq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 11 Jun 2019 21:09:46 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:44099 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405839AbfFLBJp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 11 Jun 2019 21:09:45 -0400
Received: by mail-lf1-f68.google.com with SMTP id r15so10694913lfm.11
        for <linux-mips@vger.kernel.org>; Tue, 11 Jun 2019 18:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SZXVeOYEeW/t6moRL6yl166/GZV1HqW8qo9aOqBVN+Q=;
        b=gAjfSlHuLsIpxvb8lF0RyxQXzEhYSHQJnAZ4as99A8GBRPKGt8LtILDEijhajNv2fV
         FXhIx40OUX4WPq1W1eQvis0UNqIoFt7tkihxVZ4QyREYOfVPuleZ/0Zq1i4TWCfQY/NA
         AhmvmJi02EHwj98eCflp9T4F3Jku2HpzQgXkw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SZXVeOYEeW/t6moRL6yl166/GZV1HqW8qo9aOqBVN+Q=;
        b=Ql/sSCRtgfrZE02z5FEYbLvleoJgLuoWQff3GfBsWh30elHq0u5q0ABaMw6m/0G8bc
         xA4p3J7c4Em0JEDUD6/IqUdhkJlc3We0VIFsfH5hBOQofEx0G2t82qXrT8jKtNS4RegZ
         F7HK80nAgm2l9FGB1FTscXrG5qMFiq8b7br0d2mwMPG9kVN7dzf6R/3S5Kha3zEt9hy6
         8aygXW0vLtoX0KCQRfO63kxaNiJ8Q5373tCP7rTDRyFl+Ois6VAbR0FNmHVisMMkQ+m8
         CZAFcLtRBwJJhPGqqJV+8KeXSDPlMH/G752a77rwNb5bFcBlPa4JOXZoPM2MM5xfrgiM
         NFMQ==
X-Gm-Message-State: APjAAAXw9iYzBsEy9iD4rK5R9EVww9DgwgejuzjDaAXNeFyzj4x1hAkD
        uLVPVG032bQwIRS1plx8r/98nBmjgbI=
X-Google-Smtp-Source: APXvYqwli+KrLbmUH3SvI6P3QD3YZakxo2qb9fogCzvQCXprvtaQewoGnzo2p0elcJny17CpzeiFXw==
X-Received: by 2002:a19:521a:: with SMTP id m26mr14169210lfb.134.1560301782487;
        Tue, 11 Jun 2019 18:09:42 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id c5sm2793799lfm.7.2019.06.11.18.09.40
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jun 2019 18:09:41 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id j29so10694326lfk.10
        for <linux-mips@vger.kernel.org>; Tue, 11 Jun 2019 18:09:40 -0700 (PDT)
X-Received: by 2002:ac2:50c4:: with SMTP id h4mr26185312lfm.61.1560301780325;
 Tue, 11 Jun 2019 18:09:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190611144102.8848-1-hch@lst.de> <20190611144102.8848-17-hch@lst.de>
 <1560300464.nijubslu3h.astroid@bobo.none>
In-Reply-To: <1560300464.nijubslu3h.astroid@bobo.none>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 11 Jun 2019 15:09:24 -1000
X-Gmail-Original-Message-ID: <CAHk-=wjSo+TzkvYnAqrp=eFgzzc058DhSMTPr4-2quZTbGLfnw@mail.gmail.com>
Message-ID: <CAHk-=wjSo+TzkvYnAqrp=eFgzzc058DhSMTPr4-2quZTbGLfnw@mail.gmail.com>
Subject: Re: [PATCH 16/16] mm: pass get_user_pages_fast iterator arguments in
 a structure
To:     Nicholas Piggin <npiggin@gmail.com>
Cc:     Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Christoph Hellwig <hch@lst.de>,
        James Hogan <jhogan@kernel.org>,
        Paul Burton <paul.burton@mips.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Andrey Konovalov <andreyknvl@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Khalid Aziz <khalid.aziz@oracle.com>,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
        linux-mips@vger.kernel.org, Linux-MM <linux-mm@kvack.org>,
        linuxppc-dev@lists.ozlabs.org,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
        "the arch/x86 maintainers" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jun 11, 2019 at 2:55 PM Nicholas Piggin <npiggin@gmail.com> wrote:
>
> What does this do for performance? I've found this pattern can be
> bad for store aliasing detection.

I wouldn't expect it to be noticeable, and the lack of argument
reloading etc should make up for it. Plus inlining makes it a
non-issue when that happens.

But I guess we could also at least look at using "restrict", if that
ends up helping. Unlike the completely bogus type-based aliasing rules
(that we disable because I think the C people were on some bad bad
drugs when they came up with them), restricted pointers are a real
thing that makes sense.

That said, we haven't traditionally used it, and I don't know how much
it helps gcc. Maybe gcc ignores it entirely? S

               Linus
