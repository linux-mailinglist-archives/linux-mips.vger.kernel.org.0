Return-Path: <linux-mips+bounces-10371-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1361DB2B556
	for <lists+linux-mips@lfdr.de>; Tue, 19 Aug 2025 02:34:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 459BA7AD29F
	for <lists+linux-mips@lfdr.de>; Tue, 19 Aug 2025 00:32:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 221FD1494A8;
	Tue, 19 Aug 2025 00:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="KxI8Cjev"
X-Original-To: linux-mips@vger.kernel.org
Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A67CA6B
	for <linux-mips@vger.kernel.org>; Tue, 19 Aug 2025 00:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755563662; cv=none; b=ZlrbEuquYnK50AXO+5rvaofukQe+G4c3Q3SGk4O0ojNIAp9lk8m5mJGMAqJnZi/Mv76/AwAQk6iou/w5d9+MrgPS0HymyVhSgyQ1tM9HshYohorV2d7Jc3qkhGZKw4qunirYDf2VTKiZbAvnvXtD/gfN/wXh8jxU/rxOsx//DSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755563662; c=relaxed/simple;
	bh=VIj2YbU5o1RNHaFfyeLVtpSo78+d55miYm5h6O1qnN4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=EeC30/Fpnq8ovhYez/pi79PSevZRZZjp2YDPpZ5splAaUQKMA4/sk1pdoyBUuvoIBXidqfZgKTYb5HDOUzk9FauOYYi4BL/p8jJ9ZWawsZEqDD3KvIJFjlJOXd6RSYwm7WWYjmE3YybObioCyqEJXm2kz4WiCns6Yr5alGOUXww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=KxI8Cjev; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1755563646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VIj2YbU5o1RNHaFfyeLVtpSo78+d55miYm5h6O1qnN4=;
	b=KxI8CjevBfsn7Z0BxhF1SbGMKg+RgAwIxiXyAWUW/S1KSGEbLLDNayeWDLdFvYxRLte4+T
	4MngId6ICTspUMQqmzRCZBaw5ksNq7Pe9qczEV24tZ7/8flpgQ8QMseMNqTqLN4Dyrtx7/
	3PpVbxzore0atenB9myOpoqSoB4EDYU=
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH 2/8] MIPS: sgi-ip32: Replace deprecated strcpy() in
 plat_mem_setup()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <6d7mznlomgbhqexp64tswbozmlqk7svrek66zggjnhljsdzan3@3f66zsc5jm5y>
Date: Tue, 19 Aug 2025 02:33:53 +0200
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-hardening@vger.kernel.org,
 linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <F4431470-322B-49C5-B55A-B236C8E04D77@linux.dev>
References: <20250817183728.612012-1-thorsten.blum@linux.dev>
 <20250817183728.612012-2-thorsten.blum@linux.dev>
 <6d7mznlomgbhqexp64tswbozmlqk7svrek66zggjnhljsdzan3@3f66zsc5jm5y>
To: Justin Stitt <justinstitt@google.com>
X-Migadu-Flow: FLOW_OUT

On 19. Aug 2025, at 01:40, Justin Stitt wrote:
> On Sun, Aug 17, 2025 at 08:37:12PM +0200, Thorsten Blum wrote:
>> strcpy() is deprecated; use strscpy() instead.
>>=20
>> Link: https://github.com/KSPP/linux/issues/88
>> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
>> ---
>> arch/mips/sgi-ip32/ip32-setup.c | 3 ++-
>> 1 file changed, 2 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/arch/mips/sgi-ip32/ip32-setup.c =
b/arch/mips/sgi-ip32/ip32-setup.c
>> index aeb0805aae57..c2ebc4bbd866 100644
>> --- a/arch/mips/sgi-ip32/ip32-setup.c
>> +++ b/arch/mips/sgi-ip32/ip32-setup.c
>> @@ -14,6 +14,7 @@
>> #include <linux/interrupt.h>
>> #include <linux/param.h>
>> #include <linux/sched.h>
>> +#include <linux/string.h>
>=20
> This new include isn't strictly necessary as it was building with
> strcpy() fine before?

It's not strictly necessary, but since I was often asked to explicitly
include it, I made it a habit.

Best,
Thorsten


