Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D86D6367AD6
	for <lists+linux-mips@lfdr.de>; Thu, 22 Apr 2021 09:19:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230316AbhDVHUU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 22 Apr 2021 03:20:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230324AbhDVHUT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 22 Apr 2021 03:20:19 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CA55C06174A
        for <linux-mips@vger.kernel.org>; Thu, 22 Apr 2021 00:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=aEdQBTMaUl2RRYZxc6tzp9x+ou0hYnPrwcHo24gdihQ=; b=jzhBxobmLoI0NNUrL8/EfTlash
        db9hFe8bub19NNsbPLexbUbQ/0Oek+2WiesnCwx+loiACq5t8ge/EL9W4DSMZFpoY87u/RPIoJkV0
        skPkrzEfku4t6XaFVhJGfYG1YSfoV53RnF9KVwcg5ui97sd7esymHU1XwRs6WoLw1zeQ/xSUREnAc
        pLvhgSOCyQ9FtJwrIeBOmivQMw3NSJjC5ztzsFnOy7RFUbjIm1NeQM1uhJ+ll3xBSMmyBBrUfwNnU
        aNTNXR8y7wle+wwoQB70hJnfC//sRMKPPOusASzTKEHs37fKR/o1nitVIKirzjTWHnkI4mspElf5g
        mAplpQhw==;
Received: from [2001:4bb8:19b:f845:15fc:cef6:715a:fb03] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lZTcS-00DRkA-CT; Thu, 22 Apr 2021 07:19:24 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc:     Tom Lendacky <thomas.lendacky@amd.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org
Subject: cleanup and fix swiotlb sizing
Date:   Thu, 22 Apr 2021 09:19:14 +0200
Message-Id: <20210422071921.1428607-1-hch@lst.de>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi all,

based on a report from Tom that overriding the default sizing provided
by the x86 SEV code on the command line doesn't work anymore, this series
cleans up how we handle default and command line sizes for the swiotlb
buffer and then fixes the recently introduced bug in a straight-forward
way.

Diffstat:
 arch/mips/cavium-octeon/dma-octeon.c      |   16 +--------------
 arch/mips/include/asm/octeon/pci-octeon.h |    1 
 arch/mips/pci/pci-octeon.c                |    2 -
 arch/powerpc/platforms/pseries/svm.c      |   13 ++----------
 drivers/xen/swiotlb-xen.c                 |    2 -
 include/linux/swiotlb.h                   |    2 -
 kernel/dma/swiotlb.c                      |   32 +++++++++++++++---------------
 7 files changed, 25 insertions(+), 43 deletions(-)
