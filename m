Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 261892CEDC5
	for <lists+linux-mips@lfdr.de>; Fri,  4 Dec 2020 13:11:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730147AbgLDMLJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 4 Dec 2020 07:11:09 -0500
Received: from elvis.franken.de ([193.175.24.41]:48092 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728297AbgLDMKy (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 4 Dec 2020 07:10:54 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kl9ud-0005Nb-01; Fri, 04 Dec 2020 13:10:11 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 6A294C02E5; Fri,  4 Dec 2020 13:07:05 +0100 (CET)
Date:   Fri, 4 Dec 2020 13:07:05 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH 1/2] MIPS: Move memblock_dump_all() to the end of
 setup_arch()
Message-ID: <20201204120705.GB10011@alpha.franken.de>
References: <1606965544-22611-1-git-send-email-yangtiezhu@loongson.cn>
 <1606965544-22611-2-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1606965544-22611-2-git-send-email-yangtiezhu@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Dec 03, 2020 at 11:19:03AM +0800, Tiezhu Yang wrote:
> In order to get more memblock configuration with memblock=debug in the boot
> cmdline, move memblock_dump_all() to the end of setup_arch(), this can help
> us to get dmi_setup() and resource_init() memblock info, at least for now.
> 
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/mips/kernel/setup.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
