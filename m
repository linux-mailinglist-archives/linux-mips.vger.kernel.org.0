Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 546B32022D8
	for <lists+linux-mips@lfdr.de>; Sat, 20 Jun 2020 11:33:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727841AbgFTJdv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 20 Jun 2020 05:33:51 -0400
Received: from mail-40136.protonmail.ch ([185.70.40.136]:53117 "EHLO
        mail-40136.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726533AbgFTJdu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 20 Jun 2020 05:33:50 -0400
Date:   Sat, 20 Jun 2020 09:33:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me; s=protonmail;
        t=1592645627; bh=+6kZxlKJG86Z+7goQSio+X9/leY9eeHUIPXcjxNN0Do=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=Z6QXkwTproBEynDrBVRFmsctfFAYDUmJKCQF4L/hCa5hl5TDPzlhz5I42mB34z1jw
         4Yx53tsRHY6OGWXzd9mMsHNMFHkahD7jfBwGkoRYsK9j3JVb4Iq6YNF+JDtUxRjGbs
         tRx3A5Ja1sHcfSkhEeTtVRHvPBb8z173mxfLpeea3QalHA2kURuckz968mnRFsz67V
         JJGKUoC7xqEU+j7USMAepiAkJpB5wDkTU0KClnXAx5eNOonm7NEEudZOZ1e6JYMwKq
         p5gTR7uJjKZ5pHkY7lC8b8G2YaQy4VUqlX0Vr5ep4qPsuXyrFDiP69ag88JvgBk2Uz
         52bQYR81GWj/g==
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
From:   Alexander Lobakin <alobakin@pm.me>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Paul Burton <paulburton@kernel.org>,
        Alexander Lobakin <alobakin@pm.me>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Reply-To: Alexander Lobakin <alobakin@pm.me>
Subject: [PATCH mips-next 0/3] MIPS: fix the two most annoying sparse floods
Message-ID: <OXAnLrccR2GxIpepN5IUjppNnjyVAnjQmCIx2RmgpMLsOzOBgXMKYvmjivy4Rq0bAVf11R5V9_FwfGx-MML3dShuOOoPUtAHUHUedlVrW_g=@pm.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This set addresses the two most annoying sparse floods when building the
tree with C=3D{1,2}: one in asm/io.h (in several mangle-port.h actually),
and one in asm/checksum.h.
Both of these comes from lack of forced typecasting and hence harmless,
but complicates real bug hunting, as asm/io.h is included in almost
every driver, while asm/checksum.h is included in lots of networking
code.

I also fixed two wrong __mem_ioswabq() macros while was nearby.
Tested on Generic MIPS platform -- no more flooding in console (there's
one more source in mips-cm.h, but it's included in just a few files, so
not a real problem. It can be issued separately anyway), while objdump
doesn't see any difference at all.

Alexander Lobakin (3):
  MIPS: generic/ip32: io: fix __mem_ioswabq()
  MIPS: io: fix sparse flood on asm/io.h
  MIPS: checksum: fix sparse flooding on asm/checksum.h

 arch/mips/include/asm/checksum.h                     |  4 ++--
 .../include/asm/mach-cavium-octeon/mangle-port.h     | 12 +++++++++---
 arch/mips/include/asm/mach-generic/mangle-port.h     | 12 ++++++------
 arch/mips/include/asm/mach-ip27/mangle-port.h        |  6 +++---
 arch/mips/include/asm/mach-ip30/mangle-port.h        |  6 +++---
 arch/mips/include/asm/mach-ip32/mangle-port.h        |  6 +++---
 arch/mips/include/asm/mach-tx39xx/mangle-port.h      |  6 +++---
 arch/mips/include/asm/mach-tx49xx/mangle-port.h      |  6 +++---
 8 files changed, 32 insertions(+), 26 deletions(-)

--=20
2.27.0


