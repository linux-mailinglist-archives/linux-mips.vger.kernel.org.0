Return-Path: <linux-mips+bounces-5097-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A75CD95EC65
	for <lists+linux-mips@lfdr.de>; Mon, 26 Aug 2024 10:53:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9B891C212B0
	for <lists+linux-mips@lfdr.de>; Mon, 26 Aug 2024 08:53:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ECBA82D7F;
	Mon, 26 Aug 2024 08:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mork.no header.i=@mork.no header.b="DWXzhIlM"
X-Original-To: linux-mips@vger.kernel.org
Received: from dilbert.mork.no (dilbert.mork.no [65.108.154.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E1F286A8;
	Mon, 26 Aug 2024 08:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.108.154.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724662381; cv=none; b=VEywyoLKWEmO8t7Y0T8Nr5ILNKRLKqr/r4N1wp/sBo/X1b6OOjKocwUdxC+/OiKtciTOoq0TYH5QYaFAC0IETC9iOfKojhR7pgPZM7uN0vDczuOgOFMEGk4rZ0a5J3SB7AVLwPm6mv2FNJVCHxwRzlYemeUJe6VXVlwdz8tqCrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724662381; c=relaxed/simple;
	bh=bpIxq9NrCbXHQ9xPNW9tXjBkteCqJ1McbEbD661SmJA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 MIME-Version:Content-Type; b=Nk9NClzX536iH+xXL4wAVeTh1F87ivXe7x/3+aZ4wpmwJl4L7H0sMFQ/KduC/22TWvNJijl6YLMGf/DwouAHJdcUbgMsB10r5xufk67BXppewYReefaaasE3noLrRj+rqxDBJxk4Cpae1CVouYVlyZWdtv71EIUq+BZIoXigrHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mork.no; spf=pass smtp.mailfrom=miraculix.mork.no; dkim=pass (1024-bit key) header.d=mork.no header.i=@mork.no header.b=DWXzhIlM; arc=none smtp.client-ip=65.108.154.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mork.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miraculix.mork.no
Received: from canardo.dyn.mork.no ([IPv6:2a01:799:10da:6900:0:0:0:1])
	(authenticated bits=0)
	by dilbert.mork.no (8.17.1.9/8.17.1.9) with ESMTPSA id 47Q8qaPw3895640
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Mon, 26 Aug 2024 09:52:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mork.no; s=b;
	t=1724662356; bh=T9Q3iY+bAR2dVrgAcNBgedK8JUDZWWxI1K8yXbLI9hY=;
	h=From:To:Cc:Subject:References:Date:Message-ID:From;
	b=DWXzhIlMXVwunwVJX9vkCXJ7TN0grgE3yZ2PEAzq5vDK6KKfz7AkvxutBX97gul8M
	 1FZuZcy9lB8ou/zndcu7og6SstHPXe7cPK5lmzxgcEvnxJ1aJGPBuSCbC1mZgrVe1y
	 BP/wZBp9deeAwjr+KXIvCjzrhpODE2sWGZ5dGcKM=
Received: from miraculix.mork.no ([IPv6:2a01:799:10da:690a:d43d:737:5289:b66f])
	(authenticated bits=0)
	by canardo.dyn.mork.no (8.17.1.9/8.17.1.9) with ESMTPSA id 47Q8qaxU2415343
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Mon, 26 Aug 2024 10:52:36 +0200
Received: (nullmailer pid 1588942 invoked by uid 1000);
	Mon, 26 Aug 2024 08:52:36 -0000
From: =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        linux-kernel@vger.kernel.org,
        "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH] MIPS: fw: Gracefully handle unknown firmware protocols
Organization: m
References: <20240824144133.1464835-1-bjorn@mork.no>
	<7f0602dc-8a47-46cb-a12f-09afc082b48f@app.fastmail.com>
	<87o75gy85b.fsf@miraculix.mork.no>
	<alpine.DEB.2.21.2408251612500.30766@angie.orcam.me.uk>
	<87jzg4y57g.fsf@miraculix.mork.no>
	<alpine.DEB.2.21.2408252029130.30766@angie.orcam.me.uk>
Date: Mon, 26 Aug 2024 10:52:36 +0200
In-Reply-To: <alpine.DEB.2.21.2408252029130.30766@angie.orcam.me.uk> (Maciej
	W. Rozycki's message of "Sun, 25 Aug 2024 20:59:26 +0100 (BST)")
Message-ID: <87cylvy8bv.fsf@miraculix.mork.no>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: clamav-milter 1.0.5 at canardo
X-Virus-Status: Clean

"Maciej W. Rozycki" <macro@orcam.me.uk> writes:

> Even those that do use the function have a choice to override the default=
=20
> handler by setting CONFIG_HAVE_PLAT_FW_INIT_CMDLINE.  Perhaps it's what=20
> you need to do for your platform too.

Considered that, but this problem isn't directly platform-related, is
it?  Many of the firmware implementations are multi-platform. And they
support many of the same platforms.

My concrete eample showed up on the "realtek" (rtl838x and rtl93xx SoCs)
platform in OpenWrt, where a large number of boards from assorted
vendors are currently supported. The current implementation works fine
for most of them because they using U-Boot. But it failed in what I
consider the ugliest way possible (no ooops, no error message, just
hanging) on the boards from HPE because they use Bootware.

FWIW, there is also a vendor using BootBase for pretty much the same
hardware.  But that's still unsupported in OpenWrt for various reasons.

So yes, this could be worked around by having a platform specific
fw_init_cmdline().  Or even another out-of-tree OpenWrt specific patch.
But whatever the solution is, it can't drop the U-Boot support since
most of the boards actually use U-Boot.  Which is why I believe it's
much better to solve this problem at the root, for the benefit of
everyone else.

But of course, if necessary it would be possible to build X kernels with
dfferent fw_init_cmdline() implementations to support the same hardware
booted from X different boot firmwares.

>  It's clear to me that this mess has to be cleaned up.  Not all kinds of=
=20
> firmware permit the setting of arbitrary environment variables (or ones=20
> that survive a reboot) though.

Yes.  And I believe it can be solved by improving the pointer validation
that's already there.  All we need is to reject argument values passed
by other firmwares.

But it's probably better to create an inline valid_fw_arg(() or similar
function as proposed by Jiaxun, allowing the XKPHYS range too on 64 bit
systems.

If necessary we can improve further by adding an alignment requirement,
which was a proposal that came up in the OpenWrt discussions.

Another option is to connect the validation of all 4 arguments.  There
is for example no reason to interpret the Bootware fw_arg2 value as an
enviroment pointer after we've already rejected fw_arg1 as cmdline.

It's also possible to validate command line argument pointers and
environment variable pointers (except for alignment, I guess?), refusing
anything which ends ut pointing outsde KSEG1 or XKPHYS.

How complicated you want this is all a matter of taste IMHO.  I tried to
make this a simple solution matching the current "forgiving"
implementation.

Another improvement would be a pr_info() dumping the fw_argX values. It
would make it possible to understand why the code is hanging when the
firmware does something unexpected. I don't think pr_debug() helps much
in this particular case.



Bj=C3=B8rn

