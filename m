Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E72546CAA8
	for <lists+linux-mips@lfdr.de>; Wed,  8 Dec 2021 02:57:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239244AbhLHCAq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 7 Dec 2021 21:00:46 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:49358 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238927AbhLHCAf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 7 Dec 2021 21:00:35 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8DE45B81F47
        for <linux-mips@vger.kernel.org>; Wed,  8 Dec 2021 01:57:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57685C341C5
        for <linux-mips@vger.kernel.org>; Wed,  8 Dec 2021 01:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638928622;
        bh=YnLy/Vz/xwjDLuZrb+DFmO89LHJSGqgBZ1Hi0b4wjfg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=RtYEbJbvaF8aNv6vjqc4WjIovr33qQ3kIN/mFPQ2zYp7DeDA04UMUErjwcyg/GEuf
         zQb+ytI+l7LPNIdPTxjsnb77eqKlEOxjDSMqi0P/nzkP7n31R9igFHDDk2Dt4X3PUN
         BmFIbX3s7aEeNrJD/P65FDME2oq8IQKgAmAjkE0bwho3d186t5t9h/dIF1B0TcA8jA
         ipgH8qjbFYYIo8UJw0SdAtfEYdLcEfSjvBpYgy7JbH3bNk2DfQw/NNXGzfDTB8HXnl
         O/nQVGD0u/mEjHBeLLS+12B0Z0d3/eM0TNk/fb0HewQflyJMVB/SXOU8q195vb6lOV
         fekwfSoFeZhig==
Received: by mail-ua1-f50.google.com with SMTP id y5so2048019ual.7
        for <linux-mips@vger.kernel.org>; Tue, 07 Dec 2021 17:57:02 -0800 (PST)
X-Gm-Message-State: AOAM530tmTy9I9pfrDBB78jauhhFuWDvD01b2fog/ATXUsOslKamyHWB
        9XSlxQZjDT2BriPkgGcU1E1oKwnpD+0cZC9KimQ=
X-Google-Smtp-Source: ABdhPJyqx4+dqTkLk21r5izPzK21cxN3RetWRsIJOfIXqmE3KyxQ7PXgsotO/4CSuanIusQOjLIKTEO2OH9jh0txPmc=
X-Received: by 2002:a67:2e51:: with SMTP id u78mr48775082vsu.62.1638928621390;
 Tue, 07 Dec 2021 17:57:01 -0800 (PST)
MIME-Version: 1.0
References: <20211207162618.GA19327@alpha.franken.de>
In-Reply-To: <20211207162618.GA19327@alpha.franken.de>
From:   Huacai Chen <chenhuacai@kernel.org>
Date:   Wed, 8 Dec 2021 09:56:50 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6tWyiZCtZXf_57-va9J8C+Roy5bgKJVc0=ATRrHV9Mtw@mail.gmail.com>
Message-ID: <CAAhV-H6tWyiZCtZXf_57-va9J8C+Roy5bgKJVc0=ATRrHV9Mtw@mail.gmail.com>
Subject: Re: Loongson64 and huge pages
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Thomas,

On Wed, Dec 8, 2021 at 8:59 AM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> Hi,
>
> [   11.647401] CPU 3 Unable to handle kernel paging request at virtual address 0000000558005801, epc == ffffffff80232838, ra == ffffffff802327ac
> [   11.660049] Oops[#1]:
> [   11.662303] CPU: 3 PID: 348 Comm: libvirtd Not tainted 5.16.0-rc3+ #140
> [   11.668877] Hardware name: Lemote LEMOTE-LS3A4000-7A1000-1w-V0.1-pc/LEMOTE-LS3A4000-7A1000-1w-V01-pc, BIOS Kunlun-A1901-V4.1.4 04/20/2020
> [   11.681153] $ 0   : 0000000000000000 000000007400cce0 000000000000033f 0000000558001811
> [   11.689119] $ 4   : 0000000000800000 0000000558005801 0000000000000000 980000013507c000
> [   11.697081] $ 8   : 0000000000000078 0000000000800000 ffffffffffffffff 9800000004714210
> [   11.705043] $12   : 9800000134fe7cb8 ffffffffffffff7f 9800000004714200 0000000000000040
> [   11.713005] $16   : 980000014ebbcfc0 000000007400cce1 000000ffabffc000 ffffffff81258700
> [   11.720966] $20   : 980000012137f464 980000012137f400 980000013507fea8 980000047cc60000
> [   11.728928] $24   : 0000000000000003 000000ffa3c08fa0
> [   11.736890] $28   : 9800000134fe4000 9800000134fe7c90 980000012137f468 ffffffff802327ac
> [   11.744853] Hi    : 00000000000001c8
> [   11.748399] Lo    : ffffffffc6da0e44
> [   11.751947] epc   : ffffffff80232838 __update_tlb+0xf0/0x258
> [   11.757578] ra    : ffffffff802327ac __update_tlb+0x64/0x258
> [   11.763202] Status: 7400cce2 KX SX UX KERNEL EXL
> [   11.767883] Cause : 10000008 (ExcCode 02)
> [   11.771862] BadVA : 0000000558005801
> [   11.775408] PrId  : 0014c001 (ICT Loongson-3)
> [   11.779733] Modules linked in:
> [   11.782764] Process libvirtd (pid: 348, threadinfo=00000000a73c3d49, task=00000000728cbb42, tls=000000fff0ced7d0)
> [   11.792968] Stack : 980000047cbed700 980000014ebbcfc0 000000ffaa000000 9800000134fe7d40
> [   11.800933]         0000000558001811 ffffffff804a26f8 0000000000000000 584fe00ab628d7e1
> [   11.808894]         0000000000000207 980000013507fea8 ffffffff814f4000 980000014ebbcfc0
> [   11.816856]         ffffffff81260000 0000000000000254 000000007400cce1 0000000000000001
> [   11.824818]         ffffffff813f6860 ffffffff8044e260 000000aaadae8000 980000012137f400
> [   11.832779]         000000000000000b 0000000000100077 980000014ebbcfc0 0000000000000cc0
> [   11.840742]         0000000003feafff 000000ffabffc000 0000000000000254 980000013507fea8
> [   11.848704]         98000001350f0078 0000000000000000 0000000000000000 0000000000000000
> [   11.856667]         0000000000000000 980000012137f464 0000000000000000 584fe00ab628d7e1
> [   11.864629]         9800000134fe7e08 980000014ebbcfc0 0000000000000254 000000ffabffc030
> [   11.872590]         ...
> [   11.875017] Call Trace:
> [   11.877440] [<ffffffff80232838>] __update_tlb+0xf0/0x258
> [   11.882722] [<ffffffff804a26f8>] do_huge_pmd_anonymous_page+0x3c8/0x808
> [   11.889300] [<ffffffff8044e260>] __handle_mm_fault+0xbc0/0xf38
> [   11.895099] [<ffffffff8044e7ec>] handle_mm_fault+0x214/0x2c8
> [   11.900722] [<ffffffff80f24638>] do_page_fault+0x218/0x6a0
> [   11.906176] [<ffffffff8022ae64>] tlb_do_page_fault_0+0x114/0x11c
> [   11.912149]
> [   11.913622] Code: 0067182d  dc630000  00a3282d <dca30000> 10800006  00033a3a  2408ffff  00031e3c  000847bc
> [   11.923325]
> [   11.924837] ---[ end trace bc99cfb1af49f825 ]---
> [   11.929428] note: libvirtd[348] exited with preempt_count 1
>
> is this a known issue ? If I disabled TRANSPARENT_HUGE_PAGE system
> works.
Have you tried some older kernels, such as 5.10/5.15? I have seen that
some MM-related patches be merged in MIPS tree in recent releases, and
maybe this bug is caused by them.

Huacai
>
> Thomas.
>
> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]
