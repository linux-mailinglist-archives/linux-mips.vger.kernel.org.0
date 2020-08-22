Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1687524E4A4
	for <lists+linux-mips@lfdr.de>; Sat, 22 Aug 2020 04:29:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725965AbgHVC3l (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 Aug 2020 22:29:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725938AbgHVC3k (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 21 Aug 2020 22:29:40 -0400
X-Greylist: delayed 25574 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 21 Aug 2020 19:29:39 PDT
Received: from orcam.me.uk (tpp.orcam.me.uk [IPv6:2001:8b0:154:0:ea6a:64ff:fe24:f2fc])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E41E8C061573;
        Fri, 21 Aug 2020 19:29:39 -0700 (PDT)
Received: from bugs.linux-mips.org (eddie.linux-mips.org [IPv6:2a01:4f8:201:92aa::3])
        by orcam.me.uk (Postfix) with ESMTPS id 1DAFF2BE086;
        Sat, 22 Aug 2020 03:29:38 +0100 (BST)
Date:   Sat, 22 Aug 2020 03:29:36 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Paul Cercueil <paul@crapouillou.net>
cc:     Zhou Yanjie <zhouyanjie@wanyeetech.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, od@zcrc.me,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        =?UTF-8?B?5ryG6bmP5oyv?= <aric.pzqi@ingenic.com>,
        dongsheng.qiu@ingenic.com, rick.tyliu@ingenic.com,
        yanfei.li@ingenic.com, xuwanhao@wanyeetech.com
Subject: Re: [PATCH 00/13] MIPS: Convert Ingenic to a generic board
In-Reply-To: <4SSFFQ.3I498N5I41LP3@crapouillou.net>
Message-ID: <alpine.LFD.2.21.2008220310130.3460685@eddie.linux-mips.org>
References: <20200803170124.231110-1-paul@crapouillou.net>        <ab985296-8441-4006-210d-a71503bd01f0@wanyeetech.com>        <L8DPEQ.71Z8YA0QXBJA@crapouillou.net>        <alpine.LFD.2.21.2008211949220.3460685@eddie.linux-mips.org>
 <4SSFFQ.3I498N5I41LP3@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

> > FAOD <cpu-feature-overrides.h> is not a hack, but an optimisation measure
> > so that features known to be hardwired for a given machine/CPU do not have
> > to be dynamically queried every time referred.  In some cases that results
> > in large portions of code being optimised away by the compiler as well.
> 
> Fair enough. Bloat-o-meter reports about ~100 KiB saved when that file is
> present. But we can't use it in a generic kernel, unfortunately.

 Well, run-time patching might be an alternative to get the best of both 
worlds, but someone would have to reimplement our feature selection system 
to use it.

> > The hardcoded value for a feature defined in <cpu-feature-overrides.h>
> > always has to be the same as one in the corresponding bit of the `options'
> > member of `struct cpuinfo_mips', in this case MIPS_CPU_TLBINV.
> 
> In theory yes, in practice the CPU detection code is lagging behind...

 I wasn't aware of that.  In that case it has been a design abuse which 
has been missed by the maintainer when accepting patches.  It used to be 
the case that run-time detection was accurate and overrides were rather 
lazily added.

 Also I note Ingenic must have had a CPU erratum if our `decode_configs' 
doesn't just work, as the interpretation of CP0.Config[5:0] registers has 
been architectural and mandatory, and that for a reason.  It's only legacy 
MIPS I-IV processors that should require special attention here.

  Maciej
