Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2AFC818DD1D
	for <lists+linux-mips@lfdr.de>; Sat, 21 Mar 2020 02:20:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727158AbgCUBUm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 20 Mar 2020 21:20:42 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:38352 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726851AbgCUBUm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 20 Mar 2020 21:20:42 -0400
Received: by mail-qk1-f195.google.com with SMTP id h14so9205324qke.5;
        Fri, 20 Mar 2020 18:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bnKt2AsMTECPhz85G1fhjqk7Ovvzv8dZttYOZ4u0sHY=;
        b=XYfpn+44ehB80SB5tZN2atjng5cWu4qWrAtho1L+8jsOxITz5Y3Cvo3jMImyGQNFMz
         h4Wu7EcHPUQkmm0bwgZkiybtVajJvB4n7gmHiCDVJfqvjy/w9h6NobMwZjVy7Kk6YkI0
         XyhvVxa2sy2rLJq+iERFGGKEwfPox9pOemZf6uwrQWeT+247jOAFtpKVv8yOhMDR/O78
         oJGAsZ1rPY3qR2alCcOft8bpFvyV7X429Reu0Cds2H0xvw8OvWzjOiOzWkI63FHiCIAH
         klYMmEwzEaqZYv1ssoCY5DLTSxbx6AfBWgOKoNPvy8b4xHIQoccncRUxWQm1Ys6XKqKh
         bpJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bnKt2AsMTECPhz85G1fhjqk7Ovvzv8dZttYOZ4u0sHY=;
        b=GZFuhiytJExhEGuTTRzY7FZkuuqmnGNzIggbk4yBsmZGJvGr8hAYbdI086aFYeoq23
         5LnrlFKV8lpd0JQVoXLmm9Dhfm7maJ9JvcmNMA1wdoSIbYOGzJu+CUVAqgH37Pw1uizG
         aEKJG3ftYMx2dWrfdHJQbiIoh4LrIPIE3fuMETuXxa2+w2CR64RLLzugZQP6dMUXUDcC
         gUg9Cgksd49icbORQwp0z4h+jTTY3rd2+PXaNyYaoWs95Ae6oPYOKoAB0qYLT/A6c4eu
         u1ALnNvbfIgrFSHeMAkUkA7qoBejydG72b+2t8UoJnzKZV6LOz2P/ni38s6/ZKRsS6eE
         3KEg==
X-Gm-Message-State: ANhLgQ0YQazsrRmjesydt1mHocxr9TqiBdrmOKPAWWwKXRdducZKF0Ab
        PrF4yLmmBOBWXN2KFPJMvu0jIDoxUxFLwdD/rkw=
X-Google-Smtp-Source: ADFU+vseneLPsmuARmqJq7Z3pzGXN3s/P5CrGzseIFR/TmRj7JQWpqNkFrmnzU+R1AylyWVFvmgxJPxSD4NMMSCNUn4=
X-Received: by 2002:a37:702:: with SMTP id 2mr10859561qkh.134.1584753640560;
 Fri, 20 Mar 2020 18:20:40 -0700 (PDT)
MIME-Version: 1.0
References: <1583908414-22858-1-git-send-email-yangtiezhu@loongson.cn>
 <CAOLZvyHEnnpWWhEAWx9RZASVjjQ=6HTREqwY+LK0hm=J4Wd8Xg@mail.gmail.com>
 <788597FA-6AD6-4218-886F-35C0916EA3F2@flygoat.com> <alpine.LFD.2.21.2003202109190.2689954@eddie.linux-mips.org>
In-Reply-To: <alpine.LFD.2.21.2003202109190.2689954@eddie.linux-mips.org>
From:   YunQiang Su <wzssyqa@gmail.com>
Date:   Sat, 21 Mar 2020 09:20:29 +0800
Message-ID: <CAKcpw6W=nVWGVkTi2ub82THUe09PGxHR1x9dSDW5A6sYnYGTUg@mail.gmail.com>
Subject: Re: [PATCH] MIPS: Loongson: Add model name to /proc/cpuinfo
To:     "Maciej W. Rozycki" <macro@linux-mips.org>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Manuel Lauss <manuel.lauss@gmail.com>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Linux-MIPS <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Xuefeng Li <lixuefeng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Maciej W. Rozycki <macro@linux-mips.org> =E4=BA=8E2020=E5=B9=B43=E6=9C=8821=
=E6=97=A5=E5=91=A8=E5=85=AD =E4=B8=8A=E5=8D=885:24=E5=86=99=E9=81=93=EF=BC=
=9A
>
> On Wed, 11 Mar 2020, Jiaxun Yang wrote:
>
> > __cpu_name[] will be displayed as "cpu model" in cpuinfo, however
> > in x86 world, the name line is started with "model name".
> > Most user applications like lscpu, hwinfo is following x86's rule, we d=
on't have superpower to move all of them.
> >
> > Also rename "cpu model" will break current ABI, so just create a new ar=
ray
> > for it would be a better option.
>
>  Well, /proc/cpuinfo is not an ABI, it's meant for human interaction (use
> `sysfs' for machine processing).

In fact there do be some code to use cpuinfo to detect cpu. Gcc is
even in this list.
https://codesearch.debian.net/search?q=3Dcpuinfo&literal=3D1

>
>  If tools want to use it anyway, then fine, but they need to adapt to the
> relative volatility of the free-form text interface, and also learn all
> the world is not x86 (just like all the MIPS world is not Loongson, so if
> you argue about adding effectively a duplicate field, then that would hav=
e
> to be applied across all the platforms).  IOW fix the tool and do not wor=
k
> its deficiencies around in the kernel just because it seems easier for yo=
u
> to do.
>
>  Here's how example /proc/cpuinfo looks like on RISC-V/Linux BTW:
>
> processor       : 0
> hart            : 1
> isa             : rv64imafdc
> mmu             : sv39
> uarch           : sifive,rocket0

If we create cpuinfo for a new architecture, we are freely do anything.
it is OK, as the newly write code can know about it, and there is no
old codes about it.

While if we have some modification to /proc/cpuinfo, of exists architecture=
s,
we must be very careful to keep compatible.

>
> [...]
>
> -- every Linux platform is different in this respect and tools have to
> live with that.

Yes, you are some right, the scripts/programs should be robust,
while they cannot forecast how the people change cpuinfo, if they are
freely....

>
>   Maciej



--=20
YunQiang Su
