Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 900D51ED7B9
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jun 2020 23:00:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726184AbgFCVAZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Jun 2020 17:00:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726114AbgFCVAY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 3 Jun 2020 17:00:24 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3089FC08C5C0
        for <linux-mips@vger.kernel.org>; Wed,  3 Jun 2020 14:00:23 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id a9so997368ljn.6
        for <linux-mips@vger.kernel.org>; Wed, 03 Jun 2020 14:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0b+qr176vnemvoQgcf1HFSuRPIqMyeMZrgGdeChVyfo=;
        b=bpoZOeXkOq2jdLMF9vg9SSQ/4oMaJZ3yhJEERc3GP8VTAFh8GVOMQroy6GKYhMGGJu
         AMxgClLtjnSkIrR4yo8GVGPq9+EnIVNedKMFY7CnQp14jERaDVMEvJqIFKdzkrYvsQaQ
         0wQvXi1lx10JMJxvBSafvGuuRvyaxpRFlk3mg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0b+qr176vnemvoQgcf1HFSuRPIqMyeMZrgGdeChVyfo=;
        b=FIFYfYU0OTnTInVIXEhGAIhLzXkCDYzJ9vPS26hyuu187wlmNmI+lwi6jNYcv9/Vri
         YwqFVtUyhxUAAtk7Y4tiMVqAIIOuAF180IVJQ/QaYfAPdmW2UIR/HVbbdtp52/2clA6n
         Mk/TCYqg2Pi92Fhl526/17/yODF66bkrWGXJeBhFhFr214j8aumNk7KgYksG71X+CwcK
         kn5AEBCq6b5295iH9rAkQLZqBERL7br4nELR9NdX/2RmzcNmC9UODvRSnm7Z5rjPHmcw
         5jiKbdgo0LuWQRtfjjVZOPPYwMhTcaIdiipTQHWG2EoGcWX0cxvZG/b5sEUYHu3rWfco
         44QQ==
X-Gm-Message-State: AOAM532m5YsSCGZvJz465S2Sq0XjP7Cii94j1266jwaDgLuoyrptfx/l
        B77qEWhA+X/9sXUlxoSzo2qemBJUuTE=
X-Google-Smtp-Source: ABdhPJx78TeenjSNTuzvo9QtWnxN32Gsq5wcO9cpqmT7E+1LQRdsBcOA+4op1S/Rswp1YW6iWy6lJA==
X-Received: by 2002:a2e:83c7:: with SMTP id s7mr555584ljh.68.1591218020751;
        Wed, 03 Jun 2020 14:00:20 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id f7sm723011lja.1.2020.06.03.14.00.19
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2020 14:00:19 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id m18so4555924ljo.5
        for <linux-mips@vger.kernel.org>; Wed, 03 Jun 2020 14:00:19 -0700 (PDT)
X-Received: by 2002:a2e:b5d9:: with SMTP id g25mr539040ljn.285.1591218019098;
 Wed, 03 Jun 2020 14:00:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200602125445.GA12527@alpha.franken.de>
In-Reply-To: <20200602125445.GA12527@alpha.franken.de>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 3 Jun 2020 14:00:03 -0700
X-Gmail-Original-Message-ID: <CAHk-=whtew82tj8_QLPU-xqT702vmB0pGgQSuQkK_Javnz6PPw@mail.gmail.com>
Message-ID: <CAHk-=whtew82tj8_QLPU-xqT702vmB0pGgQSuQkK_Javnz6PPw@mail.gmail.com>
Subject: Re: [GIT PULL] MIPS changes for v5.8-rc1
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Bibo Mao <maobibo@loongson.cn>
Cc:     linux-mips@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jun 2, 2020 at 5:55 AM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> Bibo Mao (4):
>       mm/memory.c: Add memory read privilege on page fault handling

Hmm. That's a horribly named commit, but can you clarify why this
didn't just use the existing pte_mkyoung?

These are all paths that set the dirty bit early if it's a write, I
don't see why they wouldn't set the accessed bit too.

Even on architectures that manage the accessed bit in hardware, this
might be a (tiny) performance advantage because it avoids a page table
walker microfault to set the bit when it's accessed.

We already do the pte_mkyoung() in paths like cow_user_page(), so the
others may have been just oversights?

Or was there possibly some reason we didn't want to do it here?

                Linus
