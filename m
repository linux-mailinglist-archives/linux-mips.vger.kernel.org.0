Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5661350548
	for <lists+linux-mips@lfdr.de>; Wed, 31 Mar 2021 19:15:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229968AbhCaROi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 31 Mar 2021 13:14:38 -0400
Received: from rcdn-iport-4.cisco.com ([173.37.86.75]:40210 "EHLO
        rcdn-iport-4.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229787AbhCaROM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 31 Mar 2021 13:14:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=2143; q=dns/txt; s=iport;
  t=1617210852; x=1618420452;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XBXiV/KZU9RAJFyY2sfCpxX3SMZ3qudvdd8J5wHAY+k=;
  b=dAR6GbyjVmMiBGE3MVUtiLqRiGDJn4lhDije+Bp5cFgz0adRaHMCkueh
   yx+Qxa4Ud7YFELJrlsW2eQoIZtKPuv77vj54vNRaxOWL7FbJ+Jj8WUwxK
   QdfNfaA06YFF7v3C62FrBwdV8erKhCk6hvyU4VyM0bzYxA6wbhmP3TFJl
   Y=;
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AtSp+ZKM2+fmgyMBcT5r155DYdL4zR+YMi2?=
 =?us-ascii?q?QD/UoZc3NoW+afkN2jm+le+B/vkTAKWGwhn9foAtjkfVr385lp7Y4NeYqzRQ?=
 =?us-ascii?q?WOghrLEKhO5ZbvqgeLJwTQ7ehYvJ0MT4FfD5nKAUF+nYLG5mCDYrId6f2m1I?=
 =?us-ascii?q?ztuuvE1XdqSmhRGsJdxiN0EBySHEEzZCQuP/sEPaGR7MZGuDasEE5/Bq+GL0?=
 =?us-ascii?q?IIUOTZq9rAmIiOW347LiQ64wqDhy7A0tDHOiWfty1zbxp/hZ8/7G6AqADi/6?=
 =?us-ascii?q?Olqf3+8APEznTe9Y4+oqqH9vJzQOqRl8MSNjLgziGvaYgJYcz6gBkF5Mey9V?=
 =?us-ascii?q?0tjN7A5y0FAv02wXbQcmapyCGdvTXd7A=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0DUAgB8rWRg/5ldJa1aGwEBAQEBAQE?=
 =?us-ascii?q?BBQEBARIBAQEDAwEBAUCBUIIrgUgEATmWRQOQCBaKWYFoCwEBAQ0BATQEAQG?=
 =?us-ascii?q?EUAKBewIlOBMCAwEBDAEBBQEBAQIBBgRxhW6GRQEFOj8QCxgVGTwbBoYMqnV?=
 =?us-ascii?q?1gTSJDoFEFA6BF41KJhyBSUKBEoMcPoN5gQaDDIIJIgSBZWEuYoIEOR8UL5E?=
 =?us-ascii?q?BgkCKUJwjgxGBI5s5MRCDOIpwliC4GwIEBgUCFoFrI4FZMxoIGxWDJU8ZDZ0?=
 =?us-ascii?q?IIQNnAgYKAQEDCY8JAQE?=
X-IronPort-AV: E=Sophos;i="5.81,293,1610409600"; 
   d="scan'208";a="855046290"
Received: from rcdn-core-2.cisco.com ([173.37.93.153])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 31 Mar 2021 17:14:11 +0000
Received: from zorba ([10.24.8.227])
        by rcdn-core-2.cisco.com (8.15.2/8.15.2) with ESMTPS id 12VHE8Ja029161
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Wed, 31 Mar 2021 17:14:10 GMT
Date:   Wed, 31 Mar 2021 10:14:08 -0700
From:   Daniel Walker <danielwa@cisco.com>
To:     Will Deacon <will@kernel.org>
Cc:     Christophe Leroy <christophe.leroy@csgroup.eu>,
        Rob Herring <robh@kernel.org>,
        Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
        Andrew Morton <akpm@linux-foundation.org>,
        X86 ML <x86@kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        xe-linux-external@cisco.com, Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/7] powerpc: convert config files to generic cmdline
Message-ID: <20210331171408.GC2469518@zorba>
References: <20210309000247.2989531-4-danielwa@cisco.com>
 <5f865584-09c9-d21f-ffb7-23cf07cf058e@csgroup.eu>
 <20210309212944.GR109100@zorba>
 <e4899874-1684-fa1b-443e-f4e478e05e31@csgroup.eu>
 <CAL_JsqKm76jRQYDcu3rGyUWKPLspoO=EZW_WFy=zAK+m_JYCTg@mail.gmail.com>
 <20fd7d44-8c39-48bc-25c3-990be9d9d911@csgroup.eu>
 <20210325195956.GM109100@zorba>
 <20210329100750.GB3207@willie-the-truck>
 <20210330173521.GT109100@zorba>
 <20210331115218.GB7626@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210331115218.GB7626@willie-the-truck>
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.24.8.227, [10.24.8.227]
X-Outbound-Node: rcdn-core-2.cisco.com
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Mar 31, 2021 at 12:52:19PM +0100, Will Deacon wrote:
> On Tue, Mar 30, 2021 at 10:35:21AM -0700, Daniel Walker wrote:
> > On Mon, Mar 29, 2021 at 11:07:51AM +0100, Will Deacon wrote:
> > > On Thu, Mar 25, 2021 at 12:59:56PM -0700, Daniel Walker wrote:
> > > > On Thu, Mar 25, 2021 at 01:03:55PM +0100, Christophe Leroy wrote:
> > > > > 
> > > > > Ok, so you agree we don't need to provide two CMDLINE, one to be appended and one to be prepended.
> > > > > 
> > > > > Let's only provide once CMDLINE as of today, and ask the user to select
> > > > > whether he wants it appended or prepended or replacee. Then no need to
> > > > > change all existing config to rename CONFIG_CMDLINE into either of the new
> > > > > ones.
> > > > > 
> > > > > That's the main difference between my series and Daniel's series. So I'll
> > > > > finish taking Will's comment into account and we'll send out a v3 soon.
> > > > 
> > > > It doesn't solve the needs of Cisco, I've stated many times your changes have
> > > > little value. Please stop submitting them.
> > > 
> > > FWIW, they're useful for arm64 and I will gladly review the updated series.
> > > 
> > > I don't think asking people to stop submitting patches is ever the right
> > > answer. Please don't do that.
> > 
> > Why ? It's me nacking his series, is that not allowed anymore ?
> 
> If you're that way inclined then you can "nack" whatever you want, but
> please allow the rest of us to continue reviewing the patches. You don't
> have any basis on which to veto other people's contributions and so
> demanding that somebody stops posting code is neither constructive nor
> meaningful.

I understand , but that's not what's happening. I've dealt with Christophe on
these changes repeatedly, and he's demonstrated he doesn't understand the feature set or
the motivation of the changes. I've tried to work with him in the past, but it
doesn't work unless he's giving me comments on my changes.

His changes don't solve Cisco problems, and likely never will regardless of
feedback. Maybe that could change, but I don't see that happening.

Daniel
