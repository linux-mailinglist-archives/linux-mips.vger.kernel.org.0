Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84D5ED342D
	for <lists+linux-mips@lfdr.de>; Fri, 11 Oct 2019 01:12:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726135AbfJJXMB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 10 Oct 2019 19:12:01 -0400
Received: from smtprelay0200.hostedemail.com ([216.40.44.200]:34105 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725959AbfJJXMB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 10 Oct 2019 19:12:01 -0400
X-Greylist: delayed 542 seconds by postgrey-1.27 at vger.kernel.org; Thu, 10 Oct 2019 19:12:00 EDT
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave05.hostedemail.com (Postfix) with ESMTP id 51E6018018126
        for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2019 23:02:59 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay08.hostedemail.com (Postfix) with ESMTP id EE2ED182CED28;
        Thu, 10 Oct 2019 23:02:57 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,:::::::::::::::::,RULES_HIT:41:355:379:599:968:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1538:1593:1594:1711:1714:1730:1747:1777:1792:2393:2559:2562:2693:2828:3138:3139:3140:3141:3142:3165:3350:3622:3865:3866:3867:3868:3870:3871:4039:4321:5007:8603:10004:10400:10848:11232:11658:11914:12050:12296:12297:12740:12760:12895:13069:13311:13357:13439:14659:14721:21080:21324:21433:21627:21972:30054:30070:30091,0,RBL:47.151.152.152:@perches.com:.lbl8.mailshell.net-62.8.0.100 64.201.201.201,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:fn,MSBL:0,DNSBL:neutral,Custom_rules:0:0:0,LFtime:28,LUA_SUMMARY:none
X-HE-Tag: frame79_53e2ee6598517
X-Filterd-Recvd-Size: 1572
Received: from XPS-9350.home (unknown [47.151.152.152])
        (Authenticated sender: joe@perches.com)
        by omf19.hostedemail.com (Postfix) with ESMTPA;
        Thu, 10 Oct 2019 23:02:56 +0000 (UTC)
Message-ID: <fbaeb107184c64e9cfa52a416809bc8866e40adc.camel@perches.com>
Subject: Re: [PATCH] MIPS: OCTEON: Replace SIZEOF_FIELD() macro
From:   Joe Perches <joe@perches.com>
To:     Kees Cook <keescook@chromium.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Thu, 10 Oct 2019 16:02:55 -0700
In-Reply-To: <201910101545.586BCFC@keescook>
References: <201910101545.586BCFC@keescook>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 2019-10-10 at 15:46 -0700, Kees Cook wrote:
> In preparation for switching to a standard sizeof_member() macro to find the
> size of a member of a struct, remove the custom SIZEOF_FIELD() macro and use
> the more common FIELD_SIZEOF() instead. Later patches will globally replace
> FIELD_SIZEOF() and sizeof_field() with the more accurate sizeof_member().

Is the intent to have a single treewide flag day conversion of
FIELD_SIZEOF -> sizeof_member or submit individual patches to
subsystem maintainers?

I don't recall Linus buying in to either mechanism.

