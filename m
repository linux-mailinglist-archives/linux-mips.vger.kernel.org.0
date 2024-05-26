Return-Path: <linux-mips+bounces-3323-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 792DF8CF44F
	for <lists+linux-mips@lfdr.de>; Sun, 26 May 2024 14:44:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35321281588
	for <lists+linux-mips@lfdr.de>; Sun, 26 May 2024 12:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 465C011181;
	Sun, 26 May 2024 12:44:19 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF74E10A25;
	Sun, 26 May 2024 12:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716727459; cv=none; b=qmux1/89rbWOb1ZbQtwKBun3WByhjVLTMAFNdklgg1+y7X9NpPGj05vpngx8I4bMmPBeDHeqIan60ZALOCrmlIhxXkO+yungSwcHrImWtPohN9c/IsHMLIXHnrKknqcKs4EVHC+IhO/PeyGH2V1J07C/rZ7TFsQOTLqjSEyrq1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716727459; c=relaxed/simple;
	bh=g6i85qqwj3MGax/kH7EXAdoQlIeb9sPfRzXZA92Ashg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=pP4tyhj/fI3s0CP/ItwVo/huzLBwiXVNDLiH+XiuWdwhMNVFkb0EKk7DV2tYzD279RVDoxjTChs33ilm5BYQOsiXqRlIBtYcJrmOMr9mDgpxy0EeYpngawh/CgcSpbBJbzEdv4LGEljw8GenaQKnF/U3w1CeG7Lm1MQlW9ELs5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id DF3BA92009C; Sun, 26 May 2024 14:44:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id D17C992009B;
	Sun, 26 May 2024 13:44:07 +0100 (BST)
Date: Sun, 26 May 2024 13:44:07 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
    linux-kernel@vger.kernel.org, 
    =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH v3 0/9] MIPS: Unify low-level debugging functionalities
In-Reply-To: <a62c1c0b-0b2a-4b3f-85df-da586e103fcb@app.fastmail.com>
Message-ID: <alpine.DEB.2.21.2405261326260.1257@angie.orcam.me.uk>
References: <20240502-mips_debug_ll-v3-0-3b61f30e484c@flygoat.com> <3dcf3ac1-5494-482a-a80a-df4126e6ae59@app.fastmail.com> <3d6883ed-f8f4-44e5-a184-e5499c44f0f7@app.fastmail.com> <Zk2mt/FsgltvhVzf@alpha.franken.de> <13aa508f-6830-4d52-87fd-5063f737c990@app.fastmail.com>
 <a62c1c0b-0b2a-4b3f-85df-da586e103fcb@app.fastmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 22 May 2024, Jiaxun Yang wrote:

> That being said, have you noticed that prom_putchar and early_printk is
> a non-extant on generic mach, ingenic, ralink etc? That's because we
> really don't want to introduce any platform specific UART code for
> early debugging on new platforms. With DEBUG_LL introduced by Arm it's
> only a Kconfig option to do the trick.

 IMHO that is however the logical thing to do.  And then you need no magic 
options to fiddle with and say a distribution kernel will dump whatever it 
has to say if something wrong has happened early on.

 IOW just wire `prom_putchar' as required, using C code preferably.  NB 
YAMON does have a `print' entry point for console output, so for the Malta 
platform you can trivially use just that, no need for messy ad hoc 8250 
code.

 As to intercepting exceptions, it depends.  Again YAMON does handle that 
and dumps the register state, so with the Malta you get the information 
required.  For less capable ones it might make sense, but it ISTM like a 
candidate for an independent change, and then again I fail to see why the 
handler has to be written in the assembly language rather than C.

  Maciej

