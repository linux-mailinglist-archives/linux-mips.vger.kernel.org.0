Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C3D0633C79
	for <lists+linux-mips@lfdr.de>; Tue, 22 Nov 2022 13:30:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232479AbiKVMaT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 22 Nov 2022 07:30:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233448AbiKVMaS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 22 Nov 2022 07:30:18 -0500
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 63BF75801A
        for <linux-mips@vger.kernel.org>; Tue, 22 Nov 2022 04:30:17 -0800 (PST)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1oxSPm-0002Uj-00; Tue, 22 Nov 2022 13:30:14 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 8609CC1CEF; Tue, 22 Nov 2022 13:29:53 +0100 (CET)
Date:   Tue, 22 Nov 2022 13:29:53 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-mips@vger.kernel.org, dengcheng.zhu@imgtec.com,
        Steven.Hill@imgtec.com, Qais.Yousef@imgtec.com, blogic@openwrt.org
Subject: Re: [PATCH v2 0/2] MIPS: fix possible memory leak while module
 exiting
Message-ID: <20221122122953.GA11276@alpha.franken.de>
References: <20221104033945.1120044-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221104033945.1120044-1-yangyingliang@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Nov 04, 2022 at 11:39:43AM +0800, Yang Yingliang wrote:
> This patchset fixes two device name leaks while module exiting
> in normal or error path.
> 
> v1 -> v2:
>   Add fix tag in patch #1.
> 
> Yang Yingliang (2):
>   MIPS: vpe-mt: fix possible memory leak while module exiting
>   MIPS: vpe-cmp: fix possible memory leak while module exiting
> 
>  arch/mips/kernel/vpe-cmp.c | 4 ++--
>  arch/mips/kernel/vpe-mt.c  | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> -- 
> 2.25.1

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
