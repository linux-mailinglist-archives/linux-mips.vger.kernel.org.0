Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6EF12E93D1
	for <lists+linux-mips@lfdr.de>; Mon,  4 Jan 2021 12:01:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726189AbhADLBL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 4 Jan 2021 06:01:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726176AbhADLBL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 4 Jan 2021 06:01:11 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23217C061574;
        Mon,  4 Jan 2021 03:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=mhrOwaAhI1UDmmcXdIWUBJdkLN1PFDKL46QLbpMb4OE=; b=t7EcSy1/+qFRoVVLaSlSHi7QsH
        7zXfhq5/F/jyb/cnYAdtGAaot76mgGHhyRfjNmuwi9kx84+M9lAiYQ7LceCnCL+iJhif3nYzv5szz
        Iju7r9DWrtyZjEse7Xkf3GX5YLe7nT56D5HWyN9nEkR9nIGGuWqPoy5NAPd2sXHEpzhp4UN6S68Em
        K4kCHuMnlcag11zob/PH40je2+u18joRj/YGJI1GFVRIB/isA8rkC+ojFljAbHJd+37OepLnz1wVc
        8kkqmMp2j+Yb27/zhbqoB2uApubThXl1y3Ro9RrkW4ir5bdPh41ENvtjOkmhPQsshwq7fcbmiLSiZ
        r4iuKmug==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1kwNZq-0000Rm-Pa; Mon, 04 Jan 2021 10:59:08 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id E961F30377D;
        Mon,  4 Jan 2021 11:59:04 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id CC6BB20298581; Mon,  4 Jan 2021 11:59:04 +0100 (CET)
Date:   Mon, 4 Jan 2021 11:59:04 +0100
From:   Peter Zijlstra <peterz@infradead.org>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>,
        David Daney <david.daney@cavium.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Archer Yan <ayan@wavecomp.com>, x86@kernel.org
Subject: Re: [PATCH 1/3] MIPS: kernel: Support extracting off-line stack
 traces from user-space with perf
Message-ID: <20210104105904.GK3021@hirez.programming.kicks-ass.net>
References: <1609246561-5474-1-git-send-email-yangtiezhu@loongson.cn>
 <1609246561-5474-2-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1609246561-5474-2-git-send-email-yangtiezhu@loongson.cn>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Dec 29, 2020 at 08:55:59PM +0800, Tiezhu Yang wrote:
> +u64 perf_reg_abi(struct task_struct *tsk)
> +{
> +	if (test_tsk_thread_flag(tsk, TIF_32BIT_REGS))
> +		return PERF_SAMPLE_REGS_ABI_32;
> +	else
> +		return PERF_SAMPLE_REGS_ABI_64;
> +}

So we recently changed this on x86 to not rely on TIF flags. IIRC the
problem is that on x86 you can change the mode of a task without the
kernel being aware of it. Is something like that possible on MIPS as
well?

The thing x86 does today is look at it's pt_regs state to determine the
actual state.
