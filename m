Return-Path: <linux-mips+bounces-12322-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C8BC7BD8D
	for <lists+linux-mips@lfdr.de>; Fri, 21 Nov 2025 23:23:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0776E3A87B5
	for <lists+linux-mips@lfdr.de>; Fri, 21 Nov 2025 22:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0924C30DD21;
	Fri, 21 Nov 2025 22:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GJesF9+6"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8F430CDAB;
	Fri, 21 Nov 2025 22:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763763635; cv=none; b=Ucwewh0q4MC/Bx6Ppkpv0LsxHcvmjvo5tt0d6t1g6RhWhr425Ep9MGeCgOxCeng7aRlZkdQJs7T/WFe2U4Y8bYHoxWy/sdbXH6heg/K3Q8Tjca4vSF2ZxYrJpbGo8pvZbrItlKzDofVijgyHtLmACvlujIdt8dSpTyfqnNsDujA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763763635; c=relaxed/simple;
	bh=IA7dRYfgmLM6hh4dPmzDRF9cilrSQigzy922nod1WPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u8kTp9N8lQJFDxCaFc2JBxzMh3sT+ljOZWEqfdswtK/svZfA3XfZLYpotiVCxkj1ClgM/gb7S55iXeBTuYfxsJWEA9TJYMnBaU/OsAzg3gXlO1Z3xkfVYmE2KVXNJxgLlRqTXu0A49MVOiSPiT14xpORTmdLZfdxIkrvk2TUl2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GJesF9+6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F6DEC4CEF1;
	Fri, 21 Nov 2025 22:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763763635;
	bh=IA7dRYfgmLM6hh4dPmzDRF9cilrSQigzy922nod1WPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GJesF9+6JXaHzGISpMpsgsByjjJRM0QtCtvm2qL3gNgta24CuCZbdho3/MCwy/6rm
	 wTEygSGamPSDbl3LFobWCmgI0rPTUqF1eXo3FPj74vkKRYzqfWP8cE0MgKC7IQoIH1
	 Z8PuCzaUKBcT+azvdSyjcMzK7TM21it/2mqnGZILw9g6yIpTZxkntKATJijxGupIy+
	 cjOXjavQ62AwFHXfiyG1RyjkAMXVuPdgEH8aFq4snwjSQDUU2NkQJfkILhOEHJggNM
	 RO6mCyvbw2bYilLbZKOHaF3d/PsO61RNb9mtw3RWYiN1EPtvTQ2jO37K3rML5gd/Yc
	 +CNi7KS/9M9SA==
Date: Fri, 21 Nov 2025 15:20:29 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>
Cc: "Rob Herring (Arm)" <robh@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2] kbuild: Support directory targets for building DTBs
Message-ID: <20251121222029.GA1674270@ax162>
References: <20251120204812.1983452-4-robh@kernel.org>
 <20251121063033.GA571346@ax162>
 <aSDAqhUb8_76IP0Y@derry.ads.avm.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSDAqhUb8_76IP0Y@derry.ads.avm.de>

On Fri, Nov 21, 2025 at 08:42:34PM +0100, Nicolas Schier wrote:
> Using '$(filter )' instead of '$(findstring )' reduces the risk of false
> positives, e.g.:
> 
> dtb-targets := %/dts %.dtb %.dtbo dtbs dtbs_check
> ifneq ($(findstring /dts/,$(MAKECMDGOALS))$(filter $(dtb-targets),$(MAKECMDGOALS)),)

Oh yeah, that would seem to clear up my concerns.

> With (something like) that:
> Tested-by: Nicolas Schier <nsc@kernel.org>
> Acked-by: Nicolas Schier <nsc@kernel.org>

Agreed.

Acked-by: Nathan Chancellor <nathan@kernel.org>

> But [1] seems to break this patch.
> 
> [1]: https://lore.kernel.org/linux-kbuild/20251120140645.478623-1-thomas.de_schampheleire@nokia.com

Yeah, that will need to be coordinated, I cc'd Rob on that change for
him to take a look as well.

Cheers,
Nathan

