Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72E121BF5C
	for <lists+linux-mips@lfdr.de>; Tue, 14 May 2019 00:06:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726728AbfEMWGp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 May 2019 18:06:45 -0400
Received: from smtprelay0179.hostedemail.com ([216.40.44.179]:53535 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726702AbfEMWGp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 13 May 2019 18:06:45 -0400
X-Greylist: delayed 535 seconds by postgrey-1.27 at vger.kernel.org; Mon, 13 May 2019 18:06:44 EDT
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave05.hostedemail.com (Postfix) with ESMTP id A0E3C1801E8C3
        for <linux-mips@vger.kernel.org>; Mon, 13 May 2019 21:57:49 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay05.hostedemail.com (Postfix) with ESMTP id 513FB1802912A;
        Mon, 13 May 2019 21:57:48 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,:::::::::,RULES_HIT:41:355:379:599:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1539:1567:1593:1594:1711:1714:1730:1747:1777:1792:1801:2393:2559:2562:2693:2828:3138:3139:3140:3141:3142:3622:3865:3866:3870:3871:3872:3874:4321:4605:5007:7974:10004:10400:10848:11232:11658:11914:12043:12740:12760:12895:13069:13311:13357:13439:14659:21080:21451:21626:30054:30079:30091,0,RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.8.0.180 64.201.201.201,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:fn,MSBL:0,DNSBL:neutral,Custom_rules:0:0:0,LFtime:26,LUA_SUMMARY:none
X-HE-Tag: tramp93_6119a0acc5355
X-Filterd-Recvd-Size: 1656
Received: from XPS-9350.home (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
        (Authenticated sender: joe@perches.com)
        by omf19.hostedemail.com (Postfix) with ESMTPA;
        Mon, 13 May 2019 21:57:47 +0000 (UTC)
Message-ID: <ffbff01f239ec468af0b591638e019f3f8fc990e.camel@perches.com>
Subject: Re: [PATCH 1/2] firmware: bcm47xx_nvram: Correct size_t printf
 format
From:   Joe Perches <joe@perches.com>
To:     Florian Fainelli <f.fainelli@gmail.com>, linux-mips@linux-mips.org
Cc:     =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Date:   Mon, 13 May 2019 14:57:45 -0700
In-Reply-To: <20190513215250.19246-1-f.fainelli@gmail.com>
References: <20190513215250.19246-1-f.fainelli@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.30.1-1build1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 2019-05-13 at 14:52 -0700, Florian Fainelli wrote:
> When building on a 64-bit host, we will get warnings like those:
> 
> drivers/firmware/broadcom/bcm47xx_nvram.c:103:3: note: in expansion of macro 'pr_err'
>    pr_err("nvram on flash (%i bytes) is bigger than the reserved space in memory, will just copy the first %i bytes\n",
>    ^~~~~~
> drivers/firmware/broadcom/bcm47xx_nvram.c:103:28: note: format string is defined here
>    pr_err("nvram on flash (%i bytes) is bigger than the reserved space in memory, will just copy the first %i bytes\n",
>                            ~^
>                            %li
> 
> Use %zi instead for that purpose.

typically it is %zu


