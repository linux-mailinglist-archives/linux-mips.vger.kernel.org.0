Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73E9939FBB2
	for <lists+linux-mips@lfdr.de>; Tue,  8 Jun 2021 18:06:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231221AbhFHQIS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Jun 2021 12:08:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230523AbhFHQIR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Jun 2021 12:08:17 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D6A1C061574;
        Tue,  8 Jun 2021 09:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=Rdgj+Ts6eEAHTRBjOLsHiLNSbIi9S90acEKIrhbynF0=; b=qzFtnNTFmjF8Bait7y64aPFZjN
        CG2xrZHMA96jvX4qfRKYO5q71QNoW/BKkemB5jooCYQBcQqtahwoHyvnRng4gkQ4p0EjCDnxe+t9+
        Lw573yQw6PEwJ74VCgSfbMxmrKoah4Fzox9v+HoEW/jDOqe2nHBWUHypRgDL5B/kogWv5Z4Dk97La
        +Y9hvgpZuOxpkbmkF/VrP06Wn+CZNQ4jEbMhqUXmQj26SUv+5Uagwjfn2tabJrBmUVgS7jcH+mmT2
        9DPQOluGnmWUso/06e7SWZ/eezBK/hWJ8lN3DjOKZPMmLH+jw9Or7ECR42QNO1i8OPZDLTNnr9+jC
        R4oNA/TQ==;
Received: from [2001:4bb8:192:ff5f:74ed:7c4f:a5ee:8dcb] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1lqeEx-009RZp-AE; Tue, 08 Jun 2021 16:06:08 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Geoff Levand <geoff@infradead.org>,
        Ilya Dryomov <idryomov@gmail.com>,
        Dongsheng Yang <dongsheng.yang@easystack.cn>,
        Mike Snitzer <snitzer@redhat.com>,
        Ira Weiny <ira.weiny@intel.com>, dm-devel@redhat.com,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-block@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        ceph-devel@vger.kernel.org
Subject: switch the block layer to use kmap_local_page
Date:   Tue,  8 Jun 2021 18:05:47 +0200
Message-Id: <20210608160603.1535935-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi all,

this series switches the core block layer code and all users of the
existing bvec kmap helpers to use kmap_local_page.  Drivers that
currently use open coded kmap_atomic calls will converted in a follow
on series.

Diffstat:
 arch/mips/include/asm/mach-rc32434/rb.h |    2 -
 block/bio-integrity.c                   |   14 ++++------
 block/bio.c                             |   37 +++++++---------------------
 block/blk-map.c                         |    2 -
 block/bounce.c                          |   35 ++++++--------------------
 block/t10-pi.c                          |   16 ++++--------
 drivers/block/ps3disk.c                 |   19 ++------------
 drivers/block/rbd.c                     |   15 +----------
 drivers/md/dm-writecache.c              |    5 +--
 include/linux/bio.h                     |   42 --------------------------------
 include/linux/bvec.h                    |   27 ++++++++++++++++++--
 include/linux/highmem.h                 |    4 +--
 12 files changed, 64 insertions(+), 154 deletions(-)
