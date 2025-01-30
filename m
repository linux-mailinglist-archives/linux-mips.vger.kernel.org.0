Return-Path: <linux-mips+bounces-7639-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 119F6A229E1
	for <lists+linux-mips@lfdr.de>; Thu, 30 Jan 2025 09:55:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 201C73A5DAF
	for <lists+linux-mips@lfdr.de>; Thu, 30 Jan 2025 08:55:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B13B81B3920;
	Thu, 30 Jan 2025 08:55:45 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79EA018FDC5;
	Thu, 30 Jan 2025 08:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738227345; cv=none; b=p+sHJ95NWhkKOCE+imrZZeiLukLXOTWqsvNb9oauXJurWxviH6yTpL93kb3LrWSfvMqdqKX8RU6zMBpdkjNivEiDLzxyx3/81GXU2ep14G1yv4FN4sLNUJrBQ82+UC6xwD5JJDgXTWRb444a3zxLVAzAYFGooKzoshU/cTm7CXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738227345; c=relaxed/simple;
	bh=NVe5gcGxKytAdRjOGh1/oBUf3kIsABQCzXovlrZB5iU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gxoXzCvxVeoxx1MVjHx7V+bQnOx9rFw56YrHCHclOJWv+vKOu49fR2qlQQb8byBCjdyS1Ig81Nca3HvjyXiWp8CR4tgyQxNZjiRgoRrR50MtiwrqZhosf4NvgxBtfIbcdl1FeOdmrA42zaKC0HRK8tMEbRQpNyB6QFfedbKwDi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1tdQKa-0001yN-00; Thu, 30 Jan 2025 09:55:24 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 50ABFC013E; Thu, 30 Jan 2025 09:55:14 +0100 (CET)
Date: Thu, 30 Jan 2025 09:55:14 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Ism Hong <ism.hong@gmail.com>, Christian Brauner <brauner@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Heiko Carstens <hca@linux.ibm.com>, Jeff Xu <jeffxu@chromium.org>,
	Christian =?iso-8859-1?Q?G=F6ttsche?= <cgzones@googlemail.com>,
	"open list:MIPS" <linux-mips@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mips: fix shmctl/semctl/msgctl syscall for o32
Message-ID: <Z5s-csyOKMCvH3ct@alpha.franken.de>
References: <20250106115227.1365643-1-ism.hong@gmail.com>
 <5427df64-658d-4377-89be-963ee7bb68ee@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5427df64-658d-4377-89be-963ee7bb68ee@app.fastmail.com>

On Mon, Jan 27, 2025 at 10:20:49PM +0100, Arnd Bergmann wrote:
> On Mon, Jan 6, 2025, at 12:52, Ism Hong wrote:
> > The commit 275f22148e87 ("ipc: rename old-style shmctl/semctl/msgctl
> > syscalls") switched various architectures to use sys_old_*ctl() with
> > ipc_parse_version, including mips n32/n64. However, for mips o32, commit
> > 0d6040d46817 ("arch: add split IPC system calls where needed") added
> > separate IPC syscalls without properly using the old-style handlers.
> >
> > This causes applications using uClibc-ng to fail with -EINVAL when
> > calling semctl/shmctl/msgctl with IPC_64 flag, as uClibc-ng uses the
> > syscall numbers from kernel headers to determine whether to use the IPC
> > multiplexer or split syscalls. In contrast, glibc is unaffected as it
> > uses a unified feature test macro __ASSUME_DIRECT_SYSVIPC_SYSCALLS
> > (disabled for mips-o32) to make this decision.
> >
> > Fix this by switching the o32 ABI entries for semctl, shmctl and msgctl
> > to use the old-style handlers, matching the behavior of other
> > architectures and fixing compatibility with uClibc-ng.
> >
> > Signed-off-by: Ism Hong <ism.hong@gmail.com>
> 
> I just saw this making it into mainline and had another look, sorry
> I hadn't caught it earlier.
> 
> It was an intentional decision to use the new-style IPC_64
> semantics on architectures that didn't already have the
> separate system call.
> 
> You may not like that choice, but it's been done this way
> for seven years now, and as far as I can tell, glibc relies
> on this behavior.
> 
> I think this commit should be reverted, and uclibc be changed
> to implement the kernel ABI for these syscalls.

I've prepared the revert

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

