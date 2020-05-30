Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4943A1E8DDC
	for <lists+linux-mips@lfdr.de>; Sat, 30 May 2020 06:43:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725814AbgE3Enb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 30 May 2020 00:43:31 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:42935 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725813AbgE3Ena (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 30 May 2020 00:43:30 -0400
Received: by mail-il1-f195.google.com with SMTP id 18so4496954iln.9
        for <linux-mips@vger.kernel.org>; Fri, 29 May 2020 21:43:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cFLmcNBY3XvaG27h8RDp3e1GxxhdEzo0JB8xRESDJkw=;
        b=IXjy2S2/43tfJZxsnqQnuaLtsY1E0K1UrG9JuvTiOiG468jD7xeMIDN0K/tq//yoaf
         5KqeW4cut5pm73E9i0wWTXQjJmcI7FRZWxYihVEVTo6DmoLdKDFB+tJJy3/cL6Bxm0ZV
         TLW45VPQIPGLTYduRQMqezYPIQr2GnU+ySAC6E0aSX0XZ/0hmcQsjCrVsAXP60yNqi8z
         J5p4J8WC/Qw/I1+EinDKeBC8LMPuNvFJ6TuUv1xz/h4D0k5lAT3rXpMRtewPIV3X93Wc
         +sJiG9N2cT3FGHXGk1v8qKYDDFQbs1Fce+Rie4GHvg1NVjbrR4uF7Pzj6zrQhOb1iqeY
         JeHQ==
X-Gm-Message-State: AOAM530x+QwUNhiGt9c2TXf/vOXfMJzR9x99wFTtuCJ5YLjSv5Tk61xJ
        1ocN2I/35k3RYL0PZt/+AcEm3hKf599hz3gySBlXof8vPGv0ww==
X-Google-Smtp-Source: ABdhPJxDqi+v/ZLN+RCIgN28+RDCp3wL9v85lIP9Hf4/7912VM7Qqg1TUG2V63LuoDioNu/fGxmySRMr0MH5DI6g0d8=
X-Received: by 2002:a92:cf48:: with SMTP id c8mr10573627ilr.147.1590813808076;
 Fri, 29 May 2020 21:43:28 -0700 (PDT)
MIME-Version: 1.0
References: <1590740530-15649-1-git-send-email-chenhc@lemote.com> <20200529111858.GA11955@alpha.franken.de>
In-Reply-To: <20200529111858.GA11955@alpha.franken.de>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Sat, 30 May 2020 12:43:17 +0800
Message-ID: <CAAhV-H41SPVQzRmQAVYpgW_dChz+QXwTZHKGWJQv4B7JjQ5gjA@mail.gmail.com>
Subject: Re: [PATCH] MIPS: Fix build warning about "PTR_STR" redefinition
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "Maciej W . Rozycki" <macro@linux-mips.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Thomas,

On Fri, May 29, 2020 at 7:19 PM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Fri, May 29, 2020 at 04:22:10PM +0800, Huacai Chen wrote:
> >  arch/mips/include/asm/inst.h      | 779 ------------------------------------
> >  arch/mips/include/asm/unaligned.h | 802 ++++++++++++++++++++++++++++++++++++++
>
> please use a different filename for this to avoid another disaster
> because asm/unaligned.h is already used.
It seems like unaligned.h is the best place, because LoadXX/StoreXX is
nearly the same thing as get_unaligned/put_unaligned in the original
unaligned.h. For PTR_STR, the only confliction comes from
lib/test_printf.c, but lib/test_printf.c doesn't include unaligned.h.
And it seems there is no future problem, because unaligned.h has only
one new macro (i.e., PTR_STR, while LoadXX/StoreXX has no problems).

Regards,
Huacai
>
> Thomas.
>
> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]
