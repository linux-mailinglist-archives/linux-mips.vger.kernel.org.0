Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09CBA12CFE1
	for <lists+linux-mips@lfdr.de>; Mon, 30 Dec 2019 13:08:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727400AbfL3MIC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Dec 2019 07:08:02 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:39487 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726196AbfL3MIC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 30 Dec 2019 07:08:02 -0500
Received: from mail-qv1-f53.google.com ([209.85.219.53]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1M3loZ-1imB5X3ixX-000s7o; Mon, 30 Dec 2019 13:08:01 +0100
Received: by mail-qv1-f53.google.com with SMTP id f16so12280764qvi.4;
        Mon, 30 Dec 2019 04:08:00 -0800 (PST)
X-Gm-Message-State: APjAAAVAiYT1SyrwaX0nP7JnD526OQKBqHvToyxBHP5ybX52jLH9Dhel
        L4MRX7x9qOVnew375bm8HFLufLyWiPYnbjH4XLk=
X-Google-Smtp-Source: APXvYqwgYmUQwo+iL/k4m54VB6r1wV0E9Nq8yE/j4nb6YZD4J7kjH+UJKaDQYBMfOQwb9P/Z8xhYwMz7551bLxAPNPc=
X-Received: by 2002:a0c:bd20:: with SMTP id m32mr50936334qvg.197.1577707679673;
 Mon, 30 Dec 2019 04:07:59 -0800 (PST)
MIME-Version: 1.0
References: <cover.1577111363.git.christophe.leroy@c-s.fr> <d0f8dfb26c025d3e3eee1b5f610161ca19b942df.1577111367.git.christophe.leroy@c-s.fr>
In-Reply-To: <d0f8dfb26c025d3e3eee1b5f610161ca19b942df.1577111367.git.christophe.leroy@c-s.fr>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 30 Dec 2019 13:07:43 +0100
X-Gmail-Original-Message-ID: <CAK8P3a36OgFuY72b_i6+0xBNGnaxS1SsRid+HrgQHPZtUJp3LQ@mail.gmail.com>
Message-ID: <CAK8P3a36OgFuY72b_i6+0xBNGnaxS1SsRid+HrgQHPZtUJp3LQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 05/10] lib: vdso: inline do_hres()
To:     Christophe Leroy <christophe.leroy@c-s.fr>
Cc:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Andy Lutomirski <luto@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        "the arch/x86 maintainers" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:jDOKdGxcK76WzzT4FAh+MO1q4e3xUlQLbmdYdbLmtxxWBIHJ/HL
 AWqfVJIHOYCNfF/hNIR+TyMp3ebgudZbn9tYY1SkQvIDEewDaci2GB8uCfFmTn1XKnEnQmh
 zGS6m1w/fbUv1tLbzRxkELzHwATLt1+D+RF+PG/PvtofNcSoRKS7EWu1LXwfSUmbuDzC27o
 gduCYI7G+WktYInkzmHpA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:xVsLO1llwLY=:3k24IvDRwIWli6yX+yQfJP
 rwMQO0q+ila9fFJvhyEXqGGdBDLJR6Ef+VmOEGx8RFCJS08qHU3UzR1soing+CxYmooVFDTDa
 Tdj7MzAbvoqAC0adVVmZCEgloHjUUgnaZJ0NT2/i6DaLQJ48ZwdS+o7jWBGOKKXzCeu/gCABt
 qmDcqvz8/5mflEhRLGjzLBCp3cAgQUSOpn7eCVQlBd99G4U6tUDgvs76NQWLcHxo0owv9BAwD
 8S7yvT6aylYPCpwyhvFJlLBmVO8y9Nfp/mqFmyMzT/dH7q2f1wdrkrV+lOnr4y8tlJo3GwWHn
 +vnlT1o7tG/Hib4ob1Mc5zzdiyE3uCQUUaZVbw9WzBWffn6SbVzIp9e2YV2/tXTTb/8sJkPpF
 sTUX++I6h1TsgMq7yxLMNUiul5gChmNXRMyTLxi4liaVL9RWRGxZo15zafy98rkMDoaoiuqmF
 gC2Y6C2P4GtrQ8kBulmrkChtz+Ev8ZkiZ+dLNfSqcEPSnuO4FZknK/rswvK7hqeXXh/RoK9Jd
 A5QRf3oUKcQ15LVNHGEWkJaHsXMaw5cFvnbHT2QanH6k2iJBlv95B+G/Wbb5QwFxMeOLywqSf
 imm1Eg6IHW6gyghCueaZqdtlSiQKONxnQLxVCxIv+eF94Y/OD9I2GNeU64zAeIv8mm8fsNqwp
 a3JDWA+spiaxQhLkyoPQdk8fPt7QzOktzCcx7WD5fS2SWV/Pb5wVRWFNr5N4NSRJBipELsZTB
 tLWKsz82ONkBdzweVDx5mKdVoORA/lzHwpMNprk1w57mtAgBXbnRARNHKESb2fRilHRldYuek
 Kr/OPZ23K3FyC1EKbVo0aLLXvTdn1JZ/wtsLCecO/VwG4uHSold4W9vJkZcuyBmKgZ1q3CDGD
 K5s+xhcAYEf+XlNDuM4g==
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Dec 23, 2019 at 3:31 PM Christophe Leroy
<christophe.leroy@c-s.fr> wrote:
>
> do_hres() is called from several places, so GCC doesn't inline
> it at first.
>
> do_hres() takes a struct __kernel_timespec * parameter for
> passing the result. In the 32 bits case, this parameter corresponds
> to a local var in the caller. In order to provide a pointer
> to this structure, the caller has to put it in its stack and
> do_hres() has to write the result in the stack. This is suboptimal,
> especially on RISC processor like powerpc.
>
> By making GCC inline the function, the struct __kernel_timespec
> remains a local var using registers, avoiding the need to write and
> read stack.
>
> The improvement is significant on powerpc.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Good idea, I can see how this ends up being an improvement
for most of the callers.

Acked-by: Arnd Bergmann <arnd@arndb.de>
