Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A0DA745E3D
	for <lists+linux-mips@lfdr.de>; Mon,  3 Jul 2023 16:12:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229750AbjGCOMc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 3 Jul 2023 10:12:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231260AbjGCOM1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 3 Jul 2023 10:12:27 -0400
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A9212E59;
        Mon,  3 Jul 2023 07:12:25 -0700 (PDT)
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
        id 1qGKHs-0008Fp-00; Mon, 03 Jul 2023 16:12:20 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 3CA5AC0346; Mon,  3 Jul 2023 16:09:53 +0200 (CEST)
Date:   Mon, 3 Jul 2023 16:09:53 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huacai Chen <chenhuacai@loongson.cn>
Cc:     Huacai Chen <chenhuacai@kernel.org>, linux-mips@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>, stable@vger.kernel.org,
        Huang Pei <huangpei@loongson.cn>
Subject: Re: [PATCH] MIPS: Loongson: Fix cpu_probe_loongson() again
Message-ID: <20230703140953.GC16247@alpha.franken.de>
References: <20230626075014.1872632-1-chenhuacai@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230626075014.1872632-1-chenhuacai@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jun 26, 2023 at 03:50:14PM +0800, Huacai Chen wrote:
> Commit 7db5e9e9e5e6c10d7d ("MIPS: loongson64: fix FTLB configuration")
> move decode_configs() from the beginning of cpu_probe_loongson() to the
> end in order to fix FTLB configuration. However, it breaks the CPUCFG
> decoding because decode_configs() use "c->options = xxxx" rather than
> "c->options |= xxxx", all information get from CPUCFG by decode_cpucfg()
> is lost.
> 
> This causes error when creating a KVM guest on Loongson-3A4000:
> Exception Code: 4 not handled @ PC: 0000000087ad5981, inst: 0xcb7a1898 BadVaddr: 0x0 Status: 0x0
> 
> Fix this by moving the c->cputype setting to the beginning and moving
> decode_configs() after that.
> 
> Fixes: 7db5e9e9e5e6c10d7d ("MIPS: loongson64: fix FTLB configuration")
> Cc: stable@vger.kernel.org
> Cc: Huang Pei <huangpei@loongson.cn>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>  arch/mips/kernel/cpu-probe.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
