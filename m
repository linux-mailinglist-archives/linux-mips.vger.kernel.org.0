Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8F1434EF8D
	for <lists+linux-mips@lfdr.de>; Tue, 30 Mar 2021 19:33:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231743AbhC3RdF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 Mar 2021 13:33:05 -0400
Received: from alln-iport-6.cisco.com ([173.37.142.93]:39646 "EHLO
        alln-iport-6.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231579AbhC3RdA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 30 Mar 2021 13:33:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1192; q=dns/txt; s=iport;
  t=1617125580; x=1618335180;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2LZfLmeECNVtSnr3Mh+CyIjZ9xFZqjH6FwYenu/bjCA=;
  b=JXf7xD2yDz2zHs88ykxH8LWQPxBiCj+1zwbnkiZkIDAv7BzoqqreBeeJ
   cxRZOjQ9D/btzDedZHZNtC8I84XMxa9szgd+ekkApVnfRxTeK20/tfhpW
   mZPWYbrORXM4Wru/IndKDcn2kB4htKy+ox09ct+aa7lpV0BMjluPLYvYB
   A=;
X-IPAS-Result: =?us-ascii?q?A0ASAAC4X2NgmJtdJa1aGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBQIE/AgEBAQELAYN2ATkxlhEDkAgWilmBaAsBAQENAQE0BAEBh?=
 =?us-ascii?q?FACgXoCJTcGDgIDAQEBAwIDAQEBAQEFAQEBAgEGBBQBAQEBAQEBAYZDhkUBA?=
 =?us-ascii?q?gM6PxALGBUZPBsGE4JwgwirJXWBNIkLgUQUDoEXAY1JJhyBSUKELj6DeYEGh?=
 =?us-ascii?q?RUiBIFlYYEQggRYFAKRKoJAikycIoMRgSObNjEQgziKb5YbuBICBAYFAhaBa?=
 =?us-ascii?q?iKBWzMaCBsVgyRQGQ2OOI5PIQMvOAIGCgEBAwmJHwEB?=
IronPort-HdrOrdr: A9a23:DnBJjKzmbOdjEo60P+GWKrPxd+skLtp033Aq2lEZdDV+eKWj+P
 yGtvIdyBPylXI9WGs4n8qBJamHRhrnhPtIyKMWOqqvWxSjhXuwIOhZnOnf6hDpBiGWzIRg/I
 h6dawWMrDNJHh8yf33+QypV+snqeP3lJyAocf74zNTQRpxa6dmhj0JaTqzNkFtXgFJCd4YOf
 Onh/ZvnDardXQJYsnTPBBsNNTrnNHFmInrZhQLHXcciDWmty+i67LxDnGjsCs2bjUn+9sf2F
 mAuxDl4OGZv+ujzBjH2yvo841Og9f60LJ4dauxo/lQDCnwgQC1Y4kkfLuOsFkO0ZiSwWdvts
 XQqBE9OMk20VftRyWepBvg3BSI6kdJ10Pf
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.81,291,1610409600"; 
   d="scan'208";a="711698846"
Received: from rcdn-core-4.cisco.com ([173.37.93.155])
  by alln-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 30 Mar 2021 17:32:59 +0000
Received: from zorba ([10.24.8.123])
        by rcdn-core-4.cisco.com (8.15.2/8.15.2) with ESMTPS id 12UHWsUi019331
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Tue, 30 Mar 2021 17:32:57 GMT
Date:   Tue, 30 Mar 2021 10:32:54 -0700
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
Message-ID: <20210330173254.GS109100@zorba>
References: <20210309000247.2989531-4-danielwa@cisco.com>
 <5f865584-09c9-d21f-ffb7-23cf07cf058e@csgroup.eu>
 <20210309212944.GR109100@zorba>
 <e4899874-1684-fa1b-443e-f4e478e05e31@csgroup.eu>
 <CAL_JsqKm76jRQYDcu3rGyUWKPLspoO=EZW_WFy=zAK+m_JYCTg@mail.gmail.com>
 <20fd7d44-8c39-48bc-25c3-990be9d9d911@csgroup.eu>
 <20210325195956.GM109100@zorba>
 <CAL_Jsq+10nucQSRkrTKe9BD5wBScqEb7-Rdg=9TsPiKuiuPG7w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+10nucQSRkrTKe9BD5wBScqEb7-Rdg=9TsPiKuiuPG7w@mail.gmail.com>
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.24.8.123, [10.24.8.123]
X-Outbound-Node: rcdn-core-4.cisco.com
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Mar 25, 2021 at 05:29:44PM -0600, Rob Herring wrote:
> On Thu, Mar 25, 2021 at 2:00 PM Daniel Walker <danielwa@cisco.com> wrote:
> >
> > On Thu, Mar 25, 2021 at 01:03:55PM +0100, Christophe Leroy wrote:
> > >
> > > Ok, so you agree we don't need to provide two CMDLINE, one to be appended and one to be prepended.
> > >
> > > Let's only provide once CMDLINE as of today, and ask the user to select
> > > whether he wants it appended or prepended or replacee. Then no need to
> > > change all existing config to rename CONFIG_CMDLINE into either of the new
> > > ones.
> > >
> > > That's the main difference between my series and Daniel's series. So I'll
> > > finish taking Will's comment into account and we'll send out a v3 soon.
> >
> > It doesn't solve the needs of Cisco, I've stated many times your changes have
> > little value. Please stop submitting them.
> 
> Can you please outline what those needs are which aren't met?

append AND prepend at the same time on all architectures. Christophe doesn't
understand the need, and hence tries to minimize the feature set which is
incompatible with Cisco needs and all the other out of tree users.

Daniel
