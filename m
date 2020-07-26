Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1866422DADD
	for <lists+linux-mips@lfdr.de>; Sun, 26 Jul 2020 02:35:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728076AbgGZAeg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 25 Jul 2020 20:34:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727034AbgGZAeg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 25 Jul 2020 20:34:36 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38345C08C5C0;
        Sat, 25 Jul 2020 17:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=st2ECFJOxFlZ5/xWIEkr9NikQ5GLxltD8J0+EBvRykA=; b=Y/dPwwj0UHALTq4fZOUOXNp4pT
        /siNsfogCpPQ2HjwykYErn7Nc1lid/6J8tV5zfMe4Z2CDBfctucXEVh6x8ZL2YJea0PN+KXGRqt5J
        rezR4qS9BLITqkiG0EUm5oP4f/vmNn2meSPVmzAZvBxlHHLstLG8rS1YLbx/VnWKPAtb3KmLoNcTC
        6MjF3jcp07iiu7sqVucIzSMpn3CyINC+JKjABY/PWRDUpWIIDXUOuLzmbFkNM13aXDJTANZgiS4Hw
        QT7XSJ3A72jYz/PqFbJgm6HVUtYuwKc6OTE25QWSPvrDKWOSfuomIJMGJBoWyjwO3/TA0CY2Ogwx3
        Op0dZieQ==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jzUcc-000328-BN; Sun, 26 Jul 2020 00:34:34 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
Subject: [PATCH 1/6] mips: io.h: delete duplicated word
Date:   Sat, 25 Jul 2020 17:34:24 -0700
Message-Id: <20200726003429.20356-2-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200726003429.20356-1-rdunlap@infradead.org>
References: <20200726003429.20356-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Delete the repeated word "on".

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org
---
 arch/mips/include/asm/io.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20200720.orig/arch/mips/include/asm/io.h
+++ linux-next-20200720/arch/mips/include/asm/io.h
@@ -59,7 +59,7 @@
  * which all ports are being mapped.  For sake of efficiency some code
  * assumes that this is an address that can be loaded with a single lui
  * instruction, so the lower 16 bits must be zero.  Should be true on
- * on any sane architecture; generic code does not use this assumption.
+ * any sane architecture; generic code does not use this assumption.
  */
 extern unsigned long mips_io_port_base;
 
