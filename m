Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC62A2EA403
	for <lists+linux-mips@lfdr.de>; Tue,  5 Jan 2021 04:47:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbhAEDqd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 4 Jan 2021 22:46:33 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:33351 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726168AbhAEDqd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 4 Jan 2021 22:46:33 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id A2ABA5805BF;
        Mon,  4 Jan 2021 22:45:47 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Mon, 04 Jan 2021 22:45:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=P
        MiPLucM+T3kSasa33zxfPFnbKWQr59tFvfm9X/a83o=; b=faVKBWBsrF3PX8bCy
        r+beznNEDRLpbWYAlEA2Pv7SROrs8g8dkgpoIM8pm95Rx2AGpDSc1M7bx6Szp1Kk
        qQMEvTfYHkxKR1z1P+x0jh9/bwGBbv8FD588apgeBSCRQRy8kJrXHwkK8FE8JdhH
        6Sj+V6OKPU1Gw2JTT3xF7EmRRtJNQdBqwBfokZCxm/X2FmciW2iM3DMUkz/QvgWv
        Qiz0ilsHoA3RXPy7bYSYPsEdI2bF+Gc5x6fdzO20DSLIN8Mc17N1QMxGLvmpDrUX
        RlxLmAQn1nX1eGqIXaLdhdt2Q17XzyEuW58OB6QruwmxdMSzTNg8lIptZz6jvX+2
        jFA0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=PMiPLucM+T3kSasa33zxfPFnbKWQr59tFvfm9X/a8
        3o=; b=Ad0RsPsiG7pnB1yvC2uBCgyJlSxJk44VfLhO9BrXE5KX4sNT4OE3zpbKD
        AOJEhjV4yVSMB6BfDsnddGcDs7Zy6NrXTfzpBQ7AzJRgUUAIc+vA26v2m0b0Vtf3
        HBh4Ul52ApT3fPC7tNtENfKd9btx1u1hmLNjXavKiliDnXQPdSj4pfXvweRwkN/P
        NsipgGhoX64iTw/aorPPjIQFg4iPpL/XhI0khLskU+1IH3CH7StPpATj+djEkaey
        bQI3IkPC1gTdBN0zkzLipBuBU6crRmxYR6g/c/vJRivX3Al7hNl3rR7TdqXTTBeb
        RNWsJph9XNWFwyJgqQo502Hr/1JCg==
X-ME-Sender: <xms:6eDzX6JQZfoKuoRvm4laf5LXOP5DqlhzRqTANsOpTbP4fu-RRjvCaA>
    <xme:6eDzXyL94ryPO4B80e8tye_K6BuSgb_i5YAFbCN8Kw3QepZ2W84voAMi-O4tMtUkU
    sk3C6yRz0mTkjJIHL8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdefgedgieduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvfhfhkffffgggjggtgfesthekredttdeftfenucfhrhhomheplfhirgig
    uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeefleduiedtvdekffeggfeukeejgeeffeetlefghfekffeuteei
    jeeghefhueffvdenucfkphepgeehrdeffedrhedtrddvheegnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhl
    hihgohgrthdrtghomh
X-ME-Proxy: <xmx:6eDzX6uryirzT-6gOt8j-7aVAJRYv1M7J17Tq5yT33agipef7jsV9g>
    <xmx:6eDzX_YlDh9qVIPFtfy0_MVw-On-Ywig2D74ZYB1L8vaa_pQULJRrA>
    <xmx:6eDzXxbyLH5nW8SYVL2y0SkZOaxi4cuXuXZazuO23ny1tYBvE5uoJw>
    <xmx:6-DzX1S9A26_3Xx6pobDg-xziHj-LskurATUbqq3I0FuCfATm1iuVUR_yDY>
Received: from [0.0.0.0] (li1000-254.members.linode.com [45.33.50.254])
        by mail.messagingengine.com (Postfix) with ESMTPA id B0A3D1080059;
        Mon,  4 Jan 2021 22:45:40 -0500 (EST)
Subject: Re: [PATCH 1/3] MIPS: kernel: Support extracting off-line stack
 traces from user-space with perf
To:     Peter Zijlstra <peterz@infradead.org>,
        Tiezhu Yang <yangtiezhu@loongson.cn>
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
References: <1609246561-5474-1-git-send-email-yangtiezhu@loongson.cn>
 <1609246561-5474-2-git-send-email-yangtiezhu@loongson.cn>
 <20210104105904.GK3021@hirez.programming.kicks-ass.net>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <0712b131-715a-a83a-bc9e-61405824ff0e@flygoat.com>
Date:   Tue, 5 Jan 2021 11:45:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210104105904.GK3021@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

ÔÚ 2021/1/4 ÏÂÎç6:59, Peter Zijlstra Ð´µÀ:
> On Tue, Dec 29, 2020 at 08:55:59PM +0800, Tiezhu Yang wrote:
>> +u64 perf_reg_abi(struct task_struct *tsk)
>> +{
>> +	if (test_tsk_thread_flag(tsk, TIF_32BIT_REGS))
>> +		return PERF_SAMPLE_REGS_ABI_32;
>> +	else
>> +		return PERF_SAMPLE_REGS_ABI_64;
>> +}
> So we recently changed this on x86 to not rely on TIF flags. IIRC the
> problem is that on x86 you can change the mode of a task without the
> kernel being aware of it. Is something like that possible on MIPS as
> well?

Hi all,

In MIPS world it's impossible to raise a thread to 64bit without kernel 
aware.
Without STATUS.UX set it will trigger reserved instruction exception 
when trying
to run 64bit instructions.

However it may be possible to run with 32bit ABI without TIF_32BIT_REGS 
if user
program didn't get ELF ABI right. I think that's out of our current 
consideration.

> The thing x86 does today is look at it's pt_regs state to determine the
> actual state.
It is possible to look at pt_regs Status.UX bit on MIPS. But it seems 
unnecessary
as user can't change it.

Thanks.

- Jiaxun




