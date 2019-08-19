Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07CFB92690
	for <lists+linux-mips@lfdr.de>; Mon, 19 Aug 2019 16:23:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726947AbfHSOXd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 19 Aug 2019 10:23:33 -0400
Received: from forward104p.mail.yandex.net ([77.88.28.107]:34305 "EHLO
        forward104p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726186AbfHSOXc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 19 Aug 2019 10:23:32 -0400
Received: from mxback17j.mail.yandex.net (mxback17j.mail.yandex.net [IPv6:2a02:6b8:0:1619::93])
        by forward104p.mail.yandex.net (Yandex) with ESMTP id DF2784B014B0;
        Mon, 19 Aug 2019 17:23:29 +0300 (MSK)
Received: from smtp1o.mail.yandex.net (smtp1o.mail.yandex.net [2a02:6b8:0:1a2d::25])
        by mxback17j.mail.yandex.net (nwsmtp/Yandex) with ESMTP id DLHYBARxIc-NTpO5jWB;
        Mon, 19 Aug 2019 17:23:29 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1566224609;
        bh=9YkThHcaGEABy/MCHzOqFPlxglUZo3f/qPoiA8bYw6c=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=v+i/Cw68+4AgNJ1NpkkV93KdusPBXNZ3IRoHI+OA9tfV3Kj/cwnoi1SxpmzL+iS+T
         TOE/3uYTF7gRIwTPxkjQApVwZXTYy2C9J6d8klji29uyaYVibxMem53Ac36E/Wrt/5
         COtFksBs5UhHVmjW3MM2O3WtUWnn5Fm1doGHEpSk=
Authentication-Results: mxback17j.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by smtp1o.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id StE3L42zOl-NPUmg4Kq;
        Mon, 19 Aug 2019 17:23:27 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     paul.burton@mips.com, yasha.che3@gmail.com, aurelien@aurel32.net,
        sfr@canb.auug.org.au, fancer.lancer@gmail.com,
        matt.redfearn@mips.com, chenhc@lemote.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v1 0/8] MIPS: Drop boot_mem_map
Date:   Mon, 19 Aug 2019 22:23:05 +0800
Message-Id: <20190819142313.3535-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190808075013.4852-1-jiaxun.yang@flygoat.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

v1: Reording patches, fixes according to Serge's suggestions,
fix maar section mismatch.

Jiaxun Yang (8):
  MIPS: OCTEON: Drop boot_mem_map
  MIPS: fw: Record prom memory
  MIPS: malta: Drop prom_free_prom_memory
  MIPS: msp: Record prom memory
  MIPS: ip22: Drop addr_is_ram
  MIPS: xlp: Drop boot_mem_map
  MIPS: mm: Drop boot_mem_map
  MIPS: init: Drop boot_mem_map

 arch/mips/cavium-octeon/dma-octeon.c |  17 +-
 arch/mips/cavium-octeon/setup.c      |   3 +-
 arch/mips/fw/arc/memory.c            |  24 +-
 arch/mips/include/asm/bootinfo.h     |  16 --
 arch/mips/include/asm/maar.h         |   8 +-
 arch/mips/kernel/setup.c             | 355 +++++++--------------------
 arch/mips/mm/init.c                  |  82 +++----
 arch/mips/mti-malta/malta-memory.c   |  11 -
 arch/mips/netlogic/xlp/setup.c       |  12 +-
 arch/mips/pmcs-msp71xx/msp_prom.c    |  22 +-
 arch/mips/sgi-ip22/ip28-berr.c       |  20 +-
 11 files changed, 173 insertions(+), 397 deletions(-)

-- 
2.22.0

