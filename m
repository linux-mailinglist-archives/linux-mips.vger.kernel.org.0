Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D11F11ED9EB
	for <lists+linux-mips@lfdr.de>; Thu,  4 Jun 2020 02:19:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725965AbgFDATV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Jun 2020 20:19:21 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:55425 "EHLO
        esa3.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725946AbgFDATV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 3 Jun 2020 20:19:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1591229961; x=1622765961;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=s8vtyU53HYeS+c5fA8SzR5RrYoh3ay1ZN3doT0jbubU=;
  b=GaeAmcq+dDotvdkLmnEfNJuke8KbujpExSrgu4kIyEgsFaVwAKIe08q0
   1CBiJBOcDX4Q8cN4TMrnzMEPGxLlNyiEFEBLtTGuYxn4aG3DeVnGA1s7s
   tLZ+YCOf7vO0K9Pu75wtBVGSoZqu3ubZ2p9FOBbDQosSqz2k+vnyiy0E6
   UMSeU63CjDyiu2hNGQnnPkZJKkvxAA6HBrSyMy3RKDuWfKrh9FzgigABK
   8Lz5M2JY7IofbnoO1MMeWD6IGSJB6j78rYrMxnbopaFiO+U/j++Pdq8kH
   C88c4wyY3gaYAo24T++mzVfkE3BoVF4rXQm8ynpO49ivLCrBK8Lvd2iXD
   g==;
IronPort-SDR: /AMTLDZm77sdcteIsThys0qMIO1pLZBmUFnoiwsF9PxDSPx7xy8uu4K/teOeWmFYMKYDLAqFkd
 SohclqtTj8bYzmjwplwwoFEi+GSa+9Bun/vbnH/9FZmnkPt8o3c4iy5hlpwiSh1fs1b6mSU+sf
 zNkfXfFLIUen26B9goMnNum5ZCwEsIlO2+bq4aqAzb2xX61ZFgjhMYxhLLQ0AY2GQVUdhMpuSV
 Pdc+sU4eLy4EuEWs33qKUS4WAAJvSYllmjlK1wPS/GznjYap2hJQaXZYK+pTev70GQtoIfVXNY
 oQk=
X-IronPort-AV: E=Sophos;i="5.73,470,1583164800"; 
   d="scan'208";a="143480593"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 04 Jun 2020 08:19:21 +0800
IronPort-SDR: uJKN6C6pEqdvoIRNRy466Dpj2L56AkLTmU42upmGANtXafoKWQP2S6kcEzv5ly/URl+m9G9ezs
 DOe7beraA+Me4TGHqkA3TVcN7uyapQzcs=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2020 17:08:58 -0700
IronPort-SDR: d4Vpx+DuJnh58KUccYX/k60tDO7UvUtoli6WxuVDrsuFbzyWsI9WX/pg21x+BT/GaUGEVB/J2j
 ajjQoIBGmEjA==
WDCIronportException: Internal
Received: from unknown (HELO redsun52) ([10.149.66.28])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2020 17:19:19 -0700
Date:   Thu, 4 Jun 2020 01:19:15 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@wdc.com>
To:     YunQiang Su <syq@debian.org>
cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips <linux-mips@vger.kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>,
        "Maciej W. Rozycki" <macro@linux-mips.org>
Subject: Re: [PATCH] mips: add o32_fp64 boot param to disable FP64 support
In-Reply-To: <CAKcpw6VkZBtiewrczgT1YS6C1KWf5WnWGf2vZRg+-k24yOD3_Q@mail.gmail.com>
Message-ID: <alpine.LFD.2.21.2006040038360.9519@redsun52.ssa.fujisawa.hgst.com>
References: <20200528231628.120171-1-syq@debian.org> <20200529110913.GA11310@alpha.franken.de> <CAKcpw6VkZBtiewrczgT1YS6C1KWf5WnWGf2vZRg+-k24yOD3_Q@mail.gmail.com>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 29 May 2020, YunQiang Su wrote:

> > > When build with CONFIG_O32_FP64_SUPPORTS, even all of the userland
> > > is FPXX, we cannot run any FP32 binary.
> >
> > I don't understand what this means. Can you explain what the problem
> > is ?
> >
> 
> Some or most CPU cannot run FP32 application if
> CONFIG_O32_FP64_SUPPORTS is enabled.
> So we switch the whole Debian archive to FPXX. But the golang cannot
> support FP32 now.
> 
> So I wish provides a way to support FP32 and FP64 with a single kernel image.

 Well, FP32 and FP64 (and FPXX) are per-program attributes set in the ELF 
headers of o32 binaries and CP0.Status.FR is a per-process property.  At 
program execution an FP64-enabled kernel will set CP0.Status.FR in the 
program's user context according to the FP32/FP64 setting in the program's 
ELF structures, or fail if hardware does not support the requested mode.  

 The FPXX hybrid mode is there to permit running with either CP0.Status.FR 
setting, by tightening the FP ABI and forbidding the use of some code that 
is allowed with both FP32 and FP64.  This mode also permits the use of 
either FP32 or FP64 modules (but not both at a time) in dynamic loading, 
by switching CP0.Status.FR accordingly as long as supported by the piece 
of hardware being run on.

 If you have software that only supports a certain FPxx setting, then 
build it accordingly and the kernel will do the rest.  If the setting 
required is not compatible with what hardware supports, then you can't run 
your software on your hardware, and if you override the checks by patching 
the kernel, then you'll get incorrect results.

 So what problem are you trying to solve?  Why do you need FP32 support if 
all your software is FPXX (which will run with any CP0.Status.FR setting), 
and why does Go have issues (what kind of issues?) with any particular 
FPxx setting given that it uses the same MIPS backend as all the other 
language frontends do?

  Maciej
