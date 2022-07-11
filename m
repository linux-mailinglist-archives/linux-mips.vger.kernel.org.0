Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66A43569F30
	for <lists+linux-mips@lfdr.de>; Thu,  7 Jul 2022 12:13:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235161AbiGGKLp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 Jul 2022 06:11:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235192AbiGGKLl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 7 Jul 2022 06:11:41 -0400
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CC2D64F668;
        Thu,  7 Jul 2022 03:11:39 -0700 (PDT)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1o9OTx-0007T4-00; Thu, 07 Jul 2022 12:11:37 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 748C9C02A1; Thu,  7 Jul 2022 11:22:06 +0200 (CEST)
Date:   Thu, 7 Jul 2022 11:22:06 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Hongchen Zhang <zhanghongchen@loongson.cn>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: fix pmd_mkinvalid
Message-ID: <20220707092206.GA9894@alpha.franken.de>
References: <1657181495-33004-1-git-send-email-zhanghongchen@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1657181495-33004-1-git-send-email-zhanghongchen@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jul 07, 2022 at 04:11:35PM +0800, Hongchen Zhang wrote:
> When a pmd entry is invalidated by pmd_mkinvalid,pmd_present should
> return true.
> So introduce a _PMD_PRESENT_INVALID_SHIFT bit to check if a pmd is
> present but invalidated by pmd_mkinvalid.

What problem are you trying to fix ? What are the symptoms ?

> Reported-by: kernel test robot <lkp@intel.com>

the test robot showed problems with your last version of the patch,
which hasn't been integrated into at least the MIPS tree, so no
need to that.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
