Return-Path: <linux-mips+bounces-7985-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 995DBA465A0
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2025 16:54:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 120DD164F55
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2025 15:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 328FC225798;
	Wed, 26 Feb 2025 15:43:01 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156772288F7;
	Wed, 26 Feb 2025 15:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740584581; cv=none; b=F4l/yAz5Bc2HyytnZbvvEBQ5/Pqu6ATTXQexd68x3OLbSJx9vfScSTKDDF8nAWrlN2nSPc6llQPGEBiknW8/GL90vyF1FS9GGcfTXa5TbbJpW4DQYIu1C1JxvaN+Qhh8rx/KsQo3SIh/8PHCS4izEUx2IdDarXT5IA8LYXH21Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740584581; c=relaxed/simple;
	bh=MQEkH+Kb36SDefix6btR6/yRvknQI01mvWYlEZFASVY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uSUBozQt8+LKDpCytTVwKQbjFCBCtVDuzQNsNb8KFJHPX7T7d2h2gJtk1riIdFm9b8YxXeH4PjPX8IYyTXFwZPZTJe5Th+QFhiWsTdhNteOG6RiG3wv4ZbY0kkanrsLIpUct9indx2fg3YXcPCP09Afq9hYop9TceMevPZWJMSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2FB4C4CED6;
	Wed, 26 Feb 2025 15:42:59 +0000 (UTC)
Date: Wed, 26 Feb 2025 10:43:40 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Xi Ruoyao <xry111@xry111.site>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Matt Redfearn <matt.redfearn@blaize.com>,
 linux-mips@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Ignore relocs against __ex_table for relocatable
 kernel
Message-ID: <20250226104340.3f0b961b@gandalf.local.home>
In-Reply-To: <20250226132841.381063-1-xry111@xry111.site>
References: <20250226132841.381063-1-xry111@xry111.site>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 26 Feb 2025 21:28:41 +0800
Xi Ruoyao <xry111@xry111.site> wrote:

> Since commit 6f2c2f93a190 ("scripts/sorttable: Remove unneeded
> Elf_Rel"), sorttable no longer clears relocs against __ex_table,
> claiming "it was never used."  But in fact MIPS relocatable kernel had
> been implicitly depending on this behavior, so after this commit the
> MIPS relocatable kernel has started to spit oops like:

 Oops!

> 
> 	CPU 1 Unable to handle kernel paging request at virtual address 000000fffbbdbff8, epc == ffffffff818f9a6c, ra == ffffffff813ad7d0
> 	... ...
> 	Call Trace:
> 	[<ffffffff818f9a6c>] __raw_copy_from_user+0x48/0x2fc
> 	[<ffffffff813ad7d0>] cp_statx+0x1a0/0x1e0
> 	[<ffffffff813ae528>] do_statx_fd+0xa8/0x118
> 	[<ffffffff813ae670>] sys_statx+0xd8/0xf8
> 	[<ffffffff81156cc8>] syscall_common+0x34/0x58
> 
> So ignore those relocs on our own to fix the issue.
> 
> Fixes: 6f2c2f93a190 ("scripts/sorttable: Remove unneeded Elf_Rel")
> Signed-off-by: Xi Ruoyao <xry111@xry111.site>

Thanks! Yeah, this is better than having an implicit dependency to the
sorttable code.

I take it that this will go through the mips tree?

-- Steve

