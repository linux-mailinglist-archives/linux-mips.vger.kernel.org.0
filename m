Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98FA9D9395
	for <lists+linux-mips@lfdr.de>; Wed, 16 Oct 2019 16:20:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733190AbfJPOUN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 16 Oct 2019 10:20:13 -0400
Received: from ns.iliad.fr ([212.27.33.1]:49222 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727167AbfJPOUN (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 16 Oct 2019 10:20:13 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 3BB6A2077F;
        Wed, 16 Oct 2019 16:20:11 +0200 (CEST)
Received: from sakura (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 1A74B205F8;
        Wed, 16 Oct 2019 16:20:11 +0200 (CEST)
Message-ID: <a7ee05cbe4c3817081fcb1b28d6d0469864978d7.camel@freebox.fr>
Subject: Re: [PATCH] mips: vdso: Fix __arch_get_hw_counter()
From:   Maxime Bizon <mbizon@freebox.fr>
Reply-To: mbizon@freebox.fr
To:     Vincenzo Frascino <vincenzo.frascino@arm.com>,
        linux-mips@vger.kernel.org
Cc:     pburton@wavecomp.com
Date:   Wed, 16 Oct 2019 16:20:11 +0200
In-Reply-To: <20191016134024.46671-1-vincenzo.frascino@arm.com>
References: <20191016134024.46671-1-vincenzo.frascino@arm.com>
Organization: Freebox
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Wed Oct 16 16:20:11 2019 +0200 (CEST)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


On Wed, 2019-10-16 at 14:40 +0100, Vincenzo Frascino wrote:

> On some MIPS variants (e.g. MIPS r1), vDSO clock_mode is set to
> VDSO_CLOCK_NONE.
> 
> When VDSO_CLOCK_NONE is set the expected kernel behavior is to
> fallback
> on syscalls. To do that the generic vDSO library expects UULONG_MAX
> as
> return value of __arch_get_hw_counter().
> 
> Fix __arch_get_hw_counter() on MIPS defining a __VDSO_USE_SYSCALL
> case
> that addressed the described scenario.
> 
> Reported-by: Maxime Bizon <mbizon@freebox.fr>
> Cc: Paul Burton <pburton@wavecomp.com>
> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>

Tested-by: Maxime Bizon <mbizon@freebox.fr>

Thanks,

-- 
Maxime



