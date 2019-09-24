Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12F7ABCB6D
	for <lists+linux-mips@lfdr.de>; Tue, 24 Sep 2019 17:32:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389150AbfIXPcZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 24 Sep 2019 11:32:25 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:37363 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731957AbfIXPcZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 24 Sep 2019 11:32:25 -0400
Received: by mail-lf1-f68.google.com with SMTP id w67so1756878lff.4
        for <linux-mips@vger.kernel.org>; Tue, 24 Sep 2019 08:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=yTXFMWN7uG8HeKP04hBknHMX7DjCzdXpjR3u5gYPGyo=;
        b=csnyqQhYOP+PrKHw6U6DXiICj2iJbqP0xhK/YsgX0NJ8CDm3M7BkvgPR21n8zf2Xoj
         bqRF7cHq2x5ioxRBkz1SMK/+9emYk9lSfnjFcL8FaOaKAL3lr7ybZnVeWLcdBnTKP94a
         XXbMWg7yvpKrqMnmGzh46esRmL0KRGQX8wTMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=yTXFMWN7uG8HeKP04hBknHMX7DjCzdXpjR3u5gYPGyo=;
        b=oyL1kJ2wI4ikf5TqzVkJNovyfFKs8CewhfH/DsY4ugOS9/AzK1Rk599EQZEWZWrQFH
         PHbK1r6f+KDMg3Pa0G8rFN762RbUTFrHNl6rg4vH6i40jSw3DtVDT5Gar9PqOLyF5GG5
         7n+wOhClOyghpFwsUM5nIgNqhjoPiJAOeU13WNF5Wihuy9Yzp6JJRH18ND2vvWfa8bJC
         UKoCzgpD/hFc1ztRXR09WQtG+HfrJGtSMRrATTvR+/9vC2MeP5r1tg8Ijl+Zyig4Mbd2
         pudoEaJ7KZfKhn0/aVzU7ImVCK4SU/AaljluqlqKM4LeKbZQD+9I7O4WfBDXNhuI24I+
         EhFQ==
X-Gm-Message-State: APjAAAXtQcN3stzU4QhCsku/7VyjfiSDlaKT3ytD0MX306hyEisuXGa0
        yryECUSLaL2d+why2KIh3CKnyPPtKhU=
X-Google-Smtp-Source: APXvYqy9Lz651spnzSDYOq64dw8a+xeThP3zsC/H3Pm/UWrM4sozE+ukK8UIwQ0k+xA5FQhLd1EsDQ==
X-Received: by 2002:ac2:5c11:: with SMTP id r17mr2350566lfp.61.1569339142215;
        Tue, 24 Sep 2019 08:32:22 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id c13sm543873ljj.25.2019.09.24.08.32.20
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Sep 2019 08:32:21 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id y3so2352220ljj.6
        for <linux-mips@vger.kernel.org>; Tue, 24 Sep 2019 08:32:20 -0700 (PDT)
X-Received: by 2002:a2e:2c02:: with SMTP id s2mr2495973ljs.156.1569339140581;
 Tue, 24 Sep 2019 08:32:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190921231022.kawfomtmka737arq@pburton-laptop>
 <CAHk-=wjmJbF3p9vZTW2nbeD4LkG-JZV+uqv8BnxzojJ5SZsLjw@mail.gmail.com>
 <20190923180728.flp6jx4jc2bh7cys@pburton-laptop> <CAHk-=wiC_B8R6th+83vKwGT1H-8vtFrmMg+1mK_P8n3VeWAWRg@mail.gmail.com>
 <14580.1569328815@warthog.procyon.org.uk>
In-Reply-To: <14580.1569328815@warthog.procyon.org.uk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 24 Sep 2019 08:32:04 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi4g0NgX9BLiTCqFYuM3H2AuhY+uCYfauOegz8OV2HjjA@mail.gmail.com>
Message-ID: <CAHk-=wi4g0NgX9BLiTCqFYuM3H2AuhY+uCYfauOegz8OV2HjjA@mail.gmail.com>
Subject: Re: [GIT PULL] MIPS changes
To:     David Howells <dhowells@redhat.com>
Cc:     Paul Burton <paul.burton@mips.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Sep 24, 2019 at 5:40 AM David Howells <dhowells@redhat.com> wrote:
>
> Linus Torvalds <torvalds@linux-foundation.org> wrote:
>
> > In honesty, I actually do have one warning in my tree:
> >
> >   samples/vfs/test-statx.c:24:15: warning: =E2=80=98struct foo=E2=80=99=
 declared
> > inside parameter list
>
> Were there any note lines from the compiler associated with this?  The wa=
rning
> message can't actually be taking place on this line.

That's the only thing that gcc says. I agree that it's not where the
problem occurs, but the gcc warning system tries to avoid warning
inside system header files, so it seems to have logic tracing it back
to the user.

But I have system header files that look like this:

  /* Fill *BUF with information about PATH in DIRFD.  */
  int statx (int __dirfd, const char *__restrict __path, int __flags,
             unsigned int __mask, struct statx *__restrict __buf)
    __THROW __nonnull ((2, 5));

and I think that's the one that triggers.

You must have hit *something* similar too, since the only reason for that

  #define statx foo
  #define statx_timestamp foo_timestamp
  #include <sys/stat.h>
  #undef statx
  #undef statx_timestamp

is that you're playing games with the kernel 'statx' clashing with
user 'statx' use.

And what I think happens is that you had the <sys/types.h> include
*without* that #define, so the 'struct statx' got declared there, and
then in <sys/stat.h> it gets used, but it gets used as 'struct foo',
so now the compiler complains (properly) that you're using this
undeclared 'struct foo' in the function declaration, and because of
namespace rules it's not the same thing as then a later 'struct foo'
would be.

              Linus

              Linus
