Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 316AE460A3F
	for <lists+linux-mips@lfdr.de>; Sun, 28 Nov 2021 22:19:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232598AbhK1VWi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 28 Nov 2021 16:22:38 -0500
Received: from rere.qmqm.pl ([91.227.64.183]:45225 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232065AbhK1VUg (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 28 Nov 2021 16:20:36 -0500
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4J2LsJ1Lcdz9y;
        Sun, 28 Nov 2021 22:17:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1638134236; bh=AVVRrFppT2KXeoQ1knr4qxNAWz0fqZEqjSZX5XRty4k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qeLiiTlDKcoC3FvftCsYmUekeo8vu2N1pSF3fCD2tgheWVvyonhdof+qu+Ea9djoI
         F0VfIqhNPcyB+IepSkiEVfWMkXITXgi5yRN5hDrKipQbOIN/UYPiCQ3ypFE5/lr3yX
         t143o/oCoxAN5HQdJgLvzJt9p7M6RWXHGnJUqKSETKZD7q6dZ+W4qIz0kh2v3idXT1
         jUvuN2o4SCcowRIIDi5HFtYotMwlOnPhdI33AjtMrxHoxjMEAOO/hdSLgu27razlyO
         MB5TcQY9Ad3wE8nllR9aML4jKPT5UuRgghYO2j4ETJ73vP6/OvL2peMilDKCW68Ia0
         6xDNHfFLM+f6A==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.3 at mail
Date:   Sun, 28 Nov 2021 22:17:06 +0100
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Joshua Thompson <funaho@jurai.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Sebastian Reichel <sre@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee.jones@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, alankao@andestech.com,
        "K . C . Kuen-Chern Lin" <kclin@andestech.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
        xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v4 08/25] kernel: Add combined power-off+restart handler
 call chain API
Message-ID: <YaPx0kY7poGpwCL9@qmqm.qmqm.pl>
References: <20211126180101.27818-1-digetx@gmail.com>
 <20211126180101.27818-9-digetx@gmail.com>
 <YaLQqks8cB0vWp6Q@qmqm.qmqm.pl>
 <9213569e-0f40-0df1-4710-8dab564e12d6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9213569e-0f40-0df1-4710-8dab564e12d6@gmail.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Nov 29, 2021 at 12:04:01AM +0300, Dmitry Osipenko wrote:
> 28.11.2021 03:43, Michał Mirosław пишет:
> > On Fri, Nov 26, 2021 at 09:00:44PM +0300, Dmitry Osipenko wrote:
> >> SoC platforms often have multiple ways of how to perform system's
> >> power-off and restart operations. Meanwhile today's kernel is limited to
> >> a single option. Add combined power-off+restart handler call chain API,
> >> which is inspired by the restart API. The new API provides both power-off
> >> and restart functionality.
> >>
> >> The old pm_power_off method will be kept around till all users are
> >> converted to the new API.
> >>
> >> Current restart API will be replaced by the new unified API since
> >> new API is its superset. The restart functionality of the sys-off handler
> >> API is built upon the existing restart-notifier APIs.
> >>
> >> In order to ease conversion to the new API, convenient helpers are added
> >> for the common use-cases. They will reduce amount of boilerplate code and
> >> remove global variables. These helpers preserve old behaviour for cases
> >> where only one power-off handler is expected, this is what all existing
> >> drivers want, and thus, they could be easily converted to the new API.
> >> Users of the new API should explicitly enable power-off chaining by
> >> setting corresponding flag of the power_handler structure.
> > [...]
> > 
> > Hi,
> > 
> > A general question: do we really need three distinct chains for this?
> 
> Hello Michał,
> 
> At minimum this makes code easier to follow.
> 
> > Can't there be only one that chain of callbacks that get a stage
> > (RESTART_PREPARE, RESTART, POWER_OFF_PREPARE, POWER_OFF) and can ignore
> > them at will? Calling through POWER_OFF_PREPARE would also return
> > whether that POWER_OFF is possible (for kernel_can_power_off()).
> 
> I'm having trouble with parsing this comment. Could you please try to
> rephrase it? I don't see how you could check whether power-off handler
> is available if you'll mix all handlers together.

If notify_call_chain() would be fixed to return NOTIFY_OK if any call
returned NOTIFY_OK, then this would be a clear way to gather the
answer if any of the handlers will attempt the final action (reboot or
power off).

> 
> > I would also split this patch into preparation cleanups (like wrapping
> > pm_power_off call with a function) and adding the notifier-based
> > implementation.
> 
> What's the benefit of this split up will be? Are you suggesting that it
> will ease reviewing of this patch or something else?

Mainly to ease review, as the wrapping will be a no-op, but the addition
of notifier chain changes semantics a bit.

Best Regards
Michał Mirosław
