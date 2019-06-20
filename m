Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D59EF4CD90
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2019 14:18:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731810AbfFTMSy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 20 Jun 2019 08:18:54 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:40390 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731695AbfFTMSy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 20 Jun 2019 08:18:54 -0400
Received: by mail-pf1-f194.google.com with SMTP id p184so1585806pfp.7;
        Thu, 20 Jun 2019 05:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:subject:to:cc:references:in-reply-to:mime-version
         :user-agent:message-id:content-transfer-encoding;
        bh=YoTiXuUhP7MILD5fnaoAlkgFg2nR8TYJrJEF6s4RZXw=;
        b=So/APhDByNH5ZTnsyLPXFkassmIa6Ov5z4dUXPiq3BcI+/tBJroH1OYfD+D/LPx2Kz
         Z2iebLBARMIonYTJViKAMNqX6T9DWFpGX4f7lEU40XE6jdwOBAKSb7px2/VVG1NdMZUV
         DGEi2tUgpJk8ahufrxePUMdf1fVMSMqTEhNaXDKRGi+y/W5OIH7OvaZjkf2vDypfXqxI
         TD2ewroIsXlnf4E6gOQtkllshj947AFSuqcZtKArd6jeI++QOwML2r0B7G5wvAqJD4UD
         xWsias8CY08OAi7pp0ZZm2YUI8zBDfNLVjsK8N1PIHm6HWAHq05Ev5F7HsEKLa/T1vLU
         uiFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
         :mime-version:user-agent:message-id:content-transfer-encoding;
        bh=YoTiXuUhP7MILD5fnaoAlkgFg2nR8TYJrJEF6s4RZXw=;
        b=kePlzXM4/wPA4VtCNmPC/YLDphhtrtgFsUHm7vnlWElG9cwbJd1HvrWstzoUsDMq47
         cTg+bK2rY0sY21forNIdLpp4ZAMhd7lmipbuhEk1oy6r0WvNcpNm1BVIUP2XogXAQTqx
         33Mb91B/j9MW1XLI+muuKZ3iKtgbsoJLVliT0aJmM913JEQnW/s6Q9ZTeOOmdphquWPB
         B1SzW3UtdNvD4VQuHldwKJrNRvv891i5QE9tzTxMWSdV7uFxC+86U1AJn9cN4dEnCYiH
         N/wHH0Y82M5Q8i2ie3bFaBDZDnFf+pIoAeg5cBMaF0nJhV73q6y/QEqlDauRpJDEfI8s
         8z6g==
X-Gm-Message-State: APjAAAW6n1z7LmbSNmRPD/lfuVBFziWLxcX+MNf1f3bXlg1tiz2KV8Tj
        1nPmHXZxTncB7FfE/bSAtts=
X-Google-Smtp-Source: APXvYqx1eSkhbrnX9j+XXPf1ijevNCfi95aQ4yuFnnSZCNNzh3FuAkFtzgkNfUYJBeEqzMwN6uhd9g==
X-Received: by 2002:a62:e815:: with SMTP id c21mr90025668pfi.244.1561033133807;
        Thu, 20 Jun 2019 05:18:53 -0700 (PDT)
Received: from localhost ([203.220.63.126])
        by smtp.gmail.com with ESMTPSA id i133sm24389358pfe.75.2019.06.20.05.18.51
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 20 Jun 2019 05:18:52 -0700 (PDT)
Date:   Thu, 20 Jun 2019 22:18:51 +1000
From:   Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 16/16] mm: pass get_user_pages_fast iterator arguments in
 a structure
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andrey Konovalov <andreyknvl@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Christoph Hellwig <hch@lst.de>,
        James Hogan <jhogan@kernel.org>,
        Khalid Aziz <khalid.aziz@oracle.com>,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
        linux-mips@vger.kernel.org, Linux-MM <linux-mm@kvack.org>,
        linuxppc-dev@lists.ozlabs.org,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Burton <paul.burton@mips.com>,
        Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
        the arch/x86 maintainers <x86@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>
References: <20190611144102.8848-1-hch@lst.de>
        <20190611144102.8848-17-hch@lst.de>
        <1560300464.nijubslu3h.astroid@bobo.none>
        <CAHk-=wjSo+TzkvYnAqrp=eFgzzc058DhSMTPr4-2quZTbGLfnw@mail.gmail.com>
In-Reply-To: <CAHk-=wjSo+TzkvYnAqrp=eFgzzc058DhSMTPr4-2quZTbGLfnw@mail.gmail.com>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1561032202.0qfct43s2c.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Linus Torvalds's on June 12, 2019 11:09 am:
> On Tue, Jun 11, 2019 at 2:55 PM Nicholas Piggin <npiggin@gmail.com> wrote=
:
>>
>> What does this do for performance? I've found this pattern can be
>> bad for store aliasing detection.
>=20
> I wouldn't expect it to be noticeable, and the lack of argument
> reloading etc should make up for it. Plus inlining makes it a
> non-issue when that happens.

Maybe in isolation. Just seems like a strange pattern to sprinkle
around randomly, I wouldn't like it to proliferate.

I understand in some cases where a big set of parameters or
basically state gets sent around through a lot of interfaces.
Within one file to make lines a bit shorter or save a few bytes
isn't such a strong case.

>=20
> But I guess we could also at least look at using "restrict", if that
> ends up helping. Unlike the completely bogus type-based aliasing rules
> (that we disable because I think the C people were on some bad bad
> drugs when they came up with them), restricted pointers are a real
> thing that makes sense.
>=20
> That said, we haven't traditionally used it, and I don't know how much
> it helps gcc. Maybe gcc ignores it entirely? S

Ahh, it's not compiler store alias analysis I'm talking about, but
processor (but you raise an interesting point about compiler too,
would be nice if we could improve that in general).

The processor aliasing problem happens because the struct will
be initialised with stores using one base register (e.g., stack
register), and then same memory is loaded using a different
register (e.g., parameter register). Processor's static heuristics
for determining a load doesn't alias with an earlier store doesn't
do so well in that case.

Just about everywhere I've seen those kind of misspeculation and
flushes in the kernel has been this pattern, so I'm wary of it in
performance critical code.

Thanks,
Nick
=
