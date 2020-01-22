Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C16E145345
	for <lists+linux-mips@lfdr.de>; Wed, 22 Jan 2020 11:59:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728931AbgAVK7e (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 Jan 2020 05:59:34 -0500
Received: from mail.dlink.ru ([178.170.168.18]:54914 "EHLO fd.dlink.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726219AbgAVK7e (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 22 Jan 2020 05:59:34 -0500
Received: by fd.dlink.ru (Postfix, from userid 5000)
        id D56191B2025C; Wed, 22 Jan 2020 13:59:31 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 fd.dlink.ru D56191B2025C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dlink.ru; s=mail;
        t=1579690772; bh=q9dD2Cr59uR3VZnrDzVBjRZfBPQ42Iq20hp5A0NIbfM=;
        h=From:To:Cc:Subject:Date;
        b=bj5rSvCSaAQYN8nKQtedqE3otEt+XcbfBX4n4ivOTeJKRB/dfY2pguBTs9l6Tsk8w
         Lrzfv9/3bLsdP9N4fNxM8tgH9lZ6sq4qvibz8cm/1tsCTNvCMyFG0n/2HB7TWPbFFX
         KEDYtvnjYsowDwtIX9DG8GWodrWT/hH9sycM5AmU=
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.dlink.ru
X-Spam-Level: 
X-Spam-Status: No, score=-99.2 required=7.5 tests=BAYES_50,USER_IN_WHITELIST
        autolearn=disabled version=3.4.2
Received: from mail.rzn.dlink.ru (mail.rzn.dlink.ru [178.170.168.13])
        by fd.dlink.ru (Postfix) with ESMTP id 319741B204A3;
        Wed, 22 Jan 2020 13:59:20 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 fd.dlink.ru 319741B204A3
Received: from mail.rzn.dlink.ru (localhost [127.0.0.1])
        by mail.rzn.dlink.ru (Postfix) with ESMTP id CF9EC1B217C5;
        Wed, 22 Jan 2020 13:59:18 +0300 (MSK)
Received: from localhost.localdomain (unknown [196.196.203.126])
        by mail.rzn.dlink.ru (Postfix) with ESMTPA;
        Wed, 22 Jan 2020 13:59:18 +0300 (MSK)
From:   Alexander Lobakin <alobakin@dlink.ru>
To:     Paul Burton <paulburton@kernel.org>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Will Deacon <will@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Alexander Lobakin <alobakin@dlink.ru>,
        Michal Simek <michal.simek@xilinx.com>,
        Allison Randal <allison@lohutok.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH mips-next 0/5] MIPS: a set of misc Kconfig/Kbuild improvements
Date:   Wed, 22 Jan 2020 13:58:47 +0300
Message-Id: <20200122105852.8788-1-alobakin@dlink.ru>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This patchset aims mainly at MIPS and Generic MIPS Kconfig optimizations
except for the last patch that removes redundant BASE_BAUD override for
Generic MIPS. If it should go out of this series, please let me know.
All changes were fully tested on Generic MIPS32R2 board, but I admit
there potentionally might be any non-critical issues on other systems
(unlikely though).

Alexander Lobakin (5):
  MIPS: don't explicitly select LIBFDT in Kconfig
  MIPS: generic: don't unconditionally select PINCTRL
  MIPS: make CPU_HAS_LOAD_STORE_LR opt-out
  MIPS: sort MIPS and MIPS_GENERIC Kconfig selects alphabetically
    (again)
  Revert "MIPS: Add custom serial.h with BASE_BAUD override for generic
    kernel"

 arch/mips/Kconfig                             | 60 ++++++-------------
 arch/mips/configs/generic/board-ocelot.config |  1 +
 arch/mips/include/asm/Kbuild                  |  1 +
 arch/mips/include/asm/serial.h                | 18 ------
 arch/mips/kernel/unaligned.c                  | 36 +++++------
 arch/mips/lib/memcpy.S                        | 14 ++---
 arch/mips/lib/memset.S                        | 16 ++---
 7 files changed, 52 insertions(+), 94 deletions(-)
 delete mode 100644 arch/mips/include/asm/serial.h

-- 
2.25.0

