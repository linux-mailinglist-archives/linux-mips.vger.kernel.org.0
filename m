Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2927285696
	for <lists+linux-mips@lfdr.de>; Wed,  7 Oct 2020 04:11:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726002AbgJGCL7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 6 Oct 2020 22:11:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725947AbgJGCL7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 6 Oct 2020 22:11:59 -0400
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com [IPv6:2607:f8b0:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D763CC061755;
        Tue,  6 Oct 2020 19:11:58 -0700 (PDT)
Received: by mail-il1-x142.google.com with SMTP id u9so887572ilj.7;
        Tue, 06 Oct 2020 19:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7IqAOYp42llwLuwCQMW9LKop2kFhyB4ypbTr1x8D03g=;
        b=VX1wgbXyjNLNffvgOfAsiLhtg/ng3H1BWasifYb3JNmAe9tZvk0JzuhGE8b8jDFJ/h
         O7Mz0rPb6IxzMVrNcpgqR03wwpDvqkxlz3vemmSSBiS62fuGbF1CooLLV23COshuhJvI
         o4zEoRTPUGrh5lw3dInn6aAejt2ebK/xvmhyTEhUbAF6bLiwl5gnMvNq1roJvsO0iiNf
         IbfrK0wXXJgXpL0TKNHP+tV5jQeiqC2MohypRDZ12/5WGl7uqJJKJGaySENsEolQS/Fk
         e8vyWm7mLOQNcSHkEpdhWuYryXq7Uu+CeLrpfoBABqAHl9U9+19g3e4oSEPMSr07YKX3
         xX7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7IqAOYp42llwLuwCQMW9LKop2kFhyB4ypbTr1x8D03g=;
        b=KFK+1QM1HQphmZsiku2xXb4Wq6HTmq6za9xgVG47u51BK1+j0YbXoAUEQSSRjI9AfY
         jOC95UkQHsaQ4fwnhMj2gc6KOkOmLcYxb6KuPP7Nml9Z4LckFtdkX3KoptVLbToe67Si
         HUxGCtHeql542G/P6itGc7y7o6U853RqXHL5NtvYYhKrShXrMhrNS2IhQF9UMVrwRKXf
         SUEoRKB7Hml9jnI1r8fVta45xML56xumxEzdM8P0BcYqRPbj6eZq6mU9mR7JXvu77R9z
         xCItGGN8HnhssAAJh1lpxyuHXo/L9hHSZrXlqNK2wZd3EbYLy6Nv7tWZb630xcVpJtrB
         sNWQ==
X-Gm-Message-State: AOAM532yT19qwov3p1NIFeid3JhSTAsMIkPmXLv3Rkn277Sg2KQoWp73
        SEbMZYVXk4BQofwQusNbnP7oz2Js1qARsttdbvUiTvi5WIc=
X-Google-Smtp-Source: ABdhPJy76By3F55RC+JMGjx9fprakDDR4v8kky+ByuUaFB5iJDD/zx4hb6X9lYABXrhPg/86e4N7bIMIwOgJIwa9g8s=
X-Received: by 2002:a92:b30c:: with SMTP id p12mr858959ilh.35.1602036718163;
 Tue, 06 Oct 2020 19:11:58 -0700 (PDT)
MIME-Version: 1.0
References: <20201005112846.66430-1-tsbogend@alpha.franken.de>
 <20201005112846.66430-2-tsbogend@alpha.franken.de> <20201006113131.GC8673@alpha.franken.de>
In-Reply-To: <20201006113131.GC8673@alpha.franken.de>
From:   Huacai Chen <chenhuacai@gmail.com>
Date:   Wed, 7 Oct 2020 10:11:46 +0800
Message-ID: <CAAhV-H73w2KgB=kTORzF4RWMz5L_z7JWVG3ZUGs9Et68NhFWJg@mail.gmail.com>
Subject: Re: [PATCH] MIPS: pgtable: Remove used PAGE_USERIO define
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

s/used/unused/g, but it is too late, I'm sorry.

Huacai

On Tue, Oct 6, 2020 at 7:31 PM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Mon, Oct 05, 2020 at 01:28:46PM +0200, Thomas Bogendoerfer wrote:
> > There are no users of PAGE_USERIO.
> >
> > Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > ---
> >  arch/mips/include/asm/pgtable.h | 2 --
> >  1 file changed, 2 deletions(-)
>
> applied to mips-next.
>
> Thomas.
>
> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]
