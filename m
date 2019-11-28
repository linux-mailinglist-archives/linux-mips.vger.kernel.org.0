Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F14410C976
	for <lists+linux-mips@lfdr.de>; Thu, 28 Nov 2019 14:29:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726633AbfK1N3t (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 Nov 2019 08:29:49 -0500
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:47843 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726227AbfK1N3t (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 Nov 2019 08:29:49 -0500
X-Originating-IP: 193.22.133.58
Received: from hyperion.localnet (unknown [193.22.133.58])
        (Authenticated sender: relay@treewalker.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 17AB9FF818;
        Thu, 28 Nov 2019 13:29:45 +0000 (UTC)
From:   Maarten ter Huurne <maarten@treewalker.org>
To:     mips-creator-ci20-dev@googlegroups.com
Cc:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Subject: Re: MIPS: bug: gettimeofday syscall broken on CI20 board
Date:   Thu, 28 Nov 2019 14:29:45 +0100
Message-ID: <4807842.gtHLO0kk0V@hyperion>
In-Reply-To: <D1CE4D1E-9A42-4FAE-90A9-615C38B979C0@goldelico.com>
References: <18788C50-F29B-4BD7-89F6-B056FF490214@goldelico.com> <7b6275c7-ab2b-a647-6bf7-d5e1c4523c98@arm.com> <D1CE4D1E-9A42-4FAE-90A9-615C38B979C0@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thursday, 28 November 2019 13:33:17 CET H. Nikolaus Schaller wrote:
> Hi Vincenzo,
> 
> > Am 28.11.2019 um 13:21 schrieb Vincenzo Frascino
> > <vincenzo.frascino@arm.com>:> 
> > [...]
> > The the lib that provides the gettimeofday() changes accordingly
> > with vdso_data. 5.4 and 4.19 have 2 different vdso libraries as
> > well.
> 
> Yes, that is what I have assumed what happens. How do these libs go
> into an existing and working root-file-system with Debian Stretch?

I'm a novice when it comes to vDSO, so someone please correct me if I'm 
wrong.

From what I read vDSO is a library in the sense that it exports ELF 
symbols that applications and other libraries (libc in particular) can 
use, but it is not a file on disk.

As such, which rootfs you use shouldn't matter, since the vDSO is not in 
the rootfs. Instead, it is contained in the kernel image. Searching for 
"linux-vdso.so.1" on packages.debian.org indeed returns no hits.

There is a check in arch/mips/vdso/Makefile that disables vDSO on MIPS 
when building the kernel with binutils < 2.25. I don't know if that is 
in any way related to this issue.

Bye,
		Maarten



