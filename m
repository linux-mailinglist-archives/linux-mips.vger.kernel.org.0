Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 289F22E93A5
	for <lists+linux-mips@lfdr.de>; Mon,  4 Jan 2021 11:49:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727150AbhADKtM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 4 Jan 2021 05:49:12 -0500
Received: from elvis.franken.de ([193.175.24.41]:57218 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726504AbhADKtM (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 4 Jan 2021 05:49:12 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kwNPU-0001xs-03; Mon, 04 Jan 2021 11:48:24 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id D190DC0808; Mon,  4 Jan 2021 11:43:25 +0100 (CET)
Date:   Mon, 4 Jan 2021 11:43:25 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     jiaqingtong97@163.com
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: perf: Add support for OCTEON III perf events.
Message-ID: <20210104104325.GD4765@alpha.franken.de>
References: <20210101093201.9201-1-jiaqingtong97@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210101093201.9201-1-jiaqingtong97@163.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Jan 01, 2021 at 05:32:00PM +0800, jiaqingtong97@163.com wrote:
> From: Jia Qingtong <jiaqingtong97@163.com>
> 
> According to Hardware Reference Manual, OCTEON III
> are mostly same as previous OCTEON models. So just
> enable them and extend supported event code.
> 0x3e and 0x3f still reserved.
> 
> Signed-off-by: Jia Qingtong <jiaqingtong97@163.com>
> ---
>  arch/mips/kernel/perf_event_mipsxx.c | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
