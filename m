Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D444734EFCD
	for <lists+linux-mips@lfdr.de>; Tue, 30 Mar 2021 19:36:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232599AbhC3Rfv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 Mar 2021 13:35:51 -0400
Received: from alln-iport-1.cisco.com ([173.37.142.88]:44166 "EHLO
        alln-iport-1.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232640AbhC3Rf1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 30 Mar 2021 13:35:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1151; q=dns/txt; s=iport;
  t=1617125727; x=1618335327;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0ijngtCeHVdaxTwLB1CJ9gXZHFg+3Ll7FC+tYt3/onQ=;
  b=li7y2ltezZOotuwwyOUotvrPz7XVAYJc038G6jI4RGALQU6EcTSNH5gs
   kGVctT7csWEVyUC1UYKaW+GwD2pZmvq8p5Zjm6O7nxz6+TuM7Rqo8LXif
   Gief6En+DptJ+u3CfK42c0k5x/TakQeJ0xDwyMvK6my7p4E8lWZPveZ6N
   c=;
X-IPAS-Result: =?us-ascii?q?A0AYAAAUYGNgmJldJa1aGwEBAQEBAQEBBQEBARIBAQEDA?=
 =?us-ascii?q?wEBAUCBPgQBAQELAYN2ATmWQQOQCBaKRRSBaAsBAQENAQE0BAEBhFACgXoCJ?=
 =?us-ascii?q?TYHDgIDAQEBAwIDAQEBAQEFAQEBAgEGBBQBAQEBAQEBAYZDhkUBAgM6PxALG?=
 =?us-ascii?q?BUZPBsGgwODCKsndYE0iQuBRBQOgRcBjUkmHIFJQoESgxw+g3mBBoUVIgSBZ?=
 =?us-ascii?q?WGBEIIEOR8UkSyCQIpMnCKDEYEjmzYxEIM4im+WG7gSAgQGBQIWgVoBMYFbM?=
 =?us-ascii?q?xoIGxWDJU8ZDY44jk8hA2cCBgoBAQMJiR8BAQ?=
IronPort-HdrOrdr: A9a23:L439FKp7WPX8plUepRxP7I0aV5twL9V00zAX/kB9WHVpW+aT/v
 rAoN0w0xjohDENHFwhg8mHIqmcQXXanKQFhLU5F7GkQQXgpS+UPJhvhLGSoQHINiXi+odmv5
 tIXLN5DLTLYGRSrcG/2wWgFsZl/d/vytHNuc7771NACT5ncLth6QARMHf5LmRTSBNdDZQ0UL
 qwj/AnmxOadX4abtu2CxA+NoCpm/TxmJ3rehIADRI8gTPvsRqT9LX4HxKEty1xbxpzx94ZnV
 TtokjQ+rik98q20Abb0HXeq65LgcL7xsFYbfb87fQ9G3HLlhuiYphnVvmkuj04ydvfkWoCoZ
 3rvwoqOdh15jfqWlyN5THp2wXmzV8Vmhnf9WM=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.81,291,1610409600"; 
   d="scan'208";a="668294645"
Received: from rcdn-core-2.cisco.com ([173.37.93.153])
  by alln-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 30 Mar 2021 17:35:26 +0000
Received: from zorba ([10.24.8.123])
        by rcdn-core-2.cisco.com (8.15.2/8.15.2) with ESMTPS id 12UHZMBO032401
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Tue, 30 Mar 2021 17:35:24 GMT
Date:   Tue, 30 Mar 2021 10:35:21 -0700
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
Message-ID: <20210330173521.GT109100@zorba>
References: <20210309000247.2989531-4-danielwa@cisco.com>
 <5f865584-09c9-d21f-ffb7-23cf07cf058e@csgroup.eu>
 <20210309212944.GR109100@zorba>
 <e4899874-1684-fa1b-443e-f4e478e05e31@csgroup.eu>
 <CAL_JsqKm76jRQYDcu3rGyUWKPLspoO=EZW_WFy=zAK+m_JYCTg@mail.gmail.com>
 <20fd7d44-8c39-48bc-25c3-990be9d9d911@csgroup.eu>
 <20210325195956.GM109100@zorba>
 <20210329100750.GB3207@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210329100750.GB3207@willie-the-truck>
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.24.8.123, [10.24.8.123]
X-Outbound-Node: rcdn-core-2.cisco.com
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Mar 29, 2021 at 11:07:51AM +0100, Will Deacon wrote:
> On Thu, Mar 25, 2021 at 12:59:56PM -0700, Daniel Walker wrote:
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
> FWIW, they're useful for arm64 and I will gladly review the updated series.
> 
> I don't think asking people to stop submitting patches is ever the right
> answer. Please don't do that.

Why ? It's me nacking his series, is that not allowed anymore ?

Daniel
