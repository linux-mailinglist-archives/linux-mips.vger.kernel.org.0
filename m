Return-Path: <linux-mips+bounces-7977-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7127A4584F
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2025 09:32:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 065EF1743D1
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2025 08:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFBA022425B;
	Wed, 26 Feb 2025 08:30:56 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19D731E1DEB;
	Wed, 26 Feb 2025 08:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740558656; cv=none; b=HTrdKwlMN4uaWwDyLRHZx1JN8ZEJ02HwmGe1PKhwAVssKIU0R3SOAkuFVcDpDd2GyptX01SvhL0cNs6U6iPaN3oqsYu1kgLekC1a7vy6JcBaVJLywu9PjwRypfZyur1EyAo4UIAdvVRKJEyXZH97UNR93lHlfUva3IvwsH3HsZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740558656; c=relaxed/simple;
	bh=8W1YS7kw1UYuPTog9vP2KQU1oV+SEgE+lxrN/xiMMxk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X16I2PEN23sCU+IKTPVOs9Oi2tEIZVAP0XxiaZV5+9Btx2ypWroNUmBxoOP4IHjcFzFOihWx0yMKd4ecqOUloX9kvrWBNHDeLpOaV8HvQBOgNp8BEQZ1dIT9Q/OSwZzMyuxWGSWIeHRGhyvXmdblbz939fu0OgEtYN9j4dUv0ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4719D1516;
	Wed, 26 Feb 2025 00:31:10 -0800 (PST)
Received: from [10.57.78.248] (unknown [10.57.78.248])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE2A83F673;
	Wed, 26 Feb 2025 00:30:47 -0800 (PST)
Message-ID: <14fefa3a-9522-4995-8e51-662e80ae1747@arm.com>
Date: Wed, 26 Feb 2025 09:30:44 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] mm: pgtable: make generic tlb_remove_table() use
 struct ptdesc
To: Qi Zheng <zhengqi.arch@bytedance.com>, peterz@infradead.org,
 riel@surriel.com, vishal.moola@gmail.com, david@redhat.com,
 jannh@google.com, hughd@google.com, willy@infradead.org, yuzhao@google.com,
 muchun.song@linux.dev, akpm@linux-foundation.org, will@kernel.org,
 aneesh.kumar@kernel.org, npiggin@gmail.com, arnd@arndb.de,
 dave.hansen@linux.intel.com, rppt@kernel.org, alexghiti@rivosinc.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-um@lists.infradead.org, x86@kernel.org,
 linux-riscv@lists.infradead.org
References: <cover.1740454179.git.zhengqi.arch@bytedance.com>
 <5be8c3ab7bd68510bf0db4cf84010f4dfe372917.1740454179.git.zhengqi.arch@bytedance.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <5be8c3ab7bd68510bf0db4cf84010f4dfe372917.1740454179.git.zhengqi.arch@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/02/2025 04:45, Qi Zheng wrote:
> Now only arm will call tlb_remove_ptdesc()/tlb_remove_table() when
> CONFIG_MMU_GATHER_TABLE_FREE is disabled. In this case, the type of the
> table parameter is actually struct ptdesc * instead of struct page *.
>
> Since struct ptdesc still overlaps with struct page and has not been
> separated from it, forcing the table parameter to struct page * will not
> cause any problems at this time. But this is definitely incorrect and
> needs to be fixed. So just like the generic __tlb_remove_table(), let
> generic tlb_remove_table() use struct ptdesc by default when
> CONFIG_MMU_GATHER_TABLE_FREE is disabled.
>
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>

Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>

