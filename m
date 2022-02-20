Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B4AC4BD2E2
	for <lists+linux-mips@lfdr.de>; Mon, 21 Feb 2022 01:19:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242341AbiBTX5V (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 20 Feb 2022 18:57:21 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:60784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244799AbiBTX5O (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 20 Feb 2022 18:57:14 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 920D1140FD
        for <linux-mips@vger.kernel.org>; Sun, 20 Feb 2022 15:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        Subject:From:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=uK/cyYZdOSqZL8n2oUDQPF3bK9NWU8SNKEiJuzyvL2E=; b=kZHtrbUCvebMB4y9DvlsgQLFWa
        kTwYtrWPm4w4t+dfsg5xFJJz+P5PjbxlJJXZHZwvbICoBEWw2hvSs00+/vliwUE1EUHefr0G4vFnM
        FiLYid/Ea3KAuvUungDHp+9MdNGHTPjJTTQN2p9lHWC/eGsTUBFnxcDIcGZfKhx9soLQEILkK6sFt
        PWpHO0Rt37a4y34PXDpC/7CVlwdkDi9VjF5KaSOhY+N9uGCWBurMrGk62DL1BK2w/1gtJ0SRmz4GP
        SYHJeLniFkOqAbMyy39gB+OH8t0D77qRa1w1DLzF2+fO6L95SlDD0UEu2XJt6QfQICNZnXCZt2Zgn
        rAqebUuQ==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1nLw4M-001ILZ-R7; Sun, 20 Feb 2022 23:56:47 +0000
Message-ID: <7d6fa84b-2fc8-57ac-f240-e681a4b8c390@infradead.org>
Date:   Sun, 20 Feb 2022 15:56:42 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: question on mips/kernel/setup.c
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

from commit 14ac09a65e19
Author: Christoph Hellwig <hch@lst.de>
Date:   Wed Feb 10 10:56:38 2021 +0100

    MIPS: refactor the runtime coherent vs noncoherent DMA indicators


Both of these command line options set 'dma_default_coherent' to true.

Is that correct or a typo?  Or it doesn't matter?
Thanks.


arch/mips/kernel/setup.c:

static int __init setcoherentio(char *str)
{
	dma_default_coherent = true;
	pr_info("Hardware DMA cache coherency (command line)\n");
	return 0;
}
early_param("coherentio", setcoherentio);

static int __init setnocoherentio(char *str)
{
	dma_default_coherent = true;
	pr_info("Software DMA cache coherency (command line)\n");
	return 0;
}
early_param("nocoherentio", setnocoherentio);

-- 
~Randy
