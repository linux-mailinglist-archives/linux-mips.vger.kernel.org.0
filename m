Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41BF93E189A
	for <lists+linux-mips@lfdr.de>; Thu,  5 Aug 2021 17:47:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242663AbhHEPrp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 5 Aug 2021 11:47:45 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:35250 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242471AbhHEPri (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 5 Aug 2021 11:47:38 -0400
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out2.suse.de (Postfix) with ESMTP id 05DC41FE69;
        Thu,  5 Aug 2021 15:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1628178443; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=xjyShzouPrJcHBbruWtTQutmAQhza4mB7qEDF4um5Mg=;
        b=HFFKv1lODf3gm58MqBGWAh8qSB3SjD0CWH1FfzIS9Ttb2ITfRIGZdfCH1BtAnoyP4ESIec
        etQbWzYl+6ASAoafzEiq37hiOIvpPGQL0Maxr2rIGqwGWJypE77o36bBPH1bIEeFynFgxE
        JPgwV+WeWHfe1PUy2fE9+HyrOT/gvco=
Received: from suse.cz (pmladek.udp.ovpn1.prg.suse.de [10.100.224.162])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by relay2.suse.de (Postfix) with ESMTPS id 9259EA3EC0;
        Thu,  5 Aug 2021 15:47:22 +0000 (UTC)
Date:   Thu, 5 Aug 2021 17:47:22 +0200
From:   Petr Mladek <pmladek@suse.com>
To:     John Ogness <john.ogness@linutronix.de>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Peter Zijlstra <peterz@infradead.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Jason Wessel <jason.wessel@windriver.com>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
        "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
        Chengyang Fan <cy.fan@huawei.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Bhaskar Chowdhury <unixbhaskar@gmail.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linuxppc-dev@lists.ozlabs.org,
        kgdb-bugreport@lists.sourceforge.net,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Vitor Massaru Iha <vitor@massaru.org>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Changbin Du <changbin.du@intel.com>,
        Sumit Garg <sumit.garg@linaro.org>,
        Cengiz Can <cengiz@kernel.wtf>,
        Jiri Slaby <jirislaby@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        kuldip dwivedi <kuldip.dwivedi@puresoftware.com>,
        Wang Qing <wangqing@vivo.com>, Andrij Abyzov <aabyzov@slb.com>,
        Johan Hovold <johan@kernel.org>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Claire Chang <tientzu@chromium.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Zhang Qilong <zhangqilong3@huawei.com>,
        "Maciej W. Rozycki" <macro@orcam.me.uk>,
        Guenter Roeck <linux@roeck-us.net>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Al Cooper <alcooperx@gmail.com>, linux-serial@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH printk v1 00/10] printk: introduce atomic consoles and
 sync mode
Message-ID: <YQwHwT2wYM1dJfVk@alley>
References: <20210803131301.5588-1-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210803131301.5588-1-john.ogness@linutronix.de>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue 2021-08-03 15:18:51, John Ogness wrote:
> Hi,
> 
> This is the next part of our printk-rework effort (points 3 and
> 4 of the LPC 2019 summary [0]).
> 
> Here the concept of "atomic consoles" is introduced through  a
> new (optional) write_atomic() callback for console drivers. This
> callback must be implemented as an NMI-safe variant of the
> write() callback, meaning that it can function from any context
> without relying on questionable tactics such as ignoring locking
> and also without relying on the synchronization of console
> semaphore.
> 
> As an example of how such an atomic console can look like, this
> series implements write_atomic() for the 8250 UART driver.
> 
> This series also introduces a new console printing mode called
> "sync mode" that is only activated when the kernel is about to
> end (such as panic, oops, shutdown, reboot). Sync mode can only
> be activated if atomic consoles are available. A system without
> registered atomic consoles will be unaffected by this series.
>
> When in sync mode, the console printing behavior becomes:
> 
> - only consoles implementing write_atomic() will be called
> 
> - printing occurs within vprintk_store() instead of
>   console_unlock(), since the console semaphore is irrelevant
>   for atomic consoles

I am fine with the new behavior at this stage. It is a quite clear
win when (only) the atomic console is used. And it does not make any
difference when atomic consoles are disabled.

But I am not sure about the proposed terms and implementation.
I want to be sure that we are on the right way for introducing
console kthreads.

Let me try to compare the behavior:

1. before this patchset():

	/* printk: store immediately; try all consoles immediately */
	int printk(...)
	{
		vprintk_store();
		if (console_try_lock()) {
			/* flush pending messages to the consoles */
			console_unlock();
		}
	}

	/* panic: try hard to flush messages to the consoles and avoid deadlock */
	void panic()
	{
		/* Ignore locks in console drivers */
		bust_spinlocks(1);

		printk("Kernel panic ...);
		dump_stack();

		smp_send_stop();
		/* ignore console lock */
		console_flush_on_panic();
	}


2. after this patchset():

   + same as before in normal mode or when there is no atomic console

   + in panic with atomic console; it modifies the behavior:

	/*
	 * printk: store immediately; immediately flush atomic consoles;
	 *         unsafe consoles are not used anymore;
	 */
	int printk(...)
	{
		vprintk_store();
		flush_atomic_consoles();
	}

	/* panic: no hacks; only atomic consoles are used */
	void panic()
	{
		printk("Kernel panic ...);
		dump_stack();
	}


3. After introducing console kthread(s):

	int printk(...)
	{
		vprintk_store();
		wake_consoles_via_irqwork();
	}

	+ in panic:

	    + with atomic console like after this patchset?
	    + without atomic consoles?

	+ during early boot?


I guess that we will need another sync mode for the early boot,
panic, suspend, kexec, etc.. It must be posible to debug these states
even wihtout atomic console and working kthreads.

Best Regards,
Petr
