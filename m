Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 250362238D8
	for <lists+linux-mips@lfdr.de>; Fri, 17 Jul 2020 12:01:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725950AbgGQKAY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 17 Jul 2020 06:00:24 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:30532 "EHLO
        esa1.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725864AbgGQKAX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 17 Jul 2020 06:00:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1594980022; x=1626516022;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=vQ2ImtfRZyj0kAtoB4fUjN5q3ds0AJVtdj0mCNHOPw8=;
  b=mRHQH2YHwIi17bE30SzNOkO6Osj7dUCH4U+yPwKO/eMlBZOMSL9JNVwY
   N0fCYE6a54bpv+XVRyEU0NeiIsicZxr32MTsCXYpsSg/GXKmaojC1t7fY
   2iF9R1+4+vcwsgYkpJkvk+naRjfKY3vIhxJLM+IC3J2yvT1yYQJzLDExG
   F/wK4M/UfEuT1OgjtmwOKNqvzKg1Kj2hbY0b3lI2qgx89pJWKfjBHAWN0
   D82izDheKxH1ytFZPUDeh76LPqpQvb/vHoa6Nao4uuDNzbd9sWdd0+Ye6
   IwRMb56ergYudwaOpT2jxYNcK2mLDyYyBrQLhX4LDy5001wStmlyfZRHy
   w==;
IronPort-SDR: A1UpebW7/PWJ6JLdUyFI7rQX4qZyGjpeQD33D4uTqS44rt+BfepdRBh8XUYfACx9EbdKYk/Y2c
 3vtsWoYBzuTaJLG220LBxr7568mVNSLKAAraPjR6dR9UzHKO+bADvE6zcXQJC1sakToN62vo5q
 NgbeiyvBm87JPPUCUxFtmnQ666fS+65aUbaNTcnZkyFIImA4/SOJ6L/1mSip2xCoTzf5QnWozc
 5yqm1N8mVC49V27cM5E1vGSCGqeyhffyvKWeGVGUi0dWx+YioAbN0t2lQmmPrhsNCoLxJCcY17
 udU=
X-IronPort-AV: E=Sophos;i="5.75,362,1589212800"; 
   d="scan'208";a="251971917"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 17 Jul 2020 18:00:22 +0800
IronPort-SDR: f9vfUf2pFQWJ8+lNQ04XXBbuhljU2nuLirptshi7O7+2iWJSHKEb0ZldaqpO5YoQHH4B87NSyj
 2aH+BnDRDA07sX6hY9oSpvpmHYthkqk70=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2020 02:48:11 -0700
IronPort-SDR: Few0pq9UDnEi1rkPglf8o17OfuANd9zMmPZqD5dk+SyOrI9wD0xwtIiGehCM8iIdlFweLIXJ/l
 aZH7rRhluDzA==
WDCIronportException: Internal
Received: from unknown (HELO redsun52) ([10.149.66.28])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2020 03:00:21 -0700
Date:   Fri, 17 Jul 2020 11:00:18 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@wdc.com>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kees Cook <keescook@chromium.org>,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Juxin Gao <gaojuxin@loongson.cn>,
        "Maciej W. Rozycki" <macro@linux-mips.org>
Subject: Re: [PATCH] MIPS: Prevent READ_IMPLIES_EXEC propagation
In-Reply-To: <b62c76c5-3548-c3d5-ad3e-5664c463a52f@loongson.cn>
Message-ID: <alpine.LFD.2.21.2007171044320.24175@redsun52.ssa.fujisawa.hgst.com>
References: <1594114741-26852-1-git-send-email-yangtiezhu@loongson.cn> <alpine.LFD.2.21.2007072043250.31807@redsun52.ssa.fujisawa.hgst.com> <b62c76c5-3548-c3d5-ad3e-5664c463a52f@loongson.cn>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 8 Jul 2020, Tiezhu Yang wrote:

> >> In the MIPS architecture, we should clear the security-relevant
> >> flag READ_IMPLIES_EXEC in the function SET_PERSONALITY2() of the
> >> file arch/mips/include/asm/elf.h.
> >>
> >> Otherwise, with this flag set, PROT_READ implies PROT_EXEC for
> >> mmap to make memory executable that is not safe, because this
> >> condition allows an attacker to simply jump to and execute bytes
> >> that are considered to be just data [1].
> >   Why isn't the arrangement made with `mips_elf_read_implies_exec'
> > sufficient?
> 
> We inherit the READ_IMPLIES_EXEC personality flag across fork().
> If we do not explicitly clear this flag in SET_PERSONALITY2(),
> PROT_READ implies PROT_EXEC for mmap to make memory executable
> even if used with the GCC option "-z noexecstack" when compile.

 It makes no sense to me to repeat this across all the architectures, and 
even less so to do it individually one by one as people rediscover this 
issue.

 Why don't we maintain the flag globally in `fs/binfmt_elf.c' which is 
where we already set it?  E.g.:

	SET_PERSONALITY2(*elf_ex, &arch_state);
	if (elf_read_implies_exec(*elf_ex, executable_stack))
		current->personality |= READ_IMPLIES_EXEC;
	else
		current->personality &= ~READ_IMPLIES_EXEC;

  Maciej
