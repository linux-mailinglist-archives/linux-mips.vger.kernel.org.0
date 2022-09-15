Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63C615B9BC0
	for <lists+linux-mips@lfdr.de>; Thu, 15 Sep 2022 15:22:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbiIONWG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 15 Sep 2022 09:22:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229695AbiIONWD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 15 Sep 2022 09:22:03 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B72085FE3
        for <linux-mips@vger.kernel.org>; Thu, 15 Sep 2022 06:22:00 -0700 (PDT)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.54])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MSyTb31pdznTyF;
        Thu, 15 Sep 2022 21:19:15 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 15 Sep 2022 21:21:57 +0800
From:   Gaosheng Cui <cuigaosheng1@huawei.com>
To:     <tsbogend@alpha.franken.de>, <jiaxun.yang@flygoat.com>,
        <paulburton@kernel.org>, <hch@lst.de>, <konrad.wilk@oracle.com>,
        <david.daney@cavium.com>, <ralf@linux-mips.org>,
        <ddaney@caviumnetworks.com>, <florian@openwrt.org>,
        <cuigaosheng1@huawei.com>
CC:     <linux-mips@vger.kernel.org>
Subject: [PATCH 0/7] Remove orphan declarations for mips
Date:   Thu, 15 Sep 2022 21:21:50 +0800
Message-ID: <20220915132157.2132509-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This series contains a few cleanup patches, to remove unused
declarations which have been removed. Thanks!

Gaosheng Cui (7):
  MIPS: Loongson2ef: remove orphan sbx00_acpi_init() declaration
  MIPS: Octeon: remove orphan octeon_swiotlb declaration
  MIPS: Octeon: remove orphan cvmx_fpa_setup_pool() declaration
  MIPS: Octeon: remove orphan octeon_hal_setup_reserved32() declaration
  MIPS: IRQ: remove orphan declarations from arch/mips/include/asm/irq.h
  MIPS: remove orphan sni_cpu_time_init() declaration
  MIPS: AR7: remove orphan declarations from
    arch/mips/include/asm/mach-ar7/ar7.h

 arch/mips/include/asm/irq.h               |  2 --
 arch/mips/include/asm/mach-ar7/ar7.h      |  2 --
 arch/mips/include/asm/octeon/cvmx-fpa.h   | 20 --------------------
 arch/mips/include/asm/octeon/octeon.h     |  1 -
 arch/mips/include/asm/octeon/pci-octeon.h |  2 --
 arch/mips/include/asm/sni.h               |  3 ---
 arch/mips/loongson2ef/common/pci.c        |  2 --
 7 files changed, 32 deletions(-)

-- 
2.25.1

