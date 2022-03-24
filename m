Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7ECF84E60DA
	for <lists+linux-mips@lfdr.de>; Thu, 24 Mar 2022 10:06:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349109AbiCXJGd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 24 Mar 2022 05:06:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345706AbiCXJGc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 24 Mar 2022 05:06:32 -0400
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A9F499D0DF
        for <linux-mips@vger.kernel.org>; Thu, 24 Mar 2022 02:05:00 -0700 (PDT)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1nXJOs-0002LV-00; Thu, 24 Mar 2022 10:04:58 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id D606BC2EC4; Thu, 24 Mar 2022 09:51:21 +0100 (CET)
Date:   Thu, 24 Mar 2022 09:51:21 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Feiyang Chen <chris.chenfeiyang@gmail.com>
Cc:     Feiyang Chen <chenfeiyang@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, tangyouling@loongson.cn,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH v2] MIPS: Fix build error for loongson64 and sgi-ip27
Message-ID: <20220324085121.GA5250@alpha.franken.de>
References: <78559205988aa1c0b42ee6ac20bb0fec3200f978.1647682458.git.chenfeiyang@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78559205988aa1c0b42ee6ac20bb0fec3200f978.1647682458.git.chenfeiyang@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Mar 19, 2022 at 05:40:02PM +0800, Feiyang Chen wrote:
> Select HAVE_ARCH_NODEDATA_EXTENSION for loongson64 to fix build error
> when CONFIG_NUMA=y:
> 
> mips64el-unknown-linux-gnu-ld: mm/page_alloc.o: in function `free_area_init':
> (.init.text+0x1714): undefined reference to `node_data'
> mips64el-unknown-linux-gnu-ld: (.init.text+0x1730): undefined reference to `node_data'
> 
> Also, select HAVE_ARCH_NODEDATA_EXTENSION for sgi-ip27 to fix build error:
> 
> mips64el-unknown-linux-gnu-ld: mm/page_alloc.o: in function `free_area_init':
> page_alloc.c:(.init.text+0x1ba8): undefined reference to `node_data'
> mips64el-unknown-linux-gnu-ld: page_alloc.c:(.init.text+0x1bcc): undefined reference to `node_data'
> mips64el-unknown-linux-gnu-ld: page_alloc.c:(.init.text+0x1be4): undefined reference to `node_data'
> mips64el-unknown-linux-gnu-ld: page_alloc.c:(.init.text+0x1bf4): undefined reference to `node_data'
> 
> Signed-off-by: Feiyang Chen <chenfeiyang@loongson.cn>
> ---
>  arch/mips/Kconfig                |  5 +++++
>  arch/mips/loongson64/numa.c      | 10 ++++++++++
>  arch/mips/sgi-ip27/ip27-memory.c | 10 ++++++++++
>  3 files changed, 25 insertions(+)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
