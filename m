Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 218F333F229
	for <lists+linux-mips@lfdr.de>; Wed, 17 Mar 2021 15:04:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231589AbhCQOEE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Mar 2021 10:04:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231750AbhCQODe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 17 Mar 2021 10:03:34 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5743BC06174A;
        Wed, 17 Mar 2021 07:03:34 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id h82so40555446ybc.13;
        Wed, 17 Mar 2021 07:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6OaFjyFWgg4m3b9LuLpqb/rP6tn5J4G93CnXJEjgfLQ=;
        b=i2DpCpQM7JeSSiS/pjMxgtMmRWaqyEUnqOkpir3k6hjfU9Oor7nDorySG4w47CoCGd
         HaiLgTyqU0kC8zA/M2kZQM1sH1E1LbWud/WbA8om7HWvSV+BUakqiOwPUeTLcoqCLPGf
         JedwFXQpUMM2xc1N014Ahaw2YTMoAf2cj3FsgDsCKv3ZOzvpAcW8c+eMj3EENF375f8x
         11rayPkdrSyY5YcS7+D3f2mNmy0iI8qzZ8PRIa+NRFehp669D1SyF0qYVVKeD+gzVYK8
         LIsktzMZcnA20N+P0QIhTw/wSHTpN81axxWdN3YKq6VrI5qwWqPf0cj92aOsspj4iCYa
         aQLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6OaFjyFWgg4m3b9LuLpqb/rP6tn5J4G93CnXJEjgfLQ=;
        b=bEUxvKmIPKCyxJ/STwqn0nT8JeKSy63asIyOyju2QZvTR+yvanfV/cFC9wNYb3hz0V
         t/b+nT7Ag8aJ/pAjonS87XhLsRUaeihZt+QkC9CSQ0f+vg8oLMEF0ZkOtGqRgov63kqr
         2OamdQbpY0cB+Fyux7SIb8iJg1AKVHfz6UVz0dB0iqLBpVL+eRP00fgHZEycmW1Pf4/z
         3+Y16vvjfux3pRzjxFHlBsphjI3k572SXs52haRBXruQ1T/FbMtGYgDXXr/Io5hWifOo
         Uk6wZYkPiDJnssYbxrGThiHGIksmZwDpMIVplGAZVCTTmGYZsojlkNlTio8NVCUd/RFf
         MY3g==
X-Gm-Message-State: AOAM531HNTbVWb29pXxB62HSRRm7MvH3l56ACL8LHNBOrIAFh963uPdb
        soVcscHLQEjJqILnH9lyHOFq6c/gT9HjilUki5i/1OJ6iZHnmg==
X-Google-Smtp-Source: ABdhPJxYwg2QBX1owqFPtrq2F/9pLRU/hzhKTzIOR3dpydN55snYMjquLkj00WQN+8aJP9sdN02xLmqhMTlZQxWC8Dc=
X-Received: by 2002:a25:dad4:: with SMTP id n203mr4746316ybf.233.1615989813490;
 Wed, 17 Mar 2021 07:03:33 -0700 (PDT)
MIME-Version: 1.0
References: <4d488195-7281-9238-b30d-9f89a6100fb9@csgroup.eu> <20210317015210.33641-1-wangkefeng.wang@huawei.com>
In-Reply-To: <20210317015210.33641-1-wangkefeng.wang@huawei.com>
From:   Anatoly Pugachev <matorola@gmail.com>
Date:   Wed, 17 Mar 2021 17:03:22 +0300
Message-ID: <CADxRZqwFokuZrhA6GFr=whM3s7BqZpzo8yq=TW6YEr=eeEUH0A@mail.gmail.com>
Subject: Re: [PATCH v2] mm: Move mem_init_print_info() into mm_init()
To:     Kefeng Wang <wangkefeng.wang@huawei.com>
Cc:     Linux Kernel list <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Richard Henderson <rth@twiddle.net>,
        Guo Ren <guoren@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jonas Bonn <jonas@southpole.se>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, linux-alpha@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        Sparc kernel list <sparclinux@vger.kernel.org>,
        linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org,
        linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Mar 17, 2021 at 4:51 AM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>
> mem_init_print_info() is called in mem_init() on each architecture,
> and pass NULL argument, so using void argument and move it into mm_init().
>
> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
> v2:
> - Cleanup 'str' line suggested by Christophe and ACK

applied patch (5.12.0-rc3-00020-g1df27313f50a-dirty) over linus.git
and tested boot on a sparc64 virtual machine (ldom) - boots.
