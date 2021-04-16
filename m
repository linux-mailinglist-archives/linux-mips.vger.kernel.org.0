Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 792F1361A80
	for <lists+linux-mips@lfdr.de>; Fri, 16 Apr 2021 09:27:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239539AbhDPHXd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 16 Apr 2021 03:23:33 -0400
Received: from elvis.franken.de ([193.175.24.41]:53271 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239521AbhDPHXc (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 16 Apr 2021 03:23:32 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lXIol-0007qW-01; Fri, 16 Apr 2021 09:23:07 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id DE657C04CD; Fri, 16 Apr 2021 09:22:01 +0200 (CEST)
Date:   Fri, 16 Apr 2021 09:22:01 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>
Subject: Re: [PATCH v2 0/8] MIPS: fixes for PCI legacy drivers (rt2880,
 rt3883)
Message-ID: <20210416072201.GA5371@alpha.franken.de>
References: <20210414031240.313852-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210414031240.313852-1-ilya.lipnitskiy@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Apr 13, 2021 at 08:12:32PM -0700, Ilya Lipnitskiy wrote:
> One major fix for rt2880-pci in the first patch - fixes breakage that
> existed since v4.14.
> 
> Other more minor fixes, cleanups, and improvements that either free up
> memory, make dmesg messages clearer, or remove redundant dmesg output.
> 
> v2:
> - Do not use internal pci-rt2880 config read and write functions after
>   the device has been registered with the PCI subsystem to avoid races.
>   Use safe pci_bus_{read,write}_config_{d}word wrappers instead.
> 
> Ilya Lipnitskiy (8):
>   MIPS: pci-rt2880: fix slot 0 configuration
>   MIPS: pci-rt2880: remove unneeded locks
>   MIPS: pci-rt3883: trivial: remove unused variable
>   MIPS: pci-rt3883: more accurate DT error messages
>   MIPS: pci-legacy: stop using of_pci_range_to_resource
>   MIPS: pci-legacy: remove redundant info messages
>   MIPS: pci-legacy: remove busn_resource field
>   MIPS: pci-legacy: use generic pci_enable_resources
> 
>  arch/mips/include/asm/pci.h |  1 -
>  arch/mips/pci/pci-legacy.c  | 57 ++++++-------------------------------
>  arch/mips/pci/pci-rt2880.c  | 50 ++++++++++++++++----------------
>  arch/mips/pci/pci-rt3883.c  | 10 ++-----
>  4 files changed, 35 insertions(+), 83 deletions(-)

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
