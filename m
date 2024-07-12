Return-Path: <linux-mips+bounces-4301-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFEE92F9DF
	for <lists+linux-mips@lfdr.de>; Fri, 12 Jul 2024 14:03:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 141B01F21B73
	for <lists+linux-mips@lfdr.de>; Fri, 12 Jul 2024 12:03:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEC7426AED;
	Fri, 12 Jul 2024 12:03:52 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 682AB16CD04;
	Fri, 12 Jul 2024 12:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720785832; cv=none; b=GYf0YF/+QvgETkmjU4qyKPgYzcH1S3dPBEjZPWT7UdLEwtvLWXKLW5b+50hHebaNtMD9ZqETQMqOICN4d/DMKji+uqne7GhbfVDMnGlKun82G4zdy5yFSTLfspvr7la3RXLjP5iqscwMQL2N7oDzGRgtq8gJWyQAP6LWSPOJjw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720785832; c=relaxed/simple;
	bh=jtCN+mq02YZ7bgu5GOmrDbALhQe4pZv7Xwg+OTTU3a4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BPlYQMJRLcHFMT9hC9WnSB0Dd66cwNco6kiAgnV4m2C1QcEMhZ0TYBmwcHmcQ4gFXm4NSa7CJz4IWOP7maS10gIlCqHaQccqZRo6DCxA08+P+8BNfIL224cb45d8FC0ylNtejWWUHXjrCQz2BNBeVk/jMKewaDMxclDjU7RXR8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sSEMM-0003FZ-00; Fri, 12 Jul 2024 13:22:42 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 42FC4C0411; Fri, 12 Jul 2024 13:21:57 +0200 (CEST)
Date: Fri, 12 Jul 2024 13:21:57 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PATCH v3] MIPS: Implement ieee754 NAN2008 emulation mode
Message-ID: <ZpER1TRlHOxUXtSZ@alpha.franken.de>
References: <20240612-mips_ieee754_emul-v3-1-2c21b450abdb@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240612-mips_ieee754_emul-v3-1-2c21b450abdb@flygoat.com>

On Wed, Jun 12, 2024 at 09:38:19AM +0100, Jiaxun Yang wrote:
> Implement ieee754 NAN2008 emulation mode.
> 
> When this mode is enabled, kernel will accept ELF file
> compiled for both NaN 2008 and NaN legacy, but if hardware
> does not have capability to match ELF's NaN mode, __own_fpu
> will fail for corresponding thread and fpuemu will then kick
> in.
> 
> This mode trade performance for correctness, while maintaining
> support for both NaN mode regardless of hardware capability.
> It is useful for multilib installation that have both types
> of binary exist in system.
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> Changes in v3:
> - Fix typo in commit message
> - Collect R-b tags
> - Link to v2: https://lore.kernel.org/r/20240511-mips_ieee754_emul-v2-1-af796ea21ef0@flygoat.com
> 
> Changes in v2:
> - Fix a typo
> - Link to v1: https://lore.kernel.org/r/20240507-mips_ieee754_emul-v1-1-1dc7c0d13cac@flygoat.com
> ---
>  Documentation/admin-guide/kernel-parameters.txt |  4 +++-
>  arch/mips/include/asm/fpu.h                     | 15 +++++++++++++++
>  arch/mips/kernel/elf.c                          |  4 ++++
>  arch/mips/kernel/fpu-probe.c                    |  9 ++++++++-
>  4 files changed, 30 insertions(+), 2 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

