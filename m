Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55FDB2E6B99
	for <lists+linux-mips@lfdr.de>; Tue, 29 Dec 2020 00:12:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730799AbgL1Wzy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 28 Dec 2020 17:55:54 -0500
Received: from elvis.franken.de ([193.175.24.41]:43917 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729593AbgL1V6G (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 28 Dec 2020 16:58:06 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1ku0W4-0005wv-02; Mon, 28 Dec 2020 22:57:24 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 3850CC05C4; Mon, 28 Dec 2020 22:39:36 +0100 (CET)
Date:   Mon, 28 Dec 2020 22:39:36 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Zheng Yongjun <zhengyongjun3@huawei.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] mips: pci: convert comma to semicolon
Message-ID: <20201228213936.GC24617@alpha.franken.de>
References: <20201216131004.14284-1-zhengyongjun3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201216131004.14284-1-zhengyongjun3@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Dec 16, 2020 at 09:10:04PM +0800, Zheng Yongjun wrote:
> Replace a comma between expression statements by a semicolon.
> 
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
> ---
>  arch/mips/kernel/vpe-cmp.c | 4 ++--
>  arch/mips/pci/pci-ar2315.c | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
