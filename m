Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DEC4355930
	for <lists+linux-mips@lfdr.de>; Tue,  6 Apr 2021 18:29:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346427AbhDFQaF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 6 Apr 2021 12:30:05 -0400
Received: from rcdn-iport-7.cisco.com ([173.37.86.78]:60372 "EHLO
        rcdn-iport-7.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346426AbhDFQaC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 6 Apr 2021 12:30:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=3941; q=dns/txt; s=iport;
  t=1617726594; x=1618936194;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wtAeIc7XsQsptor4RXWPj9Y8j7ZxS+JmY38g2U87X54=;
  b=B65QOGPWwAX19xQm1YN0GX1QtqO9yKCfWGX8BcF76Qo0ASrcgPt1UFmk
   hNlgOlgqW2IxQmF3OcNcY7Z9r+CuEXSEbqnNe/CrzLmmTvRtMinXlgN2n
   L0z5Nak+qOVSesDpz4YQhdDj5AgeyHovb6P+iUXH0iunnVpRLAoepdIaj
   s=;
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3A8kZ/JKy/HEtUs8XFn+v/KrPxd+skLtp033?=
 =?us-ascii?q?Aq2lEZdDV+eKWj+PyGtvIdyBPylXI9WGs4n8qBJamHRhrnhPtIyKMWOqqvWx?=
 =?us-ascii?q?SjhXuwIOhZnOnf6hDpBiGWzIRg/Ih6dawWMrDNJHh8yf33+QypV+snqeP3lJ?=
 =?us-ascii?q?yAocf74zNTQRpxa6dmhj0JaTqzNkFtXgFJCd4YOfOnh/ZvnDardXQJYsnTPB?=
 =?us-ascii?q?BsNNTrnNHFmInrZhQLHXcciDWmty+i67LxDnGjsCs2bjUn+9sf2FmAuxDl4O?=
 =?us-ascii?q?GZv+ujzBjH2yvo841Og9f60LJ4dauxo/lQDCnwgQC1Y4kkfLuOsFkO0ZiSwW?=
 =?us-ascii?q?dvtsXQqBE9OMk20VftRyWepBvg3BSI6kdJ10Pf?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AHAAD2i2xg/4UNJK1aGQEBAQEBAQE?=
 =?us-ascii?q?BAQEBAQEBAQEBARIBAQEBAQEBAQEBAQFAgT4EAQEBAQELAYIqgU0BOTGMZok?=
 =?us-ascii?q?vA5AMFopGFIFoCwEBAQ0BATQEAQGEUAKBdgIlNAkOAgMBAQwBAQUBAQECAQY?=
 =?us-ascii?q?EcROFXYZEAQEBAwE6PxALEgYVGTwNDgYThVghq011gTSBAYgdgUQUDoEXAY1?=
 =?us-ascii?q?MJxyBSUKENT6DeYEGhRYiBIFlWwaBEBs/Vi8lWBQCLZEGgkGKW5sVgRSDFYE?=
 =?us-ascii?q?mm0cyEIM9iniWLLg+AgQGBQIWgVQ6gVkzGggbFYMkUBkOjisWjkchAy84AgY?=
 =?us-ascii?q?KAQEDCY1EAQE?=
X-IronPort-AV: E=Sophos;i="5.82,310,1613433600"; 
   d="scan'208";a="867307959"
Received: from alln-core-11.cisco.com ([173.36.13.133])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 06 Apr 2021 16:29:52 +0000
Received: from zorba ([10.24.14.212])
        by alln-core-11.cisco.com (8.15.2/8.15.2) with ESMTPS id 136GTgP5005585
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Tue, 6 Apr 2021 16:29:44 GMT
Date:   Tue, 6 Apr 2021 09:29:42 -0700
From:   Daniel Walker <danielwa@cisco.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Christophe Leroy <christophe.leroy@csgroup.eu>,
        Will Deacon <will@kernel.org>,
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
Message-ID: <20210406162942.GR2469518@zorba>
References: <20210309212944.GR109100@zorba>
 <e4899874-1684-fa1b-443e-f4e478e05e31@csgroup.eu>
 <CAL_JsqKm76jRQYDcu3rGyUWKPLspoO=EZW_WFy=zAK+m_JYCTg@mail.gmail.com>
 <20fd7d44-8c39-48bc-25c3-990be9d9d911@csgroup.eu>
 <20210325195956.GM109100@zorba>
 <CAL_Jsq+10nucQSRkrTKe9BD5wBScqEb7-Rdg=9TsPiKuiuPG7w@mail.gmail.com>
 <20210330173254.GS109100@zorba>
 <CAL_JsqJKBeAgaHQJwOL9G2qLbQSh32L5LtN+cSUgn5sV_P8How@mail.gmail.com>
 <20210330233137.GB2469518@zorba>
 <CAL_JsqL8bJrxnJgs4doQ0L7YTF0vrDZLOoPOBdJzwTgMhXm-dw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqL8bJrxnJgs4doQ0L7YTF0vrDZLOoPOBdJzwTgMhXm-dw@mail.gmail.com>
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.24.14.212, [10.24.14.212]
X-Outbound-Node: alln-core-11.cisco.com
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Apr 01, 2021 at 03:08:04PM -0500, Rob Herring wrote:
> On Tue, Mar 30, 2021 at 6:31 PM Daniel Walker <danielwa@cisco.com> wrote:
> >
> > On Tue, Mar 30, 2021 at 03:13:04PM -0500, Rob Herring wrote:
> > > On Tue, Mar 30, 2021 at 12:33 PM Daniel Walker <danielwa@cisco.com> wrote:
> > > >
> > > > On Thu, Mar 25, 2021 at 05:29:44PM -0600, Rob Herring wrote:
> > > > > On Thu, Mar 25, 2021 at 2:00 PM Daniel Walker <danielwa@cisco.com> wrote:
> > > > > >
> > > > > > On Thu, Mar 25, 2021 at 01:03:55PM +0100, Christophe Leroy wrote:
> > > > > > >
> > > > > > > Ok, so you agree we don't need to provide two CMDLINE, one to be appended and one to be prepended.
> > > > > > >
> > > > > > > Let's only provide once CMDLINE as of today, and ask the user to select
> > > > > > > whether he wants it appended or prepended or replacee. Then no need to
> > > > > > > change all existing config to rename CONFIG_CMDLINE into either of the new
> > > > > > > ones.
> > > > > > >
> > > > > > > That's the main difference between my series and Daniel's series. So I'll
> > > > > > > finish taking Will's comment into account and we'll send out a v3 soon.
> > > > > >
> > > > > > It doesn't solve the needs of Cisco, I've stated many times your changes have
> > > > > > little value. Please stop submitting them.
> > > > >
> > > > > Can you please outline what those needs are which aren't met?
> > > >
> > > > append AND prepend at the same time on all architectures. Christophe doesn't
> > > > understand the need, and hence tries to minimize the feature set which is
> > > > incompatible with Cisco needs and all the other out of tree users.
> > >
> > > Okay, but that's never been a feature in upstream. For upstream, we
> > > refactor first and add features 2nd. In this case, the difference is
> > > largely the kconfig and it would be better to not change the options
> > > twice, but that's not a blocker for taking the refactoring. You won't
> > > find a maintainer that's going to take adding a feature over cleanups
> > > and unification.
> >
> > It kind of is a feature in upstream, it's a matter of opinion. Some platform
> > used append and some use prepend, and it's likely because the maintainers needed
> > one or the other for development.
> 
> Which arch/platform upstream does both prepend and append at the same time?
 
None do it at the same time, however x86 and mips have switched between the two. 

> > I'm not sure why you think I can't add the features in one go. It would be
> > horrid to take Christophe's changes, then have to do basically all the same work
> > a second time which is what Christophe's changes would force me to do.
> 
> I didn't say it couldn't be done. In fact, I said it would be better
> all at once: "it would be better to not change the options twice"
> 
> But both of you ignoring comments and continuing to post competing
> series is not going to get us there. TBC, I think Christophe's series
> is much closer to being in shape to merge upstream.
 
I'm not the one ignoring comments .. I've taken a number of comments from
Christophe, but he still submits his own series..

Christophe series doesn't look good to me.. I suspect you like it cause it
deletes lines from of.

> > Say for example I implement this change only on one architecture. In that case
> > the maintainer would be accepting a feature enhancement , but there would be no
> > stopping it. I shouldn't have to go two strokes on one architecture, but each
> > change I'm making is essentially a single architecture. They can go in all
> > together or one at a time.
> 
> Features do get implemented all the time on one arch. And then maybe a
> 2nd and 3rd. At some point we decide no more copying, it needs to be
> common and refactored. We're at that point for cmdline handling IMO.

I don't think it can be done with one series all at once ..

Daniel
