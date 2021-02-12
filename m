Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC69731A2D1
	for <lists+linux-mips@lfdr.de>; Fri, 12 Feb 2021 17:37:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230089AbhBLQgn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 12 Feb 2021 11:36:43 -0500
Received: from elvis.franken.de ([193.175.24.41]:51425 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230199AbhBLQej (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 12 Feb 2021 11:34:39 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lAbO7-00056D-00; Fri, 12 Feb 2021 17:33:47 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 183D4C0E7B; Fri, 12 Feb 2021 17:33:35 +0100 (CET)
Date:   Fri, 12 Feb 2021 17:33:35 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Oleg Nesterov <oleg@redhat.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>,
        kernel test robot <lkp@intel.com>,
        Xingxing Su <suxingxing@loongson.cn>
Subject: Re: [PATCH v2] MIPS: Add basic support for ptrace single step
Message-ID: <20210212163335.GA12558@alpha.franken.de>
References: <1612939961-8827-1-git-send-email-yangtiezhu@loongson.cn>
 <20210211102905.GE7985@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210211102905.GE7985@alpha.franken.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Feb 11, 2021 at 11:29:05AM +0100, Thomas Bogendoerfer wrote:
> IMHO ptrace single step is for CPUs supporting single stepping and not
> for emulating it in the kernel.

I've checked other arch how they implement single step, and looks like
I'm wrong. So I'm ok with applying your patch. Can you resend it again,
so I'll get the latest version in patchwork ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
