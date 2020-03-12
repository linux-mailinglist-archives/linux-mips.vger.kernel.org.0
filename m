Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 800BB1828DC
	for <lists+linux-mips@lfdr.de>; Thu, 12 Mar 2020 07:16:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387786AbgCLGQq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 12 Mar 2020 02:16:46 -0400
Received: from smtprelay0065.hostedemail.com ([216.40.44.65]:51386 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2387784AbgCLGQq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 12 Mar 2020 02:16:46 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay07.hostedemail.com (Postfix) with ESMTP id D9D6B181D341E;
        Thu, 12 Mar 2020 06:16:45 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 50,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:800:960:967:973:982:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2393:2525:2553:2560:2563:2682:2685:2828:2859:2902:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3352:3622:3865:3866:3867:3868:3871:3874:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4321:5007:6742:9025:10004:10400:10848:11026:11232:11658:11914:12043:12297:12438:12555:12663:12740:12760:12895:12986:13069:13311:13357:13439:14181:14659:14721:21080:21433:21627:21811:21939:30054:30055:30090:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: room59_74f27b9f71a53
X-Filterd-Recvd-Size: 2513
Received: from XPS-9350.home (unknown [47.151.143.254])
        (Authenticated sender: joe@perches.com)
        by omf02.hostedemail.com (Postfix) with ESMTPA;
        Thu, 12 Mar 2020 06:16:43 +0000 (UTC)
Message-ID: <e4443663a51ecf601e137990019075b7dae6a457.camel@perches.com>
Subject: Re: [PATCH -next 004/491] PERFORMANCE EVENTS SUBSYSTEM: Use
 fallthrough;
From:   Joe Perches <joe@perches.com>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Date:   Wed, 11 Mar 2020 23:15:00 -0700
In-Reply-To: <20200311153000.GP12561@hirez.programming.kicks-ass.net>
References: <cover.1583896344.git.joe@perches.com>
         <73d22360c5c665fd7f480a209ae46807dfb07bbe.1583896348.git.joe@perches.com>
         <20200311153000.GP12561@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 2020-03-11 at 16:30 +0100, Peter Zijlstra wrote:
> On Tue, Mar 10, 2020 at 09:51:18PM -0700, Joe Perches wrote:
> > Convert the various uses of fallthrough comments to fallthrough;
> > 
> > Done via script
> > Link: https://lore.kernel.org/lkml/b56602fcf79f849e733e7b521bb0e17895d390fa.1582230379.git.joe.com/
> > 
> > Signed-off-by: Joe Perches <joe@perches.com>
> 
> The subject can use a little less screaming, but the actual patch is
> fine.

Patch subject come from the MAINTAINERS subsystem/section heading
because I don't see a better way to script the patch subject that
is more effective.

Using something like:

$ cat get_patch_subject_prefix.bash
#!/bin/bash
git log --format="%s" --no-merges -200 --since=2-years-ago $@ | \
  cut -f1 -d":" | \
  sort  | uniq -c | sort -rn | head -1 | \
  sed 's/^[[:space:]]*[[:digit:]]*[[:space:]]*//'
$

Does well for some sets of files, less well for others.

For instance:

$ ./get_patch_subject_prefix.bash drivers/net/ethernet/intel/
ice

which is just one of 10 or so subsystems of intel/...

And there's no way I'm going to individually edit
~500 patches for every specific maintainer's preference.


