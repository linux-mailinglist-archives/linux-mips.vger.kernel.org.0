Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B551F12D49F
	for <lists+linux-mips@lfdr.de>; Mon, 30 Dec 2019 22:09:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727733AbfL3VJe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Dec 2019 16:09:34 -0500
Received: from frisell.zx2c4.com ([192.95.5.64]:41445 "EHLO frisell.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727691AbfL3VJe (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Dec 2019 16:09:34 -0500
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cc421e35;
        Mon, 30 Dec 2019 20:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
        :references:in-reply-to:from:date:message-id:subject:to:cc
        :content-type; s=mail; bh=6bUp3Unh4J5ntgEcnJwDilbtlDo=; b=HqCV+y
        aqge5F+06cKgztdUwKCaXLUh3/yblDQ4rDD3q3hZFy43Nw2+moMQGc5bLj1SkGgi
        frZecd04k7WC5zWIpOPYTz7LwnMirenNoImVd4pgnY+1ZqClE5TYDIPTms//4EJ9
        Qr2QYRh2w5e23TB2+AX6yvB+uIhHxYPld5NTC/kfyh1iX1GPqcEhWMtJSay9/TlQ
        TRxAN24gygo5dRZPREc5R07+3xcoPDW9s1Km3CRZFyIBiJutNpK1Kiru5I7C74+I
        G9nQCIVfdmzMgl87jVYNa/cSnP3LGUhQYorZsC7sdXL1UoDhuJy4KA7Rd/FF+rhA
        uD+YZIoQJA+IfaIg==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id fa0f9c9b (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO);
        Mon, 30 Dec 2019 20:11:23 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id i1so11478210oie.8;
        Mon, 30 Dec 2019 13:09:32 -0800 (PST)
X-Gm-Message-State: APjAAAXV5b60Nw33JcRVh4nggeMk6YkAwguQndY3vvlrQf8uwZkuvNTq
        C58EAPFFFnriJ1sSRUXJYPrXgR1lnBz7/glcr0s=
X-Google-Smtp-Source: APXvYqyuMCRQ4VcLihFnxz8xJ9iUYopeGnYSqitkoalUwep0OXon+FupZMuh+YSXdCyEyaIgYPN8EeXmHxElcAyDLgE=
X-Received: by 2002:aca:2109:: with SMTP id 9mr351507oiz.119.1577740171616;
 Mon, 30 Dec 2019 13:09:31 -0800 (PST)
MIME-Version: 1.0
References: <20191223130834.GA102399@zx2c4.com> <20191224135404.389039-1-Jason@zx2c4.com>
 <CAK8P3a1fVFDkHe=gLy55rHxwfZ8YKcUSYvnhSoMbcAgWy6Nm9w@mail.gmail.com>
 <CAHmME9o07dQV_MmWmtBFCKp=sdsO-scC6-UbXNi=dpU6umCoPg@mail.gmail.com>
 <CAK8P3a0sWObusG3xO_JE9CXCyNfFN0p6OgPjUyU2CHLBBZNpZw@mail.gmail.com>
 <CAHmME9o==nBONywVgSjsmjs2H_A8itgmwibqzPmvivcSocKWRQ@mail.gmail.com>
 <CAK8P3a11g-UXcYdudDtp0TWCQAfotpc-63BqYwn-a9LDxV-b+Q@mail.gmail.com>
 <CAHmME9pnBtjJ86gsWgK8DCYKo_HFpyViHoGpJPTrYBONT01YVA@mail.gmail.com>
 <CAK8P3a0NBuqDX63+920q7Q+yO2xCoSd0O7xUDJv6BBoco2kVOg@mail.gmail.com>
 <CAHmME9rnnoFwh=EHAgdQFM+c33D9mgCoVML_+d=Js=pXPnsxKQ@mail.gmail.com> <CAK8P3a1AYGbgf6mmL-863+PXPBQw3AAtp5wQPL5duLCONGhHuw@mail.gmail.com>
In-Reply-To: <CAK8P3a1AYGbgf6mmL-863+PXPBQw3AAtp5wQPL5duLCONGhHuw@mail.gmail.com>
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Mon, 30 Dec 2019 22:09:20 +0100
X-Gmail-Original-Message-ID: <CAHmME9r2G4viiF4sYqpuYOnFCtjWpjugqenoEeUrsU6MGBeSuQ@mail.gmail.com>
Message-ID: <CAHmME9r2G4viiF4sYqpuYOnFCtjWpjugqenoEeUrsU6MGBeSuQ@mail.gmail.com>
Subject: Re: [PATCH] mips: vdso: conditionalize 32-bit time functions on COMPAT_32BIT_TIME
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Christian Brauner <christian.brauner@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Dec 30, 2019 at 6:33 PM Arnd Bergmann <arnd@arndb.de> wrote
> Is this immediately before/after the syscall instruction or the
> indirect function call?

It's immediately after/before the call to the VDSO function itself.
Next I'll try to instrument the VDSO to get closer to that syscall.

I produced those reg dumps by hooking the page fault handler in the
kernel to print them and then disabling aslr and sticking a
`*(volatile int *)0 = 0;` in the code. Pretty gnarly.
