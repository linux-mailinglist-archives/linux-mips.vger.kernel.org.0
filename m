Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 567C22E1D94
	for <lists+linux-mips@lfdr.de>; Wed, 23 Dec 2020 15:49:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728216AbgLWOr1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 23 Dec 2020 09:47:27 -0500
Received: from elvis.franken.de ([193.175.24.41]:35201 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728214AbgLWOr1 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 23 Dec 2020 09:47:27 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1ks5PZ-0002aB-00; Wed, 23 Dec 2020 15:46:45 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 0B096C0212; Wed, 23 Dec 2020 15:46:36 +0100 (CET)
Date:   Wed, 23 Dec 2020 15:46:35 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Hauke Mehrtens <hauke@hauke-m.de>
Cc:     linux-mips@vger.kernel.org
Subject: Re: CPUs with EVA support
Message-ID: <20201223144635.GA15636@alpha.franken.de>
References: <20201220193201.GA3184@alpha.franken.de>
 <b6320b6f-ecbd-bd05-1cb2-ac98aa97825b@hauke-m.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b6320b6f-ecbd-bd05-1cb2-ac98aa97825b@hauke-m.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Dec 22, 2020 at 03:46:31PM +0100, Hauke Mehrtens wrote:
> On 12/20/20 8:32 PM, Thomas Bogendoerfer wrote:
> > Hi;
> > 
> > I've started looking how to get rid of get_fs/set_fs for MIPS and
> > my current obstacle is EVA support.
> > 
> > Looking for CPUs supporting EVA I only found P5600, are there more ?
> > 
> > Does someone sell boards with an EVA enabled CPU ?
> > 
> > How good is EVA support in qemu ?
> > 
> > Thomas.
> > 
> Hi,
> 
> The InterAptiv CPUs used by Lantiq/Intel/MaxLinear are supporting EVA mode
> and it is used in the default settings of the vendor SDK.

too bad that I lost my access to a GRX350 eval board, but at least
hardware with GRX350&550 is easy to get.

> The SoCs are not supported by mainline Linux kernel, it was tried to add
> them some years ago:
> https://lwn.net/Articles/761729/
> https://lwn.net/ml/linux-kernel/20180803030237.3366-2-songjun.wu@linux.intel.com/

and no updates for that ? Too sad...

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
