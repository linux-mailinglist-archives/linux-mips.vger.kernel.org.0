Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70220341219
	for <lists+linux-mips@lfdr.de>; Fri, 19 Mar 2021 02:28:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230195AbhCSB20 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 18 Mar 2021 21:28:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230136AbhCSB2E (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 18 Mar 2021 21:28:04 -0400
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55191C06174A
        for <linux-mips@vger.kernel.org>; Thu, 18 Mar 2021 18:28:04 -0700 (PDT)
Received: by mail-qt1-x82a.google.com with SMTP id 94so5680474qtc.0
        for <linux-mips@vger.kernel.org>; Thu, 18 Mar 2021 18:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=mt9sac2Toj4rB6PrvAjsZiyo0OsCJRkRaphk+kGw6Vg=;
        b=abnQD/A/VimAiv3SBTd2SLsHjB8NYw1AWQbU2b3cVq0rCtjrOBfPftk9Du7/NmTRLy
         4jGxMcfauHZeOyfqG5K3QsZUuIHygERvnfBj+AUVC0FihqUYfZs4/+s8i522BdmLd/1p
         eVaaUnoVuw46XPCMPDAft4IAj6nQJltIGZ1gFEOBXlFp8Tnf93IVbI9Lcp6fQCJdKbVX
         g6E//GkhnH8sA4Xuyz+4iHAsASsHoZCFufgGWQhhoz9oTe/dYfAwKYi45FiI+G4ygTaQ
         bxIH43nhPmggfIOp/PsqRyf9q5AG8l0QTIK6edp/mSLzCE4yxV7pCqy/loyKt7QOJd7F
         2VKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=mt9sac2Toj4rB6PrvAjsZiyo0OsCJRkRaphk+kGw6Vg=;
        b=DNB5sK6mO4iWcV9pvC6SKboIrrhAGKPo9Aq3YVc8vU85fgGbbb6AJnRq+I6mUGR25W
         9L/MjwngyWcb7mEQiivNVLbiwVGvoUjEbZUA5fPUEjjfewZmskDEXtFoNa9hOw558Zer
         EqKosyBaC+Cs9+Y64Z2XGF6SuzW9prlerq53c9+Z8pv332e4gVbb0rW4NyKORQ5EHTSn
         1dsdziJIqzp5ZKj7hlqCS7bnLgKL4adIgEGms4KCq6Jc4jM/ACuTLJgE6HSFIxmQoZ4g
         nRRcpByIBb5XSvvsx8QCoFj7GGAxgK7CEydio/n7fbfvEbOA09Y8gkYjVjXYY68vN/a+
         SRrQ==
X-Gm-Message-State: AOAM531uSgdBKDlUuU4m3pLj5L5WvbMl/U0ns4gqvocqEpyl46YenyJM
        8WnUMHP9HYNRDXUIQdZUDAxo2ju4gCQaDpruIPrce7D3ylpYuw==
X-Google-Smtp-Source: ABdhPJwiNST3YHHpr2NCeBJIczKfHeolQ5WsEfb2huIyqPpWi1oGbM/qnTiRPo+iNapE7bI1CIypI4y5IbzKoX3ggl4=
X-Received: by 2002:aed:2c22:: with SMTP id f31mr6144740qtd.219.1616117283625;
 Thu, 18 Mar 2021 18:28:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210302022907.1835-1-yunqiang.su@cipunited.com>
 <alpine.DEB.2.21.2103021645120.19637@angie.orcam.me.uk> <000701d70fd0$ecbb21a0$c63164e0$@cipunited.com>
 <alpine.DEB.2.21.2103030321240.19637@angie.orcam.me.uk> <000b01d70fdb$c7b74450$5725ccf0$@cipunited.com>
 <alpine.DEB.2.21.2103031800130.19637@angie.orcam.me.uk> <000e01d7109e$27296360$757c2a20$@cipunited.com>
 <alpine.DEB.2.21.2103172344360.21463@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2103172344360.21463@angie.orcam.me.uk>
From:   YunQiang Su <wzssyqa@gmail.com>
Date:   Fri, 19 Mar 2021 09:27:53 +0800
Message-ID: <CAKcpw6VpTr9QEW5A3_AW6XbYHDFP9SK-JARZNq78fquU1OwqLQ@mail.gmail.com>
Subject: =?UTF-8?B?UmU6IOWbnuWkjTog5Zue5aSNOiDlm57lpI06IFtQQVRDSCB2Nl0gTUlQUzogZm9yY2UgdQ==?=
        =?UTF-8?B?c2UgRlI9MCBmb3IgRlBYWCBiaW5hcnk=?=
To:     "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc:     YunQiang Su <yunqiang.su@cipunited.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Maciej W. Rozycki <macro@orcam.me.uk> =E4=BA=8E2021=E5=B9=B43=E6=9C=8818=E6=
=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8A=E5=8D=887:30=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, 4 Mar 2021, yunqiang.su@cipunited.com wrote:
>
> > >  How many is that though?  Two?  Ten?  A thousand?
> >
> > syq@m530-2:~$ cat
> > /var/lib/apt/lists/mirrors.aliyun.com_debian_dists_sid_main_source_Sour=
ces |
> > grep 'Build-Depends' | grep golang | wc
> >    2039   21384  344099
>
>  Ack, that's quite a lot indeed.
>
> > >  I'd say the chosen policy of any distribution is said distribution's
> > problem, not
> > > the upstream kernel's.  You can have a local patch for the kernel too=
 if
> > you
> > > consider a kernel solution the only one that works for you.  From the
> > > discussion so far it looks to me like the least involving solution wh=
ich
> > will
> > > make everyone happy.
> > >
> >
> > It is not only about one distribution, instead of all distribution, sin=
ce
> > this is caused by the bug of Golang distribution.
>
>  I think every distribution is free to handle the problem their own way.
> You have asked on behalf of Debian, so we're discussing what Debian can
> do.  Other distributions may or may not follow.
>
> > >  Also I'll repeat myself: is there a Golang standard library that eve=
ry
> > Golang
> > > program uses?
> > >
> >
> > Yes. It even effect /usr/bin/go itself, and all of binaries its generat=
e may
> > be effected.
>
>  Sigh, you did not answer my question again, but I have lost my patience
> and figured it out myself, as noted with v7 (libgo.so.17 is the Golang
> standard library as at GCC 11).  The obvious userland solution goes along
> with it.  You don't even have to do anything really.
>

I am sorry for not clear enough.
Here, Golang means the Google's Go, aka https://golang.org/.
It is 2 different software with Go in gcc, which we call it gccgo.

Golang (golang.org, not gccgo) has no runtime normally, since it seems
prefer static linking.
So, Lots of Go programs produced by golang (golang.org, not gccgo) are
static linked.
Especially for Linux distributions `stable' branch.

>  NB please keep the subject proper of the cover letter the same with ever=
y
> iteration of a patch series, as in that case mail user agents (at least
> the sane ones) will group all iterations together in the thread sorting
> mode.  With the subject changed every time the link is lost and
> submissions are scattered all over the mail folder.
>

I will keep it as the last one. Thank your.

>   Maciej



--=20
YunQiang Su
