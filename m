Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B88ED349ABC
	for <lists+linux-mips@lfdr.de>; Thu, 25 Mar 2021 20:57:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230160AbhCYT5C (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 25 Mar 2021 15:57:02 -0400
Received: from alln-iport-5.cisco.com ([173.37.142.92]:33594 "EHLO
        alln-iport-5.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbhCYT47 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 25 Mar 2021 15:56:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1794; q=dns/txt; s=iport;
  t=1616702219; x=1617911819;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pu2I9fiU+I/A1fLeU7DBkeJ7rBv/7jFx5HzFlCmOGBA=;
  b=f1D0CuijH8Ug4coijfTkQIyxFLwbf0r4En58Yne3AmGuFSyv+Z8eikI3
   3RM2fgdAQIHkZvq0BfS4SZsLtm4p4R1Uyc4SZLtZdk2CmlHLETZ+x7wg/
   NSLXB4bNrI+C2gYRNhT02i8n72w/q9dM8YoJINFaruC3nwx4Axxy8Ryab
   8=;
X-IPAS-Result: =?us-ascii?q?A0AjAACo6lxgmIoNJK1aGwEBAQEBAQEBBQEBARIBAQEDA?=
 =?us-ascii?q?wEBAUCBPgQBAQELAYN2ATmWPAOQB4pbgXwLAQEBDQEBNAQBAYRQAoF8AiU2B?=
 =?us-ascii?q?w4CAwEBAQMCAwEBAQEFAQEBAgEGBBQBAQEBAQEBAYZDhkUBAgM6PxALGC48G?=
 =?us-ascii?q?wYsgleDCKspdYE0iRaBRBQOgRcBjUImHIFJQoQuPoQxhWMiBIJGF3mBCGcVB?=
 =?us-ascii?q?GI1kCxRjQuKQ5BIgRSDEIEimEiCaTEQgziKbZYbuBACBAYFAhaBWgExgVszG?=
 =?us-ascii?q?ggbFTuCak8ZDY44jk8hA2cCBgoBAQMJhSqCQwEB?=
IronPort-HdrOrdr: A9a23:EyzLJ6OQ0cmmLsBcT5r155DYdL4zR+YMi2QD/UoZc3NoW+afkN
 2jm+le+B/vkTAKWGwhn9foAtjkfVr385lp7Y4NeYqzRQWOghrLEKhO5ZbvqgeLJwTQ7ehYvJ
 0MT4FfD5nKAUF+nYLG5mCDYrId6f2m1IztuuvE1XdqSmhRGsJdxiN0EBySHEEzZCQuP/sEPa
 GR7MZGuDasEE5/Bq+GL0IIUOTZq9rAmIiOW347LiQ64wqDhy7A0tDHOiWfty1zbxp/hZ8/7G
 6AqADi/6Olqf3+8APEznTe9Y4+oqqH9vJzQOqRl8MSNjLgziGvaYgJYcz6gBkF5Mey9V0tjN
 7A5y0FAv02wXbQcmapyCGdvTXd7A==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.81,278,1610409600"; 
   d="scan'208";a="686872034"
Received: from alln-core-5.cisco.com ([173.36.13.138])
  by alln-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 25 Mar 2021 19:56:56 +0000
Received: from zorba ([10.24.0.17])
        by alln-core-5.cisco.com (8.15.2/8.15.2) with ESMTPS id 12PJurCb006095
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Thu, 25 Mar 2021 19:56:55 GMT
Date:   Thu, 25 Mar 2021 12:56:53 -0700
From:   Daniel Walker <danielwa@cisco.com>
To:     Christophe Leroy <christophe.leroy@csgroup.eu>
Cc:     Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
        Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
        Andrew Morton <akpm@linux-foundation.org>, x86@kernel.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        xe-linux-external@cisco.com, Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/7] powerpc: convert config files to generic cmdline
Message-ID: <20210325195653.GL109100@zorba>
References: <20210309000247.2989531-4-danielwa@cisco.com>
 <5f865584-09c9-d21f-ffb7-23cf07cf058e@csgroup.eu>
 <20210309212944.GR109100@zorba>
 <e4899874-1684-fa1b-443e-f4e478e05e31@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e4899874-1684-fa1b-443e-f4e478e05e31@csgroup.eu>
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.24.0.17, [10.24.0.17]
X-Outbound-Node: alln-core-5.cisco.com
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Mar 24, 2021 at 05:59:59PM +0100, Christophe Leroy wrote:
> > I think my changes maintain most of this due to the override of
> > CONFIG_CMDLINE_PREPEND. This is an upgrade and the inflexibility in powerpc is
> > an example of why these changes were created in the first place.
> 
> "inflexibility in powerpc" : Can you elaborate ?
 
the prom environment.

> > 
> > For example , say the default command line is "root=/dev/issblk0" from iss476
> > platform. And the bootloader adds "root=/dev/sda1"
> > 
> > The result is <prepend><bootloader><append>.
> 
> 
> I'm still having hard time understanding the benefit of having both <prepend> and <append>.
> Could you please provide a complete exemple from real life, ie what exactly
> the problem is and what it solves ?
 
Say the boot loader of an old product is released with a command line of
"root=/dev/sda" and per the needs of the company or product the boot loader can
not be upgraded to change this command line. To change this behavior you would
need append or EXTEND.

Below I detail an example of PREPEND due to your list question.

> > 
> > Then you have,
> > 
> > root=/dev/issblk0 root=/dev/sda1
> > 
> > and the bootloader has precedent over the default command line. So root= in the
> > above cases is defined by the bootloader.

A person could input a command line into a boot loader, and it would override
the PREPEND values.

Can you imagine you have a default command line which makes root=/dev/issblk0 ,
but that doesn't work for you testing purpose. So you input into the boot loader
root=/dev/sda1 , since you have the default input in the bootloader OVERRIDEABLE
you can do this without re-compiling and just input the single root= command
into the bootloader.

Daniel
