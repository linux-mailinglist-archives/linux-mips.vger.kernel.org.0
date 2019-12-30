Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16E2A12D4B3
	for <lists+linux-mips@lfdr.de>; Mon, 30 Dec 2019 22:42:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727751AbfL3Vmz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Dec 2019 16:42:55 -0500
Received: from frisell.zx2c4.com ([192.95.5.64]:52549 "EHLO frisell.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727691AbfL3Vmz (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Dec 2019 16:42:55 -0500
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c5818331;
        Mon, 30 Dec 2019 20:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
        :references:in-reply-to:from:date:message-id:subject:to:cc
        :content-type; s=mail; bh=RUYsmC034P4+FRLW5W24EbcqSD0=; b=Ywa1NT
        TxQgvVyEjvwIZ1ImHcQDU2ElstIjVwHaXE42h+R9H7sSzpigjAJSZLraMmgsISa2
        TQqRVdeu66dcsX5VJRmXypu/SjYOI4EzmCGz5xoQQX+Sk6Q+WStuD0A6oQhAVX18
        nV/OkNMbgCckuaDzJ52fBEjSUin25euYLuvl3OSoGPfzAZhWH9EMoFCiL3tWIH2o
        CqkSK0eZmqfDo9ojrU/YwZnCsZ3dgU2dgEpnvgauxrbVJUvyS2mMuwl7j/q6f09r
        AyuBjqgPJ3E0HmSkPphKAOU7FjpdvRMs7besSOTjs3P99ugr8XGYJpQQKJ/jOG9Z
        OusPN7DRSKh8wGCQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 448303fd (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO);
        Mon, 30 Dec 2019 20:44:42 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id 59so47848601otp.12;
        Mon, 30 Dec 2019 13:42:52 -0800 (PST)
X-Gm-Message-State: APjAAAUn6hImfB0fiXC+4HMck2c/KouiBk6T/Ah1wn4R3vwzfIf/c6XQ
        f916nPlhARR1CW+HhUer6Nf2E3852jhco7jyjaU=
X-Google-Smtp-Source: APXvYqyJFca99rUik95EqeR0wfNMwJvoDxTrbnU4YcQsAzn0rj4zYYoGMhdZyJ6raJg8jP3CNSwD6RTZJjQpMduSbyc=
X-Received: by 2002:a9d:674f:: with SMTP id w15mr77963933otm.243.1577742171452;
 Mon, 30 Dec 2019 13:42:51 -0800 (PST)
MIME-Version: 1.0
References: <20191223130834.GA102399@zx2c4.com> <20191224135404.389039-1-Jason@zx2c4.com>
 <CAK8P3a1fVFDkHe=gLy55rHxwfZ8YKcUSYvnhSoMbcAgWy6Nm9w@mail.gmail.com>
 <CAHmME9o07dQV_MmWmtBFCKp=sdsO-scC6-UbXNi=dpU6umCoPg@mail.gmail.com>
 <CAK8P3a0sWObusG3xO_JE9CXCyNfFN0p6OgPjUyU2CHLBBZNpZw@mail.gmail.com>
 <CAHmME9o==nBONywVgSjsmjs2H_A8itgmwibqzPmvivcSocKWRQ@mail.gmail.com>
 <CAK8P3a11g-UXcYdudDtp0TWCQAfotpc-63BqYwn-a9LDxV-b+Q@mail.gmail.com>
 <CAHmME9pnBtjJ86gsWgK8DCYKo_HFpyViHoGpJPTrYBONT01YVA@mail.gmail.com>
 <CAK8P3a0NBuqDX63+920q7Q+yO2xCoSd0O7xUDJv6BBoco2kVOg@mail.gmail.com>
 <CAHmME9rnnoFwh=EHAgdQFM+c33D9mgCoVML_+d=Js=pXPnsxKQ@mail.gmail.com>
 <CAK8P3a1AYGbgf6mmL-863+PXPBQw3AAtp5wQPL5duLCONGhHuw@mail.gmail.com> <CAHmME9r2G4viiF4sYqpuYOnFCtjWpjugqenoEeUrsU6MGBeSuQ@mail.gmail.com>
In-Reply-To: <CAHmME9r2G4viiF4sYqpuYOnFCtjWpjugqenoEeUrsU6MGBeSuQ@mail.gmail.com>
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Mon, 30 Dec 2019 22:42:40 +0100
X-Gmail-Original-Message-ID: <CAHmME9rCCei_CL1evDYQ44Eu8erbjx_jDzbpKeXD4jTGBu8v8A@mail.gmail.com>
Message-ID: <CAHmME9rCCei_CL1evDYQ44Eu8erbjx_jDzbpKeXD4jTGBu8v8A@mail.gmail.com>
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

On Mon, Dec 30, 2019 at 10:09 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> On Mon, Dec 30, 2019 at 6:33 PM Arnd Bergmann <arnd@arndb.de> wrote
> > Is this immediately before/after the syscall instruction or the
> > indirect function call?
>
> It's immediately after/before the call to the VDSO function itself.
> Next I'll try to instrument the VDSO to get closer to that syscall.
>
> I produced those reg dumps by hooking the page fault handler in the
> kernel to print them and then disabling aslr and sticking a
> `*(volatile int *)0 = 0;` in the code. Pretty gnarly.

Here's immediately before and immediately after the syscall asm that
the vdso has in mips/include/asm/vdso/gettimeofday.h. sp and ra are
wrong?

Before:

[    0.546364] $ 0   : 0000000000000000 0000000000000001
0000000000000002 0000000000000000
[    0.546545] $ 4   : 000000007fff4000 0000000000000000
0000000077ff0000 0000000000000406
[    0.546762] $ 8   : 000000007fff5000 0000000000000020
0000000000000002 0000000000000000
[    0.546912] $12   : 0000000000000000 000000000000000a
ffffffff80000000 000000000000006d
[    0.547046] $16   : 000000007fff2e40 000000007fff2e40
0000000010000000 0000000010000000
[    0.547178] $20   : 0000000010000000 0000000010000000
0000000000000000 0000000077ff0000
[    0.547548] $24   : 0000000000000005 0000000000000000
[    0.547743] $28   : 000000007fff5000 000000007fff2df0
0000000000000000 000000007fff550c
[    0.547898] Hi    : 0000000000000000
[    0.548010] Lo    : 0000000000000000
[    0.548175] epc   : 000000007fff5580 0x7fff5580
[    0.548358] ra    : 000000007fff550c 0x7fff550c
[    0.549305] Stack : 0000000000000002 000000007fff2e40
0000000000000002 0000000077f9e80c
[    0.549500]         0000000000000000 0000000000000000
ffffffffffffffff 0000000010000000
[    0.549687]         0000000010019dd0 0000000010000c20
0000000077ff0000 0000000077fa4868
[    0.549951]         0000000377ff19b8 0000000000000000
000000007fff2f04 0000000000000001
[    0.550127]         0000000010000870 0000000077ff0000
0000000077fa4868 0000000077ff19b8
[    0.550277]         0000000077ff7180 0000000077f297ac
7fff2f0c77ff7180 0000000077f29800
[    0.550458]         0000000000000000 000000007fff2f00
0000000077ff19b8 0000000077ff1e30
[    0.550613]         0000000010019dd0 0000000010000dec
0000000010019dd0 0000000010000db0
[    0.550811]         0000000000000000 0000000000000000
000000017fff2fda 000000007fff2fe0
[    0.550957]         7fff2fe700000000 000000217fff5000
0000001000000020 0000000600001000

After:

[    0.577975] $ 0   : 0000000000000000 0000000000000001
0000000000000059 000000007fff5000
[    0.578191] $ 4   : 0000000000000002 000000007fff2e40
0000000077ff0000 0000000000000001
[    0.578392] $ 8   : 0000000000000006 0000000000000020
0000000000000002 0000000000000000
[    0.578611] $12   : 0000000000000000 0000000000001852
ffffffff801560e0 000000000000006d
[    0.578817] $16   : 0000000000000002 000000007fff2e40
0000000010000000 0000000010000000
[    0.579004] $20   : 0000000010000000 0000000010000000
0000000000000000 0000000077ff0000
[    0.579149] $24   : 0000000000000005 0000000000000000
[    0.579375] $28   : 000000007fff5000 000000007fff2de0
0000000000000000 000000007fff551c
[    0.579640] Hi    : 0000000000000000
[    0.579799] Lo    : 0000000000000000
[    0.579974] epc   : 000000007fff55a0 0x7fff55a0
[    0.580134] ra    : 000000007fff551c 0x7fff551c
[    0.581293] Stack : 0000000000000000 0000000077f9e760
0000000000000002 000000007fff2e40
[    0.581456]         0000000077ff0000 0000000077f9e80c
0000000000000000 0000000000000000
[    0.581619]         ffffffffffffffff 0000000010000000
0000000010019dd0 0000000010000c20
[    0.581834]         0000000077ff0000 0000000077fa4868
0000000377ff19b8 0000000000000000
[    0.581985]         000000007fff2f04 0000000000000001
0000000010000870 0000000077ff0000
[    0.582136]         0000000077fa4868 0000000077ff19b8
0000000077ff7180 0000000077f297ac
[    0.582288]         7fff2f0c77ff7180 0000000077f29800
0000000000000000 000000007fff2f00
[    0.582438]         0000000077ff19b8 0000000077ff1e30
0000000010019dd0 0000000010000dec
[    0.582585]         0000000010019dd0 0000000010000db0
0000000000000000 0000000000000000
[    0.582732]         000000017fff2fda 000000007fff2fe0
7fff2fe700000000 000000217fff5000
