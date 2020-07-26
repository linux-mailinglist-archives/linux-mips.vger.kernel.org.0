Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 100FC22DAD4
	for <lists+linux-mips@lfdr.de>; Sun, 26 Jul 2020 02:34:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728135AbgGZAej (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 25 Jul 2020 20:34:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727034AbgGZAei (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 25 Jul 2020 20:34:38 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6597C08C5C0;
        Sat, 25 Jul 2020 17:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=9Of6SQR8Z8xqGqlVKIua3hGU8KQ+CACt6X4R/sjXbiA=; b=cZzlONws0YXucIHvzN1JVL2R98
        MBI6/kb9z+9BC3zcMEeRqnfPsJ4avE8li1/dmGUWOKLnE5mkoLYAB9AR1L7AzVNaBIBJteRNJRSrq
        /BeqFP/n6mS6motK6Gs3d2G6xY2dGLqJQdJzvC9m4To+rolqAww4LdrrDJGG14XpOe2vsWSdxuh4d
        S78wukQK2NKGXmCRzvZNjMaGr1yBNZASbLLzPr4kZls8fQSnpMWmkrUO7PZrQLxB3gvLoKs9PQotd
        Pv4SGO5PO+8mgwQ//CkFMPETPjx5Tt9/bEiitJQ+sgH9He+R4HCRcEq9wU+jELBJlc45/w7W2ejwP
        /JDazZCQ==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jzUce-000328-0n; Sun, 26 Jul 2020 00:34:36 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
Subject: [PATCH 2/6] mips: octeon: cvmx-l2c.h: delete duplicated word
Date:   Sat, 25 Jul 2020 17:34:25 -0700
Message-Id: <20200726003429.20356-3-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200726003429.20356-1-rdunlap@infradead.org>
References: <20200726003429.20356-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Delete the repeated word "Returns".

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org
---
 arch/mips/include/asm/octeon/cvmx-l2c.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20200720.orig/arch/mips/include/asm/octeon/cvmx-l2c.h
+++ linux-next-20200720/arch/mips/include/asm/octeon/cvmx-l2c.h
@@ -327,7 +327,7 @@ void cvmx_l2c_flush(void);
 
 /**
  *
- * Returns Returns the size of the L2 cache in bytes,
+ * Returns the size of the L2 cache in bytes,
  * -1 on error (unrecognized model)
  */
 int cvmx_l2c_get_cache_size_bytes(void);
