Return-Path: <linux-mips+bounces-10380-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D854B2BE53
	for <lists+linux-mips@lfdr.de>; Tue, 19 Aug 2025 12:02:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF89B584209
	for <lists+linux-mips@lfdr.de>; Tue, 19 Aug 2025 10:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E07602135DD;
	Tue, 19 Aug 2025 10:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="gDP4IC/0"
X-Original-To: linux-mips@vger.kernel.org
Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18244320CAF
	for <linux-mips@vger.kernel.org>; Tue, 19 Aug 2025 10:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755597611; cv=none; b=msHuzVHvPzc1uHRzlY27Kxm+S/7RNhsmueIhf9re5LMJ+TbRH5DbC1rOYREGOds+mshgI06cHzzReDqd0PntUAJLSlm15NMkIsfGG9iijGvb45AvKUcG7xkYqvMtogB1qcambz0aXzySO/2m37R5Wxiim1EqhVWsNL3nTnedarQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755597611; c=relaxed/simple;
	bh=v/okojaX1odAcTkpye83LrAb63NZEvMcO+JDGF8HSew=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=ah7pqvbNKmQVUAKem5nTdNWpRZshG0ndy3i97ooQFJHLB6voSX+uzMjQUQHtaXocUghr4hpMgtAaYmZ0d/4Jdfe74kmutORtpM6VaIElTFEzi361q3I2Kpe5uxvSJh+DAuSlLXlTIhKWICxdVcLgXzwbdbkaAmf/fv6zY7LqTDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=gDP4IC/0; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1755597608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CjgCdFdN/p2XjO4xt3tgWE95EILx00Dh/AKJ/jlTXSQ=;
	b=gDP4IC/0Ko3V3/IF1R8VGT2HoCz6HdkyUbdEPEapgXFqi0NcNmIb1hTH8nQstdbdqFv8ts
	kP8b6/ndatZ9BbA24Vt/ZdThxjrnVqs0QveSS3PjfzlQm+uTye0ZlPcRvJTs59k+pkWWBN
	kT1RsmxEBMXeESZBgNhO500qNpZIqy0=
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH 5/8] MIPS: arc: Replace deprecated strcpy() with memcpy()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <yisgcmjp5cj27yozthudyrdpfcovhcrgpqbyip5kcum4aa7qwl@52bccatjuiak>
Date: Tue, 19 Aug 2025 12:00:02 +0200
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-hardening@vger.kernel.org,
 linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <53007EE9-0DF2-4772-8254-0551F4093CE8@linux.dev>
References: <20250817183728.612012-1-thorsten.blum@linux.dev>
 <20250817183728.612012-5-thorsten.blum@linux.dev>
 <yisgcmjp5cj27yozthudyrdpfcovhcrgpqbyip5kcum4aa7qwl@52bccatjuiak>
To: Justin Stitt <justinstitt@google.com>
X-Migadu-Flow: FLOW_OUT

Hi Justin,

On 19. Aug 2025, at 01:58, Justin Stitt wrote:
> On Sun, Aug 17, 2025 at 08:37:15PM +0200, Thorsten Blum wrote:
>> strcpy() is deprecated; use memcpy() instead.
>> 
>> Use pr_debug() instead of printk(KERN_DEBUG) to silence a checkpatch
>> warning.
> 
> I'd like to see more reasoning for why you chose memcpy() here. With api
> refactors like this I think most folks want to know if 1) there is any
> functional change and 2) why you chose the api.

1) No functional changes intended.

2) To advance the pointer 'cp', we already determine the string length
'len' using strlen(), which allows us to use memcpy() directly. This is
slightly more efficient than strscpy(), which would recompute the length
before calling memcpy() internally. We could also use strscpy() and its
return value as the length, but that would require checking for string
truncation, which might introduce a functional change.

Thanks,
Thorsten


