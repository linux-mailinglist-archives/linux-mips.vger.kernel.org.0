Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7431B4CFE56
	for <lists+linux-mips@lfdr.de>; Mon,  7 Mar 2022 13:25:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242043AbiCGM0S (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 7 Mar 2022 07:26:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236937AbiCGM0R (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 7 Mar 2022 07:26:17 -0500
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 177D98023C;
        Mon,  7 Mar 2022 04:25:22 -0800 (PST)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1nRCQS-00072o-05; Mon, 07 Mar 2022 13:25:20 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id ABB2BC1280; Mon,  7 Mar 2022 13:24:40 +0100 (CET)
Date:   Mon, 7 Mar 2022 13:24:40 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Xi Ruoyao <xry111@mengyan1223.wang>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Huacai Chen <chenhuacai@kernel.org>
Subject: Re: [PATCH] mips: remove reference to "newer Loongson-3"
Message-ID: <20220307122440.GF14422@alpha.franken.de>
References: <0b7c9431efb12c2d957fcc53ec8f0743725d61b3.camel@mengyan1223.wang>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b7c9431efb12c2d957fcc53ec8f0743725d61b3.camel@mengyan1223.wang>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,T_SPF_HELO_PERMERROR autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Aug 29, 2021 at 08:49:09PM +0800, Xi Ruoyao wrote:
> Newest Loongson-3 processors have moved to use LoongArch architecture.
> Sadly, the LL/SC issue is still existing on both latest Loongson-3
> processors using MIPS64 (Loongson-3A4000) and LoongArch
> (Loongson-3A5000).
> 
> As it's very unlikely there will be new Loongson-3 processors using
> MIPS64, let's stop people from false hoping.
> 
> Signed-off-by: Xi Ruoyao <xry111@mengyan1223.wang>
> Cc: Huacai Chen <chenhuacai@kernel.org>
> ---
> 
> Huacai: how's the status of LL/SC issue on Loongson-2K?  If
> the issue exists on it as well, we can just force
> CPU_LOONGSON3_WORKAROUNDS when CONFIG_CPU_LOONGSON64 and
> CONFIG_SMP are both selected.
> 
>  arch/mips/Kconfig | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
