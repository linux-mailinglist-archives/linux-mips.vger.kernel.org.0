Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D369D3D4E89
	for <lists+linux-mips@lfdr.de>; Sun, 25 Jul 2021 18:03:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231468AbhGYPWf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 25 Jul 2021 11:22:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231317AbhGYPWd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 25 Jul 2021 11:22:33 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E255DC061765;
        Sun, 25 Jul 2021 09:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=QP31E/sXq7t2KkleWi4kwdfFIuWaSTTxx1eHMbXw83k=; b=Etc9EI7KD/xNRvBEjHQUYguOwQ
        AUQnm2uUIzb1ditOcgk/KLVg1I0Ryaucz99ZmW6w62WdVIqrhKgRnjVeBguHL6eWUyYKcNuBB93Uf
        ZGuZqBgWxfNoFTIFTUmgLzZ+7dr2P5x7176kbxRWfOosZ1jVogk6U6SNyJ8hz0VuFmDVVNtKGq1PF
        I//lm5jLPtWk5XuYU5/kqNLUcbEQcr45/BPeNzazDzyLJdpbY4vyQNdtLyhFSBCsTggC3Lff2m8ic
        Jk3FAq2Ssxypgh/Tn9IMFueeQcV2Ywnq75kGtje1T04mp/RoUcdHraXv9BGK6rE4so+C6b7ffexla
        MqbdlY2w==;
Received: from [2601:1c0:6280:3f0::aefb] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1m7gai-008oIU-O1; Sun, 25 Jul 2021 16:03:00 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Aditya Srivastava <yashsri421@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: [PATCH 0/3] mips: expunge kernel-doc warnings
Date:   Sun, 25 Jul 2021 09:02:55 -0700
Message-Id: <20210725160258.28950-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Remove all kernel-doc warnings from arch/mips/ (as reported by the
kernel test robot).

[PATCH 1/3] mips: clean up (remove) kernel-doc in cavium-octeon/executive/
[PATCH 2/3] mips: clean up kernel-doc in cavium-octeon/*.c
[PATCH 3/3] mips: clean up kernel-doc in mm/c-octeon.c

Cc: Aditya Srivastava <yashsri421@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org
Cc: kernel test robot <lkp@intel.com>

 arch/mips/cavium-octeon/executive/cvmx-bootmem.c      |   10 +-
 arch/mips/cavium-octeon/executive/cvmx-cmd-queue.c    |   12 +-
 arch/mips/cavium-octeon/executive/cvmx-helper-board.c |    8 -
 arch/mips/cavium-octeon/executive/cvmx-helper-rgmii.c |   12 +-
 arch/mips/cavium-octeon/executive/cvmx-helper-xaui.c  |    8 -
 arch/mips/cavium-octeon/executive/cvmx-l2c.c          |    9 --
 arch/mips/cavium-octeon/executive/cvmx-pko.c          |   22 ++---
 arch/mips/cavium-octeon/executive/cvmx-spi.c          |   20 ++--
 arch/mips/cavium-octeon/flash_setup.c                 |    2 
 arch/mips/cavium-octeon/setup.c                       |   43 +++++-----
 arch/mips/cavium-octeon/smp.c                         |   14 +--
 arch/mips/mm/c-octeon.c                               |   29 +++---
 12 files changed, 93 insertions(+), 96 deletions(-)
