Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7FC223D026
	for <lists+linux-mips@lfdr.de>; Wed,  5 Aug 2020 21:30:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726915AbgHETan (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 5 Aug 2020 15:30:43 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:20597 "EHLO
        esa1.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728378AbgHETa1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 5 Aug 2020 15:30:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1596655826; x=1628191826;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=22FNyOPpYPWk//S3AUoFOnpQi+utyKNlP93NhezS5ZQ=;
  b=qgI5K9FEFK2UgET/clHaHZzNvF8A2Un2kYxyOXlpTF3Yb59xmxfPFg8d
   Pwxu9bPo/8dGjbfDWhSlS8KAeoBJuk6x3GunuY+2QqdCDlH92ogmRziJM
   VJrPEDlZLuiD972ESCDAQ9lzpjyRa8IkBIm5BAN4lPJQCj1mNRlcva6nq
   Tsb+macQ/ECUKr/E2gMptOOgxeW6ABB3j3IchratDIa6CRyNjWFaBaKyh
   0v/G1m/VPdelz7vRBw9OwHAiH8osZBxYJ0iPa9OVuVmTTUw+a9UYlniPa
   b+bTILtvnRlzNTd6LBy+DwXIL2uVKz1dKseudKucqkWalYdjp8PNaYY2f
   w==;
IronPort-SDR: ubq9YOGV2iwm/yQRMo6y6tqSb+SbO+O3X3vhaQXBvY4j6CGcunyU6pXFlXjqB5xKa+ueKnZuoS
 49K/XL3Qe2U6lyWHIDBTRvUdbO0gjkI5QmO/VKh0EINdM3HL+gd09TQls8arSN9p1/JB7+kfsB
 OnOWS64kzopCXmOqq50nMcrqR91I119Of8sUfj5Ht7JLdgC2E3Ck0Mtr5mB/WBR2JCwtE1z0DQ
 WhuplqSFko0vsjQCPG05AWOvBL7FvYvwHmJyontyVGp/v5Rsb5fcMrv5Q0EHmm7LIDP8JXvr0M
 pbw=
X-IronPort-AV: E=Sophos;i="5.75,438,1589212800"; 
   d="scan'208";a="253587414"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 06 Aug 2020 03:30:22 +0800
IronPort-SDR: wEjx5pDVU305WbH5AwF9fA/XmkHKYTrsSVDvA35S9gh7yEtzz9TDG+p58BOZ+6Pau3m9HrQwKt
 DghsGNZ22OKA==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2020 12:17:41 -0700
IronPort-SDR: UxS74IHkuTgSa/zr/0eE6Ttb+qVm2kznk/CZSU8sPDe4YHP/x1DjwKUb4Pby73WrHTBt0hkDr1
 8fcBWc3hA/2A==
WDCIronportException: Internal
Received: from unknown (HELO redsun52) ([10.149.66.28])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2020 12:30:21 -0700
Date:   Wed, 5 Aug 2020 20:30:17 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@wdc.com>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        linux-mips@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Huacai Chen <chenhc@lemote.com>,
        Zhou Yanjie <zhouyanjie@zoho.com>,
        =?UTF-8?Q?=E5=91=A8=E7=90=B0=E6=9D=B0_=28Zhou_Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>,
        Liangliang Huang <huanglllzu@gmail.com>,
        linux-kernel@vger.kernel.org,
        "Maciej W. Rozycki" <macro@linux-mips.org>
Subject: Re: [PATCH] MIPS: Provide Kconfig option for default IEEE754
 conformance mode
In-Reply-To: <ceb71bef-b3e6-68ce-df80-bcff92085e66@flygoat.com>
Message-ID: <alpine.LFD.2.21.2008051850390.24175@redsun52.ssa.fujisawa.hgst.com>
References: <20200731041018.1381642-1-jiaxun.yang@flygoat.com> <20200731061702.fxdfyxpvd6qrhoql@mobilestation> <alpine.LFD.2.21.2008022213500.24175@redsun52.ssa.fujisawa.hgst.com> <ceb71bef-b3e6-68ce-df80-bcff92085e66@flygoat.com>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 3 Aug 2020, Jiaxun Yang wrote:

> >   Well, originally plans were there to have NaN interlinking implemented
> > and no such mess or desire for hacks like one here would result.  Cf.:
> >
> > <https://gcc.gnu.org/ml/gcc/2015-11/msg00068.html>,
> > <https://gcc.gnu.org/ml/gcc/2016-05/msg00137.html>,
> >
> > and then:
> >
> > <https://lkml.org/lkml/2015/11/16/386>,
> > <https://sourceware.org/ml/libc-alpha/2015-11/msg00485.html>,
> > <https://sourceware.org/ml/binutils/2015-11/msg00170.html>,
> > <https://gcc.gnu.org/ml/gcc-patches/2015-11/msg03241.html>.
> >
> > You could well pick this work up and complete it if you like.  Final
> > conclusions for further work were made here:
> >
> > <https://gcc.gnu.org/ml/gcc/2016-11/msg00027.html>,
> > <https://gcc.gnu.org/ml/gcc/2017-08/msg00260.html>,
> > <https://gcc.gnu.org/ml/gcc/2017-10/msg00142.html>.
> >
> >   In the relaxed mode math programs may produce wrong results unless you
> > rebuild all your software for the correct NaN mode for the hardware used
> 
> Unfortunately most of the hardware guys didn't understood the difficulty 
> here.
> They decided to implement their hardware (P5600 & LS3A4000) as NaN2008 only.

 Sadly we (the software group) have lost the battle with the hardware 
group for the architecture to have FCSR.NAN2008 at least optionally 
writable, and the feature was subsequently removed from R5 on, along with 
the writability of FCSR.ABS2008 and the FCSR.MAC2008 bit altogether.

 Still R3 did permit those bits to be r/w (check rev. 3.50 of the 
architecture spec), which is why I implemented them as such in our FP 
emulation and also QEMU (although I need to note that a competing QEMU 
implementation was pushed upstream behind my back, which I believe wasn't 
as complete as mine, so this part may or may not have been implemented).

> I was thinking about let Kernel drop SIGFPE exception was caused by 
> mismatched NaN,
> as most applications don't rely on signaling NaN, but it is still a 
> dirty hack. Not a good
> idea in general.

 I think you cannot reliably send SIGFPE, because hardware does not trap 
on what it considers a qNaN.

 The interlinking effort was there to let individual pieces of software 
that have various requirements for NaNs, or do not use FP at all, to use a 
set of rules for possibly being allowed to run on incompatible hardware or 
loaded together by the dynamic loader.  For example there was a mode 
specified where all NaNs were silently treated as qNaNs regardless of the 
hardware interpretation of a specific encoding.

 I maintain this is the way to move forward, and if you are serious about 
keeping the architecture alive, then I strongly recommend to upstream the 
implementation, possibly based on my patches previously published, 
although as indicated in the discussion referred there have been design 
issues observed, which mean a certain amount of rework will be required, 
first on the spec, and then the implementation.

 FWIW,

  Maciej
