Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CAEC392CF1
	for <lists+linux-mips@lfdr.de>; Thu, 27 May 2021 13:44:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234127AbhE0LqL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 27 May 2021 07:46:11 -0400
Received: from elvis.franken.de ([193.175.24.41]:51703 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234071AbhE0LqJ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 27 May 2021 07:46:09 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lmERG-0007z5-00; Thu, 27 May 2021 13:44:34 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id EF25AC111D; Thu, 27 May 2021 13:41:35 +0200 (CEST)
Date:   Thu, 27 May 2021 13:41:35 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Kefeng Wang <wangkefeng.wang@huawei.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Huang Pei <huangpei@loongson.cn>, linux-mips@vger.kernel.org
Subject: Re: [PATCH] mips: kill pte_sw_mkyoung
Message-ID: <20210527114135.GA9210@alpha.franken.de>
References: <20210520110043.149003-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210520110043.149003-1-wangkefeng.wang@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, May 20, 2021 at 07:00:43PM +0800, Kefeng Wang wrote:
> Kill unused pte_sw_mkyoung after
> commit f685a533a7fa ("MIPS: make userspace mapping young by default").

I just sent a revert for that commit. So we still want and need pte_sw_mkyoung.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
