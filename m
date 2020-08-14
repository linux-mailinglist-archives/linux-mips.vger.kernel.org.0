Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E6F5244627
	for <lists+linux-mips@lfdr.de>; Fri, 14 Aug 2020 10:09:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726952AbgHNIJC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 14 Aug 2020 04:09:02 -0400
Received: from elvis.franken.de ([193.175.24.41]:46615 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726124AbgHNIJC (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 14 Aug 2020 04:09:02 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1k6Uln-0006Kz-00; Fri, 14 Aug 2020 10:08:59 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 0B701C0D54; Fri, 14 Aug 2020 10:08:47 +0200 (CEST)
Date:   Fri, 14 Aug 2020 10:08:46 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH] MIPS: Loongson: Set CONFIG_FRAME_WARN=2048 in
 loongson3_defconfig to fix build warning
Message-ID: <20200814080846.GA5982@alpha.franken.de>
References: <1597373793-8482-1-git-send-email-yangtiezhu@loongson.cn>
 <20200814065310.GA4751@alpha.franken.de>
 <be055bef-e731-7242-78ca-e1844389c791@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be055bef-e731-7242-78ca-e1844389c791@loongson.cn>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Aug 14, 2020 at 03:31:19PM +0800, Tiezhu Yang wrote:
> On 08/14/2020 02:53 PM, Thomas Bogendoerfer wrote:
> >On Fri, Aug 14, 2020 at 10:56:33AM +0800, Tiezhu Yang wrote:
> >>Fixes: 70b838292bef ("MIPS: Update default config file for Loongson-3")
> >I'm not so sure whether this warrants a fixes tag.
> 
> I use git bisect to find it is the first bad commit. Please let me know
> if it is not necessary and then I will remove the Fixes tag.

Please remove it.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
