Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83B0A34ACD0
	for <lists+linux-mips@lfdr.de>; Fri, 26 Mar 2021 17:49:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230159AbhCZQsa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 26 Mar 2021 12:48:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230106AbhCZQsN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 26 Mar 2021 12:48:13 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ED04C0613AA
        for <linux-mips@vger.kernel.org>; Fri, 26 Mar 2021 09:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=Jkor4irRqM0JrTpyvKkV77vzym2AqLtVvp+/4NT6wbY=; b=zK0taK642aTcAPI8ENcZM8gl4j
        6KX5ppMBd7+t5zchiAVEMSmOkjFmeh8eMs7xtUWz1OwIDEHHdj25f0HYcyyYP2SOJ7fP1W/isKobt
        nwhJVSTQvF0ipU8TXNQlCRlKpq43dx8DF4i7rNJyJtgQvdY4weDwNYjLQmB8j4tdOnrmox7L7Js8Q
        //SCusDRlnKt6Mjjat9uaCuh4XSARQP6Ud0ohPmzxln48WQTX+vfgt6fua7JTfGvbaF0VCu5cnId3
        gdnviFWii+wChY4A0IdV6yYWr2/Uk7TOzb7gt9z1RRU7imwRHKLzWQPn7L5ja3739pxLUSS+Cf1Ek
        0TvHSs9A==;
Received: from 97-173-191-90.dyn.estpak.ee ([90.191.173.97] helo=ubuntu)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <sandberg@mailfence.com>)
        id 1lPpd3-0004uN-Pj; Fri, 26 Mar 2021 18:48:10 +0200
Received: by ubuntu (sSMTP sendmail emulation); Fri, 26 Mar 2021 18:48:09 +0200
From:   Mauri Sandberg <sandberg@mailfence.com>
To:     sandberg@mailfence.com
Cc:     f.fainelli@gmail.com, linux-mips@vger.kernel.org,
        tsbogend@alpha.franken.de
Subject: [PATCH v2 0/1] MIPS: fix compilation error
Date:   Fri, 26 Mar 2021 18:46:44 +0200
Message-Id: <20210326164645.433147-1-sandberg@mailfence.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210326134158.268164-1-sandberg@mailfence.com>
References: <20210326134158.268164-1-sandberg@mailfence.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 90.191.173.97
X-SA-Exim-Mail-From: sandberg@mailfence.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Earlier I had some confusion with my configuration as compared to
ath79_defconfig but now it looks like that enabling
CONFIG_MIPS_ELF_APPENDED_DTB alone will break compilation.

Simple fix of removing 'const' did not work and something more is needed.
At this point I would suggest reverting the patch until it's properly
fixed.

I am willing to help with testing if that is needed.

Thanks,
Mauri

Mauri Sandberg (1):
  Revert "MIPS: of: Introduce helper function to get DTB"

 arch/mips/ath79/setup.c               | 13 ++++++-----
 arch/mips/bmips/setup.c               |  7 +++---
 arch/mips/generic/init.c              |  5 +++--
 arch/mips/include/asm/bootinfo.h      | 22 +------------------
 arch/mips/include/asm/octeon/octeon.h |  1 +
 arch/mips/kernel/head.S               | 31 +++++++++++++++++++++++++++
 arch/mips/kernel/setup.c              |  4 ++++
 arch/mips/lantiq/prom.c               |  7 ++++--
 arch/mips/pic32/pic32mzda/init.c      | 15 ++++++++++++-
 arch/mips/ralink/of.c                 | 11 +++++++---
 10 files changed, 77 insertions(+), 39 deletions(-)


base-commit: 509d36a941a3466b78d4377913623d210b162458
-- 
2.25.1

