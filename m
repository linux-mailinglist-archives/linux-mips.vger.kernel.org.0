Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB94B22DADA
	for <lists+linux-mips@lfdr.de>; Sun, 26 Jul 2020 02:34:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728203AbgGZAep (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 25 Jul 2020 20:34:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728199AbgGZAep (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 25 Jul 2020 20:34:45 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C38A9C08C5C0;
        Sat, 25 Jul 2020 17:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=bO8mC88MKszxuKvPDLhmpYX37THoX1W9wcy78nU2bQ4=; b=ny9Xpg8Ixq338iEFm4IT+DdDiJ
        i6GjE00NrrIsKjhOB4/OCP1VRk5j9kFT3AMOHA3ga9wRg8wl19CIFcVqGaVSpQyb7Z5AEWKKvHhFH
        hdberdzWbay0xrNW1H75cM6SCclKMUIkAaDY0V0Czj05mINTq+/gNPLCg/KLP79ZTVoom8Jh6O034
        TedJaS1rqRKNcoDllFeHGZOrOySQiUfouoCqGeNQuATD7oIG0eKQxDSEZkgT9t5qlU//0PIV7FXsL
        wmq2Q6w/VVHd2g68aW8GJlRSYhoB0iw9RDARhWv0ZsDeGhQsvaysItm9Orl8DWsoywToB+F7kgop3
        vvTGjW0Q==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jzUck-000328-P0; Sun, 26 Jul 2020 00:34:43 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
Subject: [PATCH 6/6] mips: octeon: octeon.h: delete duplicated word
Date:   Sat, 25 Jul 2020 17:34:29 -0700
Message-Id: <20200726003429.20356-7-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200726003429.20356-1-rdunlap@infradead.org>
References: <20200726003429.20356-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Delete the repeated word "as".

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org
---
 arch/mips/include/asm/octeon/octeon.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20200720.orig/arch/mips/include/asm/octeon/octeon.h
+++ linux-next-20200720/arch/mips/include/asm/octeon/octeon.h
@@ -198,7 +198,7 @@ union octeon_cvmemctl {
 		 * CvmMemCtl[DIDTTO] */
 		__BITFIELD_FIELD(uint64_t didtto2:1,
 		/* R/W If set, marked write-buffer entries time out
-		 * the same as as other entries; if clear, marked
+		 * the same as other entries; if clear, marked
 		 * write-buffer entries use the maximum timeout. */
 		__BITFIELD_FIELD(uint64_t dismarkwblongto:1,
 		/* R/W If set, a merged store does not clear the
