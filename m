Return-Path: <linux-mips+bounces-8653-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C66A93653
	for <lists+linux-mips@lfdr.de>; Fri, 18 Apr 2025 13:06:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB63A1887EF9
	for <lists+linux-mips@lfdr.de>; Fri, 18 Apr 2025 11:06:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19CAE1CA9C;
	Fri, 18 Apr 2025 11:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="iLge4Wfw"
X-Original-To: linux-mips@vger.kernel.org
Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768A42741D1
	for <linux-mips@vger.kernel.org>; Fri, 18 Apr 2025 11:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744974379; cv=none; b=BY+e2oz6Hjk7zN2PR5fp24fr7kVWTnYj9WvCI9tUGA8CwVRwNtidiotJwnzZq7BY5jMaI9nnxc0z2yzd7S5kC+SzbgilYPkffaTV/ulFj4/suIFeZPLu3SIpBnVZVIyrTheDU2ikoNUSnaG/2XgEYWbqhzjdMstNBTuTGb3SpdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744974379; c=relaxed/simple;
	bh=xC7KkNN09rdJTafofxY3w7v2BYcAQc3Ap1715Ha0gRg=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=PpQlRqDSQrm+BKQeynwqO69Vni8+yYufmk7aDzkL0oaB8kTwaQdOr3Fv6u4an/MTe4VTDq0ND6Sfwlhv060t2l5Og/jCWUViuXNnelnApnNZN3LSnDkmzf/APNTNei/qkxwxxMYDHsX5G+/Ho0v8akQMkYRXzU6SnVCfMpO86mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=iLge4Wfw; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744974364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YALxZFeBfGgL+aBYJe09UesWL9Hu692Wgsun8CNUXyU=;
	b=iLge4WfwkrXbm7msowUQ8/y4/Dqh7Tcq8Wl9T2XrRb443/1fYehFvYEdjfZdegQjcjmE/H
	CfOFe10gOOewp9YXvVumf3um0QSjgHPbSpX3mYkxftr1D6duemaSi6SjrJvUaM/54q1gpA
	5pO6mkH+k1nUvaqfV8TrcKH/3a7fMhU=
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.2\))
Subject: Re: [PATCH v2] MIPS: Fix MAX_REG_OFFSET and remove zero-length struct
 member
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <alpine.DEB.2.21.2504181108170.18253@angie.orcam.me.uk>
Date: Fri, 18 Apr 2025 13:05:49 +0200
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Oleg Nesterov <oleg@redhat.com>,
 linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <EC98BAE8-8269-4169-B3A2-5F426E77C223@linux.dev>
References: <20250417174712.69292-2-thorsten.blum@linux.dev>
 <aAIF_kEFlOOVNDaE@alpha.franken.de>
 <DAD22E95-6D33-43D5-B5E5-3A7B45A63944@linux.dev>
 <alpine.DEB.2.21.2504181108170.18253@angie.orcam.me.uk>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
X-Migadu-Flow: FLOW_OUT

On 18. Apr 2025, at 12:36, Maciej W. Rozycki wrote:
> On Fri, 18 Apr 2025, Thorsten Blum wrote:
>>>> Remove the unnecessary zero-length struct member '__last' and fix
>>>> MAX_REG_OFFSET to point to the last register in 'pt_regs'.
>>>> 
>>>> Fixes: 40e084a506eba ("MIPS: Add uprobes support.")
>>> 
>>> what does it fix ?
>> 
>> The value of MAX_REG_OFFSET and thus how regs_get_register() behaves.
>> 
>> From my understanding, MAX_REG_OFFSET points to the marker '__last[0]'
>> instead of the actual last register in 'pt_regs', which could allow
>> regs_get_register() to return an invalid offset.
> 
> Or actually it permits an out-of-range access beyond the end of `struct 
> pt_regs': if you call `regs_get_register(pt_regs, MAX_REG_OFFSET)', it'll 
> read memory beyond `pt_regs' rather than returning 0 right away.  It may 
> not happen in reality (I haven't checked), but it's a QoI issue we should 
> address IMO.  Other platforms that I've checked (riscv, x86) get it right.
> 
> Though the fix is incorrect for CPU_CAVIUM_OCTEON, because it doesn't 
> allow one to access the second half of the last register, and I find it 
> exceedingly complex anyway.  Just:
> 
> #define MAX_REG_OFFSET \
> (offsetof(struct pt_regs, __last) - sizeof(unsigned long))
> 
> will do (as `regs_get_register' operates on `unsigned long' quantities).

Does regs_get_register() even work for CPU_CAVIUM_OCTEON when accessing
the last two registers because they're both ULL, not UL? (independent of
my patch)

Thorsten


