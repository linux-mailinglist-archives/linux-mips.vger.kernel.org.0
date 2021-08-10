Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CA853DEEDF
	for <lists+linux-mips@lfdr.de>; Tue,  3 Aug 2021 15:13:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236410AbhHCNNZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 3 Aug 2021 09:13:25 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:56290 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236321AbhHCNNV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 3 Aug 2021 09:13:21 -0400
From:   John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1627996388;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7lQLuXju38tEwj79L3DViIlbyax8wbq9xheJasH3Q4Q=;
        b=p/dzcKSjpWiJe1fRroHGimbIX+mBToRYVBAGffBSe0azfnpcgWhBZ6nbKpBqwjQm4LmPxE
        4ClWYQimupQwSarDSfAe2OAx0VR8NxP0xUw3OokMk//1WBy6gbQGYsOXOtZh4wwVCZtKfu
        tuHbaJuDQvyHiEf11o9hm1hWLzMTjkcHyRyEg5G/hVbvxq1s6osP+Cg+UbnG52Q7FGw4YS
        xjefquvXM2pFtTOePkOzU5IiinBqFnTdKIROMu/ubQO7ARL9b0pOWZVzxe6sq0GtjN0ybS
        zqgp76W9lJBu35GggMtYohEfwPb3yk+p7yzQ+TPU8eZRmSlk6K69rP1XhahMmw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1627996388;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7lQLuXju38tEwj79L3DViIlbyax8wbq9xheJasH3Q4Q=;
        b=cRusZNAILuXvUekWtnX3KtLOA19+wczYug5ISU3Dwa/gMNEaZvm1mRLk4VB31lA8qb/gL0
        UgTfGllnW8wq9zCA==
To:     Petr Mladek <pmladek@suse.com>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Al Cooper <alcooperx@gmail.com>, linux-serial@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH printk v1 10/10] serial: 8250: implement write_atomic
Date:   Tue,  3 Aug 2021 15:19:01 +0206
Message-Id: <20210803131301.5588-11-john.ogness@linutronix.de>
In-Reply-To: <20210803131301.5588-1-john.ogness@linutronix.de>
References: <20210803131301.5588-1-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Implement an NMI-safe write_atomic() console function in order to
support synchronous console printing.

Since interrupts need to be disabled during transmit, all usage of
the IER register is wrapped with access functions that use the
printk cpulock to synchronize register access while tracking the
state of the interrupts. This is necessary because write_atomic()
can be called from an NMI context that has preempted write_atomic().

Signed-off-by: John Ogness <john.ogness@linutronix.de>
---
 drivers/tty/serial/8250/8250.h         | 47 ++++++++++++-
 drivers/tty/serial/8250/8250_core.c    | 17 +++--
 drivers/tty/serial/8250/8250_fsl.c     |  9 +++
 drivers/tty/serial/8250/8250_ingenic.c |  7 ++
 drivers/tty/serial/8250/8250_mtk.c     | 29 +++++++-
 drivers/tty/serial/8250/8250_port.c    | 92 ++++++++++++++++----------
 drivers/tty/serial/8250/Kconfig        |  1 +
 include/linux/serial_8250.h            |  5 ++
 8 files changed, 163 insertions(+), 44 deletions(-)

diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
index 6473361525d1..9e8785ab9886 100644
--- a/drivers/tty/serial/8250/8250.h
+++ b/drivers/tty/serial/8250/8250.h
@@ -132,12 +132,55 @@ static inline void serial_dl_write(struct uart_8250_port *up, int value)
 	up->dl_write(up, value);
 }
 
+static inline void serial8250_set_IER(struct uart_8250_port *up,
+				      unsigned char ier)
+{
+	struct uart_port *port = &up->port;
+	unsigned long flags;
+	bool is_console;
+
+	is_console = uart_console(port);
+
+	if (is_console)
+		console_atomic_cpu_lock(flags);
+
+	serial_out(up, UART_IER, ier);
+
+	if (is_console)
+		console_atomic_cpu_unlock(flags);
+}
+
+static inline unsigned char serial8250_clear_IER(struct uart_8250_port *up)
+{
+	struct uart_port *port = &up->port;
+	unsigned int clearval = 0;
+	unsigned long flags;
+	unsigned int prior;
+	bool is_console;
+
+	is_console = uart_console(port);
+
+	if (up->capabilities & UART_CAP_UUE)
+		clearval = UART_IER_UUE;
+
+	if (is_console)
+		console_atomic_cpu_lock(flags);
+
+	prior = serial_port_in(port, UART_IER);
+	serial_port_out(port, UART_IER, clearval);
+
+	if (is_console)
+		console_atomic_cpu_unlock(flags);
+
+	return prior;
+}
+
 static inline bool serial8250_set_THRI(struct uart_8250_port *up)
 {
 	if (up->ier & UART_IER_THRI)
 		return false;
 	up->ier |= UART_IER_THRI;
-	serial_out(up, UART_IER, up->ier);
+	serial8250_set_IER(up, up->ier);
 	return true;
 }
 
@@ -146,7 +189,7 @@ static inline bool serial8250_clear_THRI(struct uart_8250_port *up)
 	if (!(up->ier & UART_IER_THRI))
 		return false;
 	up->ier &= ~UART_IER_THRI;
-	serial_out(up, UART_IER, up->ier);
+	serial8250_set_IER(up, up->ier);
 	return true;
 }
 
diff --git a/drivers/tty/serial/8250/8250_core.c b/drivers/tty/serial/8250/8250_core.c
index 1ce193daea7f..fad00c0414e3 100644
--- a/drivers/tty/serial/8250/8250_core.c
+++ b/drivers/tty/serial/8250/8250_core.c
@@ -264,10 +264,8 @@ static void serial8250_backup_timeout(struct timer_list *t)
 	 * Must disable interrupts or else we risk racing with the interrupt
 	 * based handler.
 	 */
-	if (up->port.irq) {
-		ier = serial_in(up, UART_IER);
-		serial_out(up, UART_IER, 0);
-	}
+	if (up->port.irq)
+		ier = serial8250_clear_IER(up);
 
 	iir = serial_in(up, UART_IIR);
 
@@ -290,7 +288,7 @@ static void serial8250_backup_timeout(struct timer_list *t)
 		serial8250_tx_chars(up);
 
 	if (up->port.irq)
-		serial_out(up, UART_IER, ier);
+		serial8250_set_IER(up, ier);
 
 	spin_unlock_irqrestore(&up->port.lock, flags);
 
@@ -568,6 +566,14 @@ serial8250_register_ports(struct uart_driver *drv, struct device *dev)
 
 #ifdef CONFIG_SERIAL_8250_CONSOLE
 
+static void univ8250_console_write_atomic(struct console *co, const char *s,
+					  unsigned int count)
+{
+	struct uart_8250_port *up = &serial8250_ports[co->index];
+
+	serial8250_console_write_atomic(up, s, count);
+}
+
 static void univ8250_console_write(struct console *co, const char *s,
 				   unsigned int count)
 {
@@ -661,6 +667,7 @@ static int univ8250_console_match(struct console *co, char *name, int idx,
 
 static struct console univ8250_console = {
 	.name		= "ttyS",
+	.write_atomic	= univ8250_console_write_atomic,
 	.write		= univ8250_console_write,
 	.device		= uart_console_device,
 	.setup		= univ8250_console_setup,
diff --git a/drivers/tty/serial/8250/8250_fsl.c b/drivers/tty/serial/8250/8250_fsl.c
index 4e75d2e4f87c..00e0f8f6607b 100644
--- a/drivers/tty/serial/8250/8250_fsl.c
+++ b/drivers/tty/serial/8250/8250_fsl.c
@@ -59,9 +59,18 @@ int fsl8250_handle_irq(struct uart_port *port)
 
 	/* Stop processing interrupts on input overrun */
 	if ((orig_lsr & UART_LSR_OE) && (up->overrun_backoff_time_ms > 0)) {
+		unsigned long flags;
 		unsigned long delay;
+		bool is_console;
 
+		is_console = uart_console(port);
+
+		if (is_console)
+			console_atomic_cpu_lock(flags);
 		up->ier = port->serial_in(port, UART_IER);
+		if (is_console)
+			console_atomic_cpu_unlock(flags);
+
 		if (up->ier & (UART_IER_RLSI | UART_IER_RDI)) {
 			port->ops->stop_rx(port);
 		} else {
diff --git a/drivers/tty/serial/8250/8250_ingenic.c b/drivers/tty/serial/8250/8250_ingenic.c
index 988bf6bcce42..ff0e1d84ec7e 100644
--- a/drivers/tty/serial/8250/8250_ingenic.c
+++ b/drivers/tty/serial/8250/8250_ingenic.c
@@ -146,6 +146,8 @@ OF_EARLYCON_DECLARE(x1000_uart, "ingenic,x1000-uart",
 
 static void ingenic_uart_serial_out(struct uart_port *p, int offset, int value)
 {
+	unsigned long flags;
+	bool is_console;
 	int ier;
 
 	switch (offset) {
@@ -167,7 +169,12 @@ static void ingenic_uart_serial_out(struct uart_port *p, int offset, int value)
 		 * If we have enabled modem status IRQs we should enable
 		 * modem mode.
 		 */
+		is_console = uart_console(p);
+		if (is_console)
+			console_atomic_cpu_lock(flags);
 		ier = p->serial_in(p, UART_IER);
+		if (is_console)
+			console_atomic_cpu_unlock(flags);
 
 		if (ier & UART_IER_MSI)
 			value |= UART_MCR_MDCE | UART_MCR_FCM;
diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250/8250_mtk.c
index f7d3023f860f..f26140ebd67a 100644
--- a/drivers/tty/serial/8250/8250_mtk.c
+++ b/drivers/tty/serial/8250/8250_mtk.c
@@ -213,12 +213,37 @@ static void mtk8250_shutdown(struct uart_port *port)
 
 static void mtk8250_disable_intrs(struct uart_8250_port *up, int mask)
 {
-	serial_out(up, UART_IER, serial_in(up, UART_IER) & (~mask));
+	struct uart_port *port = &up->port;
+	unsigned long flags;
+	unsigned int ier;
+	bool is_console;
+
+	is_console = uart_console(port);
+
+	if (is_console)
+		console_atomic_cpu_lock(flags);
+
+	ier = serial_in(up, UART_IER);
+	serial_out(up, UART_IER, ier & (~mask));
+
+	if (is_console)
+		console_atomic_cpu_unlock(flags);
 }
 
 static void mtk8250_enable_intrs(struct uart_8250_port *up, int mask)
 {
-	serial_out(up, UART_IER, serial_in(up, UART_IER) | mask);
+	struct uart_port *port = &up->port;
+	unsigned long flags;
+	unsigned int ier;
+
+	if (uart_console(port))
+		console_atomic_cpu_lock(flags);
+
+	ier = serial_in(up, UART_IER);
+	serial_out(up, UART_IER, ier | mask);
+
+	if (uart_console(port))
+		console_atomic_cpu_unlock(flags);
 }
 
 static void mtk8250_set_flow_ctrl(struct uart_8250_port *up, int mode)
diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index 2164290cbd31..2c2a5abc1baf 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -757,7 +757,7 @@ static void serial8250_set_sleep(struct uart_8250_port *p, int sleep)
 			serial_out(p, UART_EFR, UART_EFR_ECB);
 			serial_out(p, UART_LCR, 0);
 		}
-		serial_out(p, UART_IER, sleep ? UART_IERX_SLEEP : 0);
+		serial8250_set_IER(p, sleep ? UART_IERX_SLEEP : 0);
 		if (p->capabilities & UART_CAP_EFR) {
 			serial_out(p, UART_LCR, UART_LCR_CONF_MODE_B);
 			serial_out(p, UART_EFR, efr);
@@ -1429,7 +1429,7 @@ static void serial8250_stop_rx(struct uart_port *port)
 
 	up->ier &= ~(UART_IER_RLSI | UART_IER_RDI);
 	up->port.read_status_mask &= ~UART_LSR_DR;
-	serial_port_out(port, UART_IER, up->ier);
+	serial8250_set_IER(up, up->ier);
 
 	serial8250_rpm_put(up);
 }
@@ -1459,7 +1459,7 @@ void serial8250_em485_stop_tx(struct uart_8250_port *p)
 		serial8250_clear_and_reinit_fifos(p);
 
 		p->ier |= UART_IER_RLSI | UART_IER_RDI;
-		serial_port_out(&p->port, UART_IER, p->ier);
+		serial8250_set_IER(p, p->ier);
 	}
 }
 EXPORT_SYMBOL_GPL(serial8250_em485_stop_tx);
@@ -1681,7 +1681,7 @@ static void serial8250_disable_ms(struct uart_port *port)
 	mctrl_gpio_disable_ms(up->gpios);
 
 	up->ier &= ~UART_IER_MSI;
-	serial_port_out(port, UART_IER, up->ier);
+	serial8250_set_IER(up, up->ier);
 }
 
 static void serial8250_enable_ms(struct uart_port *port)
@@ -1697,7 +1697,7 @@ static void serial8250_enable_ms(struct uart_port *port)
 	up->ier |= UART_IER_MSI;
 
 	serial8250_rpm_get(up);
-	serial_port_out(port, UART_IER, up->ier);
+	serial8250_set_IER(up, up->ier);
 	serial8250_rpm_put(up);
 }
 
@@ -2124,14 +2124,7 @@ static void serial8250_put_poll_char(struct uart_port *port,
 	struct uart_8250_port *up = up_to_u8250p(port);
 
 	serial8250_rpm_get(up);
-	/*
-	 *	First save the IER then disable the interrupts
-	 */
-	ier = serial_port_in(port, UART_IER);
-	if (up->capabilities & UART_CAP_UUE)
-		serial_port_out(port, UART_IER, UART_IER_UUE);
-	else
-		serial_port_out(port, UART_IER, 0);
+	ier = serial8250_clear_IER(up);
 
 	wait_for_xmitr(up, BOTH_EMPTY);
 	/*
@@ -2144,7 +2137,7 @@ static void serial8250_put_poll_char(struct uart_port *port,
 	 *	and restore the IER
 	 */
 	wait_for_xmitr(up, BOTH_EMPTY);
-	serial_port_out(port, UART_IER, ier);
+	serial8250_set_IER(up, ier);
 	serial8250_rpm_put(up);
 }
 
@@ -2447,7 +2440,7 @@ void serial8250_do_shutdown(struct uart_port *port)
 	 */
 	spin_lock_irqsave(&port->lock, flags);
 	up->ier = 0;
-	serial_port_out(port, UART_IER, 0);
+	serial8250_set_IER(up, 0);
 	spin_unlock_irqrestore(&port->lock, flags);
 
 	synchronize_irq(port->irq);
@@ -2816,7 +2809,7 @@ serial8250_do_set_termios(struct uart_port *port, struct ktermios *termios,
 	if (up->capabilities & UART_CAP_RTOIE)
 		up->ier |= UART_IER_RTOIE;
 
-	serial_port_out(port, UART_IER, up->ier);
+	serial8250_set_IER(up, up->ier);
 
 	if (up->capabilities & UART_CAP_EFR) {
 		unsigned char efr = 0;
@@ -3282,7 +3275,7 @@ EXPORT_SYMBOL_GPL(serial8250_set_defaults);
 
 #ifdef CONFIG_SERIAL_8250_CONSOLE
 
-static void serial8250_console_putchar(struct uart_port *port, int ch)
+static void serial8250_console_putchar_locked(struct uart_port *port, int ch)
 {
 	struct uart_8250_port *up = up_to_u8250p(port);
 
@@ -3290,6 +3283,18 @@ static void serial8250_console_putchar(struct uart_port *port, int ch)
 	serial_port_out(port, UART_TX, ch);
 }
 
+static void serial8250_console_putchar(struct uart_port *port, int ch)
+{
+	struct uart_8250_port *up = up_to_u8250p(port);
+	unsigned long flags;
+
+	wait_for_xmitr(up, UART_LSR_THRE);
+
+	console_atomic_cpu_lock(flags);
+	serial8250_console_putchar_locked(port, ch);
+	console_atomic_cpu_unlock(flags);
+}
+
 /*
  *	Restore serial console when h/w power-off detected
  */
@@ -3311,6 +3316,32 @@ static void serial8250_console_restore(struct uart_8250_port *up)
 	serial8250_out_MCR(up, UART_MCR_DTR | UART_MCR_RTS);
 }
 
+void serial8250_console_write_atomic(struct uart_8250_port *up,
+				     const char *s, unsigned int count)
+{
+	struct uart_port *port = &up->port;
+	unsigned long flags;
+	unsigned int ier;
+
+	console_atomic_cpu_lock(flags);
+
+	touch_nmi_watchdog();
+
+	ier = serial8250_clear_IER(up);
+
+	if (atomic_fetch_inc(&up->console_printing)) {
+		uart_console_write(port, "\n", 1,
+				   serial8250_console_putchar_locked);
+	}
+	uart_console_write(port, s, count, serial8250_console_putchar_locked);
+	atomic_dec(&up->console_printing);
+
+	wait_for_xmitr(up, BOTH_EMPTY);
+	serial8250_set_IER(up, ier);
+
+	console_atomic_cpu_unlock(flags);
+}
+
 /*
  *	Print a string to the serial port trying not to disturb
  *	any possible real use of the port...
@@ -3327,24 +3358,12 @@ void serial8250_console_write(struct uart_8250_port *up, const char *s,
 	struct uart_port *port = &up->port;
 	unsigned long flags;
 	unsigned int ier;
-	int locked = 1;
 
 	touch_nmi_watchdog();
 
-	if (oops_in_progress)
-		locked = spin_trylock_irqsave(&port->lock, flags);
-	else
-		spin_lock_irqsave(&port->lock, flags);
-
-	/*
-	 *	First save the IER then disable the interrupts
-	 */
-	ier = serial_port_in(port, UART_IER);
+	spin_lock_irqsave(&port->lock, flags);
 
-	if (up->capabilities & UART_CAP_UUE)
-		serial_port_out(port, UART_IER, UART_IER_UUE);
-	else
-		serial_port_out(port, UART_IER, 0);
+	ier = serial8250_clear_IER(up);
 
 	/* check scratch reg to see if port powered off during system sleep */
 	if (up->canary && (up->canary != serial_port_in(port, UART_SCR))) {
@@ -3358,7 +3377,9 @@ void serial8250_console_write(struct uart_8250_port *up, const char *s,
 		mdelay(port->rs485.delay_rts_before_send);
 	}
 
+	atomic_inc(&up->console_printing);
 	uart_console_write(port, s, count, serial8250_console_putchar);
+	atomic_dec(&up->console_printing);
 
 	/*
 	 *	Finally, wait for transmitter to become empty
@@ -3371,8 +3392,7 @@ void serial8250_console_write(struct uart_8250_port *up, const char *s,
 		if (em485->tx_stopped)
 			up->rs485_stop_tx(up);
 	}
-
-	serial_port_out(port, UART_IER, ier);
+	serial8250_set_IER(up, ier);
 
 	/*
 	 *	The receive handling will happen properly because the
@@ -3384,8 +3404,7 @@ void serial8250_console_write(struct uart_8250_port *up, const char *s,
 	if (up->msr_saved_flags)
 		serial8250_modem_status(up);
 
-	if (locked)
-		spin_unlock_irqrestore(&port->lock, flags);
+	spin_unlock_irqrestore(&port->lock, flags);
 }
 
 static unsigned int probe_baud(struct uart_port *port)
@@ -3405,6 +3424,7 @@ static unsigned int probe_baud(struct uart_port *port)
 
 int serial8250_console_setup(struct uart_port *port, char *options, bool probe)
 {
+	struct uart_8250_port *up = up_to_u8250p(port);
 	int baud = 9600;
 	int bits = 8;
 	int parity = 'n';
@@ -3414,6 +3434,8 @@ int serial8250_console_setup(struct uart_port *port, char *options, bool probe)
 	if (!port->iobase && !port->membase)
 		return -ENODEV;
 
+	atomic_set(&up->console_printing, 0);
+
 	if (options)
 		uart_parse_options(options, &baud, &parity, &bits, &flow);
 	else if (probe)
diff --git a/drivers/tty/serial/8250/Kconfig b/drivers/tty/serial/8250/Kconfig
index d1b3c2373fa4..1671d2882ba7 100644
--- a/drivers/tty/serial/8250/Kconfig
+++ b/drivers/tty/serial/8250/Kconfig
@@ -9,6 +9,7 @@ config SERIAL_8250
 	depends on !S390
 	select SERIAL_CORE
 	select SERIAL_MCTRL_GPIO if GPIOLIB
+	select HAVE_ATOMIC_CONSOLE
 	help
 	  This selects whether you want to include the driver for the standard
 	  serial ports.  The standard answer is Y.  People who might say N
diff --git a/include/linux/serial_8250.h b/include/linux/serial_8250.h
index 5db211f43b29..aa011f668705 100644
--- a/include/linux/serial_8250.h
+++ b/include/linux/serial_8250.h
@@ -7,6 +7,7 @@
 #ifndef _LINUX_SERIAL_8250_H
 #define _LINUX_SERIAL_8250_H
 
+#include <linux/atomic.h>
 #include <linux/serial_core.h>
 #include <linux/serial_reg.h>
 #include <linux/platform_device.h>
@@ -125,6 +126,8 @@ struct uart_8250_port {
 #define MSR_SAVE_FLAGS UART_MSR_ANY_DELTA
 	unsigned char		msr_saved_flags;
 
+	atomic_t		console_printing;
+
 	struct uart_8250_dma	*dma;
 	const struct uart_8250_ops *ops;
 
@@ -180,6 +183,8 @@ void serial8250_init_port(struct uart_8250_port *up);
 void serial8250_set_defaults(struct uart_8250_port *up);
 void serial8250_console_write(struct uart_8250_port *up, const char *s,
 			      unsigned int count);
+void serial8250_console_write_atomic(struct uart_8250_port *up, const char *s,
+				     unsigned int count);
 int serial8250_console_setup(struct uart_port *port, char *options, bool probe);
 int serial8250_console_exit(struct uart_port *port);
 
-- 
2.20.1

