Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1A48328D74
	for <lists+linux-mips@lfdr.de>; Mon,  1 Mar 2021 20:12:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241051AbhCATL0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 1 Mar 2021 14:11:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:36574 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240495AbhCATGe (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 1 Mar 2021 14:06:34 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D33D1650AC;
        Mon,  1 Mar 2021 17:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614621053;
        bh=STlryrFmyWxnrecpWVZY5M4mY+2S7qyV66J7hXsrOro=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LNYpyUd2m25M2FUAmy5h7hUuJGx/g64C6oTLkzz54GuBOX378PWes89AKAOwb15Vn
         Vw/AroXaSTPRWQ7ChCacmpfALNBhdXan1Wz/OBRSgZ/hDuJuwn2oUS6+O9nU+SWNkd
         XGzi/h60XH9PxUKpNSku75ZQEd7ARKLbJw1cVegz0aernc/T/j+bsblRBGM2zZW3lK
         ijpiyRSXYggYdaJRAgNlVLWYsOP/zHoJxexUFeRB3wGZMZ3r7BcljDbfa/+bQRYv2r
         sGbS4Bzh6rq+eU4PpzQVX+/t2P/dMiZWUad6wWDKWFAJtC/D0neXby/T9Ys8ZAf6xI
         Uqy44L+RuNGng==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
        id F363840CD9; Mon,  1 Mar 2021 14:50:48 -0300 (-03)
Date:   Mon, 1 Mar 2021 14:50:48 -0300
From:   Arnaldo Carvalho de Melo <acme@kernel.org>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Jianlin Lv <Jianlin.Lv@arm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>,
        Juxin Gao <gaojuxin@loongson.cn>
Subject: Re: [PATCH v2 0/3] Add some perf support for mips
Message-ID: <YD0peIlkvx/FY1wd@kernel.org>
References: <1612409724-3516-1-git-send-email-yangtiezhu@loongson.cn>
 <1d3c4abd-4b14-90e3-6528-457a8248cb52@loongson.cn>
 <YDZRxz1yRwgWc47F@kernel.org>
 <YDec9LIikZ9EVufH@kernel.org>
 <YDehtDi4q+lFO2l6@kernel.org>
 <YDeiR66J0ohidVSq@kernel.org>
 <8894bb31-ec2b-7324-9c7f-6820d12d951e@loongson.cn>
 <YDmJCTxOBb7TGhqw@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YDmJCTxOBb7TGhqw@kernel.org>
X-Url:  http://acmel.wordpress.com
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Em Fri, Feb 26, 2021 at 08:49:29PM -0300, Arnaldo Carvalho de Melo escreveu:
> Em Fri, Feb 26, 2021 at 09:11:17AM +0800, Tiezhu Yang escreveu:
> > Sorry for the late reply. I asked for a leave yesterday.

> > asm/perf_regs.h is a new added file in the patch #1,
> > the patch link is:
> > https://lore.kernel.org/patchwork/patch/1375477/
> > the commit is:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/mips/include/uapi/asm/perf_regs.h?id=1ddc96bd42da
> > 
> > So we should build patch #2 based on patch #1.

> yeah, my bad, since perf wasn't supported on MIPS, how could cross build
> environments have the needed files? Stooooopid me, sorry. :-) I'll
> retest after adding the needed files to my test containers.

Then I had to add this one on top:

Committer notes:

Do it as __perf_reg_name() to cope with:

  067012974c8ae31a ("perf tools: Fix arm64 build error with gcc-11")

- Arnaldo
