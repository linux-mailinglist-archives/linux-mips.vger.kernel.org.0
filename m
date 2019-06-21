Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76D334E6C7
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jun 2019 13:09:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726232AbfFULJm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 Jun 2019 07:09:42 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:35465 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726218AbfFULJl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 21 Jun 2019 07:09:41 -0400
Received: by mail-qt1-f193.google.com with SMTP id d23so6484951qto.2;
        Fri, 21 Jun 2019 04:09:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xo3SvTstxc7h8VJt3dWmJBpJuemSVAPyqkyjpLinJ9Q=;
        b=rPMjz6Jvy0o8zHF5mV55OCnizlza5oUVh1Wymk2CnmUzUkayjYT/0cHs/UAKNN7ON5
         FUkvGHDJoL/mnL4K8bekFYu9xsd40DCGycDxUwm1n3VAipvtC7P1U3w9ZS0zQoRha9j/
         Yx3TDCvdfEn8Eu2OzpVfqJL/PBxM++CeRw6XQop9oOqTeSbazE4+eqv0oPCYuzM5/Gob
         YdNAFvOakgfo87XT8/T5iu9KB2ubyqLvcECfTH2zrzWbG+rzHHarjkGl3xNL7pUIksz0
         +eahEaZUIaNW4IYp/8YWVT87BHouU5vLrLNgzMjmASoccSdE5n2md5Wo8GWdne2dOchm
         61iQ==
X-Gm-Message-State: APjAAAXxk3pICnI/rhOAkWHrmSlEapOypjudbea7QYpSXrWQ/y4kyYhn
        BltiUbXFo1CzHNeHlkm0/cG0WG4+8fSnQynCfw8=
X-Google-Smtp-Source: APXvYqwF5z4PQ6dvkG543VntOj0Tud/yFvuHJ5kowGF4MTHuP3YLkBNuiGsoZO/lvnBsfzfanGAPBx2TSCqpQE/wIOM=
X-Received: by 2002:a0c:91dd:: with SMTP id r29mr171346qvr.93.1561115380817;
 Fri, 21 Jun 2019 04:09:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190614063341.1672-1-fancer.lancer@gmail.com>
 <20190620174002.tgayzon7dc5d57fh@pburton-laptop> <alpine.LFD.2.21.1906201851580.21654@eddie.linux-mips.org>
 <CAK8P3a28Dp3UygNyomDPDxDmCmey37VS7TJkmDogaKUGZMF2mw@mail.gmail.com> <alpine.LFD.2.21.1906211048360.21654@eddie.linux-mips.org>
In-Reply-To: <alpine.LFD.2.21.1906211048360.21654@eddie.linux-mips.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 21 Jun 2019 13:09:24 +0200
Message-ID: <CAK8P3a3HWn7RXjcT0KA_qOc+C1SgWd2qXSdCTTAmRKHdc4qNbQ@mail.gmail.com>
Subject: Re: [PATCH] mips: Remove q-accessors from non-64bit platforms
To:     "Maciej W. Rozycki" <macro@linux-mips.org>
Cc:     Paul Burton <paul.burton@mips.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Serge Semin <Sergey.Semin@t-platforms.ru>,
        "Vadim V . Vlasov" <vadim.vlasov@t-platforms.ru>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Jun 21, 2019 at 12:09 PM Maciej W. Rozycki <macro@linux-mips.org> wrote:
>
> On Fri, 21 Jun 2019, Arnd Bergmann wrote:
>
> > >  The use of 64-bit operations to access option's packet memory, which is
> > > true SRAM, i.e. no side effects, is to improve throughput only and there's
> > > no need for atomicity here nor also any kind of barriers, except at the
> > > conclusion.  Splitting 64-bit accesses into 32-bit halves in software
> > > would not be a functional error here.
> >
> > The other property of packet memory and similar things is that you
> > basically want memcpy()-behavior with no byteswaps. This is one
> > of the few cases in which __raw_readq() is actually the right accessor
> > in (mostly) portable code.
>
>  Correct, but we're missing an `__raw_readq_relaxed', etc. interface and
> having additional barriers applied on every access would hit performance
> very badly;

How so? __raw_readq() by definition has the least barriers of
all, you can't make it more relaxed than it already is.

> in fact even the barriers `*_relaxed' accessors imply would
> best be removed in this use (which is why defza.c uses `readw_o' vs
> `readw_u', etc. internally), but after all the struggles over the years
> for weakly ordered internal APIs x86 people are so averse to I'm not sure
> if I want to start another one.  We can get away with `readq_relaxed' in
> this use though as all the systems this device can be used with are
> little-endian as is TURBOchannel, so no byte-swapping will ever actually
> occur.

I still don't see any downside of using __raw_readq() here, while the
upsides are:

- makes the driver portable to big-endian kernels (even though we don't
  care)
- avoids all barriers
- fixes the build regression.

      Arnd
