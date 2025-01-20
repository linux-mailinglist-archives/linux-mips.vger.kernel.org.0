Return-Path: <linux-mips+bounces-7560-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B74A17473
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jan 2025 23:00:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF59D3A435B
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jan 2025 22:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40DAA19992D;
	Mon, 20 Jan 2025 22:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KSz3FXjO"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1544214830F;
	Mon, 20 Jan 2025 22:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737410439; cv=none; b=fcsETn2K5kKkEzJyWyQt3VjP1UurF60cEgfMs65GGwBsUwLhGTOpl/Pf9bQOKvcZZEwVr8M3r9jXSnPf4JRM9oaV1iSbm7B37i2uKiJLbkFTrlrN48w5vPyOry+FbAn6vRLeYy7fNhBfXry4ozZ1zxtX2GtLGM648aU5AHcbryg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737410439; c=relaxed/simple;
	bh=QydTgFx2tlV3wKwstA1o+PHgPAeyZHx6Y5RneVhyBxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y2IUcQP83b2rJKxDw+vyWiL0EWmgM2ep1d2a+pw6L19uiA5WtciArG0pVoff+Nxpz6cWcw3FMLgOyZYgUjl6pgAJMtCJv00iDqYFZRIYFl4l23BY+zkgvB6LBfnfXGi2cCy9NjO1w8uRukwHFiCVylGZK98Sobm5O8IrNWwt75o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KSz3FXjO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CE52C4CEDD;
	Mon, 20 Jan 2025 22:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737410438;
	bh=QydTgFx2tlV3wKwstA1o+PHgPAeyZHx6Y5RneVhyBxY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KSz3FXjOnhJSy+OViALjtWEPph6mytJgOz7i+y2ylB3MRrDTtCgGvj0l0Q7+IrAp3
	 FDZjbc0e4xG5lsHdKOy5Np6xziYExDu53QsRIY3Es3iEy+LN5e9HYrOjhH9FZJ+1J0
	 VTMd8hZDRbZTSxa3X2V/4ff5u3s0fwEtbQxq9bnIcUte1Kp7xJaCFimsbXMH2q2qS2
	 yTG4CSaiUXI3AA0MRE0BAOyPOvxH3N0B0Np1MxXQnJ5PCmA1KcqRl4Yxtz5eHVYtLU
	 fgOU6Ej9LTu906sGjQPavBoyxR8u0j/cNfI6mR/ymR4X++b35Z3gtnzba6AzrLVCOb
	 XiMhu1kEiP31Q==
Date: Mon, 20 Jan 2025 14:00:35 -0800
From: Kees Cook <kees@kernel.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 4/4] seccomp: remove the 'sd' argument from
 __seccomp_filter()
Message-ID: <202501201400.3518CED7C@keescook>
References: <20250120134409.GA21241@redhat.com>
 <20250120134505.GA21290@redhat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120134505.GA21290@redhat.com>

On Mon, Jan 20, 2025 at 02:45:05PM +0100, Oleg Nesterov wrote:
> After the previous change 'sd' is always NULL.
> 
> Signed-off-by: Oleg Nesterov <oleg@redhat.com>

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook

