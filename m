Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DB653DF25D
	for <lists+linux-mips@lfdr.de>; Tue,  3 Aug 2021 18:19:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233215AbhHCQTu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 3 Aug 2021 12:19:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:53832 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233239AbhHCQTs (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 3 Aug 2021 12:19:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2318260F8F;
        Tue,  3 Aug 2021 16:19:33 +0000 (UTC)
Date:   Tue, 3 Aug 2021 17:19:26 +0100
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Andy Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Guo Ren <guoren@kernel.org>, linux-mips@vger.kernel.org,
        Paul Mackerras <paulus@samba.org>, linux-csky@vger.kernel.org,
        linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>,
        linuxppc-dev@lists.ozlabs.org,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org,
        Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH v2] arch: vdso: remove if-conditionals of
 $(c-gettimeofday-y)
Message-ID: <20210803161925.GC5786@arm.com>
References: <20210731060020.12913-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210731060020.12913-1-masahiroy@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Jul 31, 2021 at 03:00:20PM +0900, Masahiro Yamada wrote:
> arm, arm64, csky, mips, powerpc always select GENERIC_GETTIMEOFDAY,
> hence $(gettimeofday-y) never becomes empty.
> 
> riscv conditionally selects GENERIC_GETTIMEOFDAY when MMU=y && 64BIT=y,
> but arch/riscv/kernel/vdso/vgettimeofday.o is built only under that
> condition. So, you can always define CFLAGS_vgettimeofday.o
> 
> Remove all the meaningless conditionals.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
