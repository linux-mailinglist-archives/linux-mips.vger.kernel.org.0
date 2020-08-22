Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1A8B24E7BD
	for <lists+linux-mips@lfdr.de>; Sat, 22 Aug 2020 16:00:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727948AbgHVOAQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 22 Aug 2020 10:00:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727900AbgHVOAQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 22 Aug 2020 10:00:16 -0400
Received: from orcam.me.uk (orcam.me.uk [IPv6:2001:8b0:154:0:ea6a:64ff:fe24:f2fc])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6C416C061573;
        Sat, 22 Aug 2020 07:00:15 -0700 (PDT)
Received: from bugs.linux-mips.org (eddie.linux-mips.org [IPv6:2a01:4f8:201:92aa::3])
        by orcam.me.uk (Postfix) with ESMTPS id 01B152BE086;
        Sat, 22 Aug 2020 15:00:08 +0100 (BST)
Date:   Sat, 22 Aug 2020 15:00:00 +0100 (BST)
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
In-Reply-To: <PLVGFQ.TBOPD0BSHD5L1@crapouillou.net>
Message-ID: <alpine.LFD.2.21.2008221456410.3460685@eddie.linux-mips.org>
References: <20200803170124.231110-1-paul@crapouillou.net>        <ab985296-8441-4006-210d-a71503bd01f0@wanyeetech.com>        <L8DPEQ.71Z8YA0QXBJA@crapouillou.net>        <alpine.LFD.2.21.2008211949220.3460685@eddie.linux-mips.org>       
 <4SSFFQ.3I498N5I41LP3@crapouillou.net>        <alpine.LFD.2.21.2008220310130.3460685@eddie.linux-mips.org> <PLVGFQ.TBOPD0BSHD5L1@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, 22 Aug 2020, Paul Cercueil wrote:

> > Well, run-time patching might be an alternative to get the best of both
> > worlds, but someone would have to reimplement our feature selection system
> > to use it.
> 
> Would run-time patching allow to drop dead code?

 I don't know offhand.  In principle it should be doable like with init 
sections, but that requires out of line code, so there'd still be some 
performance hit compared to a kernel configuration dedicated to a single 
platform.

  Maciej
