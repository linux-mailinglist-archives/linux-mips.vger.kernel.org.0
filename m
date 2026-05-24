Return-Path: <linux-mips+bounces-14723-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLooJEJ9E2r8BwcAu9opvQ
	(envelope-from <linux-mips+bounces-14723-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 25 May 2026 00:35:46 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E71155C49BD
	for <lists+linux-mips@lfdr.de>; Mon, 25 May 2026 00:35:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1C1293008D1E
	for <lists+linux-mips@lfdr.de>; Sun, 24 May 2026 22:35:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F062A37C0F8;
	Sun, 24 May 2026 22:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="Rs5PlUSV"
X-Original-To: linux-mips@vger.kernel.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315BE36CDE0
	for <linux-mips@vger.kernel.org>; Sun, 24 May 2026 22:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779662123; cv=none; b=erSojlvgiBGWcN2pgQx59mKOBfBEobMkRBk4KQ1Ah355DeUDRh6ghfLatKpj1vrqs6N1iUulYVWcu0vUYAYiOX6CAEtyjxKfIJ9Bmjxggb9HTkwcXhXkHCDCGXkD/Rbprds9da/64yIxWjlfHjnkIi2yYBhLFMI2xJE4/yn3XNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779662123; c=relaxed/simple;
	bh=Kgp+nPOc2YwBq+o839BFe0tCcZNBz78NrVGBu2uaB9o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uVqHSEMs3gP7lfDgo7p9fBbLEZd8XznwhCt+lyZUyluJiIA0nZ/X3l74jD1HnDHnvSTstu+Ri5rEaQWD4OvnwtFvvdqeVSTqEyS+HTEK5CVjNxNb9dvuJhzHcQ9TyFtfKKMRuG2iyvhVAmxbQqXM132TYyO/C1r2yd7ySPZP1T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=Rs5PlUSV; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 61DEA240107
	for <linux-mips@vger.kernel.org>; Mon, 25 May 2026 00:35:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1779662114; bh=j3V5mw/r4cvhEOyHjLtU/U6FkOUzn5/59uAk6LoHNCQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:To:Cc:Autocrypt:OpenPGP:From;
	b=Rs5PlUSVtsbF6tLVeGfD7fndf6XvPVBUEn9q9guJJ6KeVs8SDf4SEoP3LgpukPqOr
	 RdJ6qjPiw7gAQo0KZU8TUm4EhqeLUARmgKIX/eJjuem0wiRUsrrSDwzPOrneucvZLZ
	 Rvwp/sdCdfqQw7iOMvNhVTCwJR0sh7l4A55tu7lApvdyy3IDx8eebBoTJdkHzCv/vO
	 xuLjGPAln0sVOR9Sz8+IE22cv9TY1bznvs1E7bpbEENHiBPagj+3bBcXWzpfP0PfL9
	 FCns6qbC5XR1u4jhBFD62XnYD35XxQPMG2VYfV4GeC5LTYs8DXjVzO7BfwLGSIakA8
	 LVKemcdVgaKmw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4gNv3N2L2jz6twB;
	Mon, 25 May 2026 00:35:12 +0200 (CEST)
From: Markus Probst <markus.probst@posteo.de>
Date: Sun, 24 May 2026 22:35:13 +0000
Subject: [PATCH v2 1/2] serial: earlycon: add uart_clk_freq parameter
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-acpi_spcr-v2-1-c042089d73ca@posteo.de>
References: <20260525-acpi_spcr-v2-0-c042089d73ca@posteo.de>
In-Reply-To: <20260525-acpi_spcr-v2-0-c042089d73ca@posteo.de>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Ard Biesheuvel <ardb@kernel.org>, 
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
 linux-efi@vger.kernel.org, linux-serial@vger.kernel.org, 
 Markus Probst <markus.probst@posteo.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=5692;
 i=markus.probst@posteo.de; h=from:subject:message-id;
 bh=Kgp+nPOc2YwBq+o839BFe0tCcZNBz78NrVGBu2uaB9o=;
 b=owEBiQJ2/ZANAwAIATR2H/jnrUPSAcsmYgBqE30dPWishtR7zipcVuAUP/5LkSsecEC1sb1oV
 k2YmTU0y2+JAk8EAAEIADkWIQSCdBjE9KxY53IwxHM0dh/4561D0gUCahN9HRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQNHYf+OetQ9K/Ag//c4mlww5OIxF+Lddec487aYdzVPzrkqM
 jqiWXqwt3oFBbPDtUOWxB6Gr12l2ptQn605Fznrk7vW1rNLdstQXawu6oRHCKWt+th7BdOzkAEz
 eVsJ08wSWZ71p88EpinykmaLwBd5UByanNdJO0/IU5SSWyUEmgfyXWuCoDPhynTvlP3aqjr9r5F
 SwrRrxBnk5nVQ4GmH5xQ6SukqbI4yVTnsE6CkpD16Ir5voBRVzDufDr0An3MMxwsSQ7Zc1ne2zC
 biLGQl6JZwcn1w0Cqsc5d2/27l8cQhW5x+msGol0CpwdsCcznjC8QUybb5S4lpy82sM2zyS35TR
 +za859PWcLviJaUn+qNJhDBJXgSwcn+BNLQucOv9PJglpcuz26yXfaRphempH1c04KbpKbN1fwu
 jXgkHhEhFG91GHvh2hdXzZvh7Que0swtniG1hTB0w6RYTTViAbizf7GtcBdoM8DFdvr/4crfZaf
 JrU86JMdmCl5AtJW+4tNdphVajEZq6cGZ4cAiBAZzrvi0hDZMGqYfXkfaCjK6CeWDUf8fE7cfFC
 BFUKnM8j9pa6lT2uNkBpZ8KfuVf6otWr+CJbuZa+BBnG2cG8Suk7zsikD8Kewtq4B5zvTaXK9AU
 1zb2TVp8CsUo8VC4oOqZDt4SzvQG827kY+jeJUNVlE8b6AaN3EfI=
X-Developer-Key: i=markus.probst@posteo.de; a=openpgp;
 fpr=827418C4F4AC58E77230C47334761FF8E7AD43D2
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
  keydata=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
  aBeNN4ijKZchBXHPgVx+YtWRHfcm4l8=
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[posteo.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[posteo.de:s=2017];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[posteo.de:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-14723-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[markus.probst@posteo.de,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,posteo.de:email,posteo.de:mid,posteo.de:dkim]
X-Rspamd-Queue-Id: E71155C49BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add `uart_clk_freq` parameter to `setup_earlycon`. This allows the
options string to be reused with `add_preferred_console`, while still
allowing to set the uart clock frequency. This will be used in the
following commit ("ACPI: SPCR: Support UART clock frequency field").

No logical change intended.

Signed-off-by: Markus Probst <markus.probst@posteo.de>
---
 arch/m68k/virt/config.c          |  2 +-
 arch/mips/mti-malta/malta-init.c |  2 +-
 drivers/acpi/spcr.c              |  2 +-
 drivers/firmware/efi/earlycon.c  |  2 +-
 drivers/tty/serial/earlycon.c    | 17 ++++++++++++-----
 include/linux/serial_core.h      |  7 +++++--
 6 files changed, 21 insertions(+), 11 deletions(-)

diff --git a/arch/m68k/virt/config.c b/arch/m68k/virt/config.c
index b338e2a8da6a..2c35ec15a51b 100644
--- a/arch/m68k/virt/config.c
+++ b/arch/m68k/virt/config.c
@@ -83,7 +83,7 @@ void __init config_virt(void)
 
 	snprintf(earlycon, sizeof(earlycon), "early_gf_tty,0x%08x",
 		 virt_bi_data.tty.mmio);
-	setup_earlycon(earlycon);
+	setup_earlycon(earlycon, 0);
 
 	mach_init_IRQ = virt_init_IRQ;
 	mach_sched_init = virt_sched_init;
diff --git a/arch/mips/mti-malta/malta-init.c b/arch/mips/mti-malta/malta-init.c
index 82b0fd8576a2..88ef17967ced 100644
--- a/arch/mips/mti-malta/malta-init.c
+++ b/arch/mips/mti-malta/malta-init.c
@@ -75,7 +75,7 @@ static void __init console_config(void)
 	if ((strstr(fw_getcmdline(), "earlycon=")) == NULL) {
 		sprintf(console_string, "uart8250,io,0x3f8,%d%c%c", baud,
 			parity, bits);
-		setup_earlycon(console_string);
+		setup_earlycon(console_string, 0);
 	}
 
 	if ((strstr(fw_getcmdline(), "console=")) == NULL) {
diff --git a/drivers/acpi/spcr.c b/drivers/acpi/spcr.c
index 73cb933fdc89..cfacbe53f279 100644
--- a/drivers/acpi/spcr.c
+++ b/drivers/acpi/spcr.c
@@ -228,7 +228,7 @@ int __init acpi_parse_spcr(bool enable_earlycon, bool enable_console)
 	pr_info("console: %s\n", opts);
 
 	if (enable_earlycon)
-		setup_earlycon(opts);
+		setup_earlycon(opts, 0);
 
 	if (enable_console)
 		err = add_preferred_console(uart, 0, opts + strlen(uart) + 1);
diff --git a/drivers/firmware/efi/earlycon.c b/drivers/firmware/efi/earlycon.c
index 3d060d59968c..0e3c2cb08966 100644
--- a/drivers/firmware/efi/earlycon.c
+++ b/drivers/firmware/efi/earlycon.c
@@ -221,7 +221,7 @@ static bool __initdata fb_probed;
 void __init efi_earlycon_reprobe(void)
 {
 	if (fb_probed)
-		setup_earlycon("efifb");
+		setup_earlycon("efifb", 0);
 }
 
 static int __init efi_earlycon_setup(struct earlycon_device *device,
diff --git a/drivers/tty/serial/earlycon.c b/drivers/tty/serial/earlycon.c
index ab9af37f6cda..a419943e083b 100644
--- a/drivers/tty/serial/earlycon.c
+++ b/drivers/tty/serial/earlycon.c
@@ -135,11 +135,14 @@ static int __init parse_options(struct earlycon_device *device, char *options)
 	return 0;
 }
 
-static int __init register_earlycon(char *buf, const struct earlycon_id *match)
+static int __init register_earlycon(char *buf, unsigned int uart_clk_freq,
+				    const struct earlycon_id *match)
 {
 	int err;
 	struct uart_port *port = &early_console_dev.port;
 
+	port->uartclk = uart_clk_freq;
+
 	/* On parsing error, pass the options buf to the setup function */
 	if (buf && !parse_options(&early_console_dev, buf))
 		buf = NULL;
@@ -164,7 +167,8 @@ static int __init register_earlycon(char *buf, const struct earlycon_id *match)
 
 /**
  *	setup_earlycon - match and register earlycon console
- *	@buf:	earlycon param string
+ *	@buf:		earlycon param string
+ *	@uart_clk_freq:	uart clock frequency in Hz or 0 for BASE_BAUD*16
  *
  *	Registers the earlycon console matching the earlycon specified
  *	in the param string @buf. Acceptable param strings are of the form
@@ -177,10 +181,13 @@ static int __init register_earlycon(char *buf, const struct earlycon_id *match)
  *	<options> string in the 'options' parameter; all other forms set
  *	the parameter to NULL.
  *
+ *	If the uart clock frequency is specified in the 'options' parameter,
+ *	the value of the param @uart_clk_freq will be ignored.
+ *
  *	Returns 0 if an attempt to register the earlycon was made,
  *	otherwise negative error code
  */
-int __init setup_earlycon(char *buf)
+int __init setup_earlycon(char *buf, unsigned int uart_clk_freq)
 {
 	const struct earlycon_id *match;
 	bool empty_compatible = true;
@@ -209,7 +216,7 @@ int __init setup_earlycon(char *buf)
 		} else
 			buf = NULL;
 
-		return register_earlycon(buf, match);
+		return register_earlycon(buf, uart_clk_freq, match);
 	}
 
 	if (empty_compatible) {
@@ -241,7 +248,7 @@ static int __init param_setup_earlycon(char *buf)
 		}
 	}
 
-	err = setup_earlycon(buf);
+	err = setup_earlycon(buf, 0);
 	if (err == -ENOENT || err == -EALREADY)
 		return 0;
 	return err;
diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
index 666430b47899..5c60fda9dd3a 100644
--- a/include/linux/serial_core.h
+++ b/include/linux/serial_core.h
@@ -1097,10 +1097,13 @@ int of_setup_earlycon(const struct earlycon_id *match, unsigned long node,
 
 #ifdef CONFIG_SERIAL_EARLYCON
 extern bool earlycon_acpi_spcr_enable __initdata;
-int setup_earlycon(char *buf);
+int setup_earlycon(char *buf, unsigned int uart_clk_freq);
 #else
 static const bool earlycon_acpi_spcr_enable EARLYCON_USED_OR_UNUSED;
-static inline int setup_earlycon(char *buf) { return 0; }
+static inline int setup_earlycon(char *buf, unsigned int uart_clk_freq)
+{
+	return 0;
+}
 #endif
 
 /* Variant of uart_console_registered() when the console_list_lock is held. */

-- 
2.53.0


