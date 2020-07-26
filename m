Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6502E22DAD0
	for <lists+linux-mips@lfdr.de>; Sun, 26 Jul 2020 02:34:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727101AbgGZAef (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 25 Jul 2020 20:34:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727034AbgGZAef (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 25 Jul 2020 20:34:35 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14663C08C5C0;
        Sat, 25 Jul 2020 17:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=HvKiUE8vKn1AjgQg21AJZBevWr9i4FwyWssJDygpqgk=; b=DohzzhVjFvngNE5D36jS2Q01fH
        Cphn2mPeELR3SE8/rN/fUP+TI36s5xbPo9P39XI5BwPk2KvAjoanVsZN5ZpGM9bqnviUS49TiLphg
        U4fFAd7EMCUCBeqmPR3MdiiL3cYwrPlVLJQDq8OubNmZDGdPsTtuLgo48l5AG+EmFx2BOKs7yS1Kz
        lozjmyJO9FfbGfT7cTxG60f6NRWHwTk4Z2vmSuz00eAS5AFNfOEX4MizHWrUPWDB0NOE5A+lelVN4
        vrTjuIdmTuVPNEL9a6H7RZ+/AjVc8nUbj8l/PtEr1CvgTPhRrlAGOePUAN7NFbeEIoQRdaIqiFdrz
        aJ6+SPGA==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jzUca-000328-NA; Sun, 26 Jul 2020 00:34:33 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
Subject: [PATCH 0/6] mips: delete duplicated words
Date:   Sat, 25 Jul 2020 17:34:23 -0700
Message-Id: <20200726003429.20356-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Delete duplicated words in arch/mips/ header files.

Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org

 arch/mips/include/asm/io.h              |    2 +-
 arch/mips/include/asm/octeon/cvmx-l2c.h |    2 +-
 arch/mips/include/asm/octeon/cvmx-pip.h |    2 +-
 arch/mips/include/asm/octeon/cvmx-pko.h |    7 +++----
 arch/mips/include/asm/octeon/cvmx-pow.h |    8 ++++----
 arch/mips/include/asm/octeon/octeon.h   |    2 +-
 6 files changed, 11 insertions(+), 12 deletions(-)
