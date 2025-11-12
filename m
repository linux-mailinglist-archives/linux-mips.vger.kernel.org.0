Return-Path: <linux-mips+bounces-12210-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 038CDC545EE
	for <lists+linux-mips@lfdr.de>; Wed, 12 Nov 2025 21:11:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2F03E4F4E10
	for <lists+linux-mips@lfdr.de>; Wed, 12 Nov 2025 20:03:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB8AD27F163;
	Wed, 12 Nov 2025 20:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BJlDjxq7"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E3E279334;
	Wed, 12 Nov 2025 20:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762977818; cv=none; b=UJCAuNAF4JHudJFjHYEbt/sWWdiwWfD9jvJx2kWCTbEArIXuSwKwamiP82rQGZfzQQCK6XAvr6q/PggzFaPnOpsT04JDVrSzLrsJUSi8o6Zttuqym1pIVjoxXjeLg6d4RjPCn5Ckdji7uf6M4olFm1OAxbxCjIN/IyXdJZR7XGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762977818; c=relaxed/simple;
	bh=zAvG1Qo2HuWOnUmKk3EcMjBeNxBNM8ZFtr9UpT/34Vw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YkCwsGi6nRRxk1RFmcM44zmj74tQjC4R7mF3qInKSlaMYNURUANDc+D8qasOC/LWbUPipUzGm4l2FEDYTIpHnjvJVAmvZm7yLG6mHOXwyvtMW/6xcx2jg9CSIIOrbQ6ear8dqpZre9u+wShwhcLa0qNAxbGQ3ei1u+c7O0rj7pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BJlDjxq7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88134C116B1;
	Wed, 12 Nov 2025 20:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762977818;
	bh=zAvG1Qo2HuWOnUmKk3EcMjBeNxBNM8ZFtr9UpT/34Vw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BJlDjxq7IfTUQQ7KUoqeZvLJ7e7liS62fkRaIr+cTAEO3z6jy+mhhshvOmd3bh8vc
	 LKQO04khJh2oTe+f9rb+O0G37uBzgRuvleSSc1k+8vfLQQV7cKjeurjC9gI6nKycv6
	 PtFT/rC0/q2cqD1G9etafq9EthszRCQfMIRlsYu7HBTVjs9du5ebCl4+i2pradypdg
	 uuGbRqvggNZ1Vq8SYiqLM6ZaYk0XhBHTie0iiVMSMc61PWlcq5ZLMdJpdkHbN/3sxg
	 o1Sg+B3yFgDuYTpbiL1bDCgFQIu50KZMRUyF2kc3V/3zdo4GQF+AkhnVV8Fo5aIP9W
	 TUrrjnu0wLLlw==
Date: Wed, 12 Nov 2025 20:55:55 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nathan Chancellor <nathan@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: Re: [PATCH v2 01/10] kbuild: don't enable CC_CAN_LINK if the dummy
 program generates warnings
Message-ID: <aRTmSzzOmdhBy_lO@derry.ads.avm.de>
References: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
 <20251014-kbuild-userprogs-bits-v2-1-faeec46e887a@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251014-kbuild-userprogs-bits-v2-1-faeec46e887a@linutronix.de>

On Tue, Oct 14, 2025 at 03:05:16PM +0200, Thomas Weiﬂschuh wrote:
> It is possible that the kernel toolchain generates warnings when used
> together with the system toolchain. This happens for example when the
> older kernel toolchain does not handle new versions of sframe debug
> information. While these warnings where ignored during the evaluation
> of CC_CAN_LINK, together with CONFIG_WERROR the actual userprog build
> will later fail.
> 
> Example warning:
> 
> .../x86_64-linux/13.2.0/../../../../x86_64-linux/bin/ld:
> error in /lib/../lib64/crt1.o(.sframe); no .sframe will be created
> collect2: error: ld returned 1 exit status
> 
> Make sure that the very simple example program does not generate
> warnings already to avoid breaking the userprog compilations.
> 
> Fixes: ec4a3992bc0b ("kbuild: respect CONFIG_WERROR for linker and assembler")
> Fixes: 3f0ff4cc6ffb ("kbuild: respect CONFIG_WERROR for userprogs")
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> ---
>  scripts/cc-can-link.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas

