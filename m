Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88DF6316CE8
	for <lists+linux-mips@lfdr.de>; Wed, 10 Feb 2021 18:36:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232052AbhBJRgq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Feb 2021 12:36:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232895AbhBJReq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Feb 2021 12:34:46 -0500
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40E62C06174A
        for <linux-mips@vger.kernel.org>; Wed, 10 Feb 2021 09:34:05 -0800 (PST)
Received: by mail-il1-x132.google.com with SMTP id q9so2605257ilo.1
        for <linux-mips@vger.kernel.org>; Wed, 10 Feb 2021 09:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C2/WOdd/8KDAjM3l5pwXc9iIvLqkyXUoMupr743nnZA=;
        b=F6KDUmqCeyui5VNje+nCGcw9yC5OpnZUTufPwVjkRtq430UvgV9j6hBXFqaq17NziX
         MlcrPu4v08926LVhXtQGqh2ZNQqjJLWJfEm/Ut0Ex4jMKGbG1/S0LCMd11Ak31gxqhk7
         JfWdp1f0/f/M7QX+i15gyPBocL01x9ynbYYU3EXYzHdyBehFEY7QXf4axUQ9kWz/a0eH
         sfdco4VIlRAexe6DjCBZXt3rHILMY09vXnrv67bvMmADUD3Ji32vaQ28FzVIFCU74d7p
         JqqHu55pS5oLbh7E1f2kDPkVGy1ioyH9vLKBOTAR7A0DBvm0J/O0KMkK/G6t8w9Kew2r
         Qpmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C2/WOdd/8KDAjM3l5pwXc9iIvLqkyXUoMupr743nnZA=;
        b=VrUU+03yGc2Jx3adopyExCN7eImgHAX0K1yVXWa2OU3MQDps8A5lr6zSzutTVChZy+
         HeK1iGg68LQlmGi/sScxeBk0xYHz8XRLkG1r1ZKKd1lxPvmghFlwmSPof6QAHMOn5xeZ
         8KkFvqHVvlTQVXBGeheMFd3wQbRzDf7zCoIVbsIO77cwjNpvsWvlZvjlI7uM8VUGHIK6
         ILQqA7AjKiNlx7bH2RUhxY83ZSaxyooAkI0wivtuRmWcj2PBsZrsTba/7SwqOrKqSttE
         ZuNX1KHoA8ZIFG+nX/mvdLQqbLodQ+IyV/5TfqMLix4huNFekjtxMRkglprXj4RilXin
         DSFQ==
X-Gm-Message-State: AOAM532iMwT04fKbJ9njkGBbd8g71aQH2yD7yT8Z7w8azvVVAyE1G3Ot
        wqVDzWs2cSopLrbNVHIVRhLO3BYE0rrYeEGuvaqSBw==
X-Google-Smtp-Source: ABdhPJxCF+5fHvUD5hNJhK1GwCdrt6fLgkcQKSWQ+uC6tIma4rjeF6Q6xWQjGuWYmYxJ+1igriFd0OD1U83EEV2hNCM=
X-Received: by 2002:a92:cbce:: with SMTP id s14mr2171028ilq.306.1612978444473;
 Wed, 10 Feb 2021 09:34:04 -0800 (PST)
MIME-Version: 1.0
References: <20210210144556.10932-1-longman@redhat.com> <401dbbe1-096c-8af5-4e21-e355e602272e@roeck-us.net>
 <d8f02a3f-4cef-c5d4-7646-fc435cfc9307@redhat.com>
In-Reply-To: <d8f02a3f-4cef-c5d4-7646-fc435cfc9307@redhat.com>
From:   Ben Gardon <bgardon@google.com>
Date:   Wed, 10 Feb 2021 09:33:53 -0800
Message-ID: <CANgfPd9WS33A7OjOxdUhexJ4NibF6XZ1TA5mVRNOEGgurznEtA@mail.gmail.com>
Subject: Re: [PATCH] locking/arch: Move qrwlock.h include after qspinlock.h
To:     Waiman Long <longman@redhat.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-xtensa@linux-xtensa.org,
        Naresh Kamboju <naresh.kamboju@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Feb 10, 2021 at 7:54 AM Waiman Long <longman@redhat.com> wrote:
>
> On 2/10/21 10:05 AM, Guenter Roeck wrote:
> > On 2/10/21 6:45 AM, Waiman Long wrote:
> >> The queued rwlock code has a dependency on the current spinlock
> >> implementation (likely to be qspinlock), but not vice versa. Including
> >> qrwlock.h before qspinlock.h can be problematic when expanding qrwlock
> >> functionality.
> >>
> >> If both qspinlock.h and qrwlock.h are to be included, the qrwlock.h
> >> include should always be after qspinlock.h. Update the current set of
> >> asm/spinlock.h files to enforce that.
> >>
> >> Signed-off-by: Waiman Long <longman@redhat.com>
> > There should be a Fixes: tag here. If the SHA of the offending commit is not
> > stable, there should be a better reference than "The queued rwlock code".
> I originally have a Fixes tag when I was modifying the mips'
> asm/spinlock.h file. After I realize that there are more files to
> modify, I take that out. Anyway, the problem was exposed by Ben's
> qrwlock patch. So existing stable releases should still be fine without
> this patch.
> >
> > This patch fixes the build problem I had observed on mips. I also tested
> > xtensa:defconfig and arm64:defconfig with no problems observed.
> >
> > Tested-by: Guenter Roeck <linux@roeck-us.net>
>
> Thanks for the testing as I don't have a build environment to verify that.
>
> Cheers,
> Longman
>

Thanks Longman and Guenter for developing and testing this fix! I
don't have the environment to test this either, but the patch looks
good to me.
Reviewed-by: Ben Gardon <bgardon@google.com>
