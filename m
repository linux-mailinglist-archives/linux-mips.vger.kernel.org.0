Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 204C6168E4C
	for <lists+linux-mips@lfdr.de>; Sat, 22 Feb 2020 11:41:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726836AbgBVKll (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 22 Feb 2020 05:41:41 -0500
Received: from elvis.franken.de ([193.175.24.41]:60555 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726763AbgBVKll (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 22 Feb 2020 05:41:41 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1j5SE4-0003bo-00; Sat, 22 Feb 2020 11:41:36 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 9868BC0E42; Sat, 22 Feb 2020 11:41:24 +0100 (CET)
Date:   Sat, 22 Feb 2020 11:41:24 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     YunQiang Su <wzssyqa@gmail.com>
Cc:     Paul Burton <paulburton@kernel.org>,
        linux-mips <linux-mips@vger.kernel.org>,
        linux-kernel@vger.kernel.org, wayne.sun@cipunited.com,
        chris.wang@neocore.cn, Yunqiang Su <ysu@wavecomp.com>
Subject: Re: [PATCH 2/2] MAINTAINERS: Set MIPS status to Odd Fixes
Message-ID: <20200222104124.GA4589@alpha.franken.de>
References: <20200219191730.1277800-1-paulburton@kernel.org>
 <20200219191730.1277800-3-paulburton@kernel.org>
 <20200220112330.GA3053@alpha.franken.de>
 <CAKcpw6UDik=K6MdEayDPVaZP+BsqrbKoKAXJaHLERrxDmFF7+A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKcpw6UDik=K6MdEayDPVaZP+BsqrbKoKAXJaHLERrxDmFF7+A@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Feb 20, 2020 at 08:11:08PM +0800, YunQiang Su wrote:
> I noticed that you are mainly working some old machines.
> And recently years, there are some new machines from Ingenic, Loongson, MTK etc.
> MIPS Inc also have some MIPSr6 IPs.
> I think that you need some of these machines.

sure, it would be helpfull. And with a reasonable price I have no problem
buying a new machine. But IMHO it's not mandatory for a maintainer
to have all supported hardware available.

> In the last years, we see that the single maintainer is not enough as
> people may quite busy.
> Do you think that we need co-maintainers?

Looking at the number of patches in arch/mips for the last few
release cylces we were always in the range of 100-150 commits.
So I don't see a need for a co-maintainer, but having backup
maintainer(s) is a good thing.

For me maintaining means

- keep MIPS archicture alive (legacy and newer stuff)
- collecting patches and integrating them into a git tree for pulling
- send pull requests to Linus in a timely manner
- review/comment patches
- give guidance on how to do abstractions inside MIPS arch code

Some personal background

- doing Linux/MIPS coding since 1995
- worked as system architect for OS development with MIPS 4kec, 24k, 34k
  based embedded systems
- working now for SUSE in kernel network driver area (with enough time
  for other open source projects)

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
