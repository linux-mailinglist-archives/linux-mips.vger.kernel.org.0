Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DDA11AC7DE
	for <lists+linux-mips@lfdr.de>; Thu, 16 Apr 2020 17:01:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389074AbgDPPAT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Apr 2020 11:00:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2388235AbgDPPAR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 16 Apr 2020 11:00:17 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 993F1C061A0C;
        Thu, 16 Apr 2020 08:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=uYntwwOxHl+eWmrggy0D1lZ6buzvACNOsmvvl0lx4SM=; b=nYkexzPURS/EEaBQzLNs6ZJPtY
        iXXeif5/EFTvuipZKQz0BouVV3czxminJPIipTRWE+1tuUi/189SxUUAIXh+sMh1wE/AMHQuQhCLa
        wFYwxEplgeD16FEvzoPHa6ClGQ9ZK/lcHBr/wKiIYTFTwBYcbWmyCjfA5wAEpmDx1hjBN4Ke48VTI
        FVSQ48dRRq+fZWRGREvz+o/oEt4q2IrPWYh1DLPvCBPJb6QlCzuSz7qQojJXH6J7j6sucJumsagVP
        9EFeSRjp/5S4kgcB43Q9ag7iqI2D9LhbhvheItZ9PTRz6xXRXnZFT6OUTM6P3MZ8wTGzfngQoVLhQ
        tywJXWRA==;
Received: from [2001:4bb8:184:4aa1:c70:4a89:bc61:2] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jP5zx-0001nv-Jg; Thu, 16 Apr 2020 15:00:14 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: MIPS ioremap cleanups v2
Date:   Thu, 16 Apr 2020 17:00:04 +0200
Message-Id: <20200416150011.820984-1-hch@lst.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Thomas,

below is a bunch of cleanups for the MIPS ioremap code.  Compile tested
only.

Changes since v1:
 - don't remove cpu_has_64bit_gp_regs
 - add a new prep patch to stop txx9aclc-ac97 from poking into ioremap
   internals
