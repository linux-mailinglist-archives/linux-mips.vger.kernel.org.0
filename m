Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78CE7165580
	for <lists+linux-mips@lfdr.de>; Thu, 20 Feb 2020 04:16:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727370AbgBTDQu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 19 Feb 2020 22:16:50 -0500
Received: from smtprelay0049.hostedemail.com ([216.40.44.49]:48533 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727208AbgBTDQu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 19 Feb 2020 22:16:50 -0500
X-Greylist: delayed 414 seconds by postgrey-1.27 at vger.kernel.org; Wed, 19 Feb 2020 22:16:49 EST
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave02.hostedemail.com (Postfix) with ESMTP id E838818013824
        for <linux-mips@vger.kernel.org>; Thu, 20 Feb 2020 03:09:55 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay08.hostedemail.com (Postfix) with ESMTP id 67E1B182CED28;
        Thu, 20 Feb 2020 03:09:54 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 50,0,0,,d41d8cd98f00b204,joe@perches.com,:::::,RULES_HIT:41:355:379:408:599:967:968:973:988:989:1260:1263:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1539:1593:1594:1711:1714:1730:1747:1777:1792:2194:2199:2393:2525:2560:2563:2682:2685:2828:2859:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3351:3622:3865:3866:3867:3868:3870:3872:3874:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4250:4321:5007:7754:7903:9025:9108:10004:10400:10848:11232:11658:11914:12043:12297:12555:12740:12760:12895:13069:13311:13357:13439:14181:14346:14659:14721:14764:21080:21611:21627:30014:30046:30054:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: tank61_1c33f32e6735c
X-Filterd-Recvd-Size: 1433
Received: from XPS-9350.home (unknown [47.151.143.254])
        (Authenticated sender: joe@perches.com)
        by omf12.hostedemail.com (Postfix) with ESMTPA;
        Thu, 20 Feb 2020 03:09:53 +0000 (UTC)
Message-ID: <cfeab22c0f332418d25e56fa86f5420f5470e4ee.camel@perches.com>
Subject: Re: [PATCH 2/2] MAINTAINERS: Set MIPS status to Odd Fixes
From:   Joe Perches <joe@perches.com>
To:     Paul Burton <paulburton@kernel.org>, linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org
Date:   Wed, 19 Feb 2020 19:08:30 -0800
In-Reply-To: <20200219191730.1277800-3-paulburton@kernel.org>
References: <20200219191730.1277800-1-paulburton@kernel.org>
         <20200219191730.1277800-3-paulburton@kernel.org>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 2020-02-19 at 11:17 -0800, Paul Burton wrote:
> My time with MIPS the company has reached its end, and so at best I'll
> have little time spend on maintaining arch/mips/. Reflect that in
> MAINTAINERS by changing status to Odd Fixes. Hopefully this might spur
> the involvement of someone with more time, but even if not it should
> help serve to avoid unrealistic expectations.
[]
> diff --git a/MAINTAINERS b/MAINTAINERS
[]
> @@ -11120,7 +11120,7 @@ W:	http://www.linux-mips.org/
>  T:	git git://git.linux-mips.org/pub/scm/ralf/linux.git

Maybe Ralf's T: entry should be removed too.


