Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0114E349AC2
	for <lists+linux-mips@lfdr.de>; Thu, 25 Mar 2021 21:00:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230153AbhCYUAP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 25 Mar 2021 16:00:15 -0400
Received: from rcdn-iport-4.cisco.com ([173.37.86.75]:26333 "EHLO
        rcdn-iport-4.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230042AbhCYUAC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 25 Mar 2021 16:00:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=704; q=dns/txt; s=iport;
  t=1616702402; x=1617912002;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iWag3nlhZsh0PSEeVxiaq1tQo7jXl7/iI10UazG4Z0Q=;
  b=M1sgcMdvuLeFe5RJXflSTsJ/QfZUmEMQmGFKRC4qsaYqFxiM3twYU1OH
   ew7XqKP4/Hp902sm/HsXlBOynQUI+OqNopBOHN5wey0N6FiKjKNHnt8Pf
   kFmxT7TMI1QnQSYj1eJmSkkRUuFS9xvYZ3hBqgaRVlE1yGEn/N6Vb7TYo
   U=;
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3Aekwar6MSi0olHsBcT5r155DYdL4zR+YMi2?=
 =?us-ascii?q?QD/UoZc3NoW+afkN2jm+le+B/vkTAKWGwhn9foAtjkfVr385lp7Y4NeYqzRQ?=
 =?us-ascii?q?WOghrLEKhO5ZbvqgeLJwTQ7ehYvJ0MT4FfD5nKAUF+nYLG5mCDYrId6f2m1I?=
 =?us-ascii?q?ztuuvE1XdqSmhRGsJdxiN0EBySHEEzZCQuP/sEPaGR7MZGuDasEE5/Bq+GL0?=
 =?us-ascii?q?IIUOTZq9rAmIiOW347LiQ64wqDhy7A0tDHOiWfty1zbxp/hZ8/7G6AqADi/6?=
 =?us-ascii?q?Olqf3+8APEznTe9Y4+oqqH9vJzQOqRl8MSNjLgziGvaYgJYcz6gBkF5Mey9V?=
 =?us-ascii?q?0tjN7A5y0FAv02wXbQcmapyCGdvTXd7A=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AnAABg61xg/4QNJK1aGgEBAQEBAQE?=
 =?us-ascii?q?BAQEDAQEBARIBAQEBAgIBAQEBQIE+AwEBAQELAYIqgUwBOZY/kAeKWxSBaAs?=
 =?us-ascii?q?BAQENAQE0BAEBhFACgXwCJTYHDgIDAQELAQEFAQEBAgEGBHGFboZFAQU6PxA?=
 =?us-ascii?q?LGBUZPBsGhgurKXWBNIkWgUQUDoEXAY1CJhyBSUKELj6DeYEGhRUiBIFlYYE?=
 =?us-ascii?q?QggRYFJErgkCKTJwfgxCBIpsxMRCDOIptlhu4EAIEBgUCFoFaATOBWTMaCBs?=
 =?us-ascii?q?VgyVPGQ2dByEDZwIGCgEBAwmHbQEB?=
X-IronPort-AV: E=Sophos;i="5.81,278,1610409600"; 
   d="scan'208";a="852860109"
Received: from alln-core-10.cisco.com ([173.36.13.132])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 25 Mar 2021 19:59:59 +0000
Received: from zorba ([10.24.0.17])
        by alln-core-10.cisco.com (8.15.2/8.15.2) with ESMTPS id 12PJxvYJ009948
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Thu, 25 Mar 2021 19:59:58 GMT
Date:   Thu, 25 Mar 2021 12:59:56 -0700
From:   Daniel Walker <danielwa@cisco.com>
To:     Christophe Leroy <christophe.leroy@csgroup.eu>
Cc:     Rob Herring <robh@kernel.org>, Will Deacon <will@kernel.org>,
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
Message-ID: <20210325195956.GM109100@zorba>
References: <20210309000247.2989531-4-danielwa@cisco.com>
 <5f865584-09c9-d21f-ffb7-23cf07cf058e@csgroup.eu>
 <20210309212944.GR109100@zorba>
 <e4899874-1684-fa1b-443e-f4e478e05e31@csgroup.eu>
 <CAL_JsqKm76jRQYDcu3rGyUWKPLspoO=EZW_WFy=zAK+m_JYCTg@mail.gmail.com>
 <20fd7d44-8c39-48bc-25c3-990be9d9d911@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20fd7d44-8c39-48bc-25c3-990be9d9d911@csgroup.eu>
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.24.0.17, [10.24.0.17]
X-Outbound-Node: alln-core-10.cisco.com
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Mar 25, 2021 at 01:03:55PM +0100, Christophe Leroy wrote:
> 
> Ok, so you agree we don't need to provide two CMDLINE, one to be appended and one to be prepended.
> 
> Let's only provide once CMDLINE as of today, and ask the user to select
> whether he wants it appended or prepended or replacee. Then no need to
> change all existing config to rename CONFIG_CMDLINE into either of the new
> ones.
> 
> That's the main difference between my series and Daniel's series. So I'll
> finish taking Will's comment into account and we'll send out a v3 soon.

It doesn't solve the needs of Cisco, I've stated many times your changes have
little value. Please stop submitting them.

Daniel

