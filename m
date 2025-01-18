Return-Path: <linux-mips+bounces-7508-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D70AA15EBE
	for <lists+linux-mips@lfdr.de>; Sat, 18 Jan 2025 21:25:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5CA4C161539
	for <lists+linux-mips@lfdr.de>; Sat, 18 Jan 2025 20:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6762919F489;
	Sat, 18 Jan 2025 20:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lpuxuMoO"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3B91373;
	Sat, 18 Jan 2025 20:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737231943; cv=none; b=upHT1znXM/EJ1dP8R6MrDHikwyauXd/3S+x5YV4dxDGMtGTJhQ+wuw20Fh/URVoK3ls+pLuE5k67k1ZgXrqJsKszSpYFEzHB1yyOD8b6mKzR3n2wLXGRAQWGNAwioCR0oCXimxhxG22fIW4TiNQD3grA7/7iVd+JSULwhgjDA6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737231943; c=relaxed/simple;
	bh=+o95iiHxHDMRN68vsIkuqr+ywbP9zrnVCqX4lVcOB/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=np/8hg6NOX02J70ebQXwK/TD49N6vsMPmNZBnGtsOfMx2n9W7mkmmshmrpNC5CDCgY2TPfaw650IXjbUC+aGj5BqTvAdkottFw2baPdPhzfiRnZVy3xANTb4feaWgc1bUO/HdAItJCV/f220VK3qxbPGR08k18V70Lkl9mvvGrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lpuxuMoO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7713C4CED1;
	Sat, 18 Jan 2025 20:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737231941;
	bh=+o95iiHxHDMRN68vsIkuqr+ywbP9zrnVCqX4lVcOB/A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lpuxuMoOVUF/2rp7NYhcVb8YYrhtxZN/dsTCFWjbMC8JgObszFr8ixPpPVZpZv/ZR
	 i43kVGMggV0Ose35j54CXv80oLlVxr6AlfvqoWtdzTFxhTSOU0G5op8VkmmCUql2oB
	 A1HB0tb9+M09xvY9bRVqlANNCRVWEu8ybf6m8/ZA2kvclEwClBR8r28JccZHp8nsaT
	 ylvBLgOyrZ4V/VnzMdpxXqgUih71AG3IxwvA3vEu/7QkigYpnIoWk/r4kWX5bYKB5B
	 CBCS/4ycrNjeNhfRSPH4rGlL+epD+UuBRM23t8gl37S4HiDs3h4te+PB1L2FESbmw6
	 QBRVN9chYQuhQ==
Date: Sat, 18 Jan 2025 12:25:38 -0800
From: Kees Cook <kees@kernel.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Q: arch/mips && __secure_computing(sd) with sd != NULL
Message-ID: <202501181223.1BA4E6A5@keescook>
References: <20250118162238.GA31924@redhat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250118162238.GA31924@redhat.com>

On Sat, Jan 18, 2025 at 05:22:38PM +0100, Oleg Nesterov wrote:
> Note that if we change arch/mips we can do more cleanups, in particular
> __secure_computing(sd) no longer needs the argument.

Yeah, seems like reasonable clean-up. The argument is a leftover from
x86 having sd pre-populated under certain paths.

-- 
Kees Cook

