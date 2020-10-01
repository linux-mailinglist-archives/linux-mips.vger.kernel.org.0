Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08CA42807C9
	for <lists+linux-mips@lfdr.de>; Thu,  1 Oct 2020 21:32:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732836AbgJATcj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 1 Oct 2020 15:32:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730073AbgJATci (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 1 Oct 2020 15:32:38 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D1FCC0613D0;
        Thu,  1 Oct 2020 12:32:38 -0700 (PDT)
Date:   Thu, 1 Oct 2020 21:32:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1601580756;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=bwxAIHeRfARZP9OOa+BxD41bJEOsQkUrNqZWvW7Ttjc=;
        b=bBoX0O33dUO9i3KEHAqGgO9JbcPhhn2vJt23iKhckLjU6fTIKFnwTjJ4+Hg0iHruksGBQ8
        nrcSabAozILo+64GKRyLB7HwSMg+gLy73st8rOenqWgqbMnUUEgLxCF/+H6lHXauyVQxvk
        wu1ymg+xtizFbv+FM5DTh6yzxoVQsKHAfawafvFZa23gtKlPC12UFCl7cnrp2UWQSWtgvF
        ml9+eF1JVe1XuZsTGeKhW/qaRUxTyzg92dowNIo6sS5dMv0ARatoOnru1gTKVbVkjA6hiy
        /5jbutneN/dasseW4xLUraEknZYYZhDkefH9Ql1FF+kdJu9auJlPuH8vFxAeHw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1601580756;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=bwxAIHeRfARZP9OOa+BxD41bJEOsQkUrNqZWvW7Ttjc=;
        b=0GaWQGURcWfvIqH+0nmH5i2sYJHYO3uAfMad1BwcaRZMHSTO5uOiTCQ/1jC8HZoWLE1h5x
        f1G1AO4zpTSiOfCA==
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To:     Dominik Brodowski <linux@dominikbrodowski.net>,
        linux-kernel@vger.kernel.org
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Yoichi Yuasa <yuasa@linux-mips.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
Subject: [PATCH REPOST] pcmcia: Remove NEC VRC4173 CARDU
Message-ID: <20201001193234.gi6fp4vk3dypwifv@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This driver is the very definition of bitrotting:
- Introduced in commit
  79a140932c776 ("[PATCH] mips: vR41xx updates")
  which is 2.6.11-rc3.

- Provides ->register_callback which was removed in commit
  7f316b033b36a ("[PATCH] pcmcia: remove socket register_callback")
  which is v2.6.14-rc3

- Uses INIT_WORK() with three arguments which was removed in commit
  65f27f38446e1 ("WorkStruct: Pass the work_struct pointer instead of context data")
  which is v2.6.20-rc1

- Provides ->inquire_socket and uses socket_cap_t which was removed in
  commit
  b7949fdacbe00 ("[PCMCIA] Remove inquire_socket")
  which is 2.5.72

- Provides ->get_io_map which was removed in commit
  d7de1b64a23b9 ("[PCMCIA] pcmcia-2: Remove get_io_map and get_mem_map socket methods.")
  which is 2.5.66

Remove VRC4173 CARDU from the tree because it never had the luck to be
successfully compiled. Let it finally find peace in byte heaven.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---

Repost of
  https://lore.kernel.org/lkml/20200916081629.cfi6svr3yjvzimqs@linutronix.de/

 drivers/pcmcia/Kconfig         |   4 -
 drivers/pcmcia/Makefile        |   1 -
 drivers/pcmcia/vrc4173_cardu.c | 591 ---------------------------------
 drivers/pcmcia/vrc4173_cardu.h | 247 --------------
 4 files changed, 843 deletions(-)
 delete mode 100644 drivers/pcmcia/vrc4173_cardu.c
 delete mode 100644 drivers/pcmcia/vrc4173_cardu.h

diff --git a/drivers/pcmcia/Kconfig b/drivers/pcmcia/Kconfig
index 82d10b6661c73..35effded335a9 100644
--- a/drivers/pcmcia/Kconfig
+++ b/drivers/pcmcia/Kconfig
@@ -244,10 +244,6 @@ config PCMCIA_VRC4171
 	tristate "NEC VRC4171 Card Controllers support"
 	depends on CPU_VR41XX && ISA && PCMCIA
 
-config PCMCIA_VRC4173
-	tristate "NEC VRC4173 CARDU support"
-	depends on CPU_VR41XX && PCI && PCMCIA
-
 config OMAP_CF
 	tristate "OMAP CompactFlash Controller"
 	depends on PCMCIA && ARCH_OMAP16XX
diff --git a/drivers/pcmcia/Makefile b/drivers/pcmcia/Makefile
index 01779c5c45f35..d82c07c4806bd 100644
--- a/drivers/pcmcia/Makefile
+++ b/drivers/pcmcia/Makefile
@@ -30,7 +30,6 @@ obj-$(CONFIG_PCMCIA_SA1100)			+= sa1100_cs.o
 obj-$(CONFIG_PCMCIA_SA1111)			+= sa1111_cs.o
 obj-$(CONFIG_PCMCIA_BCM63XX)			+= bcm63xx_pcmcia.o
 obj-$(CONFIG_PCMCIA_VRC4171)			+= vrc4171_card.o
-obj-$(CONFIG_PCMCIA_VRC4173)			+= vrc4173_cardu.o
 obj-$(CONFIG_OMAP_CF)				+= omap_cf.o
 obj-$(CONFIG_AT91_CF)				+= at91_cf.o
 obj-$(CONFIG_ELECTRA_CF)			+= electra_cf.o
diff --git a/drivers/pcmcia/vrc4173_cardu.c b/drivers/pcmcia/vrc4173_cardu.c
deleted file mode 100644
index 9fb0c3addfd40..0000000000000
--- a/drivers/pcmcia/vrc4173_cardu.c
+++ /dev/null
@@ -1,591 +0,0 @@
-/*
- * FILE NAME
- *	drivers/pcmcia/vrc4173_cardu.c
- *
- * BRIEF MODULE DESCRIPTION
- * 	NEC VRC4173 CARDU driver for Socket Services
- *	(This device doesn't support CardBus. it is supporting only 16bit PC Card.)
- *
- * Copyright 2002,2003 Yoichi Yuasa <yuasa@linux-mips.org>
- *
- *  This program is free software; you can redistribute it and/or modify it
- *  under the terms of the GNU General Public License as published by the
- *  Free Software Foundation; either version 2 of the License, or (at your
- *  option) any later version.
- *
- *  THIS SOFTWARE IS PROVIDED ``AS IS'' AND ANY EXPRESS OR IMPLIED
- *  WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
- *  MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
- *  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
- *  INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
- *  BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
- *  OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
- *  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR
- *  TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
- *  USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- *
- *  You should have received a copy of the GNU General Public License along
- *  with this program; if not, write to the Free Software Foundation, Inc.,
- *  675 Mass Ave, Cambridge, MA 02139, USA.
- */
-#include <linux/init.h>
-#include <linux/module.h>
-#include <linux/pci.h>
-#include <linux/spinlock.h>
-#include <linux/types.h>
-
-#include <asm/io.h>
-
-#include <pcmcia/ss.h>
-
-#include "vrc4173_cardu.h"
-
-MODULE_DESCRIPTION("NEC VRC4173 CARDU driver for Socket Services");
-MODULE_AUTHOR("Yoichi Yuasa <yuasa@linux-mips.org>");
-MODULE_LICENSE("GPL");
-
-static int vrc4173_cardu_slots;
-
-static vrc4173_socket_t cardu_sockets[CARDU_MAX_SOCKETS];
-
-extern struct socket_info_t *pcmcia_register_socket (int slot,
-                                                     struct pccard_operations *vtable,
-                                                     int use_bus_pm);
-extern void pcmcia_unregister_socket(struct socket_info_t *s);
-
-static inline uint8_t exca_readb(vrc4173_socket_t *socket, uint16_t offset)
-{
-	return readb(socket->base + EXCA_REGS_BASE + offset);
-}
-
-static inline uint16_t exca_readw(vrc4173_socket_t *socket, uint16_t offset)
-{
-	uint16_t val;
-
-	val = readb(socket->base + EXCA_REGS_BASE + offset);
-	val |= (u16)readb(socket->base + EXCA_REGS_BASE + offset + 1) << 8;
-
-	return val;
-}
-
-static inline void exca_writeb(vrc4173_socket_t *socket, uint16_t offset, uint8_t val)
-{
-	writeb(val, socket->base + EXCA_REGS_BASE + offset);
-}
-
-static inline void exca_writew(vrc4173_socket_t *socket, uint8_t offset, uint16_t val)
-{
-	writeb((u8)val, socket->base + EXCA_REGS_BASE + offset);
-	writeb((u8)(val >> 8), socket->base + EXCA_REGS_BASE + offset + 1);
-}
-
-static inline uint32_t cardbus_socket_readl(vrc4173_socket_t *socket, u16 offset)
-{
-	return readl(socket->base + CARDBUS_SOCKET_REGS_BASE + offset);
-}
-
-static inline void cardbus_socket_writel(vrc4173_socket_t *socket, u16 offset, uint32_t val)
-{
-	writel(val, socket->base + CARDBUS_SOCKET_REGS_BASE + offset);
-}
-
-static void cardu_pciregs_init(struct pci_dev *dev)
-{
-	u32 syscnt;
-	u16 brgcnt;
-	u8 devcnt;
-
-	pci_write_config_dword(dev, 0x1c, 0x10000000);
-	pci_write_config_dword(dev, 0x20, 0x17fff000);
-	pci_write_config_dword(dev, 0x2c, 0);
-	pci_write_config_dword(dev, 0x30, 0xfffc);
-
-	pci_read_config_word(dev, BRGCNT, &brgcnt);
-	brgcnt &= ~IREQ_INT;
-	pci_write_config_word(dev, BRGCNT, brgcnt);
-
-	pci_read_config_dword(dev, SYSCNT, &syscnt);
-	syscnt &= ~(BAD_VCC_REQ_DISB|PCPCI_EN|CH_ASSIGN_MASK|SUB_ID_WR_EN|PCI_CLK_RIN);
-	syscnt |= (CH_ASSIGN_NODMA|ASYN_INT_MODE);
-	pci_write_config_dword(dev, SYSCNT, syscnt);
-
-	pci_read_config_byte(dev, DEVCNT, &devcnt);
-	devcnt &= ~(ZOOM_VIDEO_EN|SR_PCI_INT_SEL_MASK|PCI_INT_MODE|IRQ_MODE);
-	devcnt |= (SR_PCI_INT_SEL_NONE|IFG);
-	pci_write_config_byte(dev, DEVCNT, devcnt);
-
-	pci_write_config_byte(dev, CHIPCNT, S_PREF_DISB);
-
-	pci_write_config_byte(dev, SERRDIS, 0);
-}
-
-static int cardu_init(unsigned int slot)
-{
-	vrc4173_socket_t *socket = &cardu_sockets[slot];
-
-	cardu_pciregs_init(socket->dev);
-
-	/* CARD_SC bits are cleared by reading CARD_SC. */
-	exca_writeb(socket, GLO_CNT, 0);
-
-	socket->cap.features |= SS_CAP_PCCARD | SS_CAP_PAGE_REGS;
-	socket->cap.irq_mask = 0;
-	socket->cap.map_size = 0x1000;
-	socket->cap.pci_irq  = socket->dev->irq;
-	socket->events = 0;
-	spin_lock_init(socket->event_lock);
-
-	/* Enable PC Card status interrupts */
-	exca_writeb(socket, CARD_SCI, CARD_DT_EN|RDY_EN|BAT_WAR_EN|BAT_DEAD_EN);
-
-	return 0;
-}
-
-static int cardu_register_callback(unsigned int sock,
-                                           void (*handler)(void *, unsigned int),
-                                           void * info)
-{
-	vrc4173_socket_t *socket = &cardu_sockets[sock];
-
-	socket->handler = handler;
-	socket->info = info;
-
-	return 0;
-}
-
-static int cardu_inquire_socket(unsigned int sock, socket_cap_t *cap)
-{
-	vrc4173_socket_t *socket = &cardu_sockets[sock];
-
-	*cap = socket->cap;
-
-	return 0;
-}
-
-static int cardu_get_status(unsigned int sock, u_int *value)
-{
-	vrc4173_socket_t *socket = &cardu_sockets[sock];
-	uint32_t state;
-	uint8_t status;
-	u_int val = 0;
-
-	status = exca_readb(socket, IF_STATUS);
-	if (status & CARD_PWR) val |= SS_POWERON;
-	if (status & READY) val |= SS_READY;
-	if (status & CARD_WP) val |= SS_WRPROT;
-	if ((status & (CARD_DETECT1|CARD_DETECT2)) == (CARD_DETECT1|CARD_DETECT2))
-		val |= SS_DETECT;
-	if (exca_readb(socket, INT_GEN_CNT) & CARD_TYPE_IO) {
-		if (status & STSCHG) val |= SS_STSCHG;
-	} else {
-		status &= BV_DETECT_MASK;
-		if (status != BV_DETECT_GOOD) {
-			if (status == BV_DETECT_WARN) val |= SS_BATWARN;
-			else val |= SS_BATDEAD;
-		}
-	}
-
-	state = cardbus_socket_readl(socket, SKT_PRE_STATE);
-	if (state & VOL_3V_CARD_DT) val |= SS_3VCARD;
-	if (state & VOL_XV_CARD_DT) val |= SS_XVCARD;
-	if (state & CB_CARD_DT) val |= SS_CARDBUS;
-	if (!(state &
-	      (VOL_YV_CARD_DT|VOL_XV_CARD_DT|VOL_3V_CARD_DT|VOL_5V_CARD_DT|CCD20|CCD10)))
-		val |= SS_PENDING;
-
-	*value = val;
-
-	return 0;
-}
-
-static inline uint8_t set_Vcc_value(u_char Vcc)
-{
-	switch (Vcc) {
-	case 33:
-		return VCC_3V;
-	case 50:
-		return VCC_5V;
-	}
-
-	return VCC_0V;
-}
-
-static inline uint8_t set_Vpp_value(u_char Vpp)
-{
-	switch (Vpp) {
-	case 33:
-	case 50:
-		return VPP_VCC;
-	case 120:
-		return VPP_12V;
-	}
-
-	return VPP_0V;
-}
-
-static int cardu_set_socket(unsigned int sock, socket_state_t *state)
-{
-	vrc4173_socket_t *socket = &cardu_sockets[sock];
-	uint8_t val;
-
-	if (((state->Vpp == 33) || (state->Vpp == 50)) && (state->Vpp != state->Vcc))
-			return -EINVAL;
-
-	val = set_Vcc_value(state->Vcc);
-	val |= set_Vpp_value(state->Vpp);
-	if (state->flags & SS_OUTPUT_ENA) val |= CARD_OUT_EN;
-	exca_writeb(socket, PWR_CNT, val);
-
-	val = exca_readb(socket, INT_GEN_CNT) & CARD_REST0;
-	if (state->flags & SS_RESET) val &= ~CARD_REST0;
-	else val |= CARD_REST0;
-	if (state->flags & SS_IOCARD) val |= CARD_TYPE_IO;
-	exca_writeb(socket, INT_GEN_CNT, val);
-
-	return 0;
-}
-
-static int cardu_get_io_map(unsigned int sock, struct pccard_io_map *io)
-{
-	vrc4173_socket_t *socket = &cardu_sockets[sock];
-	uint8_t ioctl, window;
-	u_char map;
-
-	map = io->map;
-	if (map > 1)
-		return -EINVAL;
-
-	io->start = exca_readw(socket, IO_WIN_SA(map));
-	io->stop = exca_readw(socket, IO_WIN_EA(map));
-
-	ioctl = exca_readb(socket, IO_WIN_CNT);
-	window = exca_readb(socket, ADR_WIN_EN);
-	io->flags  = (window & IO_WIN_EN(map)) ? MAP_ACTIVE : 0;
-	if (ioctl & IO_WIN_DATA_AUTOSZ(map))
-		io->flags |= MAP_AUTOSZ;
-	else if (ioctl & IO_WIN_DATA_16BIT(map))
-		io->flags |= MAP_16BIT;
-
-	return 0;
-}
-
-static int cardu_set_io_map(unsigned int sock, struct pccard_io_map *io)
-{
-	vrc4173_socket_t *socket = &cardu_sockets[sock];
-	uint16_t ioctl;
-	uint8_t window, enable;
-	u_char map;
-
-	map = io->map;
-	if (map > 1)
-		return -EINVAL;
-
-	window = exca_readb(socket, ADR_WIN_EN);
-	enable = IO_WIN_EN(map);
-
-	if (window & enable) {
-		window &= ~enable;
-		exca_writeb(socket, ADR_WIN_EN, window);
-	}
-
-	exca_writew(socket, IO_WIN_SA(map), io->start);
-	exca_writew(socket, IO_WIN_EA(map), io->stop);
-
-	ioctl = exca_readb(socket, IO_WIN_CNT) & ~IO_WIN_CNT_MASK(map);
-	if (io->flags & MAP_AUTOSZ) ioctl |= IO_WIN_DATA_AUTOSZ(map);
-	else if (io->flags & MAP_16BIT) ioctl |= IO_WIN_DATA_16BIT(map);
-	exca_writeb(socket, IO_WIN_CNT, ioctl);
-
-	if (io->flags & MAP_ACTIVE)
-		exca_writeb(socket, ADR_WIN_EN, window | enable);
-
-	return 0;
-}
-
-static int cardu_get_mem_map(unsigned int sock, struct pccard_mem_map *mem)
-{
-	vrc4173_socket_t *socket = &cardu_sockets[sock];
-	uint32_t start, stop, offset, page;
-	uint8_t window;
-	u_char map;
-
-	map = mem->map;
-	if (map > 4)
-		return -EINVAL;
-
-	window = exca_readb(socket, ADR_WIN_EN);
-	mem->flags = (window & MEM_WIN_EN(map)) ? MAP_ACTIVE : 0;
-
-	start = exca_readw(socket, MEM_WIN_SA(map));
-	mem->flags |= (start & MEM_WIN_DSIZE) ? MAP_16BIT : 0;
-	start = (start & 0x0fff) << 12;
-
-	stop = exca_readw(socket, MEM_WIN_EA(map));
-	stop = ((stop & 0x0fff) << 12) + 0x0fff;
-
-	offset = exca_readw(socket, MEM_WIN_OA(map));
-	mem->flags |= (offset & MEM_WIN_WP) ? MAP_WRPROT : 0;
-	mem->flags |= (offset & MEM_WIN_REGSET) ? MAP_ATTRIB : 0;
-	offset = ((offset & 0x3fff) << 12) + start;
-	mem->card_start = offset & 0x03ffffff;
-
-	page = exca_readb(socket, MEM_WIN_SAU(map)) << 24;
-	mem->sys_start = start + page;
-	mem->sys_stop = start + page;
-
-	return 0;
-}
-
-static int cardu_set_mem_map(unsigned int sock, struct pccard_mem_map *mem)
-{
-	vrc4173_socket_t *socket = &cardu_sockets[sock];
-	uint16_t value;
-	uint8_t window, enable;
-	u_long sys_start, sys_stop, card_start;
-	u_char map;
-
-	map = mem->map;
-	sys_start = mem->sys_start;
-	sys_stop = mem->sys_stop;
-	card_start = mem->card_start;
-
-	if (map > 4 || sys_start > sys_stop || ((sys_start ^ sys_stop) >> 24) ||
-	    (card_start >> 26))
-		return -EINVAL;
-
-	window = exca_readb(socket, ADR_WIN_EN);
-	enable = MEM_WIN_EN(map);
-	if (window & enable) {
-		window &= ~enable;
-		exca_writeb(socket, ADR_WIN_EN, window);
-	}
-
-	exca_writeb(socket, MEM_WIN_SAU(map), sys_start >> 24);
-
-	value = (sys_start >> 12) & 0x0fff;
-	if (mem->flags & MAP_16BIT) value |= MEM_WIN_DSIZE;
-	exca_writew(socket, MEM_WIN_SA(map), value);
-
-	value = (sys_stop >> 12) & 0x0fff;
-	exca_writew(socket, MEM_WIN_EA(map), value);
-
-	value = ((card_start - sys_start) >> 12) & 0x3fff;
-	if (mem->flags & MAP_WRPROT) value |= MEM_WIN_WP;
-	if (mem->flags & MAP_ATTRIB) value |= MEM_WIN_REGSET;
-	exca_writew(socket, MEM_WIN_OA(map), value);
-
-	if (mem->flags & MAP_ACTIVE)
-		exca_writeb(socket, ADR_WIN_EN, window | enable);
-
-	return 0;
-}
-
-static void cardu_proc_setup(unsigned int sock, struct proc_dir_entry *base)
-{
-}
-
-static struct pccard_operations cardu_operations = {
-	.init			= cardu_init,
-	.register_callback	= cardu_register_callback,
-	.inquire_socket		= cardu_inquire_socket,
-	.get_status		= cardu_get_status,
-	.set_socket		= cardu_set_socket,
-	.get_io_map		= cardu_get_io_map,
-	.set_io_map		= cardu_set_io_map,
-	.get_mem_map		= cardu_get_mem_map,
-	.set_mem_map		= cardu_set_mem_map,
-	.proc_setup		= cardu_proc_setup,
-};
-
-static void cardu_bh(void *data)
-{
-	vrc4173_socket_t *socket = (vrc4173_socket_t *)data;
-	uint16_t events;
-
-	spin_lock_irq(&socket->event_lock);
-	events = socket->events;
-	socket->events = 0;
-	spin_unlock_irq(&socket->event_lock);
-
-	if (socket->handler)
-		socket->handler(socket->info, events);
-}
-
-static uint16_t get_events(vrc4173_socket_t *socket)
-{
-	uint16_t events = 0;
-	uint8_t csc, status;
-
-	status = exca_readb(socket, IF_STATUS);
-	csc = exca_readb(socket, CARD_SC);
-	if ((csc & CARD_DT_CHG) &&
-	    ((status & (CARD_DETECT1|CARD_DETECT2)) == (CARD_DETECT1|CARD_DETECT2)))
-		events |= SS_DETECT;
-
-	if ((csc & RDY_CHG) && (status & READY))
-		events |= SS_READY;
-
-	if (exca_readb(socket, INT_GEN_CNT) & CARD_TYPE_IO) {
-		if ((csc & BAT_DEAD_ST_CHG) && (status & STSCHG))
-			events |= SS_STSCHG;
-	} else {
-		if (csc & (BAT_WAR_CHG|BAT_DEAD_ST_CHG)) {
-			if ((status & BV_DETECT_MASK) != BV_DETECT_GOOD) {
-				if (status == BV_DETECT_WARN) events |= SS_BATWARN;
-				else events |= SS_BATDEAD;
-			}
-		}
-	}
-
-	return events;
-}
-
-static void cardu_interrupt(int irq, void *dev_id)
-{
-	vrc4173_socket_t *socket = (vrc4173_socket_t *)dev_id;
-	uint16_t events;
-
-	INIT_WORK(&socket->tq_work, cardu_bh, socket);
-
-	events = get_events(socket);
-	if (events) {
-		spin_lock(&socket->event_lock);
-		socket->events |= events;
-		spin_unlock(&socket->event_lock);
-		schedule_work(&socket->tq_work);
-	}
-}
-
-static int vrc4173_cardu_probe(struct pci_dev *dev,
-                                         const struct pci_device_id *ent)
-{
-	vrc4173_socket_t *socket;
-	unsigned long start, len, flags;
-	int slot, err, ret;
-
-	slot = vrc4173_cardu_slots++;
-	socket = &cardu_sockets[slot];
-	if (socket->noprobe != 0)
-		return -EBUSY;
-
-	sprintf(socket->name, "NEC VRC4173 CARDU%1d", slot+1);
-
-	if ((err = pci_enable_device(dev)) < 0)
-		return err;
-
-	start = pci_resource_start(dev, 0);
-	if (start == 0) {
-		ret = -ENODEV;
-		goto disable;
-	}
-
-	len = pci_resource_len(dev, 0);
-	if (len == 0) {
-		ret = -ENODEV;
-		goto disable;
-	}
-
-	flags = pci_resource_flags(dev, 0);
-	if ((flags & IORESOURCE_MEM) == 0) {
-		ret = -EBUSY;
-		goto disable;
-	}
-
-	err = pci_request_regions(dev, socket->name);
-	if (err < 0) {
-		ret = err;
-		goto disable;
-	}
-
-	socket->base = ioremap(start, len);
-	if (socket->base == NULL) {
-		ret = -ENODEV;
-		goto release;
-	}
-
-	socket->dev = dev;
-
-	socket->pcmcia_socket = pcmcia_register_socket(slot, &cardu_operations, 1);
-	if (socket->pcmcia_socket == NULL) {
-		ret =  -ENOMEM;
-		goto unmap;
-	}
-
-	if (request_irq(dev->irq, cardu_interrupt, IRQF_SHARED, socket->name, socket) < 0) {
-		ret = -EBUSY;
-		goto unregister;
-	}
-
-	printk(KERN_INFO "%s at %#08lx, IRQ %d\n", socket->name, start, dev->irq);
-
-	return 0;
-
-unregister:
-	pcmcia_unregister_socket(socket->pcmcia_socket);
-	socket->pcmcia_socket = NULL;
-unmap:
-	iounmap(socket->base);
-	socket->base = NULL;
-release:
-	pci_release_regions(dev);
-disable:
-	pci_disable_device(dev);
-	return ret;
-}
-
-static int vrc4173_cardu_setup(char *options)
-{
-	if (options == NULL || *options == '\0')
-		return 1;
-
-	if (strncmp(options, "cardu1:", 7) == 0) {
-		options += 7;
-		if (*options != '\0') {
-			if (strncmp(options, "noprobe", 7) == 0) {
-				cardu_sockets[CARDU1].noprobe = 1;
-				options += 7;
-			}
-
-			if (*options != ',')
-				return 1;
-		} else
-			return 1;
-	}
-
-	if (strncmp(options, "cardu2:", 7) == 0) {
-		options += 7;
-		if ((*options != '\0') && (strncmp(options, "noprobe", 7) == 0))
-			cardu_sockets[CARDU2].noprobe = 1;
-	}
-
-	return 1;
-}
-
-__setup("vrc4173_cardu=", vrc4173_cardu_setup);
-
-static const struct pci_device_id vrc4173_cardu_id_table[] = {
-	{ PCI_DEVICE(PCI_VENDOR_ID_NEC, PCI_DEVICE_ID_NEC_NAPCCARD) },
-        {0, }
-};
-
-static struct pci_driver vrc4173_cardu_driver = {
-	.name		= "NEC VRC4173 CARDU",
-	.probe		= vrc4173_cardu_probe,
-	.id_table	= vrc4173_cardu_id_table,
-};
-
-static int vrc4173_cardu_init(void)
-{
-	vrc4173_cardu_slots = 0;
-
-	return pci_register_driver(&vrc4173_cardu_driver);
-}
-
-static void vrc4173_cardu_exit(void)
-{
-	pci_unregister_driver(&vrc4173_cardu_driver);
-}
-
-module_init(vrc4173_cardu_init);
-module_exit(vrc4173_cardu_exit);
-MODULE_DEVICE_TABLE(pci, vrc4173_cardu_id_table);
diff --git a/drivers/pcmcia/vrc4173_cardu.h b/drivers/pcmcia/vrc4173_cardu.h
deleted file mode 100644
index a7d96018ed8d4..0000000000000
--- a/drivers/pcmcia/vrc4173_cardu.h
+++ /dev/null
@@ -1,247 +0,0 @@
-/*
- * FILE NAME
- *	drivers/pcmcia/vrc4173_cardu.h
- *
- * BRIEF MODULE DESCRIPTION
- *	Include file for NEC VRC4173 CARDU.
- *
- * Copyright 2002 Yoichi Yuasa <yuasa@linux-mips.org>
- *
- *  This program is free software; you can redistribute it and/or modify it
- *  under the terms of the GNU General Public License as published by the
- *  Free Software Foundation; either version 2 of the License, or (at your
- *  option) any later version.
- *
- *  THIS SOFTWARE IS PROVIDED ``AS IS'' AND ANY EXPRESS OR IMPLIED
- *  WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
- *  MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
- *  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
- *  INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
- *  BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
- *  OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
- *  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR
- *  TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
- *  USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- *
- *  You should have received a copy of the GNU General Public License along
- *  with this program; if not, write to the Free Software Foundation, Inc.,
- *  675 Mass Ave, Cambridge, MA 02139, USA.
- */
-#ifndef _VRC4173_CARDU_H
-#define _VRC4173_CARDU_H
-
-#include <linux/pci.h>
-
-#include <pcmcia/ss.h>
-
-#define CARDU_MAX_SOCKETS	2
-#define CARDU1			0
-#define CARDU2			1
-
-/*
- * PCI Configuration Registers
- */
-#define BRGCNT			0x3e
- #define POST_WR_EN		0x0400
- #define MEM1_PREF_EN		0x0200
- #define MEM0_PREF_EN		0x0100
- #define IREQ_INT		0x0080
- #define CARD_RST		0x0040
- #define MABORT_MODE		0x0020
- #define VGA_EN			0x0008
- #define ISA_EN			0x0004
- #define SERR_EN		0x0002
- #define PERR_EN		0x0001
-
-#define SYSCNT			0x80
- #define BAD_VCC_REQ_DISB	0x00200000
- #define PCPCI_EN		0x00080000
- #define CH_ASSIGN_MASK		0x00070000
- #define CH_ASSIGN_NODMA	0x00040000
- #define SUB_ID_WR_EN		0x00000008
- #define ASYN_INT_MODE		0x00000004
- #define PCI_CLK_RIN		0x00000002
-
-#define DEVCNT			0x91
- #define ZOOM_VIDEO_EN		0x40
- #define SR_PCI_INT_SEL_MASK	0x18
- #define SR_PCI_INT_SEL_NONE	0x00
- #define PCI_INT_MODE		0x04
- #define IRQ_MODE		0x02
- #define IFG			0x01
-
-#define CHIPCNT			0x9c
- #define S_PREF_DISB		0x10
-
-#define SERRDIS			0x9f
- #define SERR_DIS_MAB		0x10
- #define SERR_DIS_TAB		0x08
- #define SERR_DIS_DT_PERR	0x04
-
-/*
- * ExCA Registers
- */
-#define EXCA_REGS_BASE		0x800
-#define EXCA_REGS_SIZE		0x800
-
-#define ID_REV			0x000
- #define IF_TYPE_16BIT		0x80
-
-#define IF_STATUS		0x001
- #define CARD_PWR		0x40
- #define READY			0x20
- #define CARD_WP		0x10
- #define CARD_DETECT2		0x08
- #define CARD_DETECT1		0x04
- #define BV_DETECT_MASK		0x03
- #define BV_DETECT_GOOD		0x03	/* Memory card */
- #define BV_DETECT_WARN		0x02
- #define BV_DETECT_BAD1		0x01
- #define BV_DETECT_BAD0		0x00
- #define STSCHG			0x02	/* I/O card */
- #define SPKR			0x01
-
-#define PWR_CNT			0x002
- #define CARD_OUT_EN		0x80
- #define VCC_MASK		0x18
- #define VCC_3V			0x18
- #define VCC_5V			0x10
- #define VCC_0V			0x00
- #define VPP_MASK		0x03
- #define VPP_12V		0x02
- #define VPP_VCC		0x01
- #define VPP_0V			0x00
-
-#define INT_GEN_CNT		0x003
- #define CARD_REST0		0x40
- #define CARD_TYPE_MASK		0x20
- #define CARD_TYPE_IO		0x20
- #define CARD_TYPE_MEM		0x00
-
-#define CARD_SC			0x004
- #define CARD_DT_CHG		0x08
- #define RDY_CHG		0x04
- #define BAT_WAR_CHG		0x02
- #define BAT_DEAD_ST_CHG	0x01
-
-#define CARD_SCI		0x005
- #define CARD_DT_EN		0x08
- #define RDY_EN			0x04
- #define BAT_WAR_EN		0x02
- #define BAT_DEAD_EN		0x01
-
-#define ADR_WIN_EN		0x006
- #define IO_WIN_EN(x)		(0x40 << (x))
- #define MEM_WIN_EN(x)		(0x01 << (x))
-
-#define IO_WIN_CNT		0x007
- #define IO_WIN_CNT_MASK(x)	(0x03 << ((x) << 2))
- #define IO_WIN_DATA_AUTOSZ(x)	(0x02 << ((x) << 2))
- #define IO_WIN_DATA_16BIT(x)	(0x01 << ((x) << 2))
-
-#define IO_WIN_SA(x)		(0x008 + ((x) << 2))
-#define IO_WIN_EA(x)		(0x00a + ((x) << 2))
-
-#define MEM_WIN_SA(x)		(0x010 + ((x) << 3))
- #define MEM_WIN_DSIZE		0x8000
-
-#define MEM_WIN_EA(x)		(0x012 + ((x) << 3))
-
-#define MEM_WIN_OA(x)		(0x014 + ((x) << 3))
- #define MEM_WIN_WP		0x8000
- #define MEM_WIN_REGSET		0x4000
-
-#define GEN_CNT			0x016
- #define VS2_STATUS		0x80
- #define VS1_STATUS		0x40
- #define EXCA_REG_RST_EN	0x02
-
-#define GLO_CNT			0x01e
- #define FUN_INT_LEV		0x08
- #define INT_WB_CLR		0x04
- #define CSC_INT_LEV		0x02
-
-#define IO_WIN_OAL(x)		(0x036 + ((x) << 1))
-#define IO_WIN_OAH(x)		(0x037 + ((x) << 1))
-
-#define MEM_WIN_SAU(x)		(0x040 + (x))
-
-#define IO_SETUP_TIM		0x080
-#define IO_CMD_TIM		0x081
-#define IO_HOLD_TIM		0x082
-#define MEM_SETUP_TIM(x)	(0x084 + ((x) << 2))
-#define MEM_CMD_TIM(x)		(0x085 + ((x) << 2))
-#define MEM_HOLD_TIM(x)		(0x086 + ((x) << 2))
- #define TIM_CLOCKS(x)		((x) - 1)
-
-#define MEM_TIM_SEL1		0x08c
-#define MEM_TIM_SEL2		0x08d
- #define MEM_WIN_TIMSEL1(x)	(0x03 << (((x) & 3) << 1))
-
-#define MEM_WIN_PWEN		0x091
- #define POSTWEN		0x01
-
-/*
- * CardBus Socket Registers
- */
-#define CARDBUS_SOCKET_REGS_BASE	0x000
-#define CARDBUS_SOCKET_REGS_SIZE	0x800
-
-#define SKT_EV			0x000
- #define POW_CYC_EV		0x00000008
- #define CCD2_EV		0x00000004
- #define CCD1_EV		0x00000002
- #define CSTSCHG_EV		0x00000001
-
-#define SKT_MASK		0x004
- #define POW_CYC_MASK		0x00000008
- #define CCD_MASK		0x00000006
- #define CSC_MASK		0x00000001
-
-#define SKT_PRE_STATE		0x008
-#define SKT_FORCE_EV		0x00c
- #define VOL_3V_SKT		0x20000000
- #define VOL_5V_SKT		0x10000000
- #define CVS_TEST		0x00004000
- #define VOL_YV_CARD_DT		0x00002000
- #define VOL_XV_CARD_DT		0x00001000
- #define VOL_3V_CARD_DT		0x00000800
- #define VOL_5V_CARD_DT		0x00000400
- #define BAD_VCC_REQ		0x00000200
- #define DATA_LOST		0x00000100
- #define NOT_A_CARD		0x00000080
- #define CREADY			0x00000040
- #define CB_CARD_DT		0x00000020
- #define R2_CARD_DT		0x00000010
- #define POW_UP			0x00000008
- #define CCD20			0x00000004
- #define CCD10			0x00000002
- #define CSTSCHG		0x00000001
-
-#define SKT_CNT			0x010
- #define STP_CLK_EN		0x00000080
- #define VCC_CNT_MASK		0x00000070
- #define VCC_CNT_3V		0x00000030
- #define VCC_CNT_5V		0x00000020
- #define VCC_CNT_0V		0x00000000
- #define VPP_CNT_MASK		0x00000007
- #define VPP_CNT_3V		0x00000003
- #define VPP_CNT_5V		0x00000002
- #define VPP_CNT_12V		0x00000001
- #define VPP_CNT_0V		0x00000000
-
-typedef struct vrc4173_socket {
-	int noprobe;
-	struct pci_dev *dev;
-	void *base;
-	void (*handler)(void *, unsigned int);
-	void *info;
-	socket_cap_t cap;
-	spinlock_t event_lock;
-	uint16_t events;
-	struct socket_info_t *pcmcia_socket;
-	struct work_struct tq_work;
-	char name[20];
-} vrc4173_socket_t;
-
-#endif /* _VRC4173_CARDU_H */
-- 
2.28.0

