Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 550FA239C41
	for <lists+linux-mips@lfdr.de>; Sun,  2 Aug 2020 23:47:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726807AbgHBVqk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 2 Aug 2020 17:46:40 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:14837 "EHLO
        esa6.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725925AbgHBVqj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 2 Aug 2020 17:46:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1596404799; x=1627940799;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=HhMDDX9Zyq0lnAOjaZ2ZkZv1uEybzvPPlvRAKPE2Mi4=;
  b=Dhp3GcG3AGn2YVR9hczUBPPeHRUbCw3nkvx3b7iI4SwTGqpgmb+xtaS7
   eTum5I8rA1TEOLjgqQRpYe5UXlozN8VmshY4rmQgHkcjfCR88OuJtz41Q
   35sbkTtZItI23hpepEDWF0Fq/9qBka1E9sb3flsYLo12cMZS4cQAoikBM
   rnt4OFvig8B31Ctt6yfKmAveFv5vJA5xZhsLdHsnzmeer0ucCpWfrkCyU
   xBB0LM748/laN0fZeKHkyAKENBETRSWfsPYG8MAlp2+LjYPM/B6bXUcWS
   fMJEeF//I0V7RRnYNaJAGfow6SzzgbJd7s/oV7ZDOCfrMilbOS8bzFxkv
   Q==;
IronPort-SDR: mmGC6VYzUw0/Xm3SF7hz7+mqq/r+LRNGVbtlVKftD/xekcs0CTjvE6kzEf2bvCHP7QvbBxfDvK
 OWrcSRPgEwcBDunBc+bwRkn1djtmBPjI/HywPouj1zsfO3BwyAdD/V1DLug6NSWg99NQRtWYS6
 HpWeIP64ItHu1acYKWpbZ4rqy3fPOzwncqkwRiFuOwrUVRoPGEHKcE8TC1kNTWnPh0may3ZOHh
 wWNWbZez0S7uefPsSFcK+B/sx9NfaaLocWAGb/1WpBH9Gn+rY86ykRiEb5fnwzVKMYocw1IR/7
 mNA=
X-IronPort-AV: E=Sophos;i="5.75,427,1589212800"; 
   d="scan'208";a="145206025"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 03 Aug 2020 05:46:39 +0800
IronPort-SDR: Of+NQSeWgfwtFfqruu8dUkJBUG+rmaqAx6V0PBh4ra70Xjik38WsDJ5/CDKQRCXPcbGuCCf7JU
 zXeVX120rt/A==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2020 14:34:41 -0700
IronPort-SDR: JTyJYmcsIT11nuHwWLExo6iBi+mF5vdh7h7vaYkePP/j5kQrDj9empvuoa8t8vFkBznxCIW4zU
 DS6T5zWH/Fvw==
WDCIronportException: Internal
Received: from unknown (HELO redsun52) ([10.149.66.28])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2020 14:46:37 -0700
Date:   Sun, 2 Aug 2020 22:46:31 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@wdc.com>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
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
In-Reply-To: <20200731061702.fxdfyxpvd6qrhoql@mobilestation>
Message-ID: <alpine.LFD.2.21.2008022213500.24175@redsun52.ssa.fujisawa.hgst.com>
References: <20200731041018.1381642-1-jiaxun.yang@flygoat.com> <20200731061702.fxdfyxpvd6qrhoql@mobilestation>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 31 Jul 2020, Serge Semin wrote:

> > Requested by downstream distros, a Kconfig option for default
> > IEEE754 conformance mode allows them to set their mode to
> > relaxed by default.
> 
> That's what should have been here in the first place. Thanks!

 Well, originally plans were there to have NaN interlinking implemented 
and no such mess or desire for hacks like one here would result.  Cf.:

<https://gcc.gnu.org/ml/gcc/2015-11/msg00068.html>,
<https://gcc.gnu.org/ml/gcc/2016-05/msg00137.html>,

and then:

<https://lkml.org/lkml/2015/11/16/386>,
<https://sourceware.org/ml/libc-alpha/2015-11/msg00485.html>,
<https://sourceware.org/ml/binutils/2015-11/msg00170.html>,
<https://gcc.gnu.org/ml/gcc-patches/2015-11/msg03241.html>.

You could well pick this work up and complete it if you like.  Final 
conclusions for further work were made here:

<https://gcc.gnu.org/ml/gcc/2016-11/msg00027.html>,
<https://gcc.gnu.org/ml/gcc/2017-08/msg00260.html>,
<https://gcc.gnu.org/ml/gcc/2017-10/msg00142.html>.

 In the relaxed mode math programs may produce wrong results unless you 
rebuild all your software for the correct NaN mode for the hardware used 
(in which case you don't need the relaxed setting in the first place).

  Maciej
