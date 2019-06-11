Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89A203CF3F
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2019 16:43:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391532AbfFKOli (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 11 Jun 2019 10:41:38 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:37476 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390359AbfFKOlh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 11 Jun 2019 10:41:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=o2J4Gd6aGMYycQc2Cgd8ykATa6/NVo6qP3SsoSO5AUQ=; b=NooVa7odzLv7IOhiLuJXRzdAT
        9847NXr6KbmlQQbCdm/roXtU733/1c0TujxJALV/CRskCxkSZJxIjTuvYje4Hu2HIx2/18lsT2IkT
        V4S9ZLfKxOjzNiNdjE9YSFiOAuEFWncLCMqFlld9C8E0tZO1blw/UZUNEDSAKtGyMp1ujFWNiFfe7
        bemGU+fEPeBzJVI3EYWYyNcNlr9PPjI0kHfUCTEX9tUwAnnuaSJSqAOCWqlHSD1idi9GIdvUa4nKM
        oFIEUMzaP5Hxm/4DCKB8Fju5R0z5GUcY9hrj8tNMF/3Z6P45ZzjIK8YKFH6ozHQKYWGLVdntjkdeO
        jfIDBIm1w==;
Received: from mpp-cp1-natpool-1-037.ethz.ch ([82.130.71.37] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hahxS-0005NR-8l; Tue, 11 Jun 2019 14:41:06 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>
Cc:     Nicholas Piggin <npiggin@gmail.com>,
        Khalid Aziz <khalid.aziz@oracle.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-mips@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-mm@kvack.org, x86@kernel.org, linux-kernel@vger.kernel.org
Subject: switch the remaining architectures to use generic GUP v3
Date:   Tue, 11 Jun 2019 16:40:46 +0200
Message-Id: <20190611144102.8848-1-hch@lst.de>
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
management, so handle with care.

Changes since v2:
 - rebase to mainline to pick up the untagged_addr definition
 - fix the gup range check to be start <= end to catch the 0 length case
 - use pfn based version for the missing pud_page/pgd_page definitions
 - fix a wrong check in the sparc64 version of pte_access_permitted

Changes since v1:
 - fix various issues found by the build bot
 - cherry pick and use the untagged_addr helper form Andrey
 - add various refactoring patches to share more code over architectures
 - move the powerpc hugepd code to mm/gup.c and sync it with the generic
   hup semantics
