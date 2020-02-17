Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 844CD16077B
	for <lists+linux-mips@lfdr.de>; Mon, 17 Feb 2020 01:23:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726128AbgBQAXC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 16 Feb 2020 19:23:02 -0500
Received: from mail-yw1-f65.google.com ([209.85.161.65]:36336 "EHLO
        mail-yw1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726099AbgBQAXC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 16 Feb 2020 19:23:02 -0500
Received: by mail-yw1-f65.google.com with SMTP id n184so7166607ywc.3;
        Sun, 16 Feb 2020 16:23:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RvBPrsaf/vx3QAte1Qnpsp+hszyxo6KbY+gYM2/7LjA=;
        b=e8nko6o8jnyQyJikRA1fe5DZNTm6bYrKK+LVuMwN4L5yV1lpe3Y3Q89oC08chKlN5f
         07gM/qKk5hXZDaRl3+4KcT0TYvEruuLIL9Em7hVwCpBbYlD8e3Sx/a6L37oEHcRLPgDP
         Aj8OdwOtqjnxDGQqQCNKzrdeinxKrrjvQBAdmWe4oP4i+DLsuliIfr4Y6ylRyg8tnTxt
         hZl1050AaXQPet92kyn2ptGmB+ynMyUp03u+j7pW5uQy7apRsK0px75LTfBSBw7TCy5x
         +CICS4fGzT8/m4Ls1KpcAQs3fJEJr1kxf1Uu6U+tTPCG9dlt+LQtGJfQ9+T/+i+Kkzjf
         Ug3A==
X-Gm-Message-State: APjAAAVrilw6XuqqbcA1Cm452G7CJfx6bC7kcMzLEelW+TQYesSUuX6Q
        sO03ceGlVqzLBbExLmfT+a7A096v9zVzrr/AkMo=
X-Google-Smtp-Source: APXvYqyQCU/hZKc6c+ps40FzzNag7kfR8UYQvQHgYyMzprLyT5uqFzzA36KlL+ZEwnYZDX8HWAovcgTPrrSJi42fqBw=
X-Received: by 2002:a81:4f8b:: with SMTP id d133mr11513961ywb.368.1581898981330;
 Sun, 16 Feb 2020 16:23:01 -0800 (PST)
MIME-Version: 1.0
References: <20200211212455.3307-1-mark.tomlinson@alliedtelesis.co.nz>
In-Reply-To: <20200211212455.3307-1-mark.tomlinson@alliedtelesis.co.nz>
From:   =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date:   Mon, 17 Feb 2020 01:22:50 +0100
Message-ID: <CAAdtpL5Tf-8O=xMKO33DWDs=2_Hsdk=FQSNO5Gsrx=9hWvENdg@mail.gmail.com>
Subject: Re: [PATCH] MIPS: cavium_octeon: Fix syncw generation.
To:     Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
Cc:     Paul Burton <paulburton@kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        chris.packham@alliedtelesis.co.nz,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Mark,

On Tue, Feb 11, 2020 at 10:42 PM Mark Tomlinson
<mark.tomlinson@alliedtelesis.co.nz> wrote:
>
> The Cavium Octeon CPU uses a special sync instruction for implementing
> wmb, and due to a CPU bug, the instruction must appear twice. A macro
> had been defined to hide this:
>
>  #define __SYNC_rpt(type)     (1 + (type == __SYNC_wmb))
>
> which was intended to evaluate to 2 for __SYNC_wmb, and 1 for any other
> type of sync. However, this expression is evaluated by the assembler,
> and not the compiler, and the result of '==' in the assembler is 0 or
> -1, not 0 or 1 as it is in C. The net result was wmb() producing no code
> at all. The simple fix in this patch is to change the '+' to '-'.

Isn't this particular to the assembler implementation?
Can you explicit the assembler you are using in the commit description?
Assuming we have to look at your commit in 3 years from now, we'll
wonder what assembler you were using.

Thanks,

Phil.

> Fixes: bf92927251b3 ("MIPS: barrier: Add __SYNC() infrastructure")
> Signed-off-by: Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
> ---
>  arch/mips/include/asm/sync.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/mips/include/asm/sync.h b/arch/mips/include/asm/sync.h
> index 7c6a1095f5..aabd097933 100644
> --- a/arch/mips/include/asm/sync.h
> +++ b/arch/mips/include/asm/sync.h
> @@ -155,9 +155,11 @@
>   * effective barrier as noted by commit 6b07d38aaa52 ("MIPS: Octeon: Use
>   * optimized memory barrier primitives."). Here we specify that the affected
>   * sync instructions should be emitted twice.
> + * Note that this expression is evaluated by the assembler (not the compiler),
> + * and that the assembler evaluates '==' as 0 or -1, not 0 or 1.
>   */
>  #ifdef CONFIG_CPU_CAVIUM_OCTEON
> -# define __SYNC_rpt(type)      (1 + (type == __SYNC_wmb))
> +# define __SYNC_rpt(type)      (1 - (type == __SYNC_wmb))
>  #else
>  # define __SYNC_rpt(type)      1
>  #endif
> --
> 2.25.0
>
