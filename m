Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7C9A4E1EA
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jun 2019 10:29:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726336AbfFUI3j (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 Jun 2019 04:29:39 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:41868 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbfFUI3i (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 21 Jun 2019 04:29:38 -0400
Received: by mail-pf1-f195.google.com with SMTP id m30so3204761pff.8;
        Fri, 21 Jun 2019 01:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:subject:to:cc:references:in-reply-to:mime-version
         :user-agent:message-id:content-transfer-encoding;
        bh=yxfaAKL36iRBk7i3lJUt2q8lAl7GH2S2sjM2Bw2uPJs=;
        b=fbj3ryUASSI5WTeqBy+Hc5OEHWiPYdV7sIZyNqgV+qzFiANsZYBHP3eTFrdbgDPMqz
         +NZAYlBR+Dfy7yY9SJaByfth0oz38I9M0oFx0/PjpOVh4PwNfZ6TM2OYoTtOR9SENi8J
         c4JwUKiwqGhPWDDJTo19f+iyU8hDWG4ED1a79bBPnMbmzbrs+wX6NcAW3qliBAqn2Cz9
         cNxxEV7yL4Cgwr2k23ZRaqddTXmW7jlpNEyLek6w+pt1gX1BPnCgoRUSFo9HYLeo65pM
         jcwVL8KYaA8GxmgazJGRjU9ifPR/K7V+tvyC4gxu12oOVP2g9/tx3yANOSmbk/9lW3n7
         hoKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
         :mime-version:user-agent:message-id:content-transfer-encoding;
        bh=yxfaAKL36iRBk7i3lJUt2q8lAl7GH2S2sjM2Bw2uPJs=;
        b=Uo5FWFl6d27L/KKJjFoSEGyYN9YEHSsXrrHIqtIjPRFShcujK9ZxGISRMK70fetFV+
         2EICV2rp8ce7UHnd5OGFDoR5x3H38oa6txrDiuU8eJRX0kJ2fBLOUrMO0cMgGEyzgaLa
         koRjBdWYo2cIion2cUXd4V0WoohJbahmrHRiyqyHMUgs9LH2x+trzLlpvetgRZaV7FJD
         LS4R2l3CCRx9hIMxKU2/n6rtW8myrmgHsG142CxfiwX9fL54AmG0z2L6XSS7sBwp5fme
         EMaAdCikfAE6via71atFS9Kg3BtpvWmknrxKqVQAFyyfkzRzBDzZs16CVJs2qLn8Ptth
         v97w==
X-Gm-Message-State: APjAAAWcVG1KAc5XJv4nWrF4ndq1DdZZGujF01VtChFPU/14zfCXX8Qq
        LDVQCcvc914/MuUdcBWwsag=
X-Google-Smtp-Source: APXvYqw0+FZM5x3iJhEGb07mnJPrmGs4w362V6gxLaKrkfdj/o0PM7u+3QQXzswzUEdHsggmQOj3Bw==
X-Received: by 2002:a17:90a:cb15:: with SMTP id z21mr5012050pjt.87.1561105777693;
        Fri, 21 Jun 2019 01:29:37 -0700 (PDT)
Received: from localhost ([1.144.138.41])
        by smtp.gmail.com with ESMTPSA id v185sm2443015pfb.14.2019.06.21.01.29.36
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 21 Jun 2019 01:29:36 -0700 (PDT)
Date:   Fri, 21 Jun 2019 18:29:27 +1000
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
        <1561032202.0qfct43s2c.astroid@bobo.none>
        <CAHk-=wh46y3x5O0HkR=R4ETh6e5pDCrEsJ94CtC0fyQiYYAf6A@mail.gmail.com>
In-Reply-To: <CAHk-=wh46y3x5O0HkR=R4ETh6e5pDCrEsJ94CtC0fyQiYYAf6A@mail.gmail.com>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1561104674.cxm7sn77rx.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Linus Torvalds's on June 21, 2019 3:21 am:
> On Thu, Jun 20, 2019 at 5:19 AM Nicholas Piggin <npiggin@gmail.com> wrote=
:
>>
>> The processor aliasing problem happens because the struct will
>> be initialised with stores using one base register (e.g., stack
>> register), and then same memory is loaded using a different
>> register (e.g., parameter register).
>=20
> Hmm. Honestly, I've never seen anything like that in any kernel profiles.
>=20
> Compared to the problems I _do_ see (which is usually the obvious
> cache misses, and locking), it must either be in the noise or it's
> some problem specific to whatever CPU you are doing performance work
> on?

No you're right, the performance hit from these flushes is not a
big hit that stands out in cycle counts. I just look at kernel code
for various flushes. Branches not surprisingly are usually the main
culprit, but they're normally not so interesting.

Static alias prediction seems to work well outside this case. It's
interesting, you need both a store ; load sequence that does not
predict well (e.g., using a different base register), and you also
need that load to be executed ahead of the store.

The small stack structure for arguments is the perfect case. Bad
pattern, and load executed right after store. Even then you also need
a reason to delay the store (e.g., source not ready or store queue
full), but those hazards do show up.

Now, even when all that goes wrong, there are dynamic heuristics that
can take over. So if you run a repetitive microbenchmark you won't
see it.

Some CPUs seem to be quite aggressive about giving up and turning off
the alias prediction globally if you take misses (Intel x86 used to do
that IIRC, not sure if they still do). So in that case you wouldn't
even see it show up in one place, everything will just run slightly
slower.

What I worry about is high rate direct IO workloads that see single
flushes in these paths as significant. Or if this thing creeps in to
the kernel too much and just slightly raises global misses enough,
then it will cause disambiguation to be significantly shut down.

Thanks,
Nick

=
