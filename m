Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3532F70D892
	for <lists+linux-mips@lfdr.de>; Tue, 23 May 2023 11:13:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236224AbjEWJNy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 May 2023 05:13:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235332AbjEWJNx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 23 May 2023 05:13:53 -0400
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 50852118
        for <linux-mips@vger.kernel.org>; Tue, 23 May 2023 02:13:45 -0700 (PDT)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1q1O5L-0007MY-02; Tue, 23 May 2023 11:13:39 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 3ADC1C02E6; Tue, 23 May 2023 11:09:56 +0200 (CEST)
Date:   Tue, 23 May 2023 11:09:56 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Manuel Lauss <manuel.lauss@gmail.com>
Cc:     Linux-MIPS <linux-mips@vger.kernel.org>
Subject: Re: [PATCH] MIPS: Alchemy: fix dbdma2
Message-ID: <20230523090956.GG9484@alpha.franken.de>
References: <20230511153010.651283-1-manuel.lauss@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230511153010.651283-1-manuel.lauss@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,T_SPF_TEMPERROR autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, May 11, 2023 at 05:30:10PM +0200, Manuel Lauss wrote:
> Various fixes for the Au1200/Au1550/Au1300 DBDMA2 code:
> 
> - skip cache invalidation if chip has working coherency circuitry.
> - invalidate KSEG0-portion of the (physical) data address.
> - force the dma channel doorbell write out to bus immediately with
>   a sync.
> 
> --
>  This fixes Audio and SD/MMC on the DB1300 board.
> 
> Signed-off-by: Manuel Lauss <manuel.lauss@gmail.com>
> ---
>  arch/mips/alchemy/common/dbdma.c | 27 +++++++++++++++------------
>  1 file changed, 15 insertions(+), 12 deletions(-)

applied to mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
