Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29A931D4056
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2020 23:42:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727970AbgENVmu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 May 2020 17:42:50 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:32873 "EHLO
        esa1.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727029AbgENVmu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 14 May 2020 17:42:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1589492570; x=1621028570;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=q63yo8bVkhWRaBDZ9S11RZ3fzbC5L5nmu6paGVut25U=;
  b=ZlxXGgPtjDl+sLTYCXITfar8O9PBYjO2SmTvRxFOumlYYP4QSl6h4vpy
   juyVq505OX9DuQWd04bi1Un1J54K6gK9/Cr49RDrxBEVFU8gCz5tfEaKE
   /LlGCDjl35pbh4EmPYeN25SIWfEeEgaTRgchOP3o7eKW/KXvJGAvvUkw6
   kswpExyeAWj/WCUXqN9nngVnroZDH3OrBYr4IziuN2t8gKweNMYZEA9nT
   c0GexpCYIeR1zQRebfHb6GR4t35n2TcOpLuJ2VD04x1Hc6jP5VvJZKmjn
   j311ACH9eHsvTYb3fXQeAMYeyYTFRbo3Quk8td69ubAmwi09EXBfPtay2
   A==;
IronPort-SDR: xu2fZKc7lVqAsRfwL150U2e2/v/lNqG8ZZqPav8lxgOaYqSeuqKZXmoFvaaC2Hajbx3RblL0XI
 B+ppVCzCsJHvcVHUtPuMshvAaYOfqgNeN4ek6qbqWsq0orxM55PqTZ8638jiEMFHCPvqnW5Orm
 Pfdxnhpw/eDL2gRuqt67To5+qFWAf/V5QyZ8gHbNMAtPsWl5XsnhH6KJf2PrVyjnpC2R1qg+Tn
 tTLG1nVr359cET+GTSg6sncxy8xNaM192ZIQOQXE0I0vJ0K/Op97K/AZY36ZNhJofynpXSPXTc
 YzE=
X-IronPort-AV: E=Sophos;i="5.73,392,1583164800"; 
   d="scan'208";a="246679804"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 15 May 2020 05:42:49 +0800
IronPort-SDR: gnn2ZM3rxJUC3jsHKisciG4MFzLOytt/BxInFE48ZFgWWBXMArPZIvr9r6vwJgkps/nJ5EKLtt
 nAvotnOJun/gO76nGxW2ODGggyIKqZMpU=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2020 14:33:02 -0700
IronPort-SDR: ME9DiOneFyXMDgjyx7UX1+pqI4UwemYTPq1HyZfiEgpAkVnHWi1t960L7Y+DU9yvpgBEPZTjZC
 Fq+nSvhf+XWA==
WDCIronportException: Internal
Received: from unknown (HELO redsun52) ([10.149.66.28])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2020 14:42:48 -0700
Date:   Thu, 14 May 2020 22:42:45 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@wdc.com>
To:     Joshua Kinard <kumba@gentoo.org>
cc:     linux-mips@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "Maciej W. Rozycki" <macro@linux-mips.org>
Subject: Re: [PATCH v2] MIPS: Split R10000 to allow for R12K+ optimizations
In-Reply-To: <78b68917-ec7e-7434-2a80-5fabbd5247a8@gentoo.org>
Message-ID: <alpine.LFD.2.21.2005142233430.6492@redsun52.ssa.fujisawa.hgst.com>
References: <19dc5a54-4f53-5f69-5ade-4c354f63a356@gentoo.org> <alpine.LFD.2.21.2005140251480.6492@redsun52.ssa.fujisawa.hgst.com> <78b68917-ec7e-7434-2a80-5fabbd5247a8@gentoo.org>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 13 May 2020, Joshua Kinard wrote:

> >  I think it would be good not to reorder the macros (even though there's
> > preexisting breakage in <asm/mach-ip30/war.h>) so that all the files have
> > them in the same order.
> 
> They don't appear to be in any logical order to begin with.  That, and I
> wanted to keep conditional defines separate from the fixed defines, hence
> moving the first in those files down to its own block.

 I suppose they have just come up in the order they were added.  Whatever 
the order is however as long as it is consistent you can `diff' a pair of 
files against each other to spot differences easily without the need to 
rely on your perceptiveness.  And <asm/mach-sibyte/war.h> already has 
conditionals in the middle.

> Is there some subtlety w/r to the existing ordering that I don't know about,
> or would it make sense to have two patches, one which reorders the defines
> to be alphabetical, then the second being the R10K split patch?

 I wouldn't strongly mind reordering alphabetically, but it would disturb 
`git blame' and would add little value I'm afraid.  I'm fine if new ones 
keep being added at the end, though OTOH it's not the best way to avoid 
conflicts.

  Maciej
