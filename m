Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 220D11EDA63
	for <lists+linux-mips@lfdr.de>; Thu,  4 Jun 2020 03:24:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727794AbgFDBYJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Jun 2020 21:24:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726047AbgFDBYI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 3 Jun 2020 21:24:08 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2BAFC08C5C0
        for <linux-mips@vger.kernel.org>; Wed,  3 Jun 2020 18:24:07 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id z18so5131895lji.12
        for <linux-mips@vger.kernel.org>; Wed, 03 Jun 2020 18:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fnqOYIUQo+qaj8w3g24MOT2Gco25LKdRH9nOfQU72t8=;
        b=UtdKeZmQ8xReEqzhYUDShUeXsTib84g3eRDLNMK7usyMbV4TBGM0vlhqgnEG9g57OY
         g6RH2h89oJKKLDLPjSogvRLpkY1UOHe+h5yfeawReCQqmn6/iMacwKP9WhjlmJi7gK38
         0/31CbOL/GGaaFwxJ46S/iu6T9fah2XuKCXYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fnqOYIUQo+qaj8w3g24MOT2Gco25LKdRH9nOfQU72t8=;
        b=Pk/GcUPMR1HUwnZnCjbHR1sHCkvcgdyhgWJhFFAwI2z1++TdeH4410vEg958MhnbJ8
         f6JiLOJIeWcPSYYUD1E7HlTgV+q9qrICltKkj89NCT77CZV5JziMYV/CRdkCM4NAMq/q
         FYT46HKqpSDmyQVGBbKF+9eFAjnP+4mvwA/psQClVdtJ3k6YR3Ui4nUQK089ZzFToXzf
         KlUhb0OCcDqzmAx06Jbcinz91w0sP/fDsn7QWLVfkGMNMzHbpXckhul+CgisjkVhnzAL
         rWwOvvdSQgmGNoSDe66JXwEG5aSB/GQat4eI5Dyu3ZT/9YnE7G0QTj+ulu93ki2+pJR1
         FRTw==
X-Gm-Message-State: AOAM531JGcNv2f7eF0AqVaUKuWYsndQVA130XRZgQhUfAtqeLRno5qLV
        katObvQ/Hvm7QzuJfCtXhodTq6/8d/8=
X-Google-Smtp-Source: ABdhPJw+3R8EoG++826LRYctEUBIsN+6mYHjmMsycAzxwarApINzkTNJVPDzFQltDp03OqrT9NcH0Q==
X-Received: by 2002:a2e:b5bc:: with SMTP id f28mr870917ljn.394.1591233845437;
        Wed, 03 Jun 2020 18:24:05 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id 15sm872284ljr.104.2020.06.03.18.24.04
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2020 18:24:04 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id b6so5208074ljj.1
        for <linux-mips@vger.kernel.org>; Wed, 03 Jun 2020 18:24:04 -0700 (PDT)
X-Received: by 2002:a2e:97c3:: with SMTP id m3mr644861ljj.312.1591233844059;
 Wed, 03 Jun 2020 18:24:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200602125445.GA12527@alpha.franken.de> <CAHk-=whtew82tj8_QLPU-xqT702vmB0pGgQSuQkK_Javnz6PPw@mail.gmail.com>
 <b37df9de-adca-3639-bd11-b114ad2f1e76@loongson.cn>
In-Reply-To: <b37df9de-adca-3639-bd11-b114ad2f1e76@loongson.cn>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 3 Jun 2020 18:23:48 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiP68twiDi58hdgP7LrDeyTUrtFf=Kz0owF=X8i5AUTng@mail.gmail.com>
Message-ID: <CAHk-=wiP68twiDi58hdgP7LrDeyTUrtFf=Kz0owF=X8i5AUTng@mail.gmail.com>
Subject: Re: [GIT PULL] MIPS changes for v5.8-rc1
To:     maobibo <maobibo@loongson.cn>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jun 3, 2020 at 6:11 PM maobibo <maobibo@loongson.cn> wrote:
>
> On architectures that manage the access bit in hardware, access bit is
> set at the beginning even if there is no memory access. On MIPS system
> access bit is not set at the beginning, it is set in page fault handling.

I had a hard time parsing that.

But I think you mean that the access bit is already set in the pgprot
bits on other architectures. And yeah, you seem to be right for at
least x86.

So yes, it seems unnecessary to set the accessed bit again, when the
accessed bit is already there from the pgprot bits. Good point.

> I am investigating why access bit is not set at the
> beginning in MIPS system.

Yeah, that does seem to be the right thing to do.

On x86, we have (for example)

  #define PAGE_COPY            __pg(__PP|   0|_USR|___A|__NX|   0|   0|   0)
..
  #define __P010  PAGE_COPY

where that "__A" bit is the accessed bit (_PAGE_ACCESSED), just a
small internal macro to make all those line up nicely.

And that ends up being used for that protection_map[] array.

MIPS fills in the initial protection bits in protection_map[] with
dummy values, and then seems to initialize them without ever setting
the accessed bit there.

Not sure why that initialization then doesn't just add the pte_mkyoung..

                Linus
