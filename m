Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 193D23330ED
	for <lists+linux-mips@lfdr.de>; Tue,  9 Mar 2021 22:30:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230266AbhCIV37 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Mar 2021 16:29:59 -0500
Received: from rcdn-iport-2.cisco.com ([173.37.86.73]:55606 "EHLO
        rcdn-iport-2.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231894AbhCIV3s (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 Mar 2021 16:29:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=2621; q=dns/txt; s=iport;
  t=1615325388; x=1616534988;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=P29McQ6d/QFxrQq1EYKN884pwFzgqSORJbOcG1OnGCA=;
  b=cXhxfCHtcP4ljwBOVNCPmiajlNLRlQkZyDAByml5gqHPiFeE19Otg9PO
   YrIdp0w4hV9/0NZrwRG5Tw87Lvm6pQx2svPHKdU7cOKg4yVnj5mmF6DnX
   7HkwB/f93cxuLquhTitX5vQMhuYmn2RbkbAdkfSS8COGC9dnTSnEF5Bor
   8=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0BqAAC/50dg/40NJK1aHAEBAQEBAQc?=
 =?us-ascii?q?BARIBAQQEAQFAgTsHAQELAQGBdDWBTAE5jRaJPI9zilaBfAsBAQENAQE0BAE?=
 =?us-ascii?q?BgRSDNAMCAoF+AiU0CQ4CAwEBCwEBBQEBAQIBBgRxhW5DAQwBCAGFawEFMgF?=
 =?us-ascii?q?GEAsYLjwbBoYLrGd0gTSJEYFFFA6BFwGNQiYcgUlChCw+ihAiBIJGgRBLPXx?=
 =?us-ascii?q?XkSqMcJpwgRSDCYEfmnsxEKNitx8CBAYFAhaBVDqBVzMaCBsVgyVPGQ2OKxa?=
 =?us-ascii?q?ORyADZwIGAQkBAQMJhiCEEIM4AQE?=
X-IronPort-AV: E=Sophos;i="5.81,236,1610409600"; 
   d="scan'208";a="874107942"
Received: from alln-core-8.cisco.com ([173.36.13.141])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Mar 2021 21:29:47 +0000
Received: from zorba ([10.24.4.5])
        by alln-core-8.cisco.com (8.15.2/8.15.2) with ESMTPS id 129LTj55006364
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Tue, 9 Mar 2021 21:29:46 GMT
Date:   Tue, 9 Mar 2021 13:29:44 -0800
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
Message-ID: <20210309212944.GR109100@zorba>
References: <20210309000247.2989531-4-danielwa@cisco.com>
 <5f865584-09c9-d21f-ffb7-23cf07cf058e@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5f865584-09c9-d21f-ffb7-23cf07cf058e@csgroup.eu>
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.24.4.5, [10.24.4.5]
X-Outbound-Node: alln-core-8.cisco.com
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Mar 09, 2021 at 08:47:09AM +0100, Christophe Leroy wrote:
> 
> 
> Le 09/03/2021 à 01:02, Daniel Walker a écrit :
> > This is a scripted mass convert of the config files to use
> > the new generic cmdline. There is a bit of a trim effect here.
> > It would seems that some of the config haven't been trimmed in
> > a while.
> 
> If you do that in a separate patch, you loose bisectability.
> 
> I think it would have been better to do things in a different way, more or less like I did in my series:
> 1/ Provide GENERIC cmdline at the same functionnality level as what is
> spread in the different architectures
> 2/ Convert architectures to the generic with least churn.
> 3/ Add new features to the generic

You have to have the churn eventually, no matter how you do it. The only way you
don't have churn is if you never upgrade the feature set.


> > 
> > The bash script used to convert is as follows,
> > 
> > if [[ -z "$1" || -z "$2" ]]; then
> >          echo "Two arguments are needed."
> >          exit 1
> > fi
> > mkdir $1
> > cp $2 $1/.config
> > sed -i 's/CONFIG_CMDLINE=/CONFIG_CMDLINE_BOOL=y\nCONFIG_CMDLINE_PREPEND=/g' $1/.config
> 
> This is not correct.
> 
> By default, on powerpc the provided command line is used only if the bootloader doesn't provide one.
> 
> Otherwise:
> - the builtin command line is appended to the one provided by the bootloader
> if CONFIG_CMDLINE_EXTEND is selected
> - the builtin command line replaces to the one provided by the bootloader if
> CONFIG_CMDLINE_FORCE is selected

I think my changes maintain most of this due to the override of
CONFIG_CMDLINE_PREPEND. This is an upgrade and the inflexibility in powerpc is
an example of why these changes were created in the first place.

For example , say the default command line is "root=/dev/issblk0" from iss476
platform. And the bootloader adds "root=/dev/sda1"

The result is <prepend><bootloader><append>.

Then you have,

root=/dev/issblk0 root=/dev/sda1

and the bootloader has precedent over the default command line. So root= in the
above cases is defined by the bootloader.

The only issue would be if a person wants to override the default command line
with an unrelated bootloader command line. I don't know how many people do this,
but I doubt it's many. Can you think of any use cases like this?

I would imagine there are many more people who have to entirely duplicate the
default command line in the boot loader when they really just want to change a
single part of it like the root= device or console device or speed.

Daniel
