Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 543C416A72C
	for <lists+linux-mips@lfdr.de>; Mon, 24 Feb 2020 14:19:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727348AbgBXNTk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Feb 2020 08:19:40 -0500
Received: from foss.arm.com ([217.140.110.172]:36978 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727281AbgBXNTk (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 24 Feb 2020 08:19:40 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3790730E;
        Mon, 24 Feb 2020 05:19:40 -0800 (PST)
Received: from [10.163.1.29] (unknown [10.163.1.29])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DD26E3F534;
        Mon, 24 Feb 2020 05:19:35 -0800 (PST)
Subject: Re: [PATCH] mm/vma: Append unlikely() while testing VMA access
 permissions
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux MM <linux-mm@kvack.org>, Guo Ren <guoren@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        linux-mips@vger.kernel.org, linux-csky@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <1582525304-32113-1-git-send-email-anshuman.khandual@arm.com>
 <CAMuHMdXMSTLevTH1gkM8B53LtRUQ80o=t+W27z0QT-dNKkkYgQ@mail.gmail.com>
From:   Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <f23b808a-d71f-de44-b31b-057ec883b92f@arm.com>
Date:   Mon, 24 Feb 2020 18:49:34 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXMSTLevTH1gkM8B53LtRUQ80o=t+W27z0QT-dNKkkYgQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


On 02/24/2020 03:39 PM, Geert Uytterhoeven wrote:
> Hi Anshuman,
> 
> Thanks for your patch!
> 
> On Mon, Feb 24, 2020 at 7:22 AM Anshuman Khandual
> <anshuman.khandual@arm.com> wrote:
>> It is unlikely that an inaccessible VMA without required permission flags
>> will get a page fault. Hence lets just append unlikely() directive to such
> 
> Why? Isn't it the idea that you get a page fault when the page is not
> accessible?

Yeah it is. But the point here is to have a directive indicating that it is
unlikely that such scenarios will exist frequently even though they are very
much possible.

> 
>> checks in order to improve performance while also standardizing it across
>> various platforms.
> 
> Does it make a difference to add these? Have you benchmarked this?
> https://lwn.net/Articles/420019/

I dont have access to these platforms. As I had noted down previously, this
was only build tested. The primary motivation was that the likeliness or
rather unlikeliness for page faults on inaccessible VMAs are more workload
specific. Hence should not be platform dependent and this change was just
trying to make it similar in some platforms.

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 
