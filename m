Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7042B3DDCE1
	for <lists+linux-mips@lfdr.de>; Mon,  2 Aug 2021 17:55:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234998AbhHBPzq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 2 Aug 2021 11:55:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:54854 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233995AbhHBPzp (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 2 Aug 2021 11:55:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3008461107;
        Mon,  2 Aug 2021 15:55:25 +0000 (UTC)
Date:   Mon, 2 Aug 2021 16:55:22 +0100
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
        Ard Biesheuvel <ardb@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ley Foon Tan <ley.foon.tan@intel.com>, x86@kernel.org,
        linux-mips@vger.kernel.org, sparclinux@vger.kernel.org,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Nick Hu <nickhu@andestech.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Mike Rapoport <rppt@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-riscv@lists.infradead.org, YiFei Zhu <yifeifz2@illinois.edu>,
        Greentime Hu <green.hu@gmail.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Michal Simek <monstr@monstr.eu>, Helge Deller <deller@gmx.de>,
        linux-sh@vger.kernel.org, Vineet Gupta <vgupta@synopsys.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, Guo Ren <guoren@kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        Richard Weinberger <richard@nod.at>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Rich Felker <dalias@libc.org>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Heiko Carstens <hca@linux.ibm.com>,
        Jeff Dike <jdike@addtoit.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        linux-hexagon@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
        linux-s390@vger.kernel.org,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        linux-um@lists.infradead.org,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Frederic Weisbecker <frederic@kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Brian Cain <bcain@codeaurora.org>, linux-csky@vger.kernel.org,
        Stafford Horne <shorne@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Chris Zankel <chris@zankel.net>,
        Vasily Gorbik <gor@linux.ibm.com>,
        linux-snps-arc@lists.infradead.org,
        Jonas Bonn <jonas@southpole.se>, linux-parisc@vger.kernel.org,
        Kees Cook <keescook@chromium.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Colin Ian King <colin.king@canonical.com>,
        "David S. Miller" <davem@davemloft.net>,
        linux-kernel@vger.kernel.org, Vincent Chen <deanbo422@gmail.com>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Mackerras <paulus@samba.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linuxppc-dev@lists.ozlabs.org, openrisc@lists.librecores.org
Subject: Re: [PATCH 2/3] trace: refactor TRACE_IRQFLAGS_SUPPORT in Kconfig
Message-ID: <20210802155521.GI18685@arm.com>
References: <20210731052233.4703-1-masahiroy@kernel.org>
 <20210731052233.4703-2-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210731052233.4703-2-masahiroy@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Jul 31, 2021 at 02:22:32PM +0900, Masahiro Yamada wrote:
> Make architectures select TRACE_IRQFLAGS_SUPPORT instead of
> having many defines.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

For arm64:

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
