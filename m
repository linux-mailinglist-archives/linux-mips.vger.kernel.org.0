Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3AC22A492
	for <lists+linux-mips@lfdr.de>; Sat, 25 May 2019 15:32:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726974AbfEYNcR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 25 May 2019 09:32:17 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:50350 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726838AbfEYNcR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 25 May 2019 09:32:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=Fclx2EkLgGZXMWSnoaUIWWcWHkhmXZk15XX3q1+NpkY=; b=qMmTNCLA+cd0wrgFY7M1IdfhH
        a7UH0ogu20h1J5SiJ/CDdmDVN9+6plSUgOdLtw3s3GA2P9KXe6LQZlEXEKL0WcNscFuhnXCdw2lxO
        VuHb5eNnQXbvfmNnQUqHuEmqKzqRxazORsOaeMyDwmRz5w9p3gMNhCdrtTJ4VLUohQnwaiDFp1Qsv
        XFRTyZ3rwPRms3QA30d7IAPD/xQIcNt9mcpAZSyEVPZA+e3w2S28DBaUJrnQVYVIthXWpPO2fQy8i
        uQ1Z5oaqOxJXFLu3lOo+SJMMZQNl9Yl23YrszkAJElJUuHdqZlRJdv2gxlf3DCUZk3fInV7so85zJ
        WqCevvc0g==;
Received: from 213-225-10-46.nat.highway.a1.net ([213.225.10.46] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hUWmM-0006Xn-Vj; Sat, 25 May 2019 13:32:07 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>
Cc:     Nicholas Piggin <npiggin@gmail.com>, linux-mips@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: RFC: switch the remaining architectures to use generic GUP
Date:   Sat, 25 May 2019 15:31:57 +0200
Message-Id: <20190525133203.25853-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Linus and maintainers,

below is a series to switch mips, sh and sparc64 to use the generic
GUP code so that we only have one codebase to touch for further
improvements to this code.  I don't have hardware for any of these
architectures, and generally no clue about their page table
management, so handle with care.  But it at least survives a
basic defconfig compile test..
