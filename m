Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07C5EC1E89
	for <lists+linux-mips@lfdr.de>; Mon, 30 Sep 2019 11:59:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730339AbfI3J7n (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Sep 2019 05:59:43 -0400
Received: from forward103o.mail.yandex.net ([37.140.190.177]:54073 "EHLO
        forward103o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727025AbfI3J7n (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Sep 2019 05:59:43 -0400
Received: from forward102q.mail.yandex.net (forward102q.mail.yandex.net [IPv6:2a02:6b8:c0e:1ba:0:640:516:4e7d])
        by forward103o.mail.yandex.net (Yandex) with ESMTP id 8FC4C5F80109;
        Mon, 30 Sep 2019 12:59:39 +0300 (MSK)
Received: from mxback4q.mail.yandex.net (mxback4q.mail.yandex.net [IPv6:2a02:6b8:c0e:6d:0:640:ed15:d2bd])
        by forward102q.mail.yandex.net (Yandex) with ESMTP id 8B4727F20002;
        Mon, 30 Sep 2019 12:59:39 +0300 (MSK)
Received: from vla3-11710f0f0dbd.qloud-c.yandex.net (vla3-11710f0f0dbd.qloud-c.yandex.net [2a02:6b8:c15:2584:0:640:1171:f0f])
        by mxback4q.mail.yandex.net (nwsmtp/Yandex) with ESMTP id QdsmqUPXZ4-xcO0dnbH;
        Mon, 30 Sep 2019 12:59:39 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1569837579;
        bh=NwyLL6DOSkw/PCcM8oUlXEs7ySEKjw+bBWjRiY8UuXk=;
        h=In-Reply-To:From:To:Subject:Cc:Date:References:Message-ID;
        b=I/PCw1zkCYzOTM3XNMotxiYquzVMyELEBkqfL/n1p9Rs8ZKUnjcN/jMpvMW/F4CMP
         OuTipE/LcAsAkScqYXtijHK5Xy1ZoVh7xR2HtQOBGMp0l8GJB/KlNjHb9p+KAHiQAb
         hNkGOJY/jwAIV+kHGnSaGhu2+A0vN9YZV1c6kYik=
Authentication-Results: mxback4q.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by vla3-11710f0f0dbd.qloud-c.yandex.net (nwsmtp/Yandex) with ESMTPSA id qVFwowU4x7-xYHGuUL9;
        Mon, 30 Sep 2019 12:59:37 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
Subject: Re: [MIPS] GCC: Fix Loongson3 LLSC Errata
To:     Paul Hua <paul.hua.gm@gmail.com>,
        gcc-patches <gcc-patches@gcc.gnu.org>
Cc:     Matthew Fortune <mfortune@gmail.com>, syq@debian.org,
        huangpei@loongson.cn,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        mattst88@gmail.com
References: <CAKjxQHkGuM7V-e78-SyRypL8rYdQ2-mXLfYaK1au8x=LNnGgBA@mail.gmail.com>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <16ecb24e-1e08-ec2f-21ab-55197bf2294f@flygoat.com>
Date:   Mon, 30 Sep 2019 17:59:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAKjxQHkGuM7V-e78-SyRypL8rYdQ2-mXLfYaK1au8x=LNnGgBA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


On 2018/11/30 下午8:45, Paul Hua wrote:
> In some older Loongson3 processors there is a LL/SC errata that can
> cause the CPU to deadlock occasionally.  The details are very
> complicated. We find a way to work around this errata by a) adding a
> sync before ll/lld instruction, b) adding a sync
> before branch target that between ll and sc. The assembler do the jobs
> 'a', gcc do the jobs 'b'.

Hi all,

Any update about this patch?

As this workaround is the last barrier for generic MIPS distros to run 
on Loongson systems.

Btw, I heard from Loongson guys that type A (adding a sync before ll/lld 
instruction) of this errata only exist on pre-3A2000 (GS464) processors 
while type B exist on all processors. Is that true?

If so, then they should have different naming in flags to prevent 
confusing. I saw that you are using "LLTGT" and "LLSYNC" in cpucfg bit 
domin of 3A4000, should we also use that naming in toolchain?


Thanks.

--

Jiaxun Yang

> This patch also add a configure options
> --with-mips-fix-loongson3-llsc=[yes|no] to enable fix-loongson3-llsc
> by config.
>
> >From 16f0fd9e32d2098637dc0eb3e576444c48c43f22 Mon Sep 17 00:00:00 2001
> From: Chenghua Xu <paul.hua.gm@gmail.com>
> Date: Fri, 30 Nov 2018 19:57:38 +0800
> Subject: [PATCH] [MIPS][GCC]  Fix Loongson3 LLSC Errata.
>
> gcc/
> 	* config.gcc (supported_defaults): Add fix-loongson3-llsc
> 	(with_fix_loongson3_llsc): Add validation.
> 	(all_defaults): Add fix-loongson3-llsc.
> 	* config/mips/mips.c (mips_process_sync_loop): Add sync before
> 	branch target that between ll and sc.
> 	* config/mips/mips.h (OPTION_DEFAULT_SPECS): Add a default for
> 	fix-loongson3-llsc.
> 	gcc/config/mips/mips.opt: New option.
> 	* doc/install.texi (--with-fix-loongson3-llsc):Document the new
> 	option.
> 	* doc/invoke.texi (-mfix-loongson3-llsc):Document the new option.
>
> gcc/testsuite/
> 	* gcc.target/mips/fix-loongson3-llsc.c: New test.
> 	* gcc.target/mips/mips.exp (option): Add fix-loongson3-llsc.
> ---
>   gcc/config.gcc                                | 19 +++++++++++++++++--
>   gcc/config/mips/mips.c                        | 13 +++++++++++--
>   gcc/config/mips/mips.h                        |  4 +++-
>   gcc/config/mips/mips.opt                      |  4 ++++
>   gcc/doc/install.texi                          |  4 ++++
>   gcc/doc/invoke.texi                           |  8 ++++++++
>   .../gcc.target/mips/fix-loongson3-llsc.c      | 10 ++++++++++
>   gcc/testsuite/gcc.target/mips/mips.exp        |  1 +
>   8 files changed, 58 insertions(+), 5 deletions(-)
>   create mode 100644 gcc/testsuite/gcc.target/mips/fix-loongson3-llsc.c
