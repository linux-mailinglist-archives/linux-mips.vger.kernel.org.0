Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C70F31273D
	for <lists+linux-mips@lfdr.de>; Sun,  7 Feb 2021 20:41:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229565AbhBGTlV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 7 Feb 2021 14:41:21 -0500
Received: from elvis.franken.de ([193.175.24.41]:33112 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229506AbhBGTlU (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 7 Feb 2021 14:41:20 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1l8pvC-0003At-00; Sun, 07 Feb 2021 20:40:38 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id A5107C0DA0; Sun,  7 Feb 2021 20:39:52 +0100 (CET)
Date:   Sun, 7 Feb 2021 20:39:52 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: KVM Guest
Message-ID: <20210207193952.GA21929@alpha.franken.de>
References: <20210203123425.GA9574@alpha.franken.de>
 <a2a2cfe3-5618-43b1-a6a4-cc768fc1b9fb@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a2a2cfe3-5618-43b1-a6a4-cc768fc1b9fb@www.fastmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Feb 03, 2021 at 08:52:34PM +0800, Jiaxun Yang wrote:
> 
> 
> On Wed, Feb 3, 2021, at 8:34 PM, Thomas Bogendoerfer wrote:
> > Hi,
> > 
> > Does kvm guest kernel still work ? I'm playing with current mips-next
> > and starting a kvm guest kernel inside an emulated malta system also
> > running a mips-next kernel. The kvm guest kernel starts, but hangs
> > in calibrate_delay (at least that's what info registers in qemu monitor
> > suggests). Ayn ideas ?
> 
> The current KVM guest kernel is actually a Trap-and-emul guest kernel.
> VZ based KVM uses the same binary with the host one, so does TCG.
> 
> TE KVM is current unmaintained. I'll try to get a malta and do some test.

hmm, so it looks broken, is unmaintained, how about removing it ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
