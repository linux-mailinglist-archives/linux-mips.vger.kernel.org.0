Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C03D260C33
	for <lists+linux-mips@lfdr.de>; Tue,  8 Sep 2020 09:37:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729547AbgIHHhS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Sep 2020 03:37:18 -0400
Received: from elvis.franken.de ([193.175.24.41]:59493 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729359AbgIHHhS (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 8 Sep 2020 03:37:18 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kFYBn-0003e2-01; Tue, 08 Sep 2020 09:37:15 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 3CA73C0F5B; Mon,  7 Sep 2020 22:32:40 +0200 (CEST)
Date:   Mon, 7 Sep 2020 22:32:40 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jinyang He <hejinyang@loongson.cn>
Cc:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Loongson64: Remove unused loongson_reboot.
Message-ID: <20200907203240.GB18497@alpha.franken.de>
References: <1599215391-2644-1-git-send-email-hejinyang@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1599215391-2644-1-git-send-email-hejinyang@loongson.cn>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Sep 04, 2020 at 06:29:51PM +0800, Jinyang He wrote:
> Commit 1bdb7b76705a ("MIPS: Loongson64: Cleanup unused code")
> left the loongson_reboot unused, delete it.
> 
> Signed-off-by: Jinyang He <hejinyang@loongson.cn>
> ---
>  arch/mips/loongson64/reset.c | 5 -----
>  1 file changed, 5 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
