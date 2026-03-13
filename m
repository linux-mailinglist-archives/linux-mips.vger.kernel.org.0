Return-Path: <linux-mips+bounces-13624-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cEoQMNw5tGl3jAAAu9opvQ
	(envelope-from <linux-mips+bounces-13624-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 13 Mar 2026 17:22:52 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3466E286EA2
	for <lists+linux-mips@lfdr.de>; Fri, 13 Mar 2026 17:22:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 45E5F30022A9
	for <lists+linux-mips@lfdr.de>; Fri, 13 Mar 2026 16:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C26DA3C4575;
	Fri, 13 Mar 2026 16:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aJJdKmOb"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A8B37F019;
	Fri, 13 Mar 2026 16:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773418802; cv=none; b=Y7Zq4oKHVjqXq+Tmrejp+pcSNAGFVh7unTkb4nOue63wZms7QaggUQN0hu2QVm91bkPv+41+Ii9/A1IgTTEZM/oSflFSwltyWhF+Hx4Srq6dc7UYFmcQTTlhYYs+g6w9CYk0dTBlv30HSjoZ3LDzS+Q0IR6/AyF9x5sd36a5kuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773418802; c=relaxed/simple;
	bh=qAx+Oi9Zys6AfZVuERSj3778VmVSGb+4dt2WbzWNnQM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=lg3vcaDlws8QzmRoLTtogJteDh9ygqwruJUb2NzaOmiL96+GndOmkiypTPfS63McL7HfiEcHcWR34x27Xg6+NcsXfGWytTREsKnIzZW4WLBt0eagAoKCfGbS2ypu8fbtUf3ZPNEYcv77uFzkSRkUH+2fxhCJhORC+lu0B49qDPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aJJdKmOb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A11DC19421;
	Fri, 13 Mar 2026 16:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773418801;
	bh=qAx+Oi9Zys6AfZVuERSj3778VmVSGb+4dt2WbzWNnQM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=aJJdKmObhu0oGQFhPmZibqPGYMFcDKPzl/9mB3J36PzGzxkoMjSRfSXBX5MI0LL8Y
	 pt0ITmWwZ0jIFLyCA7aoy9lBG3RymPxRzsJzBJqj9vWiPGBDsMvxyCk1l4os2eRDQw
	 td/eczCuJoDYZVCoWeUpHqTcASeAbGh03dx5BnecNOqSl5p8et+K9XAW9thTzVqO3b
	 s/I705px3CQoKAPV7BVcBJhNeqLLFdX+8LQVO4gyx7Ajt5S0G3iXsKebM7Hq9TDP32
	 7yBAcD9E5By8FtKu6VFIJzSwH6k/XctO3Gii1WV2rs0k324wL/AIFYIKMEq1Ns9reR
	 WsWhPuulyJLwQ==
Date: Fri, 13 Mar 2026 11:20:00 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-pci@vger.kernel.org, linux-mips@vger.kernel.org,
	naseefkm@gmail.com, ryder.lee@mediatek.com, bhelgaas@google.com,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	ansuelsmth@gmail.com, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] PCI: Skip bridge window reads when window is not
 supported
Message-ID: <20260313162000.GA1385506@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312165332.569772-4-cjd@cjdns.fr>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13624-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,mediatek.com,google.com,kernel.org,collabora.com,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3466E286EA2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 04:53:32PM +0000, Caleb James DeLisle wrote:
> pci_read_bridge_io() and pci_read_bridge_mmio_pref() read bridge window
> registers unconditionally. If the registers are hardwired to zero
> (not implemented), both base and limit will be 0. Since (0 <= 0) is
> true, a bogus window [mem 0x00000000-0x000fffff] or [io 0x0000-0x0fff]
> gets created.
> 
> pci_read_bridge_windows() already detects unsupported windows by
> testing register writability and sets io_window/pref_window flags
> accordingly. Check these flags at the start of pci_read_bridge_io()
> and pci_read_bridge_mmio_pref() to skip reading registers when the
> window is not supported.
> 
> Suggested-by: Bjorn Helgaas <helgaas@kernel.org>
> Link: https://lore.kernel.org/all/20260113210259.GA715789@bhelgaas/
> Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>

I'd like to apply this, but I don't understand what's going on here.

I instrumented a kernel to return zero for all reads of Root Port
prefetchable window registers, and it worked correctly: It didn't
create a bogus [mem 0x00000000-0x000fffff] window (see below for a
possible explanation), didn't claim to have assigned a prefetchable
window, and the 64-bit prefetchable BAR of the downstream device was
correctly placed in the non-prefetchable window.

I'm booting this in qemu, and the current behavior with a functional
prefetchable window is this:

  pci 0000:00:1c.3: PCI bridge to [bus 04]
  pci 0000:00:1c.3:   bridge window [io  0x4000-0x4fff]
  pci 0000:00:1c.3:   bridge window [mem 0xfe200000-0xfe3fffff]
  pci 0000:00:1c.3:   bridge window [mem 0xfd000000-0xfd1fffff 64bit pref]
  pci 0000:04:00.0: [1033:0194] type 00 class 0x0c0330 PCIe Endpoint
  pci 0000:04:00.0: BAR 0 [mem 0xfe200000-0xfe203fff 64bit]

With the instrumented kernel where the prefetchable window registers
are effectively hardwired to zero, I see this:

  pci 0000:00:1c.3: PCI bridge to [bus 04]
  pci 0000:00:1c.3:   bridge window [io  0x4000-0x4fff]
  pci 0000:00:1c.3:   bridge window [mem 0xfe200000-0xfe3fffff]
  pci 0000:04:00.0: [1033:0194] type 00 class 0x0c0330 PCIe Endpoint
  pci 0000:04:00.0: BAR 0 [mem 0xfe200000-0xfe203fff 64bit]

So the 04:00.0 BAR 0 was put in the non-prefetchable window as we
would expect when there's no prefetchable window.

Either there's something else going on with EcoNet EN7528 or I don't
understand the explanation.

Based on the link above, Root Port 1 doesn't implement a prefetchable
window, but Linux thinks it does and puts a mt7615e WiFi device BAR in
the non-existent window, so it doesn't work.  I assume RP 1 is
0001:00:01.0, and the mt7615e WiFi is 0001:01:00.0, and the mt7615e
doesn't work:

  pci 0001:00:01.0: [14c3:0811] type 01 class 0x060400 PCIe Root Port
  pci 0001:00:01.0: PCI bridge to [bus 00]
  pci 0001:00:01.0:   bridge window [mem 0x00000000-0x000fffff]
  pci 0001:00:01.0: bridge configuration invalid ([bus 00-00]), reconfiguring
  pci 0001:00:01.0: PCI bridge to [bus 01-ff]
  pci 0001:00:01.0: bridge window [mem 0x28000000-0x280fffff]: assigned
  pci 0001:00:01.0: bridge window [mem 0x28100000-0x282fffff pref]: assigned
  pci 0001:01:00.0: BAR 0 [mem 0x28100000-0x281fffff 64bit pref]: assigned
  WARNING: CPU: 3 PID: 1777 at target-mipsel_24kc_musl/linux-econet_en7528/mt76-2025.11.06~eb567bc7/mt7615/eeprom.c:31 mt7615_eeprom_init+0x484/0x548 [mt7615_common]
  mt7615e 0001:01:00.0: Firmware is not ready for download

The [mem 0x00000000-0x000fffff] window mentioned above is not a
hardware problem.  This is the non-prefetchable window, which is
required for all bridges, and if it hasn't been initialized and
contains the power-up values, this is the window.  So all this is
telling us is that there was no firmware that programmed the window
before Linux.

FWIW, I'll attach my instrumentation patches below.  Maybe you can
similarly instrument your kernel to see the actual config accesses to
the RP in question.

Also, minor nit: Caleb appears to be the author, but the first
sign-off is from Ahmed, so the Author vs Signed-off-by order is wrong;
see
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=v6.19#n449

Bjorn


commit 012e94d89d10 ("PCI: Log config accesses")
Author: Bjorn Helgaas <bhelgaas@google.com>
Date:   Sat Jan 24 12:46:02 2026 -0600

    PCI: Log config accesses


diff --git a/drivers/pci/access.c b/drivers/pci/access.c
index b123da16b63b..8b03af748238 100644
--- a/drivers/pci/access.c
+++ b/drivers/pci/access.c
@@ -32,6 +32,49 @@ DEFINE_RAW_SPINLOCK(pci_lock);
 # define pci_unlock_config(f)	raw_spin_unlock_irqrestore(&pci_lock, f)
 #endif
 
+/* domain, bus, dev, fn */
+static u64 pci_log_cfg_dev = (0LL << 32) | PCI_DEVID(0, PCI_DEVFN(0x1c, 3));
+
+#define PCI_CFG_FMT	"pci %04x:%02x:%02x.%d: %s %#06x "
+#define PCI_CFG_FMT_1	PCI_CFG_FMT "%#04x\n"
+#define PCI_CFG_FMT_2	PCI_CFG_FMT "%#06x\n"
+#define PCI_CFG_FMT_4	PCI_CFG_FMT "%#010x\n"
+
+static void pci_log_cfg(struct pci_bus *bus, unsigned int devfn, char *op,
+		        int pos, int len, u32 val, int res)
+{
+	u64 dev_match = ((u64) pci_domain_nr(bus) << 32) | devfn;
+	u32 domain = pci_log_cfg_dev >> 32;
+
+	if (pci_log_cfg_dev != dev_match)
+		return;
+
+	if (res) {
+		pr_info(PCI_CFG_FMT "failed (%d)\n",
+			domain, bus->number, PCI_SLOT(devfn), PCI_FUNC(devfn),
+			op, pos, res);
+		return;
+	}
+
+	switch (len) {
+	case 1:
+		pr_info(PCI_CFG_FMT_1,
+			domain, bus->number, PCI_SLOT(devfn), PCI_FUNC(devfn),
+			op, pos, val);
+		break;
+	case 2:
+		pr_info(PCI_CFG_FMT_2,
+			domain, bus->number, PCI_SLOT(devfn), PCI_FUNC(devfn),
+			op, pos, val);
+		break;
+	default:
+		pr_info(PCI_CFG_FMT_4,
+			domain, bus->number, PCI_SLOT(devfn), PCI_FUNC(devfn),
+			op, pos, val);
+		break;
+	}
+}
+
 #define PCI_OP_READ(size, type, len) \
 int noinline pci_bus_read_config_##size \
 	(struct pci_bus *bus, unsigned int devfn, int pos, type *value)	\
@@ -50,6 +93,7 @@ int noinline pci_bus_read_config_##size \
 	else								\
 		*value = (type)data;					\
 	pci_unlock_config(flags);					\
+	pci_log_cfg(bus, devfn, "rd", pos, len, (u32) *value, res);	\
 									\
 	return res;							\
 }
@@ -67,6 +111,7 @@ int noinline pci_bus_write_config_##size \
 	pci_lock_config(flags);						\
 	res = bus->ops->write(bus, devfn, pos, len, value);		\
 	pci_unlock_config(flags);					\
+	pci_log_cfg(bus, devfn, "wr", pos, len, value, res);		\
 									\
 	return res;							\
 }
commit 744b78273da8 ("PCI: Override pref window reads to return 0")
Author: Bjorn Helgaas <bhelgaas@google.com>
Date:   Fri Mar 13 10:39:27 2026 -0500

    PCI: Override pref window reads to return 0


diff --git a/drivers/pci/access.c b/drivers/pci/access.c
index 8b03af748238..675926bddc54 100644
--- a/drivers/pci/access.c
+++ b/drivers/pci/access.c
@@ -40,6 +40,43 @@ static u64 pci_log_cfg_dev = (0LL << 32) | PCI_DEVID(0, PCI_DEVFN(0x1c, 3));
 #define PCI_CFG_FMT_2	PCI_CFG_FMT "%#06x\n"
 #define PCI_CFG_FMT_4	PCI_CFG_FMT "%#010x\n"
 
+static int pci_override_cfg_rd(struct pci_bus *bus, unsigned int devfn,
+			       int pos, int len, u32 *value)
+{
+	u64 dev_match = ((u64) pci_domain_nr(bus) << 32) | devfn;
+
+	if (pci_log_cfg_dev != dev_match)
+		return -ENODEV;
+
+	if (!(pos == 0x24 || pos == 0x26 || pos == 0x28 || pos == 0x2c))
+		return -ENODEV;
+
+	*value = 0;
+
+#if 0
+	u32 domain = pci_log_cfg_dev >> 32;
+	switch (len) {
+	case 1:
+		pr_info("override " PCI_CFG_FMT_1,
+			domain, bus->number, PCI_SLOT(devfn), PCI_FUNC(devfn),
+			"rd", pos, *value);
+		break;
+	case 2:
+		pr_info("override " PCI_CFG_FMT_2,
+			domain, bus->number, PCI_SLOT(devfn), PCI_FUNC(devfn),
+			"rd", pos, *value);
+		break;
+	default:
+		pr_info("override " PCI_CFG_FMT_4,
+			domain, bus->number, PCI_SLOT(devfn), PCI_FUNC(devfn),
+			"rd", pos, *value);
+		break;
+	}
+#endif
+
+	return 0;
+}
+
 static void pci_log_cfg(struct pci_bus *bus, unsigned int devfn, char *op,
 		        int pos, int len, u32 val, int res)
 {
@@ -87,7 +124,9 @@ int noinline pci_bus_read_config_##size \
 		return PCIBIOS_BAD_REGISTER_NUMBER;			\
 									\
 	pci_lock_config(flags);						\
-	res = bus->ops->read(bus, devfn, pos, len, &data);		\
+	res = pci_override_cfg_rd(bus, devfn, pos, len, &data);		\
+	if (res)							\
+		res = bus->ops->read(bus, devfn, pos, len, &data);	\
 	if (res)							\
 		PCI_SET_ERROR_RESPONSE(value);				\
 	else								\

