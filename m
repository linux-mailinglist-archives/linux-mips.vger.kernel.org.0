Return-Path: <linux-mips+bounces-8360-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 56747A70BA2
	for <lists+linux-mips@lfdr.de>; Tue, 25 Mar 2025 21:38:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4EBBB3B2C13
	for <lists+linux-mips@lfdr.de>; Tue, 25 Mar 2025 20:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9C5E26139D;
	Tue, 25 Mar 2025 20:38:28 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33A981A5B88
	for <linux-mips@vger.kernel.org>; Tue, 25 Mar 2025 20:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742935108; cv=none; b=Fh8a4PaQ6HSdI++rNfSeKWXGrpg6j7D2dqTlsIhbLxFIebTFyZTupKqhowqddRZ7Qf96WzTw3kw09+6tTLFqgNe2MO9Oh5kYGZ2qF5KUPlAh88nuVOB61ix7zViwwRcvBMIEfhPzQd0Eili90Xcu8oLyGV3qQct5tKWbZIrTD1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742935108; c=relaxed/simple;
	bh=WJVsQmrjA2YexuKzVzuJpVcQcDlxqUr16m48ASl2K40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FCv/RRWgF3IXWICjvWZq5hOD5CE1HDSTiXeOFMsvFn3MGVOOOuppnuwcSFo8RwwkLh0GdW2kvR8+y/uWU4EScjFeGMT4Z4rbb51XdQpndVJJxgASHL7T0eVVov49wSYTMmgP2X2XDAQRyhhhsgyaaJ1h10ywFcVoXxaow68sDPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1txB2M-0007ZN-00; Tue, 25 Mar 2025 21:38:14 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id DB064C0135; Tue, 25 Mar 2025 21:37:40 +0100 (CET)
Date: Tue, 25 Mar 2025 21:37:40 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Johan Korsnes <johan.korsnes@gmail.com>
Cc: linux-mips@vger.kernel.org
Subject: Re: [PATCH] arch: mips: defconfig: Drop obsolete
 CONFIG_NET_CLS_TCINDEX
Message-ID: <Z-MUFKXfWaTQ_OpT@alpha.franken.de>
References: <20250323190734.111670-1-johan.korsnes@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250323190734.111670-1-johan.korsnes@gmail.com>

On Sun, Mar 23, 2025 at 08:07:34PM +0100, Johan Korsnes wrote:
> This option was removed from the Kconfig in commit
> 8c710f75256b ("net/sched: Retire tcindex classifier") but it was not
> removed from the defconfigs.
> 
> Fixes: 8c710f75256b ("net/sched: Retire tcindex classifier")
> Signed-off-by: Johan Korsnes <johan.korsnes@gmail.com>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>  arch/mips/configs/gpr_defconfig             | 1 -
>  arch/mips/configs/ip22_defconfig            | 1 -
>  arch/mips/configs/ip27_defconfig            | 1 -
>  arch/mips/configs/malta_defconfig           | 1 -
>  arch/mips/configs/malta_kvm_defconfig       | 1 -
>  arch/mips/configs/malta_qemu_32r6_defconfig | 1 -
>  arch/mips/configs/maltaaprp_defconfig       | 1 -
>  arch/mips/configs/maltasmvp_defconfig       | 1 -
>  arch/mips/configs/maltasmvp_eva_defconfig   | 1 -
>  arch/mips/configs/maltaup_defconfig         | 1 -
>  arch/mips/configs/maltaup_xpa_defconfig     | 1 -
>  arch/mips/configs/mtx1_defconfig            | 1 -
>  arch/mips/configs/rb532_defconfig           | 1 -
>  arch/mips/configs/rm200_defconfig           | 1 -
>  14 files changed, 14 deletions(-)

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

