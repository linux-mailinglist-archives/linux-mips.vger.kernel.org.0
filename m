Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BFB95BCFA1
	for <lists+linux-mips@lfdr.de>; Mon, 19 Sep 2022 16:51:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229773AbiISOvN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 19 Sep 2022 10:51:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbiISOvI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 19 Sep 2022 10:51:08 -0400
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 81900DF0B
        for <linux-mips@vger.kernel.org>; Mon, 19 Sep 2022 07:51:07 -0700 (PDT)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1oaI6u-0005ft-07; Mon, 19 Sep 2022 16:51:00 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id C6B18C12F2; Mon, 19 Sep 2022 16:50:46 +0200 (CEST)
Date:   Mon, 19 Sep 2022 16:50:46 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Gaosheng Cui <cuigaosheng1@huawei.com>
Cc:     jiaxun.yang@flygoat.com, paulburton@kernel.org, hch@lst.de,
        konrad.wilk@oracle.com, david.daney@cavium.com,
        ralf@linux-mips.org, ddaney@caviumnetworks.com,
        florian@openwrt.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH 0/7] Remove orphan declarations for mips
Message-ID: <20220919145046.GG7674@alpha.franken.de>
References: <20220915132157.2132509-1-cuigaosheng1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220915132157.2132509-1-cuigaosheng1@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Sep 15, 2022 at 09:21:50PM +0800, Gaosheng Cui wrote:
> This series contains a few cleanup patches, to remove unused
> declarations which have been removed. Thanks!
> 
> Gaosheng Cui (7):
>   MIPS: Loongson2ef: remove orphan sbx00_acpi_init() declaration
>   MIPS: Octeon: remove orphan octeon_swiotlb declaration
>   MIPS: Octeon: remove orphan cvmx_fpa_setup_pool() declaration
>   MIPS: Octeon: remove orphan octeon_hal_setup_reserved32() declaration
>   MIPS: IRQ: remove orphan declarations from arch/mips/include/asm/irq.h
>   MIPS: remove orphan sni_cpu_time_init() declaration
>   MIPS: AR7: remove orphan declarations from
>     arch/mips/include/asm/mach-ar7/ar7.h
> 
>  arch/mips/include/asm/irq.h               |  2 --
>  arch/mips/include/asm/mach-ar7/ar7.h      |  2 --
>  arch/mips/include/asm/octeon/cvmx-fpa.h   | 20 --------------------
>  arch/mips/include/asm/octeon/octeon.h     |  1 -
>  arch/mips/include/asm/octeon/pci-octeon.h |  2 --
>  arch/mips/include/asm/sni.h               |  3 ---
>  arch/mips/loongson2ef/common/pci.c        |  2 --
>  7 files changed, 32 deletions(-)

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
