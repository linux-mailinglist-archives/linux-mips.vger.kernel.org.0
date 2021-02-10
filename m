Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AFE731630A
	for <lists+linux-mips@lfdr.de>; Wed, 10 Feb 2021 11:00:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230340AbhBJJ7l (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Feb 2021 04:59:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230362AbhBJJ53 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Feb 2021 04:57:29 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E2B7C061574;
        Wed, 10 Feb 2021 01:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=BrUYSTaTW1e8xfs22Uv2txfuMyOzowe0x7y8KWioAkI=; b=objhhjPX/Ddcl19rnluY4m3wtU
        s1nu7oXVypTcGWPEhqSLqA2ftEA5iw4zbHgl7M8BxmplY9sUVubNj2iYzimdWnt2zYYsCwhkPR96O
        NOyj4Jzbp+11KAFQi1lGSqrfw1FDpKGwX9jVggi9UZ6zFfoJKQGeRIEKGjXDpUHsNutenkaIth/Jk
        AW9WvvrjCIGx9QzdFdJ22hY3idFBCr2AEl9iBHwJqJCwAr5K1Q3UKUxHqK4d/2NOA/IqGX/PWGsvB
        wEz8RYWS52Q5lWApiySaofRWOhaB5If/ixDGOCetc4cgB/QPWTuyoujq3KYrsqVOY69rIZ+Mc7bUC
        F7q7az8g==;
Received: from [2001:4bb8:184:7d04:5e70:671e:7b3:191] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1l9mEl-008g47-L1; Wed, 10 Feb 2021 09:56:44 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org
Subject: MIPS noncoherent DMA cleanups v2
Date:   Wed, 10 Feb 2021 10:56:35 +0100
Message-Id: <20210210095641.23856-1-hch@lst.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Thomas,

this series cleans up some of the mips (maybe) noncoherent support.
It also remove the need for the special <asm/dma-coherence.h> header only
provided by mips.

Changes since v1:
 - fix a bisection issue due to a missing brace
 - simplify the parameter parsing given that it happens after
   plat_mem_init
