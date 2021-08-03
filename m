Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 144B13DEED9
	for <lists+linux-mips@lfdr.de>; Tue,  3 Aug 2021 15:13:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236094AbhHCNNQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 3 Aug 2021 09:13:16 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:56050 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235954AbhHCNNP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 3 Aug 2021 09:13:15 -0400
From:   John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1627996383;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=zratP/d2dqbzr5A3KZPCTDEa+UpOjiFaTT3D2EIH/Pg=;
        b=zk5sPz0A/N68QiMZNa4XnUH53XQGAkBgxmMF9RdDFSoOGdHXqC//ofK9o10vkQtIIgxpxy
        o3gzfJIWcGuD/7CJSo5P2+b6eNhxoNOxZol539AjZC3laI2y9WkzZGJ7p/8XuGC/SI6py5
        6Mpztfu+HxmsRcOTqIZJcFq3yrOVV08E2vhgrY8or5Z3uRGykD2IiT/TXmzbGy4LL+sBHS
        cGTPp1pxVnfmrDUBXMNIf7pO9xGKJUUaHa3+Iftq3TyMFoNPnqWV077wktj4wMXkILY+0N
        qrvzjb5E1n/5VK5Jn8gch/Yneaa2fDy8JybmbeFc/b2DSqzfflXIeOBn73Azfw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1627996383;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=zratP/d2dqbzr5A3KZPCTDEa+UpOjiFaTT3D2EIH/Pg=;
        b=eiwsN3XDO7gIOKIO/tyPKCl9YBM/K+0P9ejFJ1AFeHJgY6RpWMpxmcaTC14bbaMpVCrVQI
        kAWF+aftd/6aNtAw==
To:     Petr Mladek <pmladek@suse.com>
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
        =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linuxppc-dev@lists.ozlabs.org,
        kgdb-bugreport@lists.sourceforge.net,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
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
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Al Cooper <alcooperx@gmail.com>, linux-serial@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH printk v1 00/10] printk: introduce atomic consoles and sync mode
Date:   Tue,  3 Aug 2021 15:18:51 +0206
Message-Id: <20210803131301.5588-1-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

This is the next part of our printk-rework effort (points 3 and
4 of the LPC 2019 summary [0]).

Here the concept of "atomic consoles" is introduced through  a
new (optional) write_atomic() callback for console drivers. This
callback must be implemented as an NMI-safe variant of the
write() callback, meaning that it can function from any context
without relying on questionable tactics such as ignoring locking
and also without relying on the synchronization of console
semaphore.

As an example of how such an atomic console can look like, this
series implements write_atomic() for the 8250 UART driver.

This series also introduces a new console printing mode called
"sync mode" that is only activated when the kernel is about to
end (such as panic, oops, shutdown, reboot). Sync mode can only
be activated if atomic consoles are available. A system without
registered atomic consoles will be unaffected by this series.

When in sync mode, the console printing behavior becomes:

- only consoles implementing write_atomic() will be called

- printing occurs within vprintk_store() instead of
  console_unlock(), since the console semaphore is irrelevant
  for atomic consoles

For systems that have registered atomic consoles, this series
improves the reliability of seeing crash messages by using new
locking techniques rather than "ignoring locks and hoping for
the best". In particular, atomic consoles rely on the
CPU-reentrant spinlock (i.e. the printk cpulock) for
synchronizing console output.

John Ogness

[0] https://lore.kernel.org/lkml/87k1acz5rx.fsf@linutronix.de/

John Ogness (10):
  printk: relocate printk cpulock functions
  printk: rename printk cpulock API and always disable interrupts
  kgdb: delay roundup if holding printk cpulock
  printk: relocate printk_delay()
  printk: call boot_delay_msec() in printk_delay()
  printk: use seqcount_latch for console_seq
  console: add write_atomic interface
  printk: introduce kernel sync mode
  kdb: if available, only use atomic consoles for output mirroring
  serial: 8250: implement write_atomic

 arch/powerpc/include/asm/smp.h         |   1 +
 arch/powerpc/kernel/kgdb.c             |  10 +-
 arch/powerpc/kernel/smp.c              |   5 +
 arch/x86/kernel/kgdb.c                 |   9 +-
 drivers/tty/serial/8250/8250.h         |  47 ++-
 drivers/tty/serial/8250/8250_core.c    |  17 +-
 drivers/tty/serial/8250/8250_fsl.c     |   9 +
 drivers/tty/serial/8250/8250_ingenic.c |   7 +
 drivers/tty/serial/8250/8250_mtk.c     |  29 +-
 drivers/tty/serial/8250/8250_port.c    |  92 ++--
 drivers/tty/serial/8250/Kconfig        |   1 +
 include/linux/console.h                |  32 ++
 include/linux/kgdb.h                   |   3 +
 include/linux/printk.h                 |  57 +--
 include/linux/serial_8250.h            |   5 +
 kernel/debug/debug_core.c              |  45 +-
 kernel/debug/kdb/kdb_io.c              |  16 +
 kernel/printk/printk.c                 | 554 +++++++++++++++++--------
 lib/Kconfig.debug                      |   3 +
 lib/dump_stack.c                       |   4 +-
 lib/nmi_backtrace.c                    |   4 +-
 21 files changed, 684 insertions(+), 266 deletions(-)


base-commit: 23d8adcf8022b9483605531d8985f5b77533cb3a
-- 
2.20.1

