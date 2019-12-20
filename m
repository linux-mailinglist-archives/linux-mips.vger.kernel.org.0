Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78E2A1280EA
	for <lists+linux-mips@lfdr.de>; Fri, 20 Dec 2019 17:50:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727388AbfLTQuD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 20 Dec 2019 11:50:03 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.22]:20999 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727233AbfLTQuC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 20 Dec 2019 11:50:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1576860600;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:Cc:Message-Id:Date:Subject:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=rUxpZn7cfcxARKCHzhVD7qNlVTVpzSzhoASApFtny/I=;
        b=FwXM8KkuymqUEVQ9wzpf5BCc/r9f9olxDwb0jNOs7Ts66GX3UMHgVbkCNrOdto82i7
        HEsbtZF/aWWA3fZAlApW6QfBs/zOMq2grRHXzJYvTpVs9NNNRnv05uITDebL2z6VFANJ
        ZQszImN4mZLU7KlAEmpvv7g+sWI6RMvPaKhesRPAJX+MyhHgQ0+DrCWegDnCOij4uuGw
        IYBdgpj2vJRuflAcnY0wFtrQERZJEsaTBd6CDtm2zhdNCpYJ5nTozAEXZ3F37HHALPtd
        DiYeaC6tzPGWMvTcbUWTy8Zaosn9HsytOCdJs/GU4ThGqPp0s6Il/TQIaZ2/0FKB7J0K
        hWAQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/vuwDOpExo="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.1.1 DYNA|AUTH)
        with ESMTPSA id 4012cfvBKGns8za
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Fri, 20 Dec 2019 17:49:54 +0100 (CET)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Subject: [BUG] CI20: interrupt-controller@10001000 didn't like hwirq-0x0 to VIRQ8 mapping (rc=-19) 
Date:   Fri, 20 Dec 2019 17:49:52 +0100
Message-Id: <8BA39E30-53CB-47DB-8890-465ACB760402@goldelico.com>
Cc:     Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-mips@vger.kernel.org,
        MIPS Creator CI20 Development 
        <mips-creator-ci20-dev@googlegroups.com>,
        Marc Zyngier <maz@kernel.org>,
        Zhou Yanjie <zhouyanjie@zoho.com>
To:     Paul Cercueil <paul@crapouillou.net>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,
since v5.5-rc1 the boot log is flooded by a sequence of messages like:

[    0.000000] NR_IRQS: 222
[    0.000000] irq: :interrupt-controller@10001000 didn't like hwirq-0x0 =
to VIRQ8 mapping (rc=3D-19)
[    0.000000] irq: :interrupt-controller@10001000 didn't like hwirq-0x1 =
to VIRQ9 mapping (rc=3D-19)
[    0.000000] irq: :interrupt-controller@10001000 didn't like hwirq-0x2 =
to VIRQ10 mapping (rc=3D-19)
[    0.000000] irq: :interrupt-controller@10001000 didn't like hwirq-0x3 =
to VIRQ11 mapping (rc=3D-19)
[    0.000000] irq: :interrupt-controller@10001000 didn't like hwirq-0x4 =
to VIRQ12 mapping (rc=3D-19)
...
[    0.000000] irq: :interrupt-controller@10001000 didn't like =
hwirq-0x3e to VIRQ70 mapping (rc=3D-19)
[    0.000000] irq: :interrupt-controller@10001000 didn't like =
hwirq-0x3f to VIRQ71 mapping (rc=3D-19)

A handful of /proc/interrupts are nevertheless working.

I have now analyzed the situation a little:

* the message is printed by irq_domain_associate()
* call sequence is ingenic_intc_of_init() -> irq_domain_add_legacy() -> =
irq_domain_associate_many() -> irq_domain_associate()
* the reason for the message is that
  domain->ops->map()
  called in irq_domain_associate() returns an error
* domain->ops is initialized to &irq_generic_chip_ops
* domain->ops->map is initialized to irq_map_generic_chip()
* irq_map_generic_chip() calls __irq_get_domain_generic_chip()
* which returns -ENODEV (-19) if d->gc =3D=3D NULL

So the location, where the -19 comes from, is found.

Now why is d->gc =3D=3D NULL in __irq_get_domain_generic_chip() ?

This IMHO seems to be a bad initialization sequence:

* ingenic_intc_of_init() calls firstly irq_domain_add_legacy()
* which does *not* initialize domain->gc but expects it to be !NULL =
through irq_map_generic_chip()
* and would only irq_alloc_domain_generic_chips() which initializes =
domain->gc if irq_domain_add_legacy() is successful
* irq_alloc_domain_generic_chips() would initialize domain->gc by =
calling __irq_alloc_domain_generic_chips()

There are indeed significant changes in drivers/irqchip/irq-ingenic.c
from v5.4to v5.5-rc1 which have introduced the use of =
irq_domain_add_legacy()
and irq_alloc_domain_generic_chips() by

52ecc87642f2 irqchip: ingenic: Error out if IRQ domain creation failed
208caadce5d4 irqchip: ingenic: Get virq number from IRQ domain
8bc7464b5140 irqchip: ingenic: Alloc generic chips from IRQ domain
b8b0145f7d0e irqchip: Ingenic: Add process for more than one irq at the =
same time.

Most likely 52ecc87642f2 has changed the call sequence and therefore =
always fails.

Is there some essential patch missing to be upstreamed?
I have looked but not found anything related in linux-next.

I have also tried reverting 52ecc87642f2 alone but it has conflicts.

But I can revert all 4 commits with an otherwise unchanged setup and
the messages are gone for me.

How would a fix look like?

BR and thanks,
Nikolaus

