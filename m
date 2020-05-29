Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D33D1E845A
	for <lists+linux-mips@lfdr.de>; Fri, 29 May 2020 19:10:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725839AbgE2RKc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 May 2020 13:10:32 -0400
Received: from [115.28.160.31] ([115.28.160.31]:54470 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S1725821AbgE2RKc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 29 May 2020 13:10:32 -0400
Received: from localhost.localdomain (unknown [116.236.177.50])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 6308B600B5;
        Sat, 30 May 2020 01:10:27 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1590772227; bh=ws7rbod/BuGxMR0lY8uPxlvbp/b4yKJo3tXnGlGADFg=;
        h=From:To:Cc:Subject:Date:From;
        b=e/APdZCe84Z0FKR1201Z0QWxQOp8eWbJBXX0GjFuIT3ITDdAa3tOHGrt50obybTh6
         ZevVvGNyjsjskYRGpC67XoWlP/yueOyzHqNcWXTcR5SVqQBP5kL4l2OPS7lV/W9BtU
         7TuznpfMs/VB+hw8o0mANo33Pa3WPl+poDs+gXTA=
From:   WANG Xuerui <git@xen0n.name>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     WANG Xuerui <git@xen0n.name>, linux-mips@vger.kernel.org
Subject: [PATCH 0/2] CPUCFG emulation future-proofing & HWCAP addition
Date:   Sat, 30 May 2020 01:09:58 +0800
Message-Id: <20200529171000.8905-1-git@xen0n.name>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This patch series future-proofs the CPUCFG emulation, in light of
possibility of new Loongson cores still lacking native CPUCFG.
Also an HWCAP flag bit is allocated and exposed for userspace's probing
convenience, per the earlier plan shared on the mailing list.

WANG Xuerui (2):
  MIPS: Loongson64: Guard against future cores without CPUCFG
  MIPS: Expose Loongson CPUCFG availability via HWCAP

 .../include/asm/mach-loongson64/cpucfg-emul.h | 11 +++++
 arch/mips/include/uapi/asm/hwcap.h            |  1 +
 arch/mips/kernel/traps.c                      |  4 ++
 arch/mips/loongson64/cpucfg-emul.c            | 46 +++++++++++--------
 4 files changed, 44 insertions(+), 18 deletions(-)

-- 
2.26.2

