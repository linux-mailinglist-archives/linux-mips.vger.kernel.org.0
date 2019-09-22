Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E19F8BA3A3
	for <lists+linux-mips@lfdr.de>; Sun, 22 Sep 2019 20:35:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388524AbfIVSf4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 22 Sep 2019 14:35:56 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:33396 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388212AbfIVSf4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 22 Sep 2019 14:35:56 -0400
Received: by mail-lf1-f66.google.com with SMTP id y127so8446418lfc.0
        for <linux-mips@vger.kernel.org>; Sun, 22 Sep 2019 11:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cRoLwcm3Bb7q4lPiN1rwfLvtJPNQzTFyUagpOf2DWnI=;
        b=AxpAMa13K7mqHpC92mPyI3hm643Gi5sFppNr3Oenhx4gcOBf50M/6nFdHjfwTv+LdK
         gfDYtO+n4HqfjK+joMh+M9iHYIM3yrPWmz6jZB1Q0yKsGnF8T5E50EPD1d6xztfI7eez
         TdOZdS0zkzKXWxMn9qjYNXSNRw4ee2IFgcfPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cRoLwcm3Bb7q4lPiN1rwfLvtJPNQzTFyUagpOf2DWnI=;
        b=lMYZ6i1Eo7HfLhVyhphDScV1TccUz82BlPhX4XmrgcvrNWIl3bKkSUuSqD6qU2hd0j
         QxRVe4pngdQkMb3+hY3tKwU/jwIc/7hhXb7RU0/AuhWlk5EEXrfXTPOfUL1XRh+Bu0nV
         uCjSm2f1pPIElUkBTPotXiv05vzezgfCXeGiZt/vd9cqZuLnzkQk5jRGzIbHOi3TUe7Z
         YaiBjO80wYIqg3Uw5xqXvf1iEl+yzqiDj31OVxX8FaY4pioBxvBtEicT0I4bhWA/e52G
         hre/PuIE0fkCI4KGAXmvzqfyyqOKx7FN/XrCWUuruxY8zGE61LEtfPFxm34JiNp2oe4a
         8Myg==
X-Gm-Message-State: APjAAAV9aWO18MSmirZPWn+Pn36p+AEMh4blrsBqVBhkV5ME+ePYpBvL
        MmB/5JQls9Oye5ilWr5Cc/Y0aETmjvQ=
X-Google-Smtp-Source: APXvYqyeKtbm27YhgCryi0/KChDOgstRv+AADZZfdZtA0Gxc/V6+Tbb0uCFNmuM+5Tzspey3fjJwcQ==
X-Received: by 2002:a19:770a:: with SMTP id s10mr14591248lfc.30.1569177353591;
        Sun, 22 Sep 2019 11:35:53 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id t27sm1748539lfl.48.2019.09.22.11.35.52
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Sep 2019 11:35:52 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id b20so6154828ljj.5
        for <linux-mips@vger.kernel.org>; Sun, 22 Sep 2019 11:35:52 -0700 (PDT)
X-Received: by 2002:a2e:9854:: with SMTP id e20mr15742816ljj.72.1569177352341;
 Sun, 22 Sep 2019 11:35:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190921231022.kawfomtmka737arq@pburton-laptop>
In-Reply-To: <20190921231022.kawfomtmka737arq@pburton-laptop>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 22 Sep 2019 11:35:36 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjmJbF3p9vZTW2nbeD4LkG-JZV+uqv8BnxzojJ5SZsLjw@mail.gmail.com>
Message-ID: <CAHk-=wjmJbF3p9vZTW2nbeD4LkG-JZV+uqv8BnxzojJ5SZsLjw@mail.gmail.com>
Subject: Re: [GIT PULL] MIPS changes
To:     Paul Burton <paul.burton@mips.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Sep 21, 2019 at 4:10 PM Paul Burton <paul.burton@mips.com> wrote:
>
> Here are the main MIPS changes for v5.4; please pull.

Hmm. I pulled and because initial tests didn't show any issues, I
already pushed out.

But some unrelated further testing then shows that this:

> Florian Fainelli (2):
>       firmware: bcm47xx_nvram: Correct size_t printf format
>       firmware: bcm47xx_nvram: Allow COMPILE_TEST

causes problems, and commit feb4eb060c3a ("firmware: bcm47xx_nvram:
Correct size_t printf format") is buggy:

  drivers/firmware/broadcom/bcm47xx_nvram.c: In function =E2=80=98nvram_ini=
t=E2=80=99:
  drivers/firmware/broadcom/bcm47xx_nvram.c:151: warning: format =E2=80=98%=
zu=E2=80=99
expects argument of type =E2=80=98size_t=E2=80=99, but argument 2 has type =
=E2=80=98u32=E2=80=99 {aka
=E2=80=98unsigned int=E2=80=99} [-Wformat=3D]

and the change to use %zu was completely wrong.

It prints out 'header.len', which is an u32, not nvram_len which is a size_=
t.

Tssk tssk.

I've fixed it in my tree, but this should have shown up in linux-next,
or in MIPS testing. The process clearly failed.

                 Linus
